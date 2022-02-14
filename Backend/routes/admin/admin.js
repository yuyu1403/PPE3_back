const router = require("express-promise-router")();

const { getOneUser, insertNewUser } = require("../../controllers/admin/admin");

router.route("/:p_utilisateur")
    .get(getOneUser)

router.route("/")
    .post(insertNewUser)

module.exports = router;