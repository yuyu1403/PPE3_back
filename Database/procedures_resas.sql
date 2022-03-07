use ap1;

DELIMITER //

    -- verifier que la modif de date de la reunion n'agisse pas sur la date de resa du parking/repas
    -- il faut que la resa d'une place de parking attribue automatiquement une place dispo (sans la rentrer avec id) et la 
    -- rende indispo.

---- bookReunionDetails -------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- probleme: il est possible de reserver la meme place de parking le meme jour.
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