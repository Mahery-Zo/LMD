<%@page import="fonctions.*" %>
<%@page import="Objet.*" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="Objet.OracleConnectionManager" %>

<% 

String code = null ;
String id_eleve_String = request.getParameter("id_eleve"); 
String id_semestre_String = request.getParameter("id_semestre");
int id_eleve = 0 ;
int id_semestre = 0;
try{
    OracleConnectionManager manager = new OracleConnectionManager();
    Connection connection = manager.getConnection();
    if(request.getParameter("parcour")!= null){
      out.println("TAY :"+request.getParameter("id_semestre"));
    int id_parcour = Integer.parseInt(request.getParameter("parcour"));
    
    
     id_semestre = Integer.parseInt(id_semestre_String);
     id_eleve = Integer.parseInt(id_eleve_String);
   
    note n = new note(id_eleve, id_semestre);
  code = n.get_note_optionnel(connection, id_parcour);

    
}
else{
     id_semestre = Integer.parseInt(id_semestre_String);
     id_eleve = Integer.parseInt(id_eleve_String);
    note n = new note(id_eleve, id_semestre);
    code = n.get_note(connection);
}
}
catch(Exception e){
    out.print("Error: " + e.getMessage());
}
out.print(id_semestre_String);
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
<h3>Deliberer :</h3> 
    <form action="traitement-echange-note.jsp" method="get">
    <input type="hidden" name="id_eleve" value="<%= id_eleve %>" />
     <input type="hidden" name="id_semestre" value="<%= id_semestre %>" />
      <label for="matiere1">Matiere a enlever : </label>
      <input type="text" name="matiere1" id="matiere1" />
      <label for="points">Points a echanger :</label>
      <input type="number" name="points" id="points" />
      <label for="matiere2">Matiere a ajouter:</label>
      <input type="text" name="matiere2" id="matiere2" />
      <input type="submit" value="Valider"/>
    </form>

  </body>
</html>

