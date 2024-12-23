package fonctions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import Objet.Resultat;
import Objet.Resultat_optionnel;

public class affiche_list {
    private int id_semestre;

    public affiche_list(int id_semestre) {
        this.id_semestre = id_semestre;
    }

    public int getId_semestre() {
        return id_semestre;
    }

    public void setId_semestre(int id_semestre) {
        this.id_semestre = id_semestre;
    }

    public String affiche(Connection c) throws Exception {
        Statement stm = c.createStatement();
        StringBuilder html = new StringBuilder();

        if (this.id_semestre == 2 || this.id_semestre == 3 || this.id_semestre == 4) {
            Resultat rs = new Resultat(id_semestre);
            int[] list_int;
            list_int = rs.list_admis();
            html.append("<table border = 1>");
            html.append("<tr>");
            html.append("<th>Matricule</th>");
            html.append("<th>Nom</th>");
            html.append("<th>Moyenne</th>");

            html.append("</tr>");
            for (int i = 0; i < list_int.length; i++) {
                String sql_etudiant = "select * from etudiant where id_etudiant = " + list_int[i];
                ResultSet rs_etudiant = stm.executeQuery(sql_etudiant);

                html.append("<tr>");
                String nom;
                String matricule;
                if (rs_etudiant.next()) {
                    nom = rs_etudiant.getString("nom");
                    matricule = rs_etudiant.getString("matricule");
                    html.append("<td>" + matricule + "</td>");
                    html.append("<td>" + nom + "</td>");
                }
                double moyenne = rs.get_moyenne(list_int[i], c);

                html.append("<td>" + moyenne + "</td>");
                html.append("</tr>");

            }
            html.append("</table>");
        }

        if (this.id_semestre == 5 || this.id_semestre == 6 || this.id_semestre == 7) {

            Resultat_optionnel rs1 = new Resultat_optionnel(id_semestre, 1);
            Resultat_optionnel rs2 = new Resultat_optionnel(id_semestre, 2);
            Resultat_optionnel rs3 = new Resultat_optionnel(id_semestre, 3);

            int[] list_int1 = rs1.list_admis();
            int[] list_int2 = rs2.list_admis();
            int[] list_int3 = rs3.list_admis();

            html.append("<h2>Liste des admis en parcours Developpement en semestre :" + id_semestre + "</h2>");
            html.append("<table border = 1>");
            html.append("<tr>");
            html.append("<th>Matricule</th>");
            html.append("<th>Nom</th>");
            html.append("<th>Moyenne</th>");
            html.append("</tr>");
            for (int i = 0; i < list_int1.length; i++) {
                String sql_etudiant = "select * from etudiant where id_etudiant = " + list_int1[i];
                ResultSet rs_etudiant = stm.executeQuery(sql_etudiant);
                html.append("<tr>");
                String nom;
                String matricule;
                if (rs_etudiant.next()) {
                    nom = rs_etudiant.getString("nom");
                    matricule = rs_etudiant.getString("matricule");
                    html.append("<td>" + matricule + "</td>");
                    html.append("<td>" + nom + "</td>");

                }
                double moyenne = rs1.get_moyenne(list_int1[i], c);
                html.append("<td>" + moyenne + "</td>");
                html.append("</tr>");

            }
            html.append("</table>");

            html.append("<h2>Liste des admis en parcours Base de Donnée en semestre :" + id_semestre + "</h2>");
            html.append("<table border = 1>");
            html.append("<tr>");
            html.append("<th>Matricule</th>");
            html.append("<th>Nom</th>");
            html.append("<th>Moyenne</th>");
            html.append("</tr>");
            for (int i = 0; i < list_int2.length; i++) {
                String sql_etudiant = "select * from etudiant where id_etudiant = " + list_int2[i];
                ResultSet rs_etudiant = stm.executeQuery(sql_etudiant);
                html.append("<tr>");
                String nom;
                String matricule;
                if (rs_etudiant.next()) {
                    nom = rs_etudiant.getString("nom");
                    matricule = rs_etudiant.getString("matricule");
                    html.append("<td>" + matricule + "</td>");
                    html.append("<td>" + nom + "</td>");
                }

                double moyenne = rs2.get_moyenne(list_int2[i], c);
                html.append("<td>" + moyenne + "</td>");
                html.append("</tr>");

            }
            html.append("</table>");
            html.append("<h2>Liste des admis en parcours Web en semestre :" + this.id_semestre + "</h2>");
            html.append("<table border = 1>");
            html.append("<tr>");
            html.append("<th>Matricule</th>");
            html.append("<th>Nom</th>");
            html.append("<th>Moyenne</th>");
            html.append("</tr>");
            for (int i = 0; i < list_int3.length; i++) {
                String sql_etudiant = "select * from etudiant where id_etudiant = " + list_int3[i];
                ResultSet rs_etudiant = stm.executeQuery(sql_etudiant);
                html.append("<tr>");
                String nom;
                String matricule;
                if (rs_etudiant.next()) {
                    nom = rs_etudiant.getString("nom");
                    matricule = rs_etudiant.getString("matricule");
                    html.append("<td>" + matricule + "</td>");
                    html.append("<td>" + nom + "</td>");
                }
                double moyenne = rs3.get_moyenne(list_int3[i], c);
                html.append("<td>" + moyenne + "</td>");
                html.append("</tr>");

            }
            html.append("</table>");
        }
        stm.close();
        return html.toString();
    }
}