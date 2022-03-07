require("dotenv").config({ path: `./config/${process.env.NODE_ENV}.env` });

const express = require("express");

const app = express();

const cors = require("cors");
app.use(cors())

app.use(express.json());

const reunionsRoute = require("./routes/reunions/reunions");
const reservationsRoute = require("./routes/reservations/reservations");

app
    .use("/reunions", reunionsRoute)
    .use("/reservations", reservationsRoute)

app.get("/api", (_,res) => res.send("Hello from ap1 v1"));

app.listen(process.env.PORT, () => console.log(`Backend is running on PORT ${process.env.PORT}`));

module.exports = app;