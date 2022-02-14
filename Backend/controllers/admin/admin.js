const pool = require("../../config/database");

module.exports = {

  // UTILISATEURS

  insertNewUser: async (req, res) => {
    const { prenom, nom, email, telephone, password, typeLigue } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query(
        "CALL insertNewUser (?, ?, ?, ?, ?, ?)",
        [prenom, nom, email, telephone, password, typeLigue]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  getOneUser: async (req, res) => {
    const { p_utilisateur } = req.params;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL getOneUser (?)", [
        p_utilisateur,
      ]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  getAllUsers: async (req, res) => {
      const {} = req.params;
      let connexion;
      try {
        connexion = await pool.getConnection();
        const result = await connexion.query("CALL getAllUsers ()", []);
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