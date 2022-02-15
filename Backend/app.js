require("dotenv").config({ path: `./config/${process.env.NODE_ENV}.env` });

const express = require("express");

const app = express();

const cors = require("cors");
app.use(cors())

app.use(express.json());

const routeAdmin = require("./routes/admin/admin")


app
    .use("/admin", routeAdmin)
    
    
    
    

app.get("/api", (_,res) => res.send({success: "Bienvenue sur l'API M2L"}));

app.listen(process.env.PORT, () => console.log(`Backend is running on PORT ${process.env.PORT}`));

module.exports = app;