<%@page import ="Objet.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des eleves</title>
</head>
<body>
    <form action="affiche-list.jsp" >
        <label for="semestre">Semestre :</label><input type="number" name="id_semestre" id="semestre">
        <input type="submit" value="Afficher">
    </form>
</body>
</html>