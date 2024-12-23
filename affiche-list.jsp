<%@page import="fonctions.*" %>
<%@page import="Objet.*" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="Objet.OracleConnectionManager" %>

<% 
String code = null ;
String id_semestre_String = request.getParameter("id_semestre");
int id_semestre = Integer.parseInt(id_semestre_String);
Connection connection = null ;
            try{
                OracleConnectionManager manager = new OracleConnectionManager();
                connection = manager.getConnection();
                affiche_list affiche_list = new affiche_list(id_semestre);
            code = affiche_list.affiche(connection);
            }
            catch(Exception e){
                out.println("Error : " + e.getMessage());
            }
            finally {
    if (connection != null) {
        try {
            connection.close();  // Ferme la connexion après utilisation
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
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
