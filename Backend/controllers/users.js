const pool = require("../config/database");

module.exports = {
  insertUser: async (req, res) => {
    const { prenom, nom, email, telephone, password, typeLigue } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL insertNewUser (?, ?, ?, ?, ?, ?)",
      [prenom, nom, email, telephone, password, typeLigue]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  }
};