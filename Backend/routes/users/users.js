const router = require("express-promise-router")();

const {insertUser, insertNewPlaceParking, getAllUsers, updatetUser, deletetUser, updatePlaceParking, deletePlaceParking, getAllPlacesParking, insertNewLigue, getAllLigues, updateLigue, deleteLigue, insertNewRepas, getAllRepas, updateRepas, deleteRepas, identificationUser} = require("../../controllers/users/users");

// Users ------------------------------------------------------------------------------------------------------------------------------------

router.route('/users')
    .post(insertUser)
    .get(getAllUsers);

router.route('/users/:id')
    .put(updatetUser)
    .delete(deletetUser);

// Parkings ------------------------------------------------------------------------------------------------------------------------------------

router.route('/parkings')
    .post(insertNewPlaceParking)
    .get(getAllPlacesParking);

router.route('/parkings/:id')
    .put(updatePlaceParking)
    .delete(deletePlaceParking);

// Ligues ------------------------------------------------------------------------------------------------------------------------------------

router.route('/ligues')
    .post(insertNewLigue)
    .get(getAllLigues);

router.route('/ligues/:id')
    .put(updateLigue)
    .delete(deleteLigue);

// Repas ------------------------------------------------------------------------------------------------------------------------------------

router.route('/repas')
    .post(insertNewRepas)
    .get(getAllRepas);

router.route('/repas/:id')
    .put(updateRepas)
    .delete(deleteRepas);

// identification ------------------------------------------------------------------------------------------------------------------------------------

router.route('/identification')
    .get(identificationUser);

module.exports = router;