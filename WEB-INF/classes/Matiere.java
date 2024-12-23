package Objet;

import java.sql.Connection;

public class Matiere {
    private Connection connection;
    private String nom_table;
    private String code;
    private String Nom;
    private int Credits;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getCredits() {
        return Credits;
    }

    public void setCredits(int credits) {
        Credits = credits;
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

    public Matiere(Connection c, String nom_table) {
        this.connection = c;
        this.nom_table = nom_table;

    }

}
