use ap1;
DELIMITER //

-- insertNewPlaceParking -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE insertNewPlaceParking 
    (
        IN p_id_parking BIGINT,
        IN p_num_place INT, 
        IN p_dispo_place BOOLEAN
    )
BEGIN
    INSERT INTO PARKING 
    (
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
END //

-- deletePlaceParking -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE deletePlaceParking 
    (
        IN p_id_parking BIGINT
    )
BEGIN
    DELETE
    FROM 
        PARKING
    WHERE 
        ID_PLACE_PARKING = p_id_parking;
END //

-- updatePlaceParking -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE updatePlaceParking 
    (
        IN p_id_parking BIGINT,
        IN p_num_place INT, 
        IN p_dispo_place BOOLEAN
    )
BEGIN
    UPDATE 
        PARKING
    SET 
        NUM_PLACE = p_num_place,
        DISPO_PLACE = p_dispo_place
    WHERE 
        ID_PLACE_PARKING = p_id_parking;
END //

-- getAllPlacesParking -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getAllPlacesParking ()
BEGIN
    SELECT
        *
    FROM 
        PARKING
END //

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

-- getAllUsers -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getAllUsers ()
BEGIN
    SELECT
        *
    FROM 
        UTILISATEUR
END //

-- insertNewLigue -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE insertNewLigue 
    (
        IN p_nom VARCHAR(255),
    )
BEGIN
    INSERT INTO TYPE_LIGUE 
    (
        NOM_LIGUE
    ) 
    VALUES 
    (
        p_nom
    );
END //

-- deleteLigue -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE deleteLigue 
    (
        IN p_id BIGINT
    )
BEGIN
    DELETE
    FROM 
        TYPE_LIGUE
    WHERE 
        ID_TYPE_LIGUE = p_id;
END //

-- updateLigue -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE updateLigue 
    (
        IN p_id BIGINT,
        IN p_nom VARCHAR(255),
    )
BEGIN
    UPDATE 
        TYPE_LIGUE
    SET 
        NOM_LIGUE = p_nom
    WHERE 
        ID_TYPE_LIGUE = p_id;
END //

-- getAllLigues -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getAllLigues ()
BEGIN
    SELECT
        *
    FROM 
        TYPE_LIGUE
END //

-- insertNewRepas -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE insertNewRepas 
    (
        IN p_id BIGINT,
        IN p_type_repas VARCHAR(255)
    )
BEGIN
    INSERT INTO REPAS
    (
        ID_REPAS,
        TYPE_REPAS
    ) 
    VALUES 
    (
        p_id,
        p_type_repas
    );
END //

-- deleteRepas -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE deleteRepas 
    (
        IN p_id BIGINT
    )
BEGIN
    DELETE
    FROM 
        REPAS
    WHERE 
        ID_REPAS = p_id;
END //

-- updateRepas -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE updateRepas 
    (
        IN p_id BIGINT,
        IN p_type_repas VARCHAR(255),
    )
BEGIN
    UPDATE 
        REPAS
    SET 
        TYPE_REPAS = p_type_repas
    WHERE 
        ID_REPAS = p_id;
END //

-- getAllRepas -------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE getAllRepas ()
BEGIN
    SELECT
        *
    FROM 
        REPAS
END //