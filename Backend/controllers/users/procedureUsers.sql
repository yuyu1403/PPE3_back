-- updateReservation -------------------------------------------------------------------------------------------------------------------------------------------------------------------
use ap1;
DELIMITER //
CREATE OR REPLACE PROCEDURE updateUser (IN p_id BIGINT, IN p_nom VARCHAR(50), IN p_prenom VARCHAR(50), IN p_email VARCHAR(50),
IN p_telephone BIGINT, IN p_password VARCHAR(255), IN p_id_ligue BIGINT)
BEGIN
    UPDATE UTILISATEUR
    SET NOM_UTILISATEUR = p_nom,
    PRENOM_UTILISATEUR = p_prenom,
    MAIL_UTILISATEUR = p_email,
    TELEPHONE_UTILISATEUR = p_telephone,
    PASSWORD_UTILISATEUR = p_password,
    ID_TYPE_LIGUE = p_id_ligue
    WHERE ID_UTILISATEUR = p_id;
END//