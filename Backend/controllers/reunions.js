const pool = require("../config/database");

module.exports = {
    
  // CREATION D'UNE NOUVELLE REUNION

  createReunion: async (req, res) => {
    const { reunion, date, organisateur, salle, repas } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query(
        "CALL createReunion (?, ?, ?, ?, ?)",
        [reunion, date, organisateur, salle, repas]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  // MODIFICATION D'UNE REUNION

  updateReunion: async (req, res) => {
    const { organisateur, reunion, date, salle, repas } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query(
        "CALL updateReunion (?, ?, ?, ?, ?)",
        [organisateur, reunion, date, salle, repas]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  // ANNULATION D'UNE REUNION

  cancelReunion: async (req, res) => {
    const { organisateur, reunion, annulation } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL cancelReunion (?, ?, ?)", [
        organisateur,
        reunion,
        annulation,
      ]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  // EFFACEMENT D'UNE REUNION

  deleteReunion: async (req, res) => {
    const { organisateur, date } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL deleteReunion (?, ?)", [
        organisateur,
        date,
      ]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  // RECUPERATION D'UNE REUNION

  getReunionByDate: async (req, res) => {
    const { date } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL getReunionByDate (?)", [date]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  //RECUPERATION DE TOUTES LES REUNIONS

  getAllReunions: async (req, res) => {
    const { } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL getAllReunions ()", []);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
};
