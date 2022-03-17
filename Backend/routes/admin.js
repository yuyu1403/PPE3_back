const router = require("express-promise-router")();

const { identificationAdmin, insertNewUser, deleteUser, getOneUser, getAllUsers, insertNewRoom,
     updateRoom, getOneRoom, getAllRoom, deleteRoom, insertNewMeal, 
    insertNewPlaceParking, updatePlaceParking, deletePlaceParking, getAllPlacesParking, 
    insertNewLigue, getAllLigues, updateLigue,      deleteLigue,  
    getAllRepas, updateRepas, deleteRepas } = require("../controllers/admin");

router.route("/login")
    .get(identificationAdmin);

router.route("/:p_utilisateur")
    .get(getOneUser);

router.route("/:id")
    .delete(deleteUser);

router.route("/")
    .post(insertNewUser)
    .get(getAllUsers);

router.route("/salle/room")
    .post(insertNewRoom)
    .get(getAllRoom);

router.route("/salle/:id")
    .get(getOneRoom)
    .put(updateRoom)
    .delete(deleteRoom);

router.route("/repas")
    .post(insertNewMeal)
    .get(getAllRepas)

router.route("/repas/:id")
    .put(updateRepas)
    .delete(deleteRepas);

router.route("/parking/all") // ! /all pour distinguer de "get one user"
    .post(insertNewPlaceParking)
    .get(getAllPlacesParking)
       
router.route("/parking/:id")
    .delete(deletePlaceParking)
    .put(updatePlaceParking)


router.route("/ligues/all")  // ! /all pour distinguer de "get one user"
    .post(insertNewLigue)
    .get(getAllLigues)
   
router.route("/ligues/:id")
    .delete(deleteLigue)
    .put(updateLigue)




module.exports = router;