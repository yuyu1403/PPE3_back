const pool = require("../../config/database");

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
  }, // marche mal, elle me renvoie mes users et prend n'importe qu'elle password



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


};





// CRUD Repas ---------------------

// CRUD Salles --------------------

// CRUD Ligues --------------------

// CRUD Parking -------------------