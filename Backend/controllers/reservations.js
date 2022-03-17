const pool = require("../config/database");

module.exports = {

  // CREATION D'UNE RESERVATION UTILISATEUR

  bookReunionDetails: async (req, res) => {
    const { reunion, utilisateur, placeparking, hasrepas } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query(
        "CALL bookReunionDetails (?, ?, ?, ?)",
        [reunion, utilisateur, placeparking, hasrepas]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  //  MODIFICATION D'UNE RESERVATION UTILISATEUR
  updateReunionDetails: async (req, res) => {
    const { reunion, utilisateur, placeparking, hasrepas } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query(
        "CALL updateReunionDetails (?, ?, ?, ?)",
        [reunion, utilisateur, placeparking, hasrepas]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

    //  EFFACEMENT D'UNE RESERVATION UTILISATEUR
    deleteReunionDetails: async (req, res) => {
      const { reunion, utilisateur} = req.body;
      let connexion;
      try {
        connexion = await pool.getConnection();
        const result = await connexion.query(
          "CALL deleteReunionDetails (?, ?)",
          [reunion, utilisateur]
        );
        return res.status(200).json({ success: result });
      } catch (error) {
        return res.status(400).json({ error: error.message });
      } finally {
        if (connexion) connexion.end();
      }
    },

    // RECUPERATION DE TOUTES LES RESERVATIONS UTILISATEURS
    getAllReunionDetails: async (req, res) => {
      const { } = req.body;
      let connexion;
      try {
        connexion = await pool.getConnection();
        const result = await connexion.query("CALL getAllReunionDetails ()", []);
        return res.status(200).json({ success: result });
      } catch (error) {
        return res.status(400).json({ error: error.message });
      } finally {
        if (connexion) connexion.end();
      }
    },
  

}