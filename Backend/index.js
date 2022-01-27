const express = require("express")
// importe le paquet express

const PORT = 8000


const app = express()
// Créé une application express

// Ecoute la methode GET et la route "/"
app.get("/", (req, res) => {
    res.send("Hello World !")
})

// Démarrer le serveur et écouter un port donné
app.listen(PORT, () => {
    console.log(`serveur démarré : http://localhost:${PORT}`)
})