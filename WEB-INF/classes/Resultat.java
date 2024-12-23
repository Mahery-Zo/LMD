package Objet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class Resultat {
    private int classe;

    public int getClasse() {
        return classe;
    }

    public void setClasse(int classe) {
        this.classe = classe;
    }

    public Resultat(int classe) {
        this.classe = classe;
    }

    public int check_inf_6(int id_eleve, Connection c) throws Exception {
        int valiny = 0;

        Statement stm = c.createStatement();
        int id_classe = this.classe - 1;
        this.get_note_modifie(id_eleve, c);
        String sql_note = "select count(note) as isa from Note_modif where id_eleve = " + id_eleve
                + " and (note < 6 or note = 0 )and id_classe =" + id_classe;

        ResultSet rs_note = stm.executeQuery(sql_note);
        if (rs_note.next()) {
            if (rs_note.getInt("isa") > 0) {
                return 1;
            }
        }
        stm.close();

        return 0;
    }

    public int check_NbInf10(int id_eleve, Connection c) throws Exception {

        Statement stm = c.createStatement();
        int id_classe = this.classe - 1;
        this.get_note_modifie(id_eleve, c);
        String sql_getInf10 = "select count(note) as isa from note_modif where id_eleve = " + id_eleve
                + " and id_classe ="
                + id_classe
                + "and note < 10";

        ResultSet rs_Inf10 = stm.executeQuery(sql_getInf10);
        if (rs_Inf10.next()) {
            if (rs_Inf10.getInt("isa") >= 3) {
                return 1;
            }
        }
        stm.close();

        return 0;
    }

    public void get_note_modifie(int id_eleve, Connection c) throws Exception {
        try (Statement stm = c.createStatement();
                ResultSet rs_config = stm.executeQuery(
                        "SELECT * FROM config_matiere WHERE code IN (SELECT DISTINCT matiere FROM note WHERE id_classe = "
                                + (this.classe - 1) + ")")) {

            while (rs_config.next()) {
                double note = 0;
                String code = rs_config.getString("code");
                int option = rs_config.getInt("options");

                String sql_note;
                if (option == 0) {
                    sql_note = "SELECT MAX(note) AS note FROM note WHERE id_eleve = " + id_eleve + " AND id_classe = "
                            + (this.classe - 1) + " AND matiere = '" + code + "'";
                } else {
                    sql_note = "SELECT AVG(note) AS note FROM (SELECT * FROM note WHERE id_eleve = " + id_eleve
                            + " AND id_classe = " + (this.classe - 1) + " AND matiere = '" + code + "')";

                }

                try (Statement stm1 = c.createStatement();
                        ResultSet rs_note = stm1.executeQuery(sql_note)) {
                    if (rs_note.next()) {
                        note = rs_note.getDouble("note");

                    }
                }

                String sql_insert = "INSERT INTO note_modif(id_classe, id_eleve, matiere, note) " +
                        "SELECT " + (this.classe - 1) + ", " + id_eleve + ", '" + code + "', " + note +
                        " FROM dual WHERE NOT EXISTS (SELECT 1 FROM note_modif WHERE id_classe = " + (this.classe - 1)
                        + " AND id_eleve = " + id_eleve + " AND matiere = '" + code + "')";
                System.out.println("Note modif : " + sql_insert);
                try (Statement stm2 = c.createStatement()) {
                    stm2.executeUpdate(sql_insert);
                    c.commit();
                }
            }
        }
    }

    public int check_moyenne(int id_eleve, Connection c) throws Exception {

        Statement stm = c.createStatement();
        int id_classe = this.classe - 1;
        this.get_note_modifie(id_eleve, c);
        String sql_Note = " select * from note_modif join matiere1 on matiere1.code = note_modif.matiere where id_eleve = "
                + id_eleve + " and id_classe = " + id_classe + " ";

        ResultSet rs_note = stm.executeQuery(sql_Note);
        int somme_credit = 0;

        while (rs_note.next()) {
            somme_credit = somme_credit + rs_note.getInt("credits");
        }

        int note_coef = 0;
        Statement stm1 = c.createStatement();
        ResultSet rs_note1 = stm1.executeQuery(sql_Note);
        while (rs_note1.next()) {
            note_coef = note_coef + rs_note1.getInt("note") * rs_note1.getInt("credits");

        }
        double moyenne = (double) note_coef / somme_credit;

        if (moyenne < 10) {
            return 1;
        }
        stm.close();
        stm1.close();

        return 0;
    }

    public double get_moyenne(int id_eleve, Connection c) throws Exception {
        this.get_note_modifie(id_eleve, c);
        Statement stm = c.createStatement();
        int id_classe = this.classe - 1;

        String sql_Note = " select * from note_modif join matiere1 on matiere1.code = note_modif.matiere where id_eleve = "
                + id_eleve + " and id_classe = " + id_classe + " ";

        ResultSet rs_note = stm.executeQuery(sql_Note);
        int somme_credit = 0;

        while (rs_note.next()) {
            somme_credit = somme_credit + rs_note.getInt("credits");
        }

        int note_coef = 0;
        Statement stm1 = c.createStatement();
        ResultSet rs_note1 = stm1.executeQuery(sql_Note);
        while (rs_note1.next()) {
            note_coef = note_coef + rs_note1.getInt("note") * rs_note1.getInt("credits");

        }
        double moyenne = (double) note_coef / somme_credit;

        stm.close();
        stm1.close();

        return moyenne;
    }

    public int[] list_admis() throws Exception {
        int[] valiny;
        OracleConnectionManager manager = new OracleConnectionManager();
        Connection connection = manager.getConnection();
        Statement stm = connection.createStatement();
        this.get_note_modifie(classe, connection);
        String get_eleve = "select id_etudiant from etudiant";
        ResultSet rs_eleve = stm.executeQuery(get_eleve);

        Vector valiny_vect = new Vector<>();
        while (rs_eleve.next()) {

            int check_inf_6 = check_inf_6(rs_eleve.getInt("id_etudiant"), connection);

            int check_moyenne = check_moyenne(rs_eleve.getInt("id_etudiant"), connection);

            int check_NbInf10 = check_NbInf10(rs_eleve.getInt("id_etudiant"), connection);

            if (check_NbInf10 == 0 && check_inf_6 == 0 && check_moyenne == 0) {
                valiny_vect.add(rs_eleve.getInt("id_etudiant"));
            }
        }
        valiny = new int[valiny_vect.size()];
        for (int i = 0; i < valiny_vect.size(); i++) {
            valiny[i] = (int) valiny_vect.get(i);
        }
        stm.close();

        return valiny;
    }

    public int[] list_deliberation() throws Exception {
        int[] valiny;
        OracleConnectionManager manager = new OracleConnectionManager();
        Connection connection = manager.getConnection();
        Statement stm = connection.createStatement();

        String get_eleve = "select id_etudiant from etudiant";
        ResultSet rs_eleve = stm.executeQuery(get_eleve);

        Vector valiny_vect = new Vector<>();
        while (rs_eleve.next()) {

            int check_inf_6 = check_inf_6(rs_eleve.getInt("id_etudiant"), connection);

            int check_moyenne = check_moyenne(rs_eleve.getInt("id_etudiant"), connection);

            int check_NbInf10 = check_NbInf10(rs_eleve.getInt("id_etudiant"), connection);

            if (check_NbInf10 == 1 && check_moyenne == 0 || check_inf_6 == 1 && check_moyenne == 0
                    || check_NbInf10 == 1 && check_inf_6 == 1 && check_moyenne == 0) {
                valiny_vect.add(rs_eleve.getInt("id_etudiant"));
            }
        }
        valiny = new int[valiny_vect.size()];
        for (int i = 0; i < valiny_vect.size(); i++) {
            valiny[i] = (int) valiny_vect.get(i);
        }
        stm.close();

        return valiny;
    }

    public String[] Note_Repechage(int id_eleve, int id_semestre, Connection c) throws Exception {
        String[] Valiny;
        Vector valiny_vect = new Vector<>();

        if (check_moyenne(id_eleve, c) == 1 || check_NbInf10(id_eleve, c) == 1 || check_inf_6(id_eleve, c) == 1) {
            Statement stm = c.createStatement();
            String note = "select * from note_modif where note < 10 and id_eleve = " + id_eleve + " and id_classe ="
                    + id_semestre;
            ResultSet rs_note = stm.executeQuery(note);
            while (rs_note.next()) {
                valiny_vect.add(rs_note.getString("MATIERE"));
            }
        }
        Valiny = new String[valiny_vect.size()];
        for (int i = 0; i < valiny_vect.size(); i++) {
            Valiny[i] = (String) valiny_vect.get(i);
        }
        return Valiny;
    }

}
