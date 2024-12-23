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
        <form action="traitement-insert-payement.jsp" method="get">
      <label for="matricule">Matricule:</label>
      <input type="text" name="matricule" id="matricule" />
      <label for="id_ecolage">Ecolage :</label>
      <input type="number" name="id_ecolage" id="id_ecolage" />
      <label for="montant">Montant:</label>
      <input type="number" name="montant" id="montant" />
      <input type="submit" value="Valider" />
    </form>
      </div>
 <div    class = "test1"></div>
  </body>
</html>
