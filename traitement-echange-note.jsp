<%@page import ="Objet.*" %>
<%@page import ="fonctions.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<% 
    String id_eleve  = request.getParameter("id_eleve");
    String matiere1 = request.getParameter("matiere1");
    String matiere2 = request.getParameter("matiere2");
    String points = request.getParameter("points");
    String id_semestre = request.getParameter("id_semestre");

    int id_eleve_Int = Integer.parseInt(id_eleve);
    int id_semestre_Int = Integer.parseInt(id_semestre);
    int points_Int = Integer.parseInt(points);

    try{
        OracleConnectionManager manager = new OracleConnectionManager();
        Connection connection = manager.getConnection();
        note n = new note(id_eleve_Int , id_semestre_Int);
         n.note_deliberation(id_eleve_Int, matiere1, points_Int, matiere2, connection);
    }
    catch(Exception e){
        out.println(e.getMessage());
    }

%>