use ap1;

DELIMITER //

-- insertNewUser -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE insertNewUser (IN p_prenom VARCHAR(255),IN p_nom VARCHAR(255), IN p_email VARCHAR(255), IN p_telephone INT, 
IN p_password VARCHAR(255), IN id_type_ligue BIGINT)
BEGIN
    INSERT INTO `UTILISATEUR` (
    `PRENOM_UTILISATEUR`,
    `NOM_UTILISATEUR`,
    `MAIL_UTILISATEUR`,
    `TELEPHONE_UTILISATEUR`,
    `PASSWORD_UTILISATEUR`,
    `ID_TYPE_LIGUE`) VALUES (p_prenom, p_nom, p_email, p_telephone, p_password, id_type_ligue);
END //

-- bookReservation -------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE bookReservation (IN p_date DATE, IN p_organisateur BIGINT, IN p_placeparking BIGINT, IN p_repas BIGINT, IN p_salle BIGINT, IN p_utilisateur BIGINT)
BEGIN
    INSERT INTO `RESERVER`(
    `DATE_REUNION` ,
    `ID_ORGANISATEUR` ,
    `ID_PLACE_PARKING` ,
    `ID_REPAS` ,
    `ID_SALLE` ,
    `ID_UTILISATEUR`) VALUES (p_date, p_organisateur, p_placeparking, p_repas, p_salle, p_utilisateur);
END //

-- updateReservation -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE updateReservation (IN p_organisateur BIGINT, IN p_date DATE, IN p_placeparking BIGINT, IN p_repas BIGINT,
IN p_salle BIGINT)
BEGIN
    UPDATE RESERVER
    SET DATE_REUNION = p_date,
    ID_PLACE_PARKING = p_placeparking,
    ID_REPAS = p_repas,
    ID_SALLE = p_salle
    WHERE ID_ORGANISATEUR = p_organisateur;
END //

-- deleteBookReservation -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE deleteBookReservation (IN p_date DATE, IN p_organisateur BIGINT)
BEGIN
    DELETE 
    FROM RESERVER
    WHERE DATE_REUNION = p_date 
    AND ID_ORGANISATEUR = p_organisateur;
END//

-- identification -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE identification (IN p_email VARCHAR(255),IN p_password VARCHAR(255))
BEGIN
SELECT NOM_UTILISATEUR, PRENOM_UTILISATEUR, MAIL_UTILISATEUR, TELEPHONE_UTILISATEUR, PASSWORD_UTILISATEUR, NOM_LIGUE
FROM UTILISATEUR
INNER JOIN TYPE_LIGUE ON UTILISATEUR.ID_TYPE_LIGUE = TYPE_LIGUE.ID_TYPE_LIGUE
WHERE MAIL_UTILISATEUR = p_email
AND PASSWORD_UTILISATEUR = p_password;
END //

-- identificationAdmin -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE identificationAdmin (IN p_password VARCHAR(50))
BEGIN
SELECT ID_ADMIN
FROM ADMINISTRATEUR
WHERE MP_ADMIN = p_password;
END //

-- annulationReservation -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE cancelReservation (IN p_organisateur BIGINT,IN p_annulation BOOLEAN)
BEGIN
    UPDATE RESERVER
    SET ANNUL_RESA = p_annulation
    WHERE ID_ORGANISATEUR = p_organisateur;
END //
