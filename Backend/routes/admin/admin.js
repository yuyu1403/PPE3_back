const router = require("express-promise-router")();

const { getOneUser, insertNewUser, getAllUsers } = require("../../controllers/admin/admin");

router.route("/:p_utilisateur")
    .get(getOneUser)

router.route("/")
    .post(insertNewUser)
    .get(getAllUsers);

module.exports = router;