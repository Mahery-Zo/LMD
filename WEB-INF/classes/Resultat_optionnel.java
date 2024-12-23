package Objet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class Resultat_optionnel {
    private int id_semestre;
    private int parcours;
    private String Base_matiere;

    public int getId_semestre() {
        return id_semestre;
    }

    public void setId_semestre(int id_semestre) {
        this.id_semestre = id_semestre;
    }

    public int getParcours() {
        return parcours;
    }

    public void setParcours(int parcours) {
        this.parcours = parcours;
    }

    public Resultat_optionnel(int id_semestre, int parcours) {
        this.id_semestre = id_semestre;
        this.parcours = parcours;
        if (parcours == 1) {
            Base_matiere = "Matiere_Dev";

        }
        if (parcours == 2) {
            Base_matiere = "Matiere_Base";
        }
        if (parcours == 3) {
            Base_matiere = "Matiere_Web";
        }

    }

    public void get_note_modif(int id_eleve, Connection c) throws Exception {
        try (Statement stm = c.createStatement();
                ResultSet rs_config = stm.executeQuery(
                        "SELECT * FROM config_matiere WHERE code IN (SELECT DISTINCT matiere FROM note WHERE id_classe = "
                                + (this.id_semestre - 1) + ")")) {

            while (rs_config.next()) {
                double note = 0;
                String code = rs_config.getString("code");
                int option = rs_config.getInt("options");

                String sql_note;
                if (option == 0) {
                    sql_note = "SELECT MAX(note) AS note FROM note WHERE id_eleve = " + id_eleve + " AND id_classe = "
                            + (this.id_semestre - 1) + " AND matiere = '" + code + "'";
                } else {
                    sql_note = "SELECT AVG(note) AS note FROM (SELECT * FROM note WHERE id_eleve = " + id_eleve
                            + " AND id_classe = " + (this.id_semestre - 1) + " AND matiere = '" + code + "')";

                }

                try (Statement stm1 = c.createStatement();
                        ResultSet rs_note = stm1.executeQuery(sql_note)) {
                    if (rs_note.next()) {
                        note = rs_note.getDouble("note");

                    }
                }

                String sql_insert = "INSERT INTO note_modif(id_classe, id_eleve, matiere, note) " +
                        "SELECT " + (this.id_semestre - 1) + ", " + id_eleve + ", '" + code + "', " + note +
                        " FROM dual WHERE NOT EXISTS (SELECT 1 FROM note_modif WHERE id_classe = "
                        + (this.id_semestre - 1)
                        + " AND id_eleve = " + id_eleve + " AND matiere = '" + code + "')";
                System.out.println("Note modif : " + sql_insert);
                try (Statement stm2 = c.createStatement()) {
                    stm2.executeUpdate(sql_insert);
                    c.commit();
                }
            }
        }
    }

    public int check_inf_6(int id_eleve, Connection c) throws Exception {
        int valiny = 0;
        this.get_note_modif(id_eleve, c);
        Statement stm = c.createStatement();
        int id_classe = this.id_semestre - 1;
        String sql_note = "select count(note) as isa from(\r\n" +
                "WITH MaxNotes AS (\r\n" +
                "    SELECT " + Base_matiere + ".options, MAX(note) AS max_note\r\n" +
                "    FROM note_modif\r\n" +
                "    JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                "    WHERE note_modif.id_eleve =" + id_eleve + " \r\n" +
                "      AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                "    GROUP BY " + Base_matiere + ".options\r\n" +
                ")\r\n" +
                "SELECT note_modif.note, " + Base_matiere + ".options, " + Base_matiere + ".code\r\n" +
                "FROM note_modif\r\n" +
                "JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                "JOIN MaxNotes ON MaxNotes.options = " + Base_matiere
                + ".options AND note_modif.note = MaxNotes.max_note\r\n"
                + //
                "WHERE note_modif.id_eleve = " + id_eleve + " \r\n" +
                "  AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                "ORDER BY " + Base_matiere + ".options\r\n" +
                ") where note < 6 ";

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
        int id_classe = this.id_semestre - 1;
        this.get_note_modif(id_eleve, c);
        String sql_getInf10 = "select count(note) as isa from(\r\n" +
                "WITH MaxNotes AS (\r\n" +
                "    SELECT " + Base_matiere + ".options, MAX(note) AS max_note\r\n" +
                "    FROM note_modif\r\n" +
                "    JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                "    WHERE note_modif.id_eleve =" + id_eleve + " \r\n" +
                "      AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                "    GROUP BY " + Base_matiere + ".options\r\n" +
                ")\r\n" +
                "SELECT note_modif.note, " + Base_matiere + ".options, " + Base_matiere + ".code\r\n" +
                "FROM note_modif\r\n" +
                "JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                "JOIN MaxNotes ON MaxNotes.options = " + Base_matiere
                + ".options AND note_modif.note = MaxNotes.max_note\r\n"
                + //
                "WHERE note_modif.id_eleve = " + id_eleve + " \r\n" +
                "  AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                "ORDER BY " + Base_matiere + ".options\r\n" +
                ") where note < 10 ";

        ResultSet rs_Inf10 = stm.executeQuery(sql_getInf10);
        if (rs_Inf10.next()) {
            if (rs_Inf10.getInt("isa") >= 3) {
                return 1;
            }
        }
        stm.close();

        return 0;
    }

    public int check_moyenne(int id_eleve, Connection c) throws Exception {

        Statement stm = c.createStatement();
        int id_classe = this.id_semestre - 1;
        this.get_note_modif(id_eleve, c);
        String sql_Note = " WITH MaxNotes AS (\r\n" +
                "    SELECT " + Base_matiere + ".options, MAX(note) AS max_note\r\n" +
                "    FROM note_modif\r\n" +
                "    JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                "    WHERE note_modif.id_eleve = " + id_eleve + " \r\n" +
                "      AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                "    GROUP BY " + Base_matiere + ".options\r\n" +
                ")\r\n" +
                "SELECT note_modif.note, " + Base_matiere + ".options, " + Base_matiere + ".code , " + Base_matiere
                + ".credits\r\n" +
                "FROM note_modif\r\n" +
                "JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                "JOIN MaxNotes ON MaxNotes.options = " + Base_matiere
                + ".options AND note_modif.note = MaxNotes.max_note\r\n"
                +
                "WHERE note_modif.id_eleve = " + id_eleve + " \r\n" +
                "  AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                "ORDER BY " + Base_matiere + ".options\r\n" +
                "";

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

        Statement stm = c.createStatement();
        int id_classe = this.id_semestre - 1;
        this.get_note_modif(id_eleve, c);
        String sql_Note = " WITH MaxNotes AS (\r\n" +
                "    SELECT " + Base_matiere + ".options, MAX(note) AS max_note\r\n" +
                "    FROM note_modif\r\n" +
                "    JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                "    WHERE note_modif.id_eleve = " + id_eleve + " \r\n" +
                "      AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                "    GROUP BY " + Base_matiere + ".options\r\n" +
                ")\r\n" +
                "SELECT note_modif.note, " + Base_matiere + ".options, " + Base_matiere + ".code , " + Base_matiere
                + ".credits\r\n" +
                "FROM note_modif\r\n" +
                "JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                "JOIN MaxNotes ON MaxNotes.options = " + Base_matiere
                + ".options AND note_modif.note = MaxNotes.max_note\r\n"
                +
                "WHERE note_modif.id_eleve = " + id_eleve + " \r\n" +
                "  AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                "ORDER BY " + Base_matiere + ".options\r\n" +
                "";

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

    public String[] Note_Repechage(int id_eleve, Connection c) throws Exception {
        String[] Valiny;
        int check_inf_6 = check_inf_6(id_eleve, c);
        int check_moyenne = check_moyenne(id_eleve, c);
        int check_NbInf10 = check_NbInf10(id_eleve, c);
        Statement stm = c.createStatement();
        Vector valiny_vect = new Vector<>();
        int id_classe = id_semestre - 1;
        if (check_moyenne == 1 || check_inf_6 == 1 || check_NbInf10 == 1) {
            String sql_note = "WITH MaxNotes AS (\r\n" +
                    "    SELECT " + Base_matiere + ".options, MAX(note) AS max_note\r\n" +
                    "    FROM note_modif\r\n" +
                    "    JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                    "    WHERE note_modif.id_eleve = " + id_eleve + " \r\n" +
                    "      AND " + Base_matiere + ".id_semestre = " + id_classe + "\r\n" +
                    "    GROUP BY " + Base_matiere + ".options\r\n" +
                    ")\r\n" +
                    "SELECT note_modif.note, " + Base_matiere + ".options, " + Base_matiere + ".code\r\n" +
                    "FROM note_modif\r\n" +
                    "JOIN " + Base_matiere + " ON " + Base_matiere + ".code = note_modif.matiere\r\n" +
                    "JOIN MaxNotes ON MaxNotes.options = " + Base_matiere
                    + ".options AND note_modif.note = MaxNotes.max_note\r\n" +
                    "WHERE note_modif.id_eleve = " + id_eleve + " \r\n" +
                    "  AND " + Base_matiere + ".id_semestre = " + id_classe + " and  note < 10\r\n" +
                    "ORDER BY " + Base_matiere + ".options";
            System.err.println("SQL :" + sql_note);
            ResultSet rs_note = stm.executeQuery(sql_note);
            while (rs_note.next()) {
                valiny_vect.add(rs_note.getString("code"));
            }

        }
        Valiny = new String[valiny_vect.size()];
        for (int i = 0; i < valiny_vect.size(); i++) {
            Valiny[i] = (String) valiny_vect.get(i);
        }
        return Valiny;

    }

}