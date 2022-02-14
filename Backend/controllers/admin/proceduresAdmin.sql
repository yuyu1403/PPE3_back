use ap1;

DELIMITER //

-- getOneUsers -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getOneUser (IN p_utilisateur BIGINT)
BEGIN
    SELECT 
    ID_UTILISATEUR,
    PRENOM_UTILISATEUR,
    NOM_UTILISATEUR,
    MAIL_UTILISATEUR,
    TELEPHONE_UTILISATEUR,
    PASSWORD_UTILISATEUR,
    ID_TYPE_LIGUE
    FROM UTILISATEUR
    WHERE ID_UTILISATEUR = p_utilisateur;
END //

-- getAllUsers -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getAllUsers()
BEGIN
	SELECT  
    ID_UTILISATEUR,
    PRENOM_UTILISATEUR,
    NOM_UTILISATEUR,
    MAIL_UTILISATEUR,
    TELEPHONE_UTILISATEUR,
    PASSWORD_UTILISATEUR,
    ID_TYPE_LIGUE FROM UTILISATEUR;
END //