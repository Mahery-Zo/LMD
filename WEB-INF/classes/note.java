package fonctions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import Objet.MonException;
import Objet.Resultat;
import Objet.Resultat_optionnel;

public class note {
    private int id_eleve;
    private int id_semestre;

    public note(int id_eleve, int id_semestre) {
        this.id_eleve = id_eleve;
        this.id_semestre = id_semestre - 1;
        System.err.println("SQL : " + this.id_semestre);
    }

    public void note_deliberation(int id_eleve, String code1, int point, String code2, Connection c) throws Exception {

        Statement stm = c.createStatement();
        int coef1 = 0;
        int coef2 = 0;
        String base_matiere = null;
        if (id_semestre == 1 || id_semestre == 2 || id_semestre == 3) {
            base_matiere = "matiere1";
        } else {
            base_matiere = "matiere_optionnel";
        }

        String get_coef1 = "select credits from " + base_matiere + " where code = '" + code1 + "'";
        ResultSet rs_coef1 = stm.executeQuery(get_coef1);

        if (rs_coef1.next()) {
            coef1 = rs_coef1.getInt("credits");
        }
        String get_coef2 = "select credits from " + base_matiere + " where code = '" + code2 + "'";
        ResultSet rs_coef2 = stm.executeQuery(get_coef2);
        if (rs_coef2.next()) {
            coef2 = rs_coef2.getInt("credits");
        }
        System.err.println("COEF1: " + coef1 + " coef2: " + coef2);
        if (coef1 != coef2) {
            MonException me = new MonException(
                    "Vous ne pouver pas deliberer entre deux note de coefficient differente");
            throw me;
        } else {
            String get_note1 = "select note from note_deliberation1 where id_eleve = " + id_eleve + " and matiere ='"
                    + code1
                    + "' ";
            ResultSet rs_note1 = stm.executeQuery(get_note1);
            double note1 = 0.0;
            double note2 = 0.0;
            if (rs_note1.next()) {
                note1 = rs_note1.getDouble("note");
            }

            String get_note2 = "select note from note_deliberation1 where id_eleve = " + id_eleve + " and matiere ='"
                    + code2
                    + "' ";
            ResultSet rs_note2 = stm.executeQuery(get_note2);
            if (rs_note2.next()) {
                note2 = rs_note2.getDouble("note");
            }
            note1 = note1 - point;
            note2 = note2 + point;

            String update_note1 = "update note_deliberation1 set note = " + note1 + " where matiere = '" + code1
                    + "' and id_eleve =" + id_eleve + "";

            stm.executeUpdate(update_note1);

            c.commit();

            String update_note2 = "update note_deliberation1 set note = " + note2 + "where matiere ='" + code2
                    + "' and id_eleve = " + id_eleve + " ";
            System.err.println("SQL :" + update_note2);
            stm.executeUpdate(update_note2);
            c.commit();

        }
        stm.close();
    }

    public String get_note(Connection c) throws Exception {
        StringBuilder html = new StringBuilder();
        Statement stm = c.createStatement();
        html.append("<h6>Note de l'eleve numero : " + id_eleve + "</h6>");

        html.append("<table border = 1>");
        html.append("<tr>");
        html.append("<th>Matiere</th>");
        html.append("<th>Note Avant deliberations</th>");
        html.append("<th>Note Apres deliberation</th>");
        html.append("</tr>");
        String note = "SELECT \r\n" +
                "            note.matiere AS matiere,\r\n" +
                "            note.note AS note_avant_delib,\r\n" +
                "            nd.note AS note_apres \r\n" +
                "        FROM\r\n" +
                "            (SELECT \r\n" +
                "                 nm.id_classe,\r\n" +
                "                 nm.id_eleve,\r\n" +
                "                 nm.matiere,\r\n" +
                "                 nm.note * m.credits AS note\r\n" +
                "             FROM \r\n" +
                "                 note_modif nm\r\n" +
                "             JOIN \r\n" +
                "                 matiere1 m \r\n" +
                "             ON \r\n" +
                "                 m.code = nm.matiere) note\r\n" +
                "        LEFT JOIN \r\n" +
                "            note_deliberation1 nd \r\n" +
                "        ON \r\n" +
                "            note.id_classe = nd.id_classe \r\n" +
                "            AND note.id_eleve = nd.id_eleve \r\n" +
                "            AND note.matiere = nd.matiere\r\n" +
                "        WHERE \r\n" +
                "            note.id_classe = " + id_semestre + "\r\n" +
                "            AND note.id_eleve =" + id_eleve + "";
        System.out.println("APRES :" + note);
        ResultSet rs_note = stm.executeQuery(note);

        while (rs_note.next()) {

            html.append("<tr>");
            html.append("<td>" + rs_note.getString("matiere") + "</td>");
            html.append("<td>" + rs_note.getInt("note_avant_delib") + "</td>");
            html.append("<td>" + rs_note.getInt("note_apres") + "</td>");

            html.append("</tr>");
        }
        html.append("<tr>");
        html.append("<td>Moyenne<td>");
        Resultat r = new Resultat(2);
        double moyenne = r.get_moyenne(id_eleve, c);
        html.append("<td>" + moyenne + "</td>");
        System.err.println("Moynne : " + moyenne);
        html.append("</tr>");

        html.append("</table>");

        return html.toString();
    }

    public String get_note_optionnel(Connection c, int parcours) throws Exception {
        StringBuilder html = new StringBuilder();
        String Base_matiere = null;
        Statement stm = c.createStatement();
        if (parcours == 1) {
            Base_matiere = "Matiere_Dev";

        }
        if (parcours == 2) {
            Base_matiere = "Matiere_Base";
        }
        if (parcours == 3) {
            Base_matiere = "Matiere_Web";
        }
        html.append("<h6>Note de l'eleve numero : " + id_eleve + "</h6>");

        html.append("<table border = 1>");
        html.append("<tr>");
        html.append("<th>Matiere</th>");
        html.append("<th>Note Avant deliberations</th>");
        html.append("<th>Note Apres deliberation</th>");
        html.append("</tr>");
        String note = " SELECT \n" +
                "            note_avant.matiere,\n" +
                "            note_avant.note AS note_avant,\n" +
                "            note_apres.note AS note_apres\n" +
                "        FROM\n" +
                "            (\n" +
                "                SELECT \n" +
                "                    nm.id_classe,\n" +
                "                    nm.id_eleve,\n" +
                "                    nm.matiere,\n" +
                "                    nm.note * m.credits AS note\n" +
                "                FROM \n" +
                "                    note_modif nm\n" +
                "                JOIN \n" +
                "                    " + Base_matiere + " m \n" +
                "                ON \n" +
                "                    m.code = nm.matiere\n" +
                "                WHERE \n" +
                "                    nm.id_classe = " + id_semestre + " \n" +
                "                    AND nm.id_eleve = " + id_eleve + "\n" +
                "            ) note_avant\n" +
                "        LEFT JOIN \n" +
                "            (\n" +
                "                SELECT \n" +
                "                    nd.id_classe,\n" +
                "                    nd.id_eleve,\n" +
                "                    nd.matiere,\n" +
                "                    nd.note\n" +
                "                FROM \n" +
                "                    note_deliberation1 nd\n" +
                "            ) note_apres\n" +
                "        ON \n" +
                "            note_avant.id_classe = note_apres.id_classe\n" +
                "            AND note_avant.id_eleve = note_apres.id_eleve\n" +
                "            AND note_avant.matiere = note_apres.matiere";
        ResultSet rs_note = stm.executeQuery(note);
        while (rs_note.next()) {

            html.append("<tr>");
            html.append("<td>" + rs_note.getString("matiere") + "</td>");
            html.append("<td>" + rs_note.getInt("note_avant") + "</td>");
            html.append("<td>" + rs_note.getInt("note_apres") + "</td>");
            html.append("</tr>");

        }
        html.append("<tr>");
        html.append("<td>Moyenne</td>");
        Resultat_optionnel r = new Resultat_optionnel(id_semestre, parcours);
        double moyenne = r.get_moyenne(id_eleve, c);
        html.append("<td>" + moyenne + "</td>");
        html.append("</tr>");
        html.append("</table>");
        return html.toString();
    }

}
