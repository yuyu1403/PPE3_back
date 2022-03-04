use ap1;

DELIMITER //
-- createReunion -------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE createReunion (IN p_reunion BIGINT, IN p_date DATE, IN p_organisateur BIGINT, IN p_salle BIGINT, IN p_repas BIGINT)
BEGIN
    INSERT INTO `REUNION`(
    `ID_REUNION` ,
    `DATE_REUNION`,
    `ID_ORGANISATEUR` ,
    `ID_SALLE` ,
    `ID_REPAS`) VALUES (p_reunion, p_date, p_organisateur, p_salle, p_repas);
END //

-- -- getReservation-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- -- updateReservation -------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE OR REPLACE PROCEDURE updateReservation (IN p_organisateur BIGINT, IN p_date DATE, IN p_placeparking BIGINT, IN p_repas BIGINT,
-- IN p_salle BIGINT)
-- BEGIN
--     UPDATE RESERVER
--     SET DATE_REUNION = p_date,
--     ID_PLACE_PARKING = p_placeparking,
--     ID_REPAS = p_repas,
--     ID_SALLE = p_salle
--     WHERE ID_ORGANISATEUR = p_organisateur;
-- END //

-- -- deleteBookReservation -------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE OR REPLACE PROCEDURE deleteBookReservation (IN p_date DATE, IN p_organisateur BIGINT)
-- BEGIN
--     -- DELETE 
--     FROM RESERVER
--     WHERE DATE_REUNION = p_date 
--     AND ID_ORGANISATEUR = p_organisateur;
-- END//




