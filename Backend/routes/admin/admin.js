const router = require("express-promise-router")();

const { getOneUser, insertNewUser, getAllUsers, insertNewRoom, getOneRoom, getAllRoom, insertNewMeal } = require("../../controllers/admin/admin");

router.route("/:p_utilisateur")
    .get(getOneUser);

router.route("/")
    .post(insertNewUser)
    .get(getAllUsers);

router.route("/salle/room") // pourquoi rajouter un chemin ?
    .post(insertNewRoom)
    .get(getAllRoom);

router.route("/salle/:id")
    .get(getOneRoom);

router.route("/repas")
    .post(insertNewMeal);

module.exports = router;