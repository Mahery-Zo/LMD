<%@page import ="Objet.*" %>


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
      <div  class="corps">
        <form action="traitement-fiche.jsp" method="get">
      <label for="semestre">Semestre :</label>
      <input type="number" id="semestre" name="semestre" />
      <label for="matricule">Matricule:</label>
      <input type="text" id="matricule" name="matricule" />
      <input type="submit" value="Valider" />

    </form>
      </div>

  </body>
</html>