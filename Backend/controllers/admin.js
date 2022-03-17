const pool = require("../config/database");

module.exports = {
  // ADMINISTRATEUR

  identificationAdmin: async (req, res) => {
    const { password } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query(
        "CALL identificationAdmin ( ?)", [password]
      ); if (!result[0].length) {
        res.status(401).json({ error: "Identifiant invalide"});
      }
      return res.status(200).json({ success: result })
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  }, 



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

  deleteUser: async (req, res) => {
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


  // SALLE

  insertNewRoom: async (req, res) => {
    const { id, nom, capacite } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query ("CALL insertNewRoom (?, ?, ?)", [id, nom, capacite]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  updateRoom: async (req, res) => {
    const { nom, capacite } = req.body;
    const { id } = req.params;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query ("CALL updateRoom (?, ?, ?)", [id, nom, capacite]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end();
    }
  },

  getOneRoom: async (req, res) => {
    const { id } = req.params;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query ("CALL getOneRoom (?)", [id]);
      return res.status(200).json({ success: result});
    } catch (error) {
      return res.status(400).json({ error: error.message })
    } finally {
      if (connexion) connexion.end;
    }
  },

  getAllRoom: async (req, res) => {
    const {} = req.params;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query ("CALL getAllRoom ()", []);
      return res.status(200).json({ success: result});
    } catch (error) {
      return res.status(400).json({ error: error.message})
    } finally {
      if (connexion) connexion.end;
    }
  },

  deleteRoom: async (req, res) => {
    const { id } = req.params
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query ("CALL deleteRoom (?)", [id]);
      return res.status(200).json({ success: result });
    } catch (error) {
      return res.status(400).json({ error: error.message })
    } finally {
      if (connexion) connexion.end
    }
  },

  // REPAS

  insertNewMeal: async (req, res) => {
    const { id, type } = req.body;
    let connexion;
    try {
      connexion = await pool.getConnection();
      const result = await connexion.query ("CALL insertNewMeal (?, ?)", [id, type]);
      return res.status(200).json({ success: result});
    } catch (error) {
      return res.status(400).json({ error: error.message });
    } finally {
      if (connexion) connexion.end;
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
};

