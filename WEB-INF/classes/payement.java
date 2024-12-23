package Objet;

import java.sql.Connection;

public class payement {
    private Connection connection;
    private String nom_table;
    private String matricule;
    private int id_ecolage;
    private int montant;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getId_ecolage() {
        return id_ecolage;
    }

    public void setId_ecolage(int id_ecolage) {
        this.id_ecolage = id_ecolage;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public int getMontant() {
        return montant;
    }

    public void setMontant(int montant) {
        this.montant = montant;
    }

    public String getNom_table() {
        return nom_table;
    }

    public void setNom_table(String nom_table) {
        this.nom_table = nom_table;
    }

    public payement(Connection c, String nom_table, int id_ecolage, String matricule, int montant) {
        this.nom_table = nom_table;
        this.connection = c;
        this.id_ecolage = id_ecolage;
        this.matricule = matricule;
        this.montant = montant;

    }
}