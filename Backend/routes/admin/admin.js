const router = require("express-promise-router")();

const { getOneUser, insertNewUser, getAllUsers, insertNewRoom } = require("../../controllers/admin/admin");

router.route("/:p_utilisateur")
    .get(getOneUser)

router.route("/")
    .post(insertNewUser)
    .get(getAllUsers)

router.route("/salle")
    .post(insertNewRoom)

module.exports = router;