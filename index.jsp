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
        <h1>Welcome to ITU</h1>
        <a href="list-admis.jsp"><div class="div-a1">Admission par semestre</div></a>
        <a href="traitement-note.jsp"><div class="div-a2">Notes des Etudiants</div></a>
        <a href="traitement-deliberation.jsp"><div class="div-a3">Deliberation</div></a>
        <a href="list_eleve.jsp"><div class="div-a3">Listes de tous les élèves</div></a>
        <a href="list_matiere.jsp"><div class="div-a3">Listes de toutes les matières</div></a>
        <a href="list_notes.jsp"><div class="div-a3">Listes des notes de tous les eleves </div></a>
         <a href="Fiche-input.jsp"><div class="div-a3">Fiche </div></a>
          <a href="insert_note.jsp"><div class="div-a3">Saisie de note </div></a>
           <a href="insert_payement.jsp"><div class="div-a3">Payement</div></a>
           <a href="Reste-traitement.jsp"><div class="div-a3">Reste a payer</div></a>
           <a href="payement_droit.jsp"><div class="div-a3">Payer droit</div></a>

      </div>

  </body>
</html>
