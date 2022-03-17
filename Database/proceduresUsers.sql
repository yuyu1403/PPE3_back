/** PROCEDURES UTILISATEUR**/
use ap1;
DELIMITER //

-- insertNewUser -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE insertNewUser 
    (
        IN p_prenom VARCHAR(255),
        IN p_nom VARCHAR(255), 
        IN p_email VARCHAR(255), 
        IN p_telephone INT, 
        IN p_password VARCHAR(255), 
        IN id_type_ligue BIGINT
    )
BEGIN
    INSERT INTO UTILISATEUR 
    (
        PRENOM_UTILISATEUR,
        NOM_UTILISATEUR,
        MAIL_UTILISATEUR,
        TELEPHONE_UTILISATEUR,
        PASSWORD_UTILISATEUR,
        ID_TYPE_LIGUE
    ) 
    VALUES 
    (
        p_prenom, 
        p_nom, 
        p_email, 
        p_telephone, 
        p_password, 
        id_type_ligue
    );
END //



-- updateUser -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE updateUser 
    (
        IN p_id BIGINT,
        IN p_prenom VARCHAR(255),
        IN p_nom VARCHAR(255), 
        IN p_email VARCHAR(255), 
        IN p_telephone INT, 
        IN p_password VARCHAR(255), 
        IN p_id_type_ligue BIGINT
    )
BEGIN
    UPDATE 
        UTILISATEUR
    SET 
        PRENOM_UTILISATEUR = p_prenom,
        NOM_UTILISATEUR = p_nom,
        MAIL_UTILISATEUR = p_email,
        TELEPHONE_UTILISATEUR = p_telephone,
        PASSWORD_UTILISATEUR = p_password,
        ID_TYPE_LIGUE = p_id_type_ligue
    WHERE 
        ID_UTILISATEUR = p_id;
END //


-- identificationUser -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE identificationUser (IN p_email VARCHAR(255),IN p_password VARCHAR(255))
BEGIN
SELECT ID_UTILISATEUR
FROM UTILISATEUR
WHERE MAIL_UTILISATEUR = p_email
AND PASSWORD_UTILISATEUR = p_password;
END //