use ap1;

DELIMITER //

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