package fonctions;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LireFichier {
    private String cheminFichier;
    private Connection connection;

    public LireFichier(String cheminFichier, Connection c) {
        this.cheminFichier = cheminFichier;
        this.connection = c;
    }

    // Remplacez
    // par
    // le
    // chemin
    // de
    // votre
    // fichier.

    public int get_id_ByETU(String ETU) throws Exception {
        int valiny = 0;
        try (Statement stm = this.connection.createStatement()) {
            String get_id = "select id_etudiant from etudiant where matricule ='" + ETU + "'";
            ResultSet rs_id = stm.executeQuery(get_id);
            if (rs_id.next()) {
                valiny = rs_id.getInt("id_etudiant");

            }
        }
        return valiny;
    }

    public int get_classe(String matiere) throws Exception {
        int valiny = 0;
        try (Statement stm = this.connection.createStatement()) {
            String get_classe1 = "select semestre from classe where matiere ='" + matiere + "'";
            ResultSet rs_classe1 = stm.executeQuery(get_classe1);
            if (rs_classe1.next()) {
                valiny = rs_classe1.getInt("semestre");
            }

            String get_classe2 = "select id_semestre from matiere_optionnel where code = '" + matiere + "'";
            ResultSet rs_classe2 = stm.executeQuery(get_classe2);
            if (rs_classe2.next()) {
                valiny = rs_classe2.getInt("id_semestre");
            }
        }
        return valiny;
    }

    public void insert_base() throws Exception {

        try (
                Statement stm = this.connection.createStatement();
                BufferedReader br = new BufferedReader(new FileReader(cheminFichier))) {
            StringBuffer sb = new StringBuffer();
            String ligne;

            // Lecture du fichier ligne par ligne
            while ((ligne = br.readLine()) != null) {
                sb.append(ligne); // Ajoute chaque ligne au StringBuffer
            }

            // Récupère tout le contenu dans un String
            String contenuFichier = sb.toString();

            // Séparer les lignes avec "//"
            String[] lignes = contenuFichier.split("//");

            // Parcourir chaque ligne et séparer les colonnes avec ";"
            for (String ligneData : lignes) {
                // Supprime les espaces en trop et vérifie si la ligne n'est pas vide

                ligneData = ligneData.trim();
                if (!ligneData.isEmpty()) {

                    String[] colonnes = ligneData.split(";");
                    String ETU = colonnes[0];

                    String matiere = colonnes[1];

                    int id_etudiant = this.get_id_ByETU(ETU);
                    int id_classe = this.get_classe(matiere);
                    double[] notes = new double[colonnes.length - 2];
                    System.out.println("LIGNES : " + ligneData);
                    int index = 0;
                    for (int i = 2; i < colonnes.length; i++) {
                        notes[index] = Double.parseDouble(colonnes[i]);

                        String sql_insert = "insert into note values(" + id_classe + "," + id_etudiant + ",'" + matiere
                                + "'," + notes[index] + ")";
                        System.err.println("sql_insert: " + sql_insert);
                        stm.executeUpdate(sql_insert);
                        this.connection.commit();
                        index++;
                    }

                }
            }

        } catch (IOException e) {
            System.err.println("Erreur lors de la lecture du fichier : " + e.getMessage());
        }
    }

}
