const pool = require("../../config/database");

module.exports = {
    getOneUser: async (req, res) => {
        const { p_utilisateur } = req.params;
        let connexion;
        try {
            connexion = await pool.getConnection();
            const result = await connexion.query(
            "CALL getOneUser (?)", [p_utilisateur]
            );
        return res.status(200).json({ success: result });
        } catch (error) {
          return res.status(400).json({ error: error.message });  
        } finally {
            if (connexion) connexion.end();
        }
    },
};





// CRUD Repas ---------------------

// CRUD Salles --------------------

// CRUD Ligues --------------------

// CRUD Parking -------------------