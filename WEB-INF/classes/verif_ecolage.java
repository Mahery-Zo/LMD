package fonctions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjuster;
import java.time.temporal.TemporalAdjusters;

import Objet.MonException;
import Objet.MysqlConnectionManager;

public class verif_ecolage {
    public verif_ecolage() {

    }

    public String get_mois_String(int mois) {
        if (mois == 1) {
            return "Janvier";
        } else if (mois == 2) {
            return "Février";
        } else if (mois == 3) {
            return "Mars";
        } else if (mois == 4) {
            return "Avril";
        } else if (mois == 5) {
            return "Mai";
        } else if (mois == 6) {
            return "Juin";
        } else if (mois == 7) {
            return "Juillet";
        } else if (mois == 8) {
            return "Août";
        } else if (mois == 9) {
            return "Septembre";
        } else if (mois == 10) {
            return "Octobre";
        } else if (mois == 11) {
            return "Novembre";
        } else if (mois == 12) {
            return "Décembre";
        } else {
            return "Mois invalide";
        }
    }

    public LocalDate dernier_mois_paye(int nb_mois_payé, int mois_debut, int annee_debut) {
        LocalDate dernier_mois_paye;

        LocalDate date_debut = LocalDate.of(annee_debut, mois_debut, 1);
        date_debut = date_debut.with(TemporalAdjusters.lastDayOfMonth());
        for (int i = 0; i < nb_mois_payé; i++) {
            date_debut = date_debut.plusMonths(1);

        }
        date_debut = date_debut.minusMonths(1);
        dernier_mois_paye = date_debut;
        dernier_mois_paye = dernier_mois_paye.with(TemporalAdjusters.lastDayOfMonth());
        return dernier_mois_paye;
    }

    public int prix_apres_reduc(int montant, int reduction) {
        int valiny = montant - (montant * reduction / 100);
        return valiny;
    }

    public void verif_insert_note(LocalDate date, String matricule) throws Exception {
        int id_annee_sco = 0;
        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        int mois_debut = 0;
        int annee_debut = 0;
        try (
                Statement stm = connection.createStatement();) {
            String sql_id_annee_sco = "select * from annee_scolaire where annee_debut <= " + date.getYear()
                    + " and annee_fin >= " + date.getYear();

            ResultSet rs = stm.executeQuery(sql_id_annee_sco);
            if (rs.next()) {
                id_annee_sco = rs.getInt("id_annee_scolaire");
                mois_debut = rs.getInt("mois_debut");
                annee_debut = rs.getInt("annee_debut");
            }
            rs.close();
            stm.close();
        }
        int ecolage_par_moi = 0;
        int id_ecolage = 0;
        try (
                Statement stm = connection.createStatement();

        ) {
            String sql_ecolage_par_moi = "select  * from ecolage where id_annee_scolaire = " + id_annee_sco;
            ResultSet rs = stm.executeQuery(sql_ecolage_par_moi);
            if (rs.next()) {
                ecolage_par_moi = rs.getInt("Ecolage");
                id_ecolage = rs.getInt("id_ecolage");
            }
        }

        int totale_payement = 0;

        try (Statement stm = connection.createStatement()) {
            String sql_totale_payement = "select * from payement_ecolage where matricule = '" + matricule
                    + "' and id_ecolage = " + id_ecolage;
            ResultSet rs = stm.executeQuery(sql_totale_payement);
            while (rs.next()) {
                totale_payement += rs.getInt("montant");
            }
        }
        int reduction = 0;
        try (Statement stm = connection.createStatement()) {
            String sql_option = "select * from reduction join config_payement on config_payement.option_payement   = reduction.option_payement where config_payement.matricule ='"
                    + matricule + "'";
            ResultSet rs = stm.executeQuery(sql_option);
            if (rs.next()) {
                reduction = rs.getInt("reduction");

            }
        }
        int ecolage_parmois_reduction = prix_apres_reduc(ecolage_par_moi, reduction);

        int nb_mois_payer = (int) Math.ceil((double) totale_payement / ecolage_parmois_reduction);

        LocalDate dernier_mois_payer = dernier_mois_paye(nb_mois_payer, mois_debut, annee_debut);
        System.err.println("TOTALE :" + dernier_mois_payer);
        if (dernier_mois_payer.isBefore(date)) {
            String message = "L'eleve n'pas en =core payé le(s) mois de  :";
            LocalDate dateTemp = dernier_mois_payer.plusMonths(1);

            while (dateTemp.isBefore(date) || dateTemp.isEqual(date)) {
                System.err.println("DATE :" + dateTemp);
                message += get_mois_String(dateTemp.getMonthValue()) + " ";
                dateTemp = dateTemp.plusMonths(1);
            }
            MonException me = new MonException(message);
            throw me;
        }
        connection.close();

    }
}
