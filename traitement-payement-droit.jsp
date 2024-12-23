<%@page import ="Objet.*" %>
<%@page import ="fonctions.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<% 
    
    String matricule = request.getParameter("matricule");
    String id_droitString = request.getParameter("id_droit");
    String montantString = request.getParameter("montant");
    
    int montant = Integer.parseInt(montantString);
    int id_droit = Integer.parseInt(id_droitString);

    try{
        fonctions f = new fonctions();
        f.insert_droit(matricule,id_droit,montant);
    }
    catch(Exception e){
        out.println(e.getMessage());
    }

%>