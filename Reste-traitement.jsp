<%@page import ="Objet.*" %>
<%@page import ="fonctions.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<% 

    
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <form action="Reste.jsp" method="get">
      <label for="matricule">Matricule:</label>
      <input type="text" name="matricule" id="matricule" />
       <label for="id_ecolage">ID ecolage :</label>
      <input type="number" name="id_ecolage" id="id_ecolage" />
      <input type="submit" value="Valider" />
    </form>
  </body>
</html>