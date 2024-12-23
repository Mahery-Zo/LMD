

<%@page import="fonctions.*" %>
<%@page import="Objet.*" %>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="Objet.OracleConnectionManager" %>
<%@page import="java.util.Vector" %>
<% 
String code = null ;

Connection connection = null ;
            try{
                OracleConnectionManager manager = new OracleConnectionManager();
                connection = manager.getConnection();
                String nom_table = "note";
            
            Notes n = new Notes(connection,nom_table,0,0,"ONDRY",0);
            list_generaliser ls = new list_generaliser(n);
            Vector vect = new Vector();
            vect = ls.list_obj();
            code = ls.list2(vect);
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

