use ap1;

DELIMITER //

----------------------- UTILISATEUR -----------------------------------------------
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

----------------------- SALLE -----------------------------------------------------

CREATE OR REPLACE PROCEDURE insertNewRoom (IN id_salle BIGINT, IN p_nom_salle VARCHAR(50), IN p_capacite BIGINT)
BEGIN
    INSERT INTO `SALLE` (
        `ID_SALLE`,
        `NOM_SALLE`,
        `CAPACITE_ACCUEIL`) VALUES (id_salle, p_nom_salle, p_capacite);
END //


CREATE OR REPLACE PROCEDURE getOneRoom (IN p_id_salle BIGINT)
BEGIN
    SELECT *
    FROM SALLE
    WHERE ID_SALLE = p_id_salle;
END //

CREATE OR REPLACE PROCEDURE getAllRoom ()
BEGIN
    SELECT *
    FROM SALLE;
END // 

CREATE OR REPLACE PROCEDURE updateRoom (IN p_id_salle BIGINT, IN p_nom VARCHAR(50),IN p_capacite BIGINT)
BEGIN
    UPDATE SALLE
    SET NOM_SALLE = p_nom,
    CAPACITE_ACCUEIL = p_capacite
    WHERE ID_SALLE = p_id_salle;
END //

CREATE OR REPLACE PROCEDURE deleteRoom (IN p_id_salle BIGINT)
BEGIN
    DELETE
    FROM salle
    WHERE ID_SALLE = p_id_salle;
END //

------------------------------REPAS--------------------------------------------

CREATE OR REPLACE PROCEDURE insertNewMeal (IN id_repas BIGINT, IN p_type_repas VARCHAR(150))
BEGIN
    INSERT INTO `REPAS` (
        `ID_REPAS`,
        `TYPE_REPAS`
        ) VALUES (id_repas, p_type_repas);
END //