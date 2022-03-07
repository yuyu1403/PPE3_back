const router = require('express-promise-router')();

const { bookReunionDetails, updateReunionDetails, deleteReunionDetails, getAllReunionDetails } = require('../../controllers/reservations/reservations');

router.route('/reservations')
    .post(bookReunionDetails)
    .put(updateReunionDetails)
    .delete(deleteReunionDetails)
    .get(getAllReunionDetails)


module.exports = router;