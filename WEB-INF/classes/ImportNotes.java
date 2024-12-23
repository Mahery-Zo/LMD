package com.example;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ImportNotes {

    public static void main(String[] args) {
        String filePath = "./data.txt";
        List<Note> notes = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                line = line.trim();

                String[] parts = line.split("\\s*,\\s*");
                String idEtu = parts[0].trim();
                String idEpreuve = parts[1].trim();

                for (int i = 2; i < parts.length - 1; i++) {
                    try {
                        double valeur = Double.parseDouble(parts[i].trim());
                        int valeurArrondie = (int) Math.round(valeur);
                        Note note = new Note(idEtu, valeurArrondie, idEpreuve);
                        notes.add(note);
                    } catch (NumberFormatException e) {
                        System.out.println("Valeur invalide pour la note : " + parts[i] + " dans la ligne : " + line);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        insertNotesToDatabase(notes);
    }

    private static void insertNotesToDatabase(List<Note> notes) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = CreateDB.createDBConnection();

            String sql = "INSERT INTO note (id_etu, id_epreuve, valeur) VALUES (?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);

            for (Note note : notes) {
                pstmt.setString(1, note.getId_etu());
                pstmt.setString(2, note.getId_epreuve());
                pstmt.setDouble(3, note.getValeur());
                pstmt.addBatch();
            }

            int[] results = pstmt.executeBatch();
            System.out.println("Nombre de notes insérées : " + results.length);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException ignore) {
            }
        }
    }
}
