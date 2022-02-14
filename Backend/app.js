require("dotenv").config({ path: `./config/${process.env.NODE_ENV}.env` });

const express = require("express");

const app = express();

const cors = require("cors");
app.use(cors())

app.use(express.json());

const testRoute = require("./routes/users/users");
const routeAdmin = require("./routes/admin/admin")

app
    .use("/api/test", testRoute)
    .use("/api/admin", routeAdmin);

app.get("/api", (_,res) => res.send("Hello from ap1 v1"));

app.listen(process.env.PORT, () => console.log(`Backend is running on PORT ${process.env.PORT}`));

module.exports = app;