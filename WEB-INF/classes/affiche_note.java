package fonctions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import Objet.Resultat;
import Objet.Resultat_optionnel;

public class affiche_note {
    private String matricule;

    public affiche_note(String matricule) {
        this.matricule = matricule;
    }

    public String affiche(Connection c) throws Exception {
        Statement stm = c.createStatement();
        StringBuilder html = new StringBuilder();
        String get_id = "select * from etudiant where matricule= '" + matricule + "'";
        ResultSet rs_id = stm.executeQuery(get_id);
        int id_etudiant = 0;
        if (rs_id.next()) {
            id_etudiant = rs_id.getInt("id_etudiant");
        }

        Resultat rs1 = new Resultat(2);
        String[] matiereS1 = rs1.Note_Repechage(id_etudiant, 1, c);
        if (matiereS1.length != 0) {
            html.append("<h3>Note a refaire S1 :</h3>");
            html.append("<table border = 1>");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");

            for (int i = 0; i < matiereS1.length; i++) {
                String sql_s1 = "select * from matiere1 where code = '" + matiereS1[i] + "'";
                ResultSet rs_S1 = stm.executeQuery(sql_s1);
                if (rs_S1.next()) {
                    String nom = rs_S1.getString("nom");
                    String code = rs_S1.getString("code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + code + "</td>");
                    html.append("</tr>");
                }
            }
            html.append("</table>");
        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S1 </h2></em>");
        }

        Resultat rs2 = new Resultat(3);
        String[] matiereS2 = rs2.Note_Repechage(id_etudiant, 2, c);
        if (matiereS2.length != 0) {
            html.append("<h3>Note a refaire S2 :</h3>");
            html.append("<table border = 1>");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");

            for (int i = 0; i < matiereS2.length; i++) {
                String sql_s2 = "select * from matiere1 where code = '" + matiereS2[i] + "'";
                ResultSet rs_S2 = stm.executeQuery(sql_s2);
                if (rs_S2.next()) {
                    String nom = rs_S2.getString("nom");
                    String code = rs_S2.getString("code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + code + "</td>");
                    html.append("</tr>");
                }
            }
            html.append("</table>");
        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S2 </h2></em>");
        }

        Resultat rs3 = new Resultat(3);
        String[] matiereS3 = rs3.Note_Repechage(id_etudiant, 3, c);
        if (matiereS2.length != 0) {
            html.append("<h3>Note a refaire S3 :</h3>");
            html.append("<table border = 1>");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");

            for (int i = 0; i < matiereS3.length; i++) {
                String sql_s3 = "select * from matiere1 where code = '" + matiereS3[i] + "'";
                ResultSet rs_S3 = stm.executeQuery(sql_s3);
                if (rs_S3.next()) {
                    String nom = rs_S3.getString("nom");
                    String code = rs_S3.getString("code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + code + "</td>");
                    html.append("</tr>");
                }
            }
            html.append("</table>");
        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S3 </h2></em>");
        }

        Resultat_optionnel rsop_S4_Dev = new Resultat_optionnel(5, 1);
        String[] matiereOP_S4_Dev = rsop_S4_Dev.Note_Repechage(id_etudiant, c);
        html.append("NOTE :" + matiereOP_S4_Dev[0]);
        if (matiereOP_S4_Dev.length != 0) {

            html.append("<h3>Note a refaire S4 en parcour Developpement</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");

            for (int i = 0; i < matiereOP_S4_Dev.length; i++) {

                String sqlOP_S4_Dev = "select * from Matiere_dev where code ='" + matiereOP_S4_Dev[i] + "'";
                ResultSet rsOP_S4_Dev = stm.executeQuery(sqlOP_S4_Dev);
                if (rsOP_S4_Dev.next()) {
                    String nom = rsOP_S4_Dev.getString("nom");
                    String Code = rsOP_S4_Dev.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S4 en parcour Developpement </h2></em>");
        }

        Resultat_optionnel rsop_S1_Base = new Resultat_optionnel(5, 2);
        String[] matiereOP_S1_Base = rsop_S1_Base.Note_Repechage(id_etudiant, c);

        if (matiereOP_S1_Base.length != 0) {

            html.append("<h3>Note a refaire S4 en parcour Base de donnee</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");
            for (int i = 0; i < matiereOP_S1_Base.length; i++) {
                String sqlOP_S1_Base = "select * from Matiere_base where code ='" + matiereOP_S1_Base[i] + "'";
                ResultSet rsOP_S1_Base = stm.executeQuery(sqlOP_S1_Base);
                if (rsOP_S1_Base.next()) {
                    String nom = rsOP_S1_Base.getString("nom");
                    String Code = rsOP_S1_Base.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S4 en parcour Base de Donnee </h2></em>");
        }

        Resultat_optionnel rsop_S1_Web = new Resultat_optionnel(5, 3);
        String[] matiereOP_S1_Web = rsop_S1_Web.Note_Repechage(id_etudiant, c);

        if (matiereOP_S1_Web.length != 0) {

            html.append("<h3>Note a refaire S4 en parcour Web</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");
            for (int i = 0; i < matiereOP_S1_Web.length; i++) {
                String sqlOP_S1_Web = "select * from Matiere_web where code ='" + matiereOP_S1_Web[i] + "'";
                ResultSet rsOP_S1_Web = stm.executeQuery(sqlOP_S1_Web);
                if (rsOP_S1_Web.next()) {
                    String nom = rsOP_S1_Web.getString("nom");
                    String Code = rsOP_S1_Web.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S4 en parcour Web</h2></em>");
        }

        Resultat_optionnel rsop_S5_Dev = new Resultat_optionnel(6, 1);
        String[] matiereOP_S5_Dev = rsop_S5_Dev.Note_Repechage(id_etudiant, c);

        if (matiereOP_S5_Dev.length != 0) {

            html.append("<h3>Note a refaire S5 en parcour Developpement</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");
            for (int i = 0; i < matiereOP_S5_Dev.length; i++) {
                String sqlOP_S5_Dev = "select * from Matiere_dev where code ='" + matiereOP_S5_Dev[i] + "'";
                ResultSet rsOP_S5_Dev = stm.executeQuery(sqlOP_S5_Dev);
                if (rsOP_S5_Dev.next()) {
                    String nom = rsOP_S5_Dev.getString("nom");
                    String Code = rsOP_S5_Dev.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S5 en parcour Developpement </h2></em>");
        }

        Resultat_optionnel rsop_S5_Base = new Resultat_optionnel(6, 2);
        String[] matiereOP_S5_Base = rsop_S5_Base.Note_Repechage(id_etudiant, c);

        if (matiereOP_S5_Base.length != 0) {

            html.append("<h3>Note a refaire S5 en parcour Base de donnee</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");
            for (int i = 0; i < matiereOP_S5_Base.length; i++) {
                String sqlOP_S5_Base = "select * from Matiere_base where code ='" + matiereOP_S5_Base[i] + "'";
                ResultSet rsOP_S5_Base = stm.executeQuery(sqlOP_S5_Base);
                if (rsOP_S5_Base.next()) {
                    String nom = rsOP_S5_Base.getString("nom");
                    String Code = rsOP_S5_Base.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S5 en parcour Base de Donnee </h2></em>");
        }

        Resultat_optionnel rsop_S5_Web = new Resultat_optionnel(6, 3);
        String[] matiereOP_S5_Web = rsop_S5_Web.Note_Repechage(id_etudiant, c);

        if (matiereOP_S5_Web.length != 0) {

            html.append("<h3>Note a refaire S5 en parcour Web</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");
            for (int i = 0; i < matiereOP_S5_Web.length; i++) {
                String sqlOP_S5_Web = "select * from Matiere_web where code ='" + matiereOP_S5_Web[i] + "'";
                ResultSet rsOP_S5_Web = stm.executeQuery(sqlOP_S5_Web);
                if (rsOP_S5_Web.next()) {
                    String nom = rsOP_S5_Web.getString("nom");
                    String Code = rsOP_S5_Web.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S5 en parcour Web</h2></em>");
        }

        Resultat_optionnel rsop_S6_Dev = new Resultat_optionnel(7, 1);
        String[] matiereOP_S6_Dev = rsop_S6_Dev.Note_Repechage(id_etudiant, c);

        if (matiereOP_S6_Dev.length != 0) {

            html.append("<h3>Note a refaire S6 en parcour Developpement</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");
            for (int i = 0; i < matiereOP_S5_Dev.length; i++) {
                String sqlOP_S6_Dev = "select * from Matiere_dev where code ='" + matiereOP_S6_Dev[i] + "'";
                ResultSet rsOP_S6_Dev = stm.executeQuery(sqlOP_S6_Dev);
                if (rsOP_S6_Dev.next()) {
                    String nom = rsOP_S6_Dev.getString("nom");
                    String Code = rsOP_S6_Dev.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S6 en parcour Developpement </h2></em>");
        }

        Resultat_optionnel rsop_S6_Base = new Resultat_optionnel(7, 2);
        String[] matiereOP_S6_Base = rsop_S6_Base.Note_Repechage(id_etudiant, c);

        if (matiereOP_S6_Base.length != 0) {

            html.append("<h3>Note a refaire S6 en parcour Base de donnee</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");
            for (int i = 0; i < matiereOP_S6_Base.length; i++) {
                String sqlOP_S6_Base = "select * from Matiere_base where code ='" + matiereOP_S6_Base[i] + "'";
                ResultSet rsOP_S6_Base = stm.executeQuery(sqlOP_S6_Base);
                if (rsOP_S6_Base.next()) {
                    String nom = rsOP_S6_Base.getString("nom");
                    String Code = rsOP_S6_Base.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S6 en parcour Base de Donnee </h2></em>");
        }

        Resultat_optionnel rsop_S6_Web = new Resultat_optionnel(7, 3);
        String[] matiereOP_S6_Web = rsop_S6_Web.Note_Repechage(id_etudiant, c);

        if (matiereOP_S6_Web.length != 0) {

            html.append("<h3>Note a refaire S6 en parcour Web</h3>");
            html.append("<table border = 1> ");
            html.append("<tr>");
            html.append("<th>Code</th>");
            html.append("<th>Nom</th>");
            html.append("</tr>");
            for (int i = 0; i < matiereOP_S6_Web.length; i++) {
                String sqlOP_S6_Web = "select * from Matiere_web where code ='" + matiereOP_S6_Web[i] + "'";
                ResultSet rsOP_S6_Web = stm.executeQuery(sqlOP_S6_Web);
                if (rsOP_S6_Web.next()) {
                    String nom = rsOP_S6_Web.getString("nom");
                    String Code = rsOP_S6_Web.getString("Code");
                    html.append("<tr>");
                    html.append("<td>" + nom + "</td>");
                    html.append("<td>" + Code + "</td>");
                    html.append("</tr>");
                }

            }
            html.append("</table>");

        } else {
            html.append("<em><h2>L'eleve n'a pas de matiere a refaire en S6 en parcour Web</h2></em>");
        }

        stm.close();
        return html.toString();

    }
}
