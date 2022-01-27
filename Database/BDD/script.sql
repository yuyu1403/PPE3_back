DROP DATABASE IF EXISTS AP1;

CREATE DATABASE AP1;

USE AP1;

CREATE TABLE TYPE_LIGUE(
   ID_TYPE_LIGUE BIGINT AUTO_INCREMENT,
   NOM_LIGUE VARCHAR(50),
   PRIMARY KEY(ID_TYPE_LIGUE)
) ENGINE = INNODB;

CREATE TABLE PARKING(
   ID_PLACE_PARKING BIGINT,
   NUM_PLACE INT,
   DISPO_PLACE BOOLEAN,
   PRIMARY KEY(ID_PLACE_PARKING)
) ENGINE = INNODB;

CREATE TABLE ADMINISTRATEUR(
   ID_ADMIN BIGINT,
   MP_ADMIN VARCHAR(50),
   PRIMARY KEY(ID_ADMIN)
) ENGINE = INNODB;

CREATE TABLE UTILISATEUR(
   ID_UTILISATEUR BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
   NOM_UTILISATEUR VARCHAR(50),
   PRENOM_UTILISATEUR VARCHAR(50),
   MAIL_UTILISATEUR VARCHAR(50),
   TELEPHONE_UTILISATEUR BIGINT,
   PASSWORD_UTILISATEUR VARCHAR (255),
   ID_TYPE_LIGUE BIGINT NOT NULL,
   PRIMARY KEY(ID_UTILISATEUR),
   FOREIGN KEY(ID_TYPE_LIGUE) REFERENCES TYPE_LIGUE(ID_TYPE_LIGUE)
) ENGINE = INNODB;

CREATE TABLE REPAS(
   ID_REPAS BIGINT,
   TYPE_REPAS VARCHAR(150),
   PRIMARY KEY(ID_REPAS)
) ENGINE = INNODB;

CREATE TABLE SALLE(
   ID_SALLE BIGINT,
   NOM_SALLE VARCHAR(50),
   CAPACITE_ACCUEIL BIGINT,
   PRIMARY KEY(ID_SALLE)
) ENGINE = INNODB;

CREATE TABLE PRODUITS(
   ID_PRODUITS BIGINT,
   NOM_PRODUITS VARCHAR(50),
   PRIMARY KEY(ID_PRODUITS)
) ENGINE = INNODB;

CREATE TABLE RESERVER(
   ID_SALLE BIGINT,
   DATE_REUNION DATE,
   ANNUL_RESA BOOLEAN,
   ID_ORGANISATEUR BIGINT UNSIGNED,
   ID_PLACE_PARKING BIGINT NOT NULL,
   ID_UTILISATEUR BIGINT UNSIGNED NOT NULL,
   ID_REPAS BIGINT NOT NULL,
   PRIMARY KEY(ID_SALLE),
   UNIQUE(ID_PLACE_PARKING, ID_ORGANISATEUR),
   FOREIGN KEY(ID_SALLE) REFERENCES SALLE(ID_SALLE),
   FOREIGN KEY(ID_PLACE_PARKING) REFERENCES PARKING(ID_PLACE_PARKING),
   FOREIGN KEY(ID_UTILISATEUR) REFERENCES UTILISATEUR(ID_UTILISATEUR),
   FOREIGN KEY(ID_ORGANISATEUR) REFERENCEs UTILISATEUR(ID_UTILISATEUR),
   FOREIGN KEY(ID_REPAS) REFERENCES REPAS(ID_REPAS)
) ENGINE = INNODB;

CREATE TABLE COMPOSER(
   ID_REPAS BIGINT,
   ID_PRODUITS BIGINT,
   PRIMARY KEY(ID_REPAS, ID_PRODUITS),
   FOREIGN KEY(ID_REPAS) REFERENCES REPAS(ID_REPAS),
   FOREIGN KEY(ID_PRODUITS) REFERENCES PRODUITS(ID_PRODUITS)
) ENGINE = INNODB;

-- POPULATION OF THE DATABASE
INSERT INTO
   `type_ligue` (`ID_TYPE_LIGUE`, `NOM_LIGUE`)
VALUES
   (1, 'Ligue de Football'),
   (2, 'Ligue de Tennis'),
   (3, 'Ligue de Volley Ball'),
   (4, 'Ligue de Basketball'),
   (5, 'Ligue Halterophilie'),
   (6, 'Ligue de Rugby');

INSERT INTO
   `utilisateur` (
      `ID_UTILISATEUR`,
      `NOM_UTILISATEUR`,
      `PRENOM_UTILISATEUR`,
      `MAIL_UTILISATEUR`,
      `TELEPHONE_UTILISATEUR`,
      `PASSWORD_UTILISATEUR`,
      `ID_TYPE_LIGUE`
   )
VALUES
   (
      101,
      'Landers',
      'Mark',
      'mlfoot@gmail.com',
      066654582,
      'bobetalice',
      1
   ),
   (
      102,
      'Aton',
      'Olivier',
      'aofoot@gmail.com',
      066547882,
      'bobetalice',
      1
   ),
   (
      103,
      'Becker',
      'Boris',
      'bbtennis@gmail.com',
      066884582,
      'bobetalice',
      2
   ),
   (
      104,
      'Dupuis',
      'George',
      'dpvolley@gmail.com',
      066994582,
      'bobetalice',
      3
   ),
   (
      105,
      'Nadal',
      'Rafael',
      'rltennis@gmail.com',
      066654882,
      'bobetalice',
      2
   ),
   (
      106,
      'Lomu',
      'Jonah',
      'jlrugby@gmail.com',
      066654582,
      'bobetalice',
      6
   ),
   (
      107,
      'Fernandez',
      'Alex',
      'afhalter@gmail.com',
      06665992,
      'bobetalice',
      5
   ),
   (
      108,
      'Fournier',
      'Romain',
      'rfhalter@gmail.com',
      066965582,
      'bobetalice',
      5
   ),
   (
      109,
      'Wenger',
      'Arsene',
      'awvolley@gmail.com',
      066654582,
      'bobetalice',
      3
   ),
   (
      110,
      'Rachid',
      'Khemissi',
      'zzbasket@gmail.com',
      066654582,
      'bobetalice',
      4
   );

INSERT INTO
   `salle` (`ID_SALLE`, `NOM_SALLE`, `CAPACITE_ACCUEIL`)
VALUES
   (1001, 'Majorelle', 50),
   (1002, 'Gruber', 60),
   (1003, 'Lamour', 30),
   (1004, 'Daume', 50),
   (1005, 'Baccarat', 40);

INSERT INTO
   `parking` (`ID_PLACE_PARKING`, `NUM_PLACE`, `DISPO_PLACE`)
VALUES
   (2001, 1, 1),
   (2002, 2, 1),
   (2003, 3, 1),
   (2004, 4, 1),
   (2005, 5, 1),
   (2006, 6, 1),
   (2007, 7, 1),
   (2008, 8, 1),
   (2009, 9, 1),
   (2010, 10, 1),
   (2011, 11, 1),
   (2012, 12, 1),
   (2013, 13, 1),
   (2014, 14, 1),
   (2015, 15, 1),
   (2016, 16, 1),
   (2017, 17, 1),
   (2018, 18, 1),
   (2019, 19, 1),
   (2020, 20, 1),
   (2021, 21, 1),
   (2022, 22, 1),
   (2023, 23, 1),
   (2024, 24, 1),
   (2025, 25, 1),
   (2026, 26, 1);

INSERT INTO 
   `repas` (`ID_REPAS`, `TYPE_REPAS`)
   VALUES
   (3001, 'Petit Dejeuner'),
   (3002, 'Collation'),
   (3003, 'Encas');

INSERT INTO 
   `produits` (`ID_PRODUITS`, `NOM_PRODUITS`)
   VALUES
   (4001, 'Cafe'),
   (4002, 'The'),
   (4003, 'Jus Orange'),
   (4004, 'Eau'),
   (4005, 'Viennoiserie'),
   (4006, 'Sandwich'),
   (4007, 'Sandwich Vegetarien'),
   (4008, 'Fruit'),
   (4009, 'Barre energetique');

INSERT INTO 
   `administrateur` (`ID_ADMIN`, `MP_ADMIN`)
   VALUES
   (666, 'root');