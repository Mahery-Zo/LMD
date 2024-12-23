 create table Classe (Semestre int , Matiere varchar(6));   
 create table Matiere1(code varchar(6),Nom varchar(40) , credits int );
 create table Note (id_classe int , id_eleve int , Matiere varchar(6) , note int);
 create table Etudiant(id_etudiant int , Nom varchar(40) , Matricule varchar(9));
create table matiere1_semestre (id_semestre int , matiere varchar(6));
create table matiere_all (code varchar(6) , nom varchar(50) , credits int);
create  table AnneeSco_semestre (id_annee_scolaire int , id_semestre int , FOREIGN KEY (id_annee_scolaire) REFERENCES Annee_scolaire(id_annee_scolaire));
CREATE TABLE Annee_scolaire (
    id_annee_scolaire INT,
    mois_debut INT,
    mois_fin INT,
    annee_debut INT,
    annee_fin INT,  -- Correction ici, ajout du type INT pour annee_fin
    PRIMARY KEY (id_annee_scolaire)
);
create table Ecolage (id_ecolage int , id_annee_scolaire int , Ecolage int ,  PRIMARY KEY (id_ecolage) , FOREIGN KEY (id_annee_scolaire) references Annee_scolaire(id_annee_scolaire) );
create table Payement_ecolage (matricule varchar(9) , id_ecolage int  , montant int , FOREIGN KEY (id_ecolage) references Ecolage(id_ecolage));
create table config_payement (marticule varchar(9) , id_annee_scolaire int , option_payement int , FOREIGN KEY (id_annee_scolaire) references Annee_scolaire(id_annee_scolaire) , FOREIGN KEY (option_payement) references option_payement(id_option_payement));
create table option_payement(id_option_payement int , descriptions varchar(40) , PRIMARY KEY(id_option_payement) );

create table reduction ( option_payement int , reduction int , FOREIGN KEY (option_payement) REFERENCES option_payement(id_option_payement));
    --Etudiants 
    INSERT INTO Etudiant(id_etudiant , Nom , Matricule) VALUES (1,'John','ETU003301');
      INSERT INTO Etudiant(id_etudiant , Nom , Matricule) VALUES (2,'Ives','ETU003302');
        INSERT INTO Etudiant(id_etudiant , Nom , Matricule) VALUES (3,'Elie','ETU003303');
          INSERT INTO Etudiant(id_etudiant , Nom , Matricule) VALUES (4,'Manon','ETU003304');
              INSERT INTO Etudiant(id_etudiant , Nom , Matricule) VALUES (5,'Bob','ETU003305');

    --Matiere1 (1 pour S1 , S2 , S3)
-- Semestre 1
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF101', 'Programmation procédurale', 7);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF104', 'HTML et Introduction au Web', 5);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF107', 'Informatique de Base', 4);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('MTH101', 'Arithmétique et nombres', 4);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('MTH102', 'Analyse mathématique', 6);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('ORG101', 'Techniques de communication', 4);

-- Semestre 2
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF102', 'Bases de données relationnelles', 5);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF103', 'Bases de l’administration système', 5);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF105', 'Maintenance matériel et logiciel', 4);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF106', 'Compléments de programmation', 6);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('MTH103', 'Calcul Vectoriel et Matriciel', 6);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('MTH105', 'Probabilité et Statistique', 4);

-- Semestre 3
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF201', 'Programmation orientée objet', 6);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF202', 'Bases de données objets', 6);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF203', 'Programmation système', 4);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('INF208', 'Réseaux informatiques', 6);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('MTH201', 'Méthodes numériques', 4);
INSERT INTO Matiere1 (code, Nom, credits) VALUES ('ORG201', 'Bases de gestion', 4);



    --Classe
    -- Semestre 1
INSERT INTO Classe (Semestre, Matiere) VALUES (1, 'INF101');
INSERT INTO Classe (Semestre, Matiere) VALUES (1, 'INF104');
INSERT INTO Classe (Semestre, Matiere) VALUES (1, 'INF107');
INSERT INTO Classe (Semestre, Matiere) VALUES (1, 'MTH101');
INSERT INTO Classe (Semestre, Matiere) VALUES (1, 'MTH102');
INSERT INTO Classe (Semestre, Matiere) VALUES (1, 'ORG101');

-- Semestre 2
INSERT INTO Classe (Semestre, Matiere) VALUES (2, 'INF102');
INSERT INTO Classe (Semestre, Matiere) VALUES (2, 'INF103');
INSERT INTO Classe (Semestre, Matiere) VALUES (2, 'INF105');
INSERT INTO Classe (Semestre, Matiere) VALUES (2, 'INF106');
INSERT INTO Classe (Semestre, Matiere) VALUES (2, 'MTH103');
INSERT INTO Classe (Semestre, Matiere) VALUES (2, 'MTH105');

-- Semestre 3
INSERT INTO Classe (Semestre, Matiere) VALUES (3, 'INF201');
INSERT INTO Classe (Semestre, Matiere) VALUES (3, 'INF202');
INSERT INTO Classe (Semestre, Matiere) VALUES (3, 'INF203');
INSERT INTO Classe (Semestre, Matiere) VALUES (3, 'INF208');
INSERT INTO Classe (Semestre, Matiere) VALUES (3, 'MTH201');
INSERT INTO Classe (Semestre, Matiere) VALUES (3, 'ORG201');


--Note (S1 , S2 , S3)
-- Semestre 1 pour 5 élèves
-- Semestre 1 pour 5 élèves avec des notes variées, dont certaines en dessous de la moyenne

-- Élève 1 (moyenne suffisante)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 1, 'INF101', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 1, 'INF104', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 1, 'INF107', 8);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 1, 'MTH101', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 1, 'MTH102', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 1, 'ORG101', 13);

-- Élève 2 (moyenne suffisante avec des notes variées)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 2, 'INF101', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 2, 'INF104', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 2, 'INF107', 10);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 2, 'MTH101', 6);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 2, 'MTH102', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 2, 'ORG101', 8);

-- Élève 3 (moyenne insuffisante, plusieurs notes faibles)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 3, 'INF101', 5);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 3, 'INF104', 4);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 3, 'INF107', 3);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 3, 'MTH101', 2);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 3, 'MTH102', 6);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 3, 'ORG101', 5);

-- Élève 4 (moyenne suffisante, des notes variées)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 4, 'INF101', 10);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 4, 'INF104', 7);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 4, 'INF107', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 4, 'MTH101', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 4, 'MTH102', 8);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 4, 'ORG101', 10);

-- Élève 5 (moyenne suffisante, des notes basses et élevées)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 5, 'INF101', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 5, 'INF104', 5);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 5, 'INF107', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 5, 'MTH101', 7);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 5, 'MTH102', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (1, 5, 'ORG101', 9);


-- Semestre 2 pour 5 élèves avec des notes variées, dont certains ayant ou n'ayant pas la moyenne

-- Élève 1 (moyenne suffisante avec une seule note < 10)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 1, 'INF102', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 1, 'INF103', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 1, 'INF105', 9);  
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 1, 'INF106', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 1, 'MTH103', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 1, 'MTH105', 15);

-- Élève 2 (moyenne suffisante)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 2, 'INF102', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 2, 'INF103', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 2, 'INF105', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 2, 'INF106', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 2, 'MTH103', 10);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 2, 'MTH105', 13);

-- Élève 3 (moyenne insuffisante, plusieurs notes < 10)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 3, 'INF102', 5);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 3, 'INF103', 7);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 3, 'INF105', 6);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 3, 'INF106', 8);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 3, 'MTH103', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 3, 'MTH105', 7);

-- Élève 4 (moyenne insuffisante, plusieurs notes < 10)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 4, 'INF102', 8);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 4, 'INF103', 6);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 4, 'INF105', 4);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 4, 'INF106', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 4, 'MTH103', 5);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 4, 'MTH105', 6);

-- Élève 5 (moyenne suffisante)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 5, 'INF102', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 5, 'INF103', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 5, 'INF105', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 5, 'INF106', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 5, 'MTH103', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (2, 5, 'MTH105', 10);


-- Semestre 3 pour 5 élèves avec des notes variées

-- Élève 1 (moyenne d'environ 13)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 1, 'INF201', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 1, 'INF202', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 1, 'INF203', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 1, 'INF208', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 1, 'MTH201', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 1, 'ORG201', 14);

-- Élève 2 (moyenne suffisante)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 2, 'INF201', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 2, 'INF202', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 2, 'INF203', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 2, 'INF208', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 2, 'MTH201', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 2, 'ORG201', 14);

-- Élève 3 (moyenne suffisante)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 3, 'INF201', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 3, 'INF202', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 3, 'INF203', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 3, 'INF208', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 3, 'MTH201', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 3, 'ORG201', 12);

-- Élève 4 (moyenne suffisante)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 4, 'INF201', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 4, 'INF202', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 4, 'INF203', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 4, 'INF208', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 4, 'MTH201', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 4, 'ORG201', 14);

-- Élève 5 (notes faibles avec une seule note à 0)
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 5, 'INF201', 4);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 5, 'INF202', 6);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 5, 'INF203', 5);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 5, 'INF208', 0);  
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 5, 'MTH201', 7);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (3, 5, 'ORG201', 6);



create table Matiere_Dev (Code varchar(6) , Nom varchar(40) , options int , id_semestre int ,credits int );
create table Matiere_Base(Code varchar(6) , Nom varchar (40) , options int , id_semestre int , credits int );
create table Matiere_Web (Code varchar(6) , Nom varchar(40) , options int , id_semestre int , credits int );

--          DEV
-- Semestre 4
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF204', 'Système d information géographique', 1, 4, 6);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF205', 'Système d information', 1, 4, 6);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF206', 'Interface Homme/Machine', 1, 4, 6);

INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF207', 'Éléments d algorithmique', 2, 4, 6);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF210', 'Mini-projet de développement', 3, 4, 10);

INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('MTH204', 'Géométrie', 4, 4, 4);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('MTH205', 'Équations différentielles', 4, 4, 4);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('MTH206', 'Optimisation', 4, 4, 4);

INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('MTH203', 'MAO', 5, 4, 4);





-- Semestre 5
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF301', 'Architecture logicielle', 6, 5, 6);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF304', 'Développement pour mobiles', 7, 5, 6);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF307', 'Conception en modèle orienté objet', 8, 5, 6);

INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('ORG301', 'Gestion d entreprise', 9, 5, 5);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('ORG302', 'Gestion de projets', 10, 5, 4);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('ORG303', 'Anglais pour les affaires', 11, 5, 3);


-- Semestre 6
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF310', 'Codage', 12, 6, 4);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF313', 'Programmation avancée, frameworks', 13, 6, 6);

INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF302', 'Technologies d accès aux réseaux', 14, 6, 6);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF303', 'Multimédia', 14, 6, 6);

INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('INF316', 'Projet de développement', 15, 6, 10);
INSERT INTO Matiere_Dev (Code, Nom, options, id_semestre, credits) VALUES ('ORG304', 'Communication d entreprise', 16, 6, 4);


--BASE

-- Semestre 4
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF205', 'Système d information', 1, 4, 6);

INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF204', 'Système d information géographique', 2, 4, 6);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF206', 'Interface Homme/Machine', 2, 4, 6);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF207', 'Éléments d algorithmique', 2, 4, 6);

INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF211', 'Mini-projet de BD/réseaux', 3, 4, 10);


INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('MTH202', 'Analyse des données', 4, 4, 4);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('MTH205', 'Équations différentielles', 4, 4, 4);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('MTH206', 'Optimisation', 4, 4, 4);

INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('MTH203', 'MAO', 5, 4, 4);


-- Semestre 5
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF302', 'Technologies d accès aux réseaux', 6, 5, 6);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF305', 'Gestion de domaines, clustering', 7, 5, 6);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF308', 'Conception en modèle relationnel', 8, 5, 6);

INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('ORG301', 'Gestion d entreprise', 9, 5, 5);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('ORG302', 'Gestion de projets', 10, 5, 4);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('ORG303', 'Anglais pour les affaires', 11, 5, 3);


-- Semestre 6
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF311', 'Datawarehouse et datamining', 12, 6, 4);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF314', 'Bases de données avancées', 13, 6, 6);


INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF303', 'Multimédia', 14, 6, 6);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF304', 'Développement pour mobiles', 14, 6, 6);

INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('INF317', 'Projet de Bases données/ réseaux', 15, 6, 10);
INSERT INTO Matiere_Base (Code, Nom, options, id_semestre, credits) VALUES ('ORG304', 'Communication d entreprise', 16, 6, 4);


--WEB

-- Semestre 4
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF205', 'Système d information', 2, 4, 6);


INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF204', 'Système d information géographique', 2, 4, 6);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF206', 'Interface Homme/Machine', 2, 4, 6);

INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF209', 'Web dynamique', 3, 4, 6);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF212', 'Mini-projet de Web et design', 4, 4, 10);

INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('MTH202', 'Analyse des données', 5, 4, 4);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('MTH204', 'Géométrie', 5, 4, 4);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('MTH206', 'Optimisation', 5, 4, 4);

INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('MTH203', 'MAO', 6, 4, 4);


-- Semestre 5
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF303', 'Multimédia', 7, 5, 6);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF306', 'Introduction au cloud', 8, 5, 6);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF309', 'Web avancé', 9, 5, 6);

INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('ORG301', 'Gestion d entreprise', 10, 5, 5);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('ORG302', 'Gestion de projets', 11, 5, 4);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('ORG303', 'Anglais pour les affaires', 12, 5, 3);


-- Semestre 6
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF312', 'Web design', 13, 6, 4);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF315', 'Web services', 14, 6, 6);


INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF302', 'Technologies d accès aux réseaux', 15, 6, 6);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF304', 'Développement pour mobiles', 15, 6, 6);

INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('INF318', 'Projet de Web et design', 16, 6, 10);
INSERT INTO Matiere_Web (Code, Nom, options, id_semestre, credits) VALUES ('ORG304', 'Communication d entreprise', 17, 6, 4);

INSERT INTO Etudiant(id_etudiant , Nom , Matricule) VALUES (6,'Zo','ETU003349');
--Note pour les matieres DEV
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'INF204', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'INF205', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'INF206', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'INF207', 4);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'INF210', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'MTH204', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'MTH205', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'MTH206', 3);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 1, 'MTH203', 16);




-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 1, 'INF301', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 1, 'INF304', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 1, 'INF307', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 1, 'ORG301', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 1, 'ORG302', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 1, 'ORG303', 10);


-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 1, 'INF310', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 1, 'INF313', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 1, 'INF302', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 1, 'INF303', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 1, 'INF316', 18);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 1, 'ORG304', 14);


--Note pour les matiere base 
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF205', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF204', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF206', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF207', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF207');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF211', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF211' and id_classe =4);

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'MTH202', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'MTH205', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'MTH205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'MTH206', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'MTH203', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'INF302', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'INF305', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF305');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'INF308', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF308');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'ORG301', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'ORG302', 11
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'ORG303', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF311', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF311');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF314', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF314');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF303', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF304', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF317', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF317');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'ORG304', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'ORG304');

--note pour les matiere WEB 
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF205', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF204', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF206', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF209', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF209');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'INF212', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF212');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'MTH202', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'MTH204', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'MTH204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'MTH206', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 1, 'MTH203', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'INF303', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'INF306', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF306');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'INF309', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF309');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'ORG301', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'ORG302', 11
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 1, 'ORG303', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF312', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF312');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF315', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF315');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF302', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF304', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'INF318', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'INF318');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 1, 'ORG304', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 1 AND Matiere = 'ORG304');





--Note pour les matieres DEV
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'INF204', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'INF205', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'INF206', 8);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'INF207', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'INF210', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'MTH204', 5);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'MTH205', 7);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'MTH206', 10);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 2, 'MTH203', 4);

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 2, 'INF301', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 2, 'INF304', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 2, 'INF307', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 2, 'ORG301', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 2, 'ORG302', 6);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 2, 'ORG303', 8);

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 2, 'INF310', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 2, 'INF313', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 2, 'INF302', 7);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 2, 'INF303', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 2, 'INF316', 18);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 2, 'ORG304', 10);

--Note pour les matieres base
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF205', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF204', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF206', 4
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF207', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF207');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF211', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF211');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'MTH202', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'MTH205', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'MTH205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'MTH206', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'MTH203', 3
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'INF302', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'INF305', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF305');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'INF308', 11
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF308');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'ORG301', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'ORG302', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'ORG303', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF311', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF311');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF314', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF314');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF303', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF304', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF317', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF317');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'ORG304', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'ORG304');

--Note pour les parcour Web

-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF205', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF204', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF206', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF209', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF209');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'INF212', 18
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF212');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'MTH202', 11
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'MTH204', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'MTH204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'MTH206', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 2, 'MTH203', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'INF303', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'INF306', 18
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF306');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'INF309', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF309');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'ORG301', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'ORG302', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 2, 'ORG303', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF312', 18
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF312');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF315', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF315');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF302', 19
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF304', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'INF318', 20
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'INF318');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 2, 'ORG304', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 2 AND Matiere = 'ORG304');
 




-- Note pour les matières DEV
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'INF204', 8);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'INF205', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'INF206', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'INF207', 17);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'INF210', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'MTH204', 6);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'MTH205', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'MTH206', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 3, 'MTH203', 5);

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 3, 'INF301', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 3, 'INF304', 18);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 3, 'INF307', 10);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 3, 'ORG301', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 3, 'ORG302', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 3, 'ORG303', 11);

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 3, 'INF310', 7);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 3, 'INF313', 18);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 3, 'INF302', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 3, 'INF303', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 3, 'INF316', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 3, 'ORG304', 10);

-- Note pour les matières BASE
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF205', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF204', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF206', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF207', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF207');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF211', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF211');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'MTH202', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'MTH205', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'MTH205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'MTH206', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'MTH203', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'INF302', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'INF305', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF305');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'INF308', 11
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF308');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'ORG301', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'ORG302', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'ORG303', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF311', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF311');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF314', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF314');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF303', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF304', 11
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF317', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF317');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'ORG304', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'ORG304');

-- Note pour les matières WEB
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF205', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF204', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF206', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF209', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF209');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'INF212', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF212');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'MTH202', 5
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'MTH204', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'MTH204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'MTH206', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 3, 'MTH203', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'INF303', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'INF306', 18
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF306');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'INF309', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF309');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'ORG301', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'ORG302', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 3, 'ORG303', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF312', 19
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF312');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF315', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF315');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF302', 4
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF304', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'INF318', 20
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'INF318');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 3, 'ORG304', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 3 AND Matiere = 'ORG304');




--Note pour les matieres DEV
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'INF204', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'INF205', 8);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'INF206', 7);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'INF207', 18);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'INF210', 19);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'MTH204', 6);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'MTH205', 10);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'MTH206', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 4, 'MTH203', 5);

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 4, 'INF301', 17);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 4, 'INF304', 18);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 4, 'INF307', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 4, 'ORG301', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 4, 'ORG302', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 4, 'ORG303', 8);

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 4, 'INF310', 10);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 4, 'INF313', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 4, 'INF302', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 4, 'INF303', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 4, 'INF316', 20);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 4, 'ORG304', 12);

--Note pour les matieres base
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF205', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF204', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF206', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF207', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF207');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF211', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF211');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'MTH202', 5
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'MTH205', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'MTH205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'MTH206', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'MTH203', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'INF302', 18
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'INF305', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF305');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'INF308', 19
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF308');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'ORG301', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'ORG302', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'ORG303', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF311', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF311');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF314', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF314');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF303', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF304', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF317', 19
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF317');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'ORG304', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'ORG304');

--Web
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF205', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF204', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF206', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF209', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF209');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'INF212', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF212');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'MTH202', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'MTH204', 11
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'MTH204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'MTH206', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 4, 'MTH203', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'INF303', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'INF306', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF306');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'INF309', 18
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF309');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'ORG301', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'ORG302', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 4, 'ORG303', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF312', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF312');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF315', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF315');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF302', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF304', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'INF318', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'INF318');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 4, 'ORG304', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 4 AND Matiere = 'ORG304');



-- Note pour les matieres DEV
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'INF204', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'INF205', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'INF206', 10);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'INF207', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'INF210', 18);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'MTH204', 8);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'MTH205', 11);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'MTH206', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (4, 5, 'MTH203', 7);

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 5, 'INF301', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 5, 'INF304', 15);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 5, 'INF307', 17);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 5, 'ORG301', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 5, 'ORG302', 9);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (5, 5, 'ORG303', 11);

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 5, 'INF310', 12);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 5, 'INF313', 14);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 5, 'INF302', 16);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 5, 'INF303', 13);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 5, 'INF316', 17);
INSERT INTO Note (id_classe, id_eleve, Matiere, note) VALUES (6, 5, 'ORG304', 16);

-- Note pour les matieres base
-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF205', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF204', 16
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF206', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF207', 17
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF207');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF211', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF211');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'MTH202', 11
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'MTH205', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'MTH205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'MTH206', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'MTH203', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'INF302', 15 
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'INF305', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF305');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'INF308', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF308');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'ORG301', 10
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'ORG302', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'ORG303', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF311', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF311');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF314', 12
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF314');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF303', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF304', 13
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF317', 14
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF317');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'ORG304', 15
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'ORG304');

---WEB

-- Semestre 4
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF205', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF205');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF204', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF206', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF209', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF209');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'INF212', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF212');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'MTH202', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'MTH202');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'MTH204', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'MTH204');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'MTH206', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'MTH206');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 4, 5, 'MTH203', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'MTH203');

-- Semestre 5
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'INF303', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF303');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'INF306', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF306');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'INF309', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF309');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'ORG301', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'ORG301');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'ORG302', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'ORG302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'ORG303', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'ORG303');

-- Semestre 6
INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF312', 9
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF312');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF315', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF315');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 5, 5, 'INF302', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF302');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF304', 6
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF304');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'INF318', 8
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'INF318');

INSERT INTO Note (id_classe, id_eleve, Matiere, note)
SELECT 6, 5, 'ORG304', 7
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM Note WHERE id_eleve = 5 AND Matiere = 'ORG304');


create table config_matiere ( code varchar(6), options int) ;


INSERT INTO config_matiere (code, options) VALUES ('INF204',0);
INSERT INTO config_matiere (code, options) VALUES ('ORG101',0);
INSERT INTO config_matiere (code, options) VALUES ('INF106',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH105',0);
INSERT INTO config_matiere (code, options) VALUES ('INF201',0);
INSERT INTO config_matiere (code, options) VALUES ('ORG201',0);
INSERT INTO config_matiere (code, options) VALUES ('INF317',0);
INSERT INTO config_matiere (code, options) VALUES ('INF212',0);
INSERT INTO config_matiere (code, options) VALUES ('INF205',0);
INSERT INTO config_matiere (code, options) VALUES ('INF208',0);
INSERT INTO config_matiere (code, options) VALUES ('INF307',0);
INSERT INTO config_matiere (code, options) VALUES ('INF303',0);
INSERT INTO config_matiere (code, options) VALUES ('INF311',0);
INSERT INTO config_matiere (code, options) VALUES ('INF210',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH203',0);
INSERT INTO config_matiere (code, options) VALUES ('INF103',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH201',0);
INSERT INTO config_matiere (code, options) VALUES ('ORG303',0);
INSERT INTO config_matiere (code, options) VALUES ('INF310',0);
INSERT INTO config_matiere (code, options) VALUES ('INF313',0);
INSERT INTO config_matiere (code, options) VALUES ('INF305',0);
INSERT INTO config_matiere (code, options) VALUES ('INF101',0);
INSERT INTO config_matiere (code, options) VALUES ('INF304',0);
INSERT INTO config_matiere (code, options) VALUES ('ORG301',0);
INSERT INTO config_matiere (code, options) VALUES ('ORG302',0);
INSERT INTO config_matiere (code, options) VALUES ('INF302',0);
INSERT INTO config_matiere (code, options) VALUES ('ORG304',0);
INSERT INTO config_matiere (code, options) VALUES ('INF314',0);
INSERT INTO config_matiere (code, options) VALUES ('INF209',0);
INSERT INTO config_matiere (code, options) VALUES ('INF107',0);
INSERT INTO config_matiere (code, options) VALUES ('INF105',0);
INSERT INTO config_matiere (code, options) VALUES ('INF203',0);
INSERT INTO config_matiere (code, options) VALUES ('INF315',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH204',0);
INSERT INTO config_matiere (code, options) VALUES ('INF104',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH103',0);
INSERT INTO config_matiere (code, options) VALUES ('INF202',0);
INSERT INTO config_matiere (code, options) VALUES ('INF301',0);
INSERT INTO config_matiere (code, options) VALUES ('INF211',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH202',0);
INSERT INTO config_matiere (code, options) VALUES ('INF308',0);
INSERT INTO config_matiere (code, options) VALUES ('INF306',0);
INSERT INTO config_matiere (code, options) VALUES ('INF206',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH101',0);
INSERT INTO config_matiere (code, options) VALUES ('INF102',0);
INSERT INTO config_matiere (code, options) VALUES ('INF309',0);
INSERT INTO config_matiere (code, options) VALUES ('INF312',0);
INSERT INTO config_matiere (code, options) VALUES ('INF207',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH205',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH206',0);
INSERT INTO config_matiere (code, options) VALUES ('MTH102',0);
INSERT INTO config_matiere (code, options) VALUES ('INF316',0);
INSERT INTO config_matiere (code, options) VALUES ('INF318',0);


SELECT MAX(note), matiere_web.options 
FROM note 
JOIN matiere_web 
  ON matiere_web.code = note.matiere 
WHERE note.id_eleve = 5 
  AND matiere_web.id_semestre = 4 
GROUP BY matiere_web.options
ORDER BY matiere_web.options;

--maka ny note max par option , ny option sy ny matiere correspondante

WITH MaxNotes AS (
    SELECT Matiere_Dev.options, MAX(note)  AS max_note
    FROM note
    JOIN Matiere_Dev ON Matiere_Dev.code = note.matiere
    WHERE note.id_eleve = 2
      AND Matiere_Dev.id_semestre = 4
    GROUP BY Matiere_Dev.options
)
SELECT note.note, Matiere_Dev.options, Matiere_Dev.code
FROM note
JOIN Matiere_Dev ON Matiere_Dev.code = note.matiere
JOIN MaxNotes ON MaxNotes.options = Matiere_Dev.options AND note.note = MaxNotes.max_note
WHERE note.id_eleve = 2
  AND Matiere_Dev.id_semestre = 4
ORDER BY Matiere_Dev.options;

-- maka isa note <10 na < 6

select count(note) as isa from(
WITH MaxNotes AS (
    SELECT matiere_web.options, MAX(note) AS max_note
    FROM note
    JOIN matiere_web ON matiere_web.code = note.matiere
    WHERE note.id_eleve = 5 
      AND matiere_web.id_semestre = 4
    GROUP BY matiere_web.options
)
SELECT note.note, matiere_web.options, matiere_web.code
FROM note
JOIN matiere_web ON matiere_web.code = note.matiere
JOIN MaxNotes ON MaxNotes.options = matiere_web.options AND note.note = MaxNotes.max_note
WHERE note.id_eleve = 5 
  AND matiere_web.id_semestre = 4
ORDER BY matiere_web.options
) where note < 10 ;

WITH MaxNotes AS (
    SELECT matiere_web.options, MAX(note) AS max_note
    FROM note
    JOIN matiere_web ON matiere_web.code = note.matiere
    WHERE note.id_eleve = 5 
      AND matiere_web.id_semestre = 4
    GROUP BY matiere_web.options
)
SELECT note.note, matiere_web.options, matiere_web.code , matiere_web.credits
FROM note
JOIN matiere_web ON matiere_web.code = note.matiere
JOIN MaxNotes ON MaxNotes.options = matiere_web.options AND note.note = MaxNotes.max_note
WHERE note.id_eleve = 5 
  AND matiere_web.id_semestre = 4
ORDER BY matiere_web.options
;


---
WITH MaxNotes AS (
    SELECT matiere_web.options, MAX(note) AS max_note
    FROM note
    JOIN matiere_web ON matiere_web.code = note.matiere
    WHERE note.id_eleve = 2 
      AND matiere_web.id_semestre = 4
    GROUP BY matiere_web.options
)
SELECT note.note, matiere_web.options, matiere_web.code
FROM note
JOIN matiere_web ON matiere_web.code = note.matiere
JOIN MaxNotes ON MaxNotes.options = matiere_web.options AND note.note = MaxNotes.max_note
WHERE note.id_eleve = 2 
  AND matiere_web.id_semestre = 4 and  note < 10
ORDER BY matiere_web.options;

WITH RankedNotes AS (
    SELECT note.note, matiere_web.options,
           ROW_NUMBER() OVER (PARTITION BY matiere_web.options ORDER BY note.note DESC) AS rank
    FROM note
    JOIN matiere_web ON note.matiere = matiere_web.code
    WHERE note.id_classe = 4 AND note.id_eleve = 3
)
SELECT options,
       CASE
           WHEN COUNT(*) = 1 THEN MAX(note)  
           ELSE AVG(note)                    
       END AS note
FROM RankedNotes 
WHERE rank <= 2 and note < 10
GROUP BY options ;


WITH RankedNotes AS (
    SELECT note.note, matiere_web.options, note.matiere AS code,
           ROW_NUMBER() OVER (PARTITION BY matiere_web.options ORDER BY note.note DESC) AS rank
    FROM note
    JOIN matiere_web ON note.matiere = matiere_web.code
    WHERE note.id_classe = 4 AND note.id_eleve = 5
)
SELECT options,
       LISTAGG(code, ', ') WITHIN GROUP (ORDER BY note DESC) AS codes,
       CASE
           WHEN COUNT(*) = 1 THEN MAX(note)  
           ELSE AVG(note)                    
       END AS note
FROM RankedNotes
WHERE rank <= 2  and note < 10
GROUP BY options;


WITH RankedNotes AS (
    SELECT note.note, matiere_web.options, note.matiere AS code,
           ROW_NUMBER() OVER (PARTITION BY matiere_web.options ORDER BY note.note DESC) AS rank
    FROM note
    JOIN matiere_web ON note.matiere = matiere_web.code
    WHERE note.id_classe = 4 AND note.id_eleve = 3
),
FilteredNotes AS (
    SELECT options,
           LISTAGG(code, ', ') WITHIN GROUP (ORDER BY note DESC) AS codes,
           CASE
               WHEN COUNT(*) = 1 THEN MAX(note)  
               ELSE AVG(note)                    
           END AS note
    FROM RankedNotes
    WHERE rank <= 2 AND note < 6
    GROUP BY options
)
SELECT COUNT(*) AS isa
FROM FilteredNotes;


WITH RankedNotes AS (
    SELECT note.note, matiere_web.options, note.matiere AS code, matiere_web.credits,
           ROW_NUMBER() OVER (PARTITION BY matiere_web.options ORDER BY note.note DESC) AS rank
    FROM note
    JOIN matiere_web ON note.matiere = matiere_web.code
    WHERE note.id_classe = 4 AND note.id_eleve = 3
)
SELECT options,
       LISTAGG(code, ', ') WITHIN GROUP (ORDER BY note DESC) AS code,
       CASE
           WHEN COUNT(*) = 1 THEN MAX(note)  
           ELSE AVG(note)                    
       END AS note,
       MAX(credits) AS credits  
FROM RankedNotes
WHERE rank <= 2 and note < 10 
GROUP BY options;

CREATE TABLE Note_deliberation (
    id_classe INT,
    id_eleve INT,
    Matiere VARCHAR(6),
    note NUMBER(5, 2)
);


INSERT INTO Note_deliberation (id_classe, id_eleve, Matiere, note)
SELECT id_classe, id_eleve, Matiere, note FROM Note_modif;


 select note_modif.id_classe as id_classe , note_modif.id_eleve as id_eleve , note_modif.matiere as matiere, note_modif.note*matiere1.credits as note   from note_modif join matiere1 on matiere1.code = note_modif.matiere ;
  select note_modif.id_classe as id_classe , note_modif.id_eleve as id_eleve , note_modif.matiere as matiere, note_modif.note*matiere_optionel.credits as note   from note_modif join matiere_optionel on matiere_optionel.code = note_modif.matiere ;
  select code , nom , id_semestre , credits matiere_web union select code , nom , id_semestre , credits from matiere_dev union select code , nom , id_semestre , credits from matiere_base

  INSERT into note_deliberation (select note_modif.id_classe as id_classe , note_modif.id_eleve as id_eleve , note_modif.matiere as matiere, note_modif.note*matiere1.credits as note   from note_modif join matiere1 on matiere1.code = note_modif.matiere );  
  insert into note_deliberation (select note_modif.id_classe as id_classe ,note_modif.id_eleve as id_eleve , note_modif.matiere as matiere , note_modif.note*matiere_optionnel.credits as note from note_modif join matiere_optionnel on matiere_optionnel.code = note_modif.matiere);
  create view note_deliberation1 as (select distinct * from note_deliberation where id_eleve != 6);



-- Note avant apres deliberation s1 S2 S3
 SELECT 
            note.matiere AS matiere,
            note.note AS note_avant_delib,
            nd.note AS note_apres_delib
        FROM
            (SELECT 
                 nm.id_classe,
                 nm.id_eleve,
                 nm.matiere,
                 nm.note * m.credits AS note
             FROM 
                 note_modif nm
             JOIN 
                 matiere1 m 
             ON 
                 m.code = nm.matiere) note
        LEFT JOIN 
            note_deliberation1 nd 
        ON 
            note.id_classe = nd.id_classe 
            AND note.id_eleve = nd.id_eleve 
            AND note.matiere = nd.matiere
        WHERE 
            note.id_classe = 1
            AND note.id_eleve = 5;


select note_avant.matiere , note_avant.note as note_avant_deliberation, note_apres.note as note_apres_deliberation  from(
  select nm.matiere , nm.id_eleve , nm.note*matiere_web.credits as note   from note_modif  nm join matiere_web on rm.matiere = matiere_web.code where id_classe = 5 and id_eleve = 2
) as note_avant join (select nd.matiere , nd.id_eleve , nm.id_eleve  from note_deliberation1 nd  ) as note_apres on note_avant.id_matiere = note_apres.id_matiere ;


--AVOIR LE NOM DES COLLONES 
SELECT COLUMN_NAME, DATA_TYPE
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'NOTE_MODIF';