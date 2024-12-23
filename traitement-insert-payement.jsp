<%@page import ="Objet.*" %>
<%@page import ="fonctions.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<% 
    try{
String nom_table = "payement_ecolage";
     MysqlConnectionManager manager = new MysqlConnectionManager();
            Connection connection = manager.getConnection();
            fonctions f = new fonctions();
            
            String Matricule = request.getParameter("matricule");
            String id_ecolage_String = request.getParameter("id_ecolage");
            String Montant_String = request.getParameter("montant");

            int id_ecolage = Integer.parseInt(id_ecolage_String);
            int montant = Integer.parseInt(Montant_String);
            int verif = f.verif_droit(Matricule,id_ecolage);
            if(verif == 2){
 response.sendRedirect("payement_droit.jsp");
            }
            payement p = new payement(connection, nom_table, id_ecolage, Matricule, montant);
            insert_generaliser i = new insert_generaliser(p);
            i.verif_payement(id_ecolage, Matricule, montant);
            i.insert();

    }
    catch(Exception e){
    out.println("Error: " + e.getMessage());
    }
    
%>