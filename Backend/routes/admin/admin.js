const router = require("express-promise-router")();

const { getOneUser } = require("../../controllers/admin/admin");

router.route("/:p_utilisateur")
    .get(getOneUser);

module.exports = router;