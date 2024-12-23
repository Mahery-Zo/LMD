package Objet;

import java.sql.Connection;

public class Etudiants {
    private Connection connection;
    private String nom_table;
    private String matricule;
    private String Nom;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String nom) {
        Nom = nom;
    }

    public String getNom_table() {
        return nom_table;
    }

    public void setNom_table(String nom_table) {
        this.nom_table = nom_table;
    }

    public Etudiants(Connection c, String nom_table) {
        this.connection = c;
        this.nom_table = nom_table;

    }

}
