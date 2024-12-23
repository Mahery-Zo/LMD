<%@page import ="Objet.*" %>
<%@page import ="fonctions.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.time.LocalDate" %>
<% 
MysqlConnectionManager manager = new MysqlConnectionManager();
Connection connection = manager.getConnection();

    String Matricule = request.getParameter("matricule");
    String id_ecolageString = request.getParameter("id_ecolage");

    int id_ecolage = Integer.parseInt(id_ecolageString);

                payement p1 = new payement(connection, "payement_ecolage", 1, "ETU003303", 105600);
                insert_generaliser i = new insert_generaliser(p1);
                i = new insert_generaliser(p1);
                
         int reste = i.reste_a_payer(id_ecolage, Matricule);
         fonctions f = new fonctions();
                LocalDate[] date = f.get_anneesco_by_id(2);
                int annee_debut = date[0].getYear();
                int annee_fin = date[1].getYear();

        
    
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    L'eleve doit encore payer : <% out.print(reste); %> Ar pour l'année scolaire : <% out.print(annee_debut); %> - <% out.print(annee_fin); %>
  </body>
</html>

