const router = require('express-promise-router')();

const { createReunion, updateReunion, cancelReunion, deleteReunion, getReunionByDate, getAllReunions } = require('../controllers/reunions');

router.route('/reunion')
    .post(createReunion)
    .delete(deleteReunion)
    .get(getAllReunions)

router.route('/update_reunion')
    .put(updateReunion)

router.route('/cancel_reunion')
    .put(cancelReunion)

router.route('/reunion_date')
    .get(getReunionByDate)


module.exports = router