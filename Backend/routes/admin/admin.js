const router = require("express-promise-router")();

const { getOneUser, insertNewUser, getAllUsers, insertNewRoom, getOneRoom, getAllRoom, insertNewMeal, identificationAdmin, updateRoom, deleteRoom } = require("../../controllers/admin/admin");

router.route("/login")
    .get(identificationAdmin);

router.route("/:p_utilisateur")
    .get(getOneUser);

router.route("/")
    .post(insertNewUser)
    .get(getAllUsers);

router.route("/salle/room") // pourquoi rajouter un chemin ?
    .post(insertNewRoom)
    .get(getAllRoom);

router.route("/salle/:id")
    .get(getOneRoom)
    .put(updateRoom)
    .delete(deleteRoom);

router.route("/repas")
    .post(insertNewMeal);



module.exports = router;