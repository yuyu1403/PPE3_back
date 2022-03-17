use ap1;

DELIMITER //

/**PROCEDURES REUNION**/
-- La table REUNION est utilisee pour permettre à l'utilisateur-organisateur de creer et gerer une réunion.
-- En plus d'une salle à date, l'utilisateur peut selectionner une categorie de repas. A ne pas confondre
-- avec RESERVATION dans laquelle l'utilisateur participant à la réunion peut réserver une place de parking
-- ainsi que choisir s'il souhaite un repas ou non (application mobile.)

---- createReunion -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE createReunion (IN p_reunion BIGINT, IN p_date DATE, IN p_organisateur BIGINT, IN p_salle BIGINT, 
IN p_repas BIGINT)
BEGIN
    INSERT INTO `REUNION`(
    `ID_REUNION` ,
    `DATE_REUNION`,
    `ID_ORGANISATEUR` ,
    `ID_SALLE` ,
    `ID_REPAS`) VALUES (p_reunion, p_date, p_organisateur, p_salle, p_repas);
END //

----- getAllReunions -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE getAllReunions()
BEGIN
    SELECT * FROM REUNION;
END //

----- getReunionByDate-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE getReunionByDate(IN p_date DATE)
BEGIN
    SELECT * FROM REUNION
    WHERE DATE_REUNION = p_date;
END //

----- updateReunion------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE updateReunion ( IN p_organisateur BIGINT, IN p_reunion BIGINT, p_date DATE, IN p_salle BIGINT, 
IN p_repas BIGINT)
BEGIN
    UPDATE REUNION 
    SET DATE_REUNION = p_date,
    ID_SALLE = p_salle,
    ID_REPAS = p_repas
    WHERE ID_ORGANISATEUR = p_organisateur AND ID_REUNION = p_reunion;
    END //

----- deleteReunion------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE deleteReunion(IN p_organisateur BIGINT, IN p_date DATE)
BEGIN
    DELETE
    FROM REUNION
    WHERE ID_ORGANISATEUR = p_organisateur AND DATE_REUNION = p_date;
    END //

----- cancelReunion------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE cancelReunion(IN p_organisateur BIGINT, IN p_reunion BIGINT, p_annulation BOOLEAN)
BEGIN
    UPDATE REUNION
    SET ANNUL_RESA = p_annulation
    WHERE ID_ORGANISATEUR = p_organisateur AND ID_REUNION = p_reunion;
    END //


    CREATE OR REPLACE PROCEDURE bookReunionDetails(IN p_reunion BIGINT, IN p_utilisateur BIGINT,
IN p_placeparking BIGINT, IN p_hasrepas BOOLEAN)
BEGIN
    INSERT INTO `RESERVATION`(
    `ID_REUNION`,
    `ID_UTILISATEUR`,
    `ID_PLACE_PARKING`,
    `HAS_REPAS`) VALUES (p_reunion, p_utilisateur, p_placeparking, p_hasrepas);
END //

---- updateReunionDetails -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE updateReunionDetails(IN p_reunion BIGINT, IN p_utilisateur BIGINT, 
 p_placeparking BIGINT, p_hasrepas BOOLEAN)
 BEGIN
    UPDATE RESERVATION
    SET ID_PLACE_PARKING = p_placeparking,
    HAS_REPAS = p_hasrepas
    WHERE ID_REUNION = p_reunion AND ID_UTILISATEUR = p_utilisateur;
    END //
    
---- deleteReunionDetails -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE deleteReunionDetails (IN p_reunion BIGINT, IN p_utilisateur BIGINT)
BEGIN
    DELETE FROM RESERVATION
    WHERE ID_REUNION = p_reunion AND ID_UTILISATEUR = p_utilisateur;
    END //

---- getAllReunionDetails -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE getAllReunionDetails()
BEGIN
    SELECT * FROM RESERVATION;
END //

CREATE OR REPLACE PROCEDURE bookReunionDetails(IN p_reunion BIGINT, IN p_utilisateur BIGINT,
IN p_placeparking BIGINT, IN p_hasrepas BOOLEAN)
BEGIN
    INSERT INTO `RESERVATION`(
    `ID_REUNION`,
    `ID_UTILISATEUR`,
    `ID_PLACE_PARKING`,
    `HAS_REPAS`) VALUES (p_reunion, p_utilisateur, p_placeparking, p_hasrepas);
END //



/** PROCEDURES RESERVATION **/


---- updateReunionDetails -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE updateReunionDetails(IN p_reunion BIGINT, IN p_utilisateur BIGINT, 
 p_placeparking BIGINT, p_hasrepas BOOLEAN)
 BEGIN
    UPDATE RESERVATION
    SET ID_PLACE_PARKING = p_placeparking,
    HAS_REPAS = p_hasrepas
    WHERE ID_REUNION = p_reunion AND ID_UTILISATEUR = p_utilisateur;
    END //
    
---- deleteReunionDetails -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE deleteReunionDetails (IN p_reunion BIGINT, IN p_utilisateur BIGINT)
BEGIN
    DELETE FROM RESERVATION
    WHERE ID_REUNION = p_reunion AND ID_UTILISATEUR = p_utilisateur;
    END //

---- getAllReunionDetails -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE getAllReunionDetails()
BEGIN
    SELECT * FROM RESERVATION;
END //