package Appl;

import Objet.OracleConnectionManager;
import Objet.Resultat;
import fonctions.*;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Vector;

import Objet.*;

public class App {
    public static void main(String[] args) {
        // try {
        // OracleConnectionManager manager = new OracleConnectionManager();
        // Connection connection = manager.getConnection();
        // String lien =
        // "C:\\Users\\ttcho\\OneDrive\\Bureau\\App\\ITU\\S3\\Tahiana\\FIchierTxtNoteITU\\LMD.csv";
        // LireFichier l = new LireFichier(lien, connection);
        // l.insert_base();
        // } catch (Exception e) {
        // System.err.println("Error: " + e.getMessage());
        // }

        ;
        String nom_table = "note";

        try {
            MysqlConnectionManager manager = new MysqlConnectionManager();
            // OracleConnectionManager manager = new OracleConnectionManager();
            Connection connection = manager.getConnection();
            // Etudiants e = new Etudiants(connection, nom_table);
            // list_generaliser ls = new list_generaliser(e);
            // String code = ls.list();
            // Notes n = new Notes(connection, nom_table)

            // note n = new note(7, 2);
            // String cString = n.get_note(connection);
            // n.note_deliberation(5, "INF101", 2, "MTH101", connection);
            // Resultat r = new Resultat(3);
            // double moyenne = r.get_moyenne(7, connection);
            // System.err.println("Resultat: " + moyenne);

            // Class clazz = Etudiants.class;
            // Object o = new Object();
            // Method[] me = clazz.getDeclaredMethods();
            // Constructor c = clazz.getDeclaredConstructors()[0];
            // Object[] attr = new Object[4];
            // attr[0] = connection;
            // attr[1] = "ONDRY";
            // attr[2] = "MTH101";
            // attr[3] = "INF101";
            // o = c.newInstance(attr);

            // System.err.println("getNom_table: " +
            // o.getClass().getDeclaredMethod("getNom_table").invoke(o));
            // Matiere ma = new Matiere(connection, nom_table);
            // list_generaliser ls = new list_generaliser(ma);
            // Vector valiny = ls.list_obj();
            // for (int i = 0; i < valiny.size(); i++) {
            // System.out.println(
            // "VALINY :" +
            // valiny.get(i).getClass().getDeclaredMethod("getCredits").invoke(valiny.get(i)));
            // }
            payement p = new payement(connection, nom_table, 1, "ETU003303", 40000);
            insert_generaliser i = new insert_generaliser(p);
            try {

                // fonctions f = new fonctions();
                // System.err.println("FONCION :" + f.get_date_by_semestre(3));
                // verif_ecolage v = new verif_ecolage();
                // LocalDate mois = LocalDate.of(2024, 8, 31);

                // v.verif_insert_note(mois, "ETU003304");
                // Notes n = new Notes(connection, nom_table, 1, 2, "ONDRY", 12);
                payement p1 = new payement(connection, "payement_ecolage", 1, "ETU003303", 105600);
                i = new insert_generaliser(p1);
                System.out.println("RESTE :" + i.reste_a_payer(2, "ETU003303"));
                fonctions f = new fonctions();
                LocalDate[] date = f.get_anneesco_by_id(2);
                int annee_debut = date[0].getYear();
                int annee_fin = date[1].getYear();
                System.out.println("VERIF :" + f.verif_droit("ETU003303", 3));
            } catch (Exception e) {
                System.err.println("ERROR: " + e.getMessage());
            }

        } catch (Exception e) {
            System.err.println("ERROR :" + e.getMessage());
        }
    }
}