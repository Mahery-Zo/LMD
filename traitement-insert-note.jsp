<%@page import ="Objet.*" %>
<%@page import ="fonctions.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.time.LocalDate" %>
<% 
OracleConnectionManager manager = new OracleConnectionManager();
Connection connection = manager.getConnection();
    String nom_table = "note"; 
    String Semestre_String = request.getParameter("semestre");
    String Matricule = request.getParameter("matricule");
    String Matiere = request.getParameter("matiere");
    String Notes_String = request.getParameter("note");
    String Date_string = request.getParameter("date");

    LocalDate localDate = LocalDate.parse(Date_string);
double Notes = Double.parseDouble(Notes_String);
    int Semestre = Integer.parseInt(Semestre_String);
    fonctions f = new fonctions();
    int id_eleve  = f.get_id_ByETU(Matricule);

Notes n = new Notes(connection, nom_table, Semestre, id_eleve, Matiere, Notes);
        insert_generaliser i = new insert_generaliser(n);
        try{
            verif_ecolage verif = new verif_ecolage();
            
            verif.verif_insert_note(localDate,Matricule);
            i.insert();
        }
        catch(Exception e){
            out.println("Error: " + e.getMessage());
        }
        
    
%>