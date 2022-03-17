/** PROCEDURES ADMIN**/
use ap1;

DELIMITER / / -- identificationAdmin -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE identificationAdmin (IN p_password VARCHAR(50)) BEGIN
SELECT
    ID_ADMIN
FROM
    ADMINISTRATEUR
WHERE
    MP_ADMIN = p_password;

END / / -- PARKING --
-- insertNewPlaceParking -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE insertNewPlaceParking (
    IN p_id_parking BIGINT,
    IN p_num_place INT,
    IN p_dispo_place BOOLEAN
) BEGIN
INSERT INTO
    PARKING (
        ID_PLACE_PARKING,
        NUM_PLACE,
        DISPO_PLACE
    )
VALUES
    (
        p_id_parking,
        p_num_place,
        p_dispo_place
    );

END / / -- deletePlaceParking -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE deletePlaceParking (IN p_id_parking BIGINT) BEGIN
DELETE FROM
    PARKING
WHERE
    ID_PLACE_PARKING = p_id_parking;

END / / -- updatePlaceParking -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE updatePlaceParking (
    IN p_id_parking BIGINT,
    IN p_num_place INT,
    IN p_dispo_place BOOLEAN
) BEGIN
UPDATE
    PARKING
SET
    NUM_PLACE = p_num_place,
    DISPO_PLACE = p_dispo_place
WHERE
    ID_PLACE_PARKING = p_id_parking;

END / / -- getAllPlacesParking -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE getAllPlacesParking () BEGIN
SELECT
    *
FROM
    PARKING;

END / / 

-- getOneUsers -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE
OR REPLACE PROCEDURE getOneUser (IN p_utilisateur BIGINT) BEGIN
SELECT
    ID_UTILISATEUR,
    PRENOM_UTILISATEUR,
    NOM_UTILISATEUR,
    MAIL_UTILISATEUR,
    TELEPHONE_UTILISATEUR,
    PASSWORD_UTILISATEUR,
    ID_TYPE_LIGUE
FROM
    UTILISATEUR
WHERE
    ID_UTILISATEUR = p_utilisateur;
END / / 

-- deleteUser -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE deleteUser 
    (
        IN p_id BIGINT
    )
BEGIN
    DELETE
    FROM 
        UTILISATEUR
    WHERE 
        ID_UTILISATEUR = p_id;
END //

-- getAllUsers -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE getAllUsers() BEGIN
SELECT
    ID_UTILISATEUR,
    PRENOM_UTILISATEUR,
    NOM_UTILISATEUR,
    MAIL_UTILISATEUR,
    TELEPHONE_UTILISATEUR,
    PASSWORD_UTILISATEUR,
    ID_TYPE_LIGUE
FROM
    UTILISATEUR;

END / / -- LIGUE --
-- insertNewLigue -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE insertNewLigue (IN p_nom VARCHAR(255)) BEGIN
INSERT INTO
    `TYPE_LIGUE` (`NOM_LIGUE`)
VALUES
    (p_nom);

END / / -- deleteLigue -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE deleteLigue (IN p_id BIGINT) BEGIN
DELETE FROM
    TYPE_LIGUE
WHERE
    ID_TYPE_LIGUE = p_id;

END / / -- updateLigue -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE updateLigue (
    IN p_id BIGINT,
    IN p_nom VARCHAR(255)
) BEGIN
UPDATE
    TYPE_LIGUE
SET
    NOM_LIGUE = p_nom
WHERE
    ID_TYPE_LIGUE = p_id;
END / / 

-- getAllLigues -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE getAllLigues () BEGIN
SELECT
    *
FROM
    TYPE_LIGUE;

END / / ----------------------- SALLE -----------------------------------------------------
CREATE
OR REPLACE PROCEDURE insertNewRoom (
    IN id_salle BIGINT,
    IN p_nom_salle VARCHAR(50),
    IN p_capacite BIGINT
) BEGIN
INSERT INTO
    `SALLE` (
        `ID_SALLE`,
        `NOM_SALLE`,
        `CAPACITE_ACCUEIL`
    )
VALUES
    (id_salle, p_nom_salle, p_capacite);

END / / CREATE
OR REPLACE PROCEDURE getOneRoom (IN p_id_salle BIGINT) BEGIN
SELECT
    *
FROM
    SALLE
WHERE
    ID_SALLE = p_id_salle;

END / / CREATE
OR REPLACE PROCEDURE getAllRoom () BEGIN
SELECT
    *
FROM
    SALLE;

END / / CREATE
OR REPLACE PROCEDURE updateRoom (
    IN p_id_salle BIGINT,
    IN p_nom VARCHAR(50),
    IN p_capacite BIGINT
) BEGIN
UPDATE
    SALLE
SET
    NOM_SALLE = p_nom,
    CAPACITE_ACCUEIL = p_capacite
WHERE
    ID_SALLE = p_id_salle;

END / / CREATE
OR REPLACE PROCEDURE deleteRoom (IN p_id_salle BIGINT) BEGIN
DELETE FROM
    salle
WHERE
    ID_SALLE = p_id_salle;

END / / ------------------------------REPAS--------------------------------------------
-- insertRepas -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE insertNewMeal (IN id_repas BIGINT, IN p_type_repas VARCHAR(150)) BEGIN
INSERT INTO
    `REPAS` (
        `ID_REPAS`,
        `TYPE_REPAS`
    )
VALUES
    (id_repas, p_type_repas);

END / / -- deleteRepas -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE deleteRepas (IN p_id BIGINT) BEGIN
DELETE FROM
    REPAS
WHERE
    ID_REPAS = p_id;

END / / -- updateRepas -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE updateRepas (
    IN p_id BIGINT,
    IN p_type_repas VARCHAR(255)
) BEGIN
UPDATE
    REPAS
SET
    TYPE_REPAS = p_type_repas
WHERE
    ID_REPAS = p_id;

END / / -- getAllRepas -------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE
OR REPLACE PROCEDURE getAllRepas () BEGIN
SELECT
    *
FROM
    REPAS;

END / /