package Objet;

import java.sql.Connection;

public class Notes {
    private Connection connection;
    private String nom_table;
    private int ID_CLASSE;
    private int ID_ELEVE;
    private String Matiere;
    private double NOTE;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getID_CLASSE() {
        return ID_CLASSE;
    }

    public void setID_CLASSE(int iD_CLASSE) {
        ID_CLASSE = iD_CLASSE;
    }

    public int getID_ELEVE() {
        return ID_ELEVE;
    }

    public void setID_ELEVE(int iD_ELEVE) {
        ID_ELEVE = iD_ELEVE;
    }

    public String getMatiere() {
        return Matiere;
    }

    public void setMatiere(String matiere) {
        Matiere = matiere;
    }

    public double getNOTE() {
        return NOTE;
    }

    public void setNOTE(double nOTE) {
        NOTE = nOTE;
    }

    public String getNom_table() {
        return nom_table;
    }

    public void setNom_table(String nom_table) {
        this.nom_table = nom_table;
    }

    public Notes() {

    }

    public Notes(Connection Connection, String Nom_table, int ID_CLASSE, int ID_ELEVE, String Matiere, double NOTE) {
        this.connection = Connection;
        this.nom_table = Nom_table;
        this.ID_CLASSE = ID_CLASSE;
        this.ID_ELEVE = ID_ELEVE;
        this.Matiere = Matiere;
        this.NOTE = NOTE;
    }

}
