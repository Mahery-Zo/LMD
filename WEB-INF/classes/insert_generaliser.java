package fonctions;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Vector;
import java.time.temporal.ChronoUnit;

import Objet.MonException;
import Objet.MysqlConnectionManager;

public class insert_generaliser {
    private Object objet;

    public Object getObjet() {
        return objet;
    }

    public void setObjet(Object objet, Vector valeur) {
        this.objet = objet;

    }

    public insert_generaliser(Object objet) {
        this.objet = objet;
    }

    public void insert() throws Exception {
        Class clazz = this.objet.getClass();
        Method me = clazz.getDeclaredMethod("getConnection");
        Object Connectio_obj = me.invoke(this.objet);
        Connection connection = (Connection) Connectio_obj;
        Object nom_table_obj = clazz.getDeclaredMethod("getNom_table").invoke(this.objet);
        String nom_table = (String) nom_table_obj;
        try (
                Statement stm = connection.createStatement();

        ) {
            String sql_insert = "INSERT INTO " + nom_table + "(";
            Method[] me_colonne = clazz.getDeclaredMethods();
            Vector vect_nom_col = new Vector<>();
            for (int i = 0; i < me_colonne.length; i++) {
                if (me_colonne[i].getName().startsWith("get")) {
                    vect_nom_col.add(me_colonne[i]);
                    System.out.println("COLONNES :" + me_colonne[i].getName());
                }
            }
            Vector vect_nom_col1 = new Vector<>();
            for (int i = 0; i < vect_nom_col.size(); i++) {
                Method meTemp = (Method) vect_nom_col.get(i);
                if (meTemp.getName() != "getConnection" && meTemp.getName() != "getNom_table"
                        && meTemp.getName() != "getClass") {
                    vect_nom_col1.add(meTemp);
                }
            }
            for (int i = 0; i < vect_nom_col1.size() - 1; i++) {
                Method meTemp = (Method) vect_nom_col1.get(i);
                sql_insert += meTemp.getName().substring(3, meTemp.getName().length()) + ",";
            }
            Method meTemp = (Method) vect_nom_col1.get(vect_nom_col1.size() - 1);

            sql_insert += meTemp.getName().substring(3) + ") VALUES(";

            for (int i = 0; i < vect_nom_col1.size() - 1; i++) {
                Method meTemp1 = (Method) vect_nom_col1.get(i);
                Object ObjTemp = meTemp1.invoke(this.objet);
                if (meTemp1.getReturnType().equals(int.class)) {
                    sql_insert += ObjTemp + ",";
                } else if (meTemp1.getReturnType().equals(double.class)) {
                    sql_insert += ObjTemp + ",";
                } else if (meTemp1.getReturnType().equals(String.class)) {
                    sql_insert += "'" + ObjTemp + "',";
                }

            }

            Method meTemp1 = (Method) vect_nom_col1.get(vect_nom_col1.size() - 1);

            if (meTemp1.getReturnType().equals(String.class)) {
                sql_insert += "'" + meTemp1.invoke(this.objet) + "')";
            } else {
                sql_insert += meTemp1.invoke(this.objet) + ")";
            }
            System.err.println("SQL :" + sql_insert);
            stm.executeUpdate(sql_insert);
            try {
                connection.commit();
            } catch (SQLException e) {
                if (e.getMessage().contains("Can't call commit when autocommit=true")) {
                    // Rien à faire, car autocommit est activé.
                } else {
                    throw e; // Rethrow si c'est une autre erreur.
                }
            }

            System.err.println("SQL :" + sql_insert);

        }

    }

    public int prix_apres_reduc(int montant, int reduction) {
        int valiny = montant - (montant * reduction / 100);
        return valiny;
    }

    public void verif_payement(int id_ecolage, String matricule, int montant) throws Exception {
        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        int annee_scolaire = 0;
        int monatant_par_moi = 0;
        int nb_mois_paye = 0;
        int nb_mois_annee_sco = 0;
        try (Statement stm = connection.createStatement()) {
            String sql_annee_scolaire = "select * from ecolage where id_ecolage = " + id_ecolage;
            ResultSet rs = stm.executeQuery(sql_annee_scolaire);
            if (rs.next()) {
                annee_scolaire = rs.getInt("id_annee_scolaire");
                monatant_par_moi = rs.getInt("Ecolage");
            }
            stm.close();
        }
        try (Statement stm = connection.createStatement()) {
            String sql_nb_mois_annee_sco = "select * from annee_scolaire where id_annee_scolaire = " + annee_scolaire;
            ResultSet rs = stm.executeQuery(sql_nb_mois_annee_sco);
            if (rs.next()) {
                int mois_deb = rs.getInt("mois_debut");
                int mois_fin = rs.getInt("mois_fin");
                int annee_debut = rs.getInt("annee_debut");
                int annee_fin = rs.getInt("annee_fin");
                LocalDate debut = LocalDate.of(annee_debut, mois_deb, 12);
                LocalDate fin = LocalDate.of(annee_fin, mois_fin, 12);

                nb_mois_annee_sco = (int) ChronoUnit.MONTHS.between(debut, fin);

            }

        }

        int totale_paye = 0;
        try (Statement stm = connection.createStatement()) {
            String sql_totale = "select *  from payement_ecolage where matricule = '" + matricule
                    + "' and id_ecolage = " + id_ecolage;

            ResultSet rs = stm.executeQuery(sql_totale);
            while (rs.next()) {
                totale_paye += rs.getInt("montant");
            }

        }

        nb_mois_paye = totale_paye / monatant_par_moi;
        int option = 0; // bimestrielle ou trimestrielle ;
        String option_description = null;
        try (Statement stm = connection.createStatement()) {
            String sql_option = "select * from config_payement where matricule = '" + matricule + "' ";
            System.err.println("ONDRY :" + sql_option);
            ResultSet rs = stm.executeQuery(sql_option);
            if (rs.next()) {
                option = rs.getInt("option_payement");

            }

        }

        try (Statement stm = connection.createStatement()) {
            String sql_Descritption = "select * from option_payement where id_option_payement =" + option;
            ResultSet rs = stm.executeQuery(sql_Descritption);
            if (rs.next()) {
                option_description = rs.getString("descriptions");
            }
        }

        int montant_max = nb_mois_annee_sco * monatant_par_moi;

        int option_d_apres_insert = montant / monatant_par_moi;
        int montant_apres_reduction = 0;
        int reduction = 0;
        try (Statement stm = connection.createStatement()) {
            String sql_reduction = "select * from reduction where option_payement =" + option;

            ResultSet rs = stm.executeQuery(sql_reduction);
            if (rs.next()) {
                reduction = rs.getInt("reduction");

                montant_apres_reduction = prix_apres_reduc(monatant_par_moi * option, reduction);
            }

        }

        montant_max = prix_apres_reduc(montant_max, reduction);

        if (nb_mois_paye + option > nb_mois_annee_sco && totale_paye + montant > montant_max) {
            System.err.println("TOTALE :" + montant);
            MonException me = new MonException(
                    "L'eleve a depasse les le monatant requis d'une annee scolaire Veuiller reesayer en payant seulement  :"
                            + (nb_mois_annee_sco - nb_mois_paye) + " avec un monatant de : "
                            + (montant_max - totale_paye));
            throw me;
        }

        if (totale_paye + montant > montant_max) {
            MonException me = new MonException(
                    "L'eleve a depasse les le montant requis d'une annee scolaire Veuiller reesayer en payant seulement  :"
                            + (montant_max - totale_paye));
            throw me;
        }

        if (totale_paye + montant < montant_max) {

            if (montant < montant_apres_reduction) {

                MonException me = new MonException(
                        "L'eleve a opter pour un payement " + option_description + " pas moins avec comme reduction :"
                                + reduction + "% , il doit paye au moins :" + montant_apres_reduction);

                throw me;
            }
        }

        System.err.println("TEST1");
        if (totale_paye == montant_max) {
            MonException me = new MonException("L'eleve a deja regler l'ecolage de cette annee scolaire");
        }
    }

    public int reste_a_payer(int id_ecolage, String matricule) throws Exception {

        MysqlConnectionManager manager = new MysqlConnectionManager();
        Connection connection = manager.getConnection();
        int annee_scolaire = 0;
        int monatant_par_moi = 0;
        int nb_mois_paye = 0;
        int nb_mois_annee_sco = 0;

        try (Statement stm = connection.createStatement()) {
            String sql_annee_scolaire = "select * from ecolage where id_ecolage = " + id_ecolage;
            ResultSet rs = stm.executeQuery(sql_annee_scolaire);
            if (rs.next()) {
                annee_scolaire = rs.getInt("id_annee_scolaire");
                monatant_par_moi = rs.getInt("Ecolage");
            }
            stm.close();
        }
        try (Statement stm = connection.createStatement()) {
            String sql_nb_mois_annee_sco = "select * from annee_scolaire where id_annee_scolaire = " + annee_scolaire;
            ResultSet rs = stm.executeQuery(sql_nb_mois_annee_sco);
            if (rs.next()) {
                int mois_deb = rs.getInt("mois_debut");
                int mois_fin = rs.getInt("mois_fin");
                int annee_debut = rs.getInt("annee_debut");
                int annee_fin = rs.getInt("annee_fin");
                LocalDate debut = LocalDate.of(annee_debut, mois_deb, 12);
                LocalDate fin = LocalDate.of(annee_fin, mois_fin, 12);

                nb_mois_annee_sco = (int) ChronoUnit.MONTHS.between(debut, fin);

            }

        }

        int totale_paye = 0;
        try (Statement stm = connection.createStatement()) {
            String sql_totale = "select *  from payement_ecolage where matricule = '" + matricule
                    + "' and id_ecolage = " + id_ecolage;

            ResultSet rs = stm.executeQuery(sql_totale);
            while (rs.next()) {
                totale_paye += rs.getInt("montant");
            }

        }

        nb_mois_paye = totale_paye / monatant_par_moi;
        int option = 0; // bimestrielle ou trimestrielle ;
        String option_description = null;
        try (Statement stm = connection.createStatement()) {
            String sql_option = "select * from config_payement where matricule = '" + matricule + "' ";
            System.err.println("ONDRY :" + sql_option);
            ResultSet rs = stm.executeQuery(sql_option);
            if (rs.next()) {
                option = rs.getInt("option_payement");

            }

        }

        try (Statement stm = connection.createStatement()) {
            String sql_Descritption = "select * from option_payement where id_option_payement =" + option;
            ResultSet rs = stm.executeQuery(sql_Descritption);
            if (rs.next()) {
                option_description = rs.getString("descriptions");
            }
        }

        int montant_apres_reduction = 0;
        int reduction = 0;
        try (Statement stm = connection.createStatement()) {
            String sql_reduction = "select * from reduction where option_payement =" + option;

            ResultSet rs = stm.executeQuery(sql_reduction);
            if (rs.next()) {
                reduction = rs.getInt("reduction");

                montant_apres_reduction = prix_apres_reduc(monatant_par_moi * option, reduction);
            }

        }

        int montant_max = nb_mois_annee_sco * monatant_par_moi;
        System.out.println("MONATANT PAR MOIS :" + montant_max);

        montant_max = prix_apres_reduc(montant_max, reduction);

        int reste = montant_max - totale_paye;
        return reste;
    }

}
