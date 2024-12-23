<%@page import ="Objet.*" %>
<%@page import ="fonctions.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.time.LocalDate" %>
<% 
    String Matricule = request.getParameter("matricule");
    String semestre_String  = request.getParameter("semestre");
    int semestre = Integer.parseInt(semestre_String);
    fonctions f = new fonctions();
    int id_eleve  = f.get_id_ByETU(Matricule);
String code = null ;
        try{
            LocalDate date= f.get_date_by_semestre(semestre);
            verif_ecolage verif = new verif_ecolage();
            out.println("Date: " + date);
            verif.verif_insert_note(date,Matricule);
            code = f.note_etudiant(id_eleve,semestre);
        }
        catch(Exception e){
            out.println("Error: " + e.getMessage());
        }
    
        
    
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="/assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <script src="assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="assets/css/style.css" />
    <title>Document</title>
  </head>
  <body>
    <body>
      <div class="navbar">
        <div class="menu-icon">
          <span></span>
          <span></span>
          <span></span>
        </div>
  
        <div class="menu">
          <div class="gauche">
            <a href="#">Home</a>
            <a href="#">About</a>
            
          </div>
          <div class="logo">
            <h1>ITU</h1>
          </div>
          <div class="droite">
            <a href="#">Menu</a>
            <a href="#">Team</a>
            
          </div>
        </div>
  
        <div class="loupe-icon"></div>
      </div>
     <%= code %>

  </body>
</html>
