const pool = require("../../config/database");

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
  },
  deletetUser: async (req, res) => {
    const {id} = req.params;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL deleteUser (?)", [id]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  updatetUser: async (req, res) => {
    const {id} = req.params;
    const { prenom, nom, email, telephone, password, typeLigue } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL updatetUser (?, ?, ?, ?, ?, ?, ?)",
      [id, prenom, nom, email, telephone, password, typeLigue]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  getAllUsers: async ( _ , res) => {
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL getAllUsers",);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  insertNewPlaceParking: async (req, res) => {
    const { id, num_place, dispo_place } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL insertNewPlaceParking (?, ?, ?)",
      [id, num_place, dispo_place]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  deletePlaceParking: async (req, res) => {
    const {id} = req.params;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL deletePlaceParking (?)", [id]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  updatePlaceParking: async (req, res) => {
    const {id} = req.params;
    const { num_place, dispo_place } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL updatePlaceParking (?, ?, ?)",
      [id, num_place, dispo_place]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  getAllPlacesParking: async ( _ , res) => {
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL getAllPlacesParking",);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  insertNewLigue: async (req, res) => {
    const { nom } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL insertNewLigue (?)",
      [nom]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  deleteLigue: async (req, res) => {
    const {id} = req.params;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL deleteLigue (?)", [id]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  updateLigue: async (req, res) => {
    const {id} = req.params;
    const { nom } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL updateLigue (?, ?)",
      [id, nom]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  getAllLigues: async ( _ , res) => {
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL getAllLigues",);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  insertNewRepas: async (req, res) => {
    const { id, type_repas } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL insertNewRepas (?, ?)",
      [id, type_repas]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  deleteRepas: async (req, res) => {
    const {id} = req.params;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL deleteRepas (?)", [id]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  updateRepas: async (req, res) => {
    const {id} = req.params;
    const { type_repas } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL updateRepas (?, ?)",
      [id, type_repas]
      );
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  getAllRepas: async ( _ , res) => {
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query("CALL getAllRepas",);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },
  identificationUser: async(req, res) => {
    const { email, password}  = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query('CALL identificationUser (?, ?)', [email, password]);
    if (!result[0].length) {
      res.status(401).json({ error: "Identifiant Invalide" });
    }
    return res.status(200).json({ success: result });
  } catch (error) {
    return res.status(400).json({ error: error.message });
  } finally {
    if (connexion) connexion.end();
  }
},
};