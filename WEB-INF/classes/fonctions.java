package fonctions;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjuster;
import java.time.temporal.TemporalAdjusters;

import Objet.MonException;
import Objet.MysqlConnectionManager;
import Objet.OracleConnectionManager;

public class fonctions {
    public fonctions() {

    }

    public int get_id_ByETU(String ETU) throws Exception {
        int valiny = 0;
        MysqlConnectionManager manager = new MysqlConnectionManager();
        try (
                Connection connection = manager.getConnection();
                Statement stm = connection.createStatement()) {
            String get_id = "select id_etudiant from etudiant where matricule ='" + ETU + "'";
            ResultSet rs_id = stm.executeQuery(get_id);
            if (rs_id.next()) {
                valiny = rs_id.getInt("id_etudiant");

            }
        }
        return valiny;
    }

    public int get_mois_by_semestre(int id_semestre) throws Exception {
        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        int valiny = 0;
        try (Statement stm = connection.createStatement()) {
            int mois_fin = 0;
            String sql = "select * from annee_scolaire join anneesco_semestre on annee_scolaire.id_annee_scolaire = anneesco_semestre.id_annee_scolaire where anneeSco_semestre.id_semestre ="
                    + id_semestre;
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                mois_fin = rs.getInt("mois_fin");
                valiny = mois_fin / 2;
            }
            connection.close();
            return valiny;
        }

    }

    public int get_annee_by_semestre(int id_semestre) throws Exception {
        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        int valiny = 0;
        try (Statement stm = connection.createStatement()) {
            int mois_fin = 0;
            String sql = "select * from annee_scolaire join anneesco_semestre on annee_scolaire.id_annee_scolaire = anneesco_semestre.id_annee_scolaire where anneeSco_semestre.id_semestre ="
                    + id_semestre;
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                valiny = rs.getInt("annee_debut");

            }
            connection.close();
            return valiny;
        }

    }

    public LocalDate get_date_by_semestre(int id_semestre) throws Exception {
        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        LocalDate valiny = null;
        try (Statement stm = connection.createStatement()) {
            int mois_fin = 0;

            String sql = "select * from annee_scolaire join anneesco_semestre on annee_scolaire.id_annee_scolaire = anneesco_semestre.id_annee_scolaire where anneeSco_semestre.id_semestre ="
                    + id_semestre;
            System.err.println("SQL :" + sql);
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                if (id_semestre % 2 != 0) {

                    LocalDate date1 = LocalDate.of(rs.getInt("annee_debut"), rs.getInt("mois_debut"), 1);
                    LocalDate date2 = LocalDate.of(rs.getInt("annee_fin"), rs.getInt("mois_fin"), 1);
                    date2 = date2.with(TemporalAdjusters.lastDayOfMonth());
                    System.err.println("DATE DEB :" + date1);
                    System.err.println("DATE APRES :" + date2);
                    long jour_entre = ChronoUnit.DAYS.between(date1, date2) / 2;
                    System.err.println(jour_entre);
                    valiny = date1.plusDays(jour_entre);
                    valiny = valiny.minusMonths(1);
                    valiny = valiny.with(TemporalAdjusters.lastDayOfMonth());
                } else {
                    valiny = LocalDate.of(rs.getInt("annee_fin"), rs.getInt("mois_fin"), 31);

                }
            }

        }
        connection.close();
        return valiny;
    }

    public String note_etudiant(int id_eleve, int id_semestre) throws Exception {
        StringBuilder html = new StringBuilder();
        OracleConnectionManager manager = new OracleConnectionManager();
        Connection connection = manager.getConnection();
        html.append("<table border = 1>");
        html.append("<tr><th>Matière</th><th>Note</th></tr>");
        try (Statement stm = connection.createStatement()) {
            String sql = "select * from note_modif where id_classe =" + id_semestre + " and id_eleve =" + id_eleve;
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                html.append("<tr><td>" + rs.getString("matiere") + "</td><td>" + rs.getString("note") + "</td></tr>");
            }
        }
        html.append("</table>");
        connection.close();
        return html.toString();

    }

    public LocalDate[] get_anneesco_by_id(int id_annee_sco) throws Exception {
        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        LocalDate[] valiny = new LocalDate[2];
        try (Statement stm = connection.createStatement()) {
            String sql_annescolaire = "select * from annee_scolaire where id_annee_scolaire = " + id_annee_sco;
            ResultSet rs = stm.executeQuery(sql_annescolaire);
            if (rs.next()) {
                LocalDate debut = LocalDate.of(rs.getInt("annee_debut"), rs.getInt("mois_debut"), 1);
                LocalDate fin = LocalDate.of(rs.getInt("annee_fin"), rs.getInt("mois_fin"), 1);
                valiny[0] = debut;
                valiny[1] = fin;
            }

        }
        return valiny;
    }

    public void insert_droit(String matricule, int id_droit, int montant) throws Exception {
        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        try (Statement stm = connection.createStatement()) {
            String verif = "select * from tarif_droit where id_droit = " + id_droit;
            ResultSet rs = stm.executeQuery(verif);
            int montant_tarif = 0;
            if (rs.next()) {
                montant_tarif = rs.getInt("montant");
            }
            if (montant != montant_tarif) {
                MonException me = new MonException(
                        "Votre payement est insuffisant , pour effectuer le payement veullier verser :"
                                + montant_tarif);
                throw me;
            }
        }
        try (Statement stm = connection.createStatement()) {
            String insert = "insert into payement_droit values ('" + matricule + "'," + id_droit + "," + montant + ")";
            stm.executeUpdate(insert);

        }

    }

    public int verif_droit(String matricule, int id_ecolage) throws Exception {
        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        int valiny = 0;
        int montant_tarif = 0;
        try (Statement stm = connection.createStatement()) {
            String verif = "select * from tarif_droit where id_droit = " + id_ecolage;
            ResultSet rs = stm.executeQuery(verif);
            montant_tarif = 0;
            if (rs.next()) {
                montant_tarif = rs.getInt("montant");
            }

        }
        int montant_paye = 0;
        try (Statement stm = connection.createStatement()) {
            String annee_sco = "select * from payement_droit where id_droit =" + id_ecolage + " and matricule = '"
                    + matricule + "'";

            ResultSet rs = stm.executeQuery(annee_sco);
            if (rs.next()) {
                montant_paye = rs.getInt("montant");
            }
        }
        System.out.println("MONTANT :" + montant_paye);
        System.out.println("TARIF :" + montant_tarif);
        if (montant_paye == montant_tarif) {
            return 1;
        } else {
            return 2;
        }

    }

}
