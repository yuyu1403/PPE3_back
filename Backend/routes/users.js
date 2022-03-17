const router = require("express-promise-router")();

const {insertUser, updateUser, identificationUser} = require("../controllers/users");

// Users ------------------------------------------------------------------------------------------------------------------------------------

router.route('/users')
    .post(insertUser)

router.route('/users/:id')
    .put(updateUser)
    
// identification ------------------------------------------------------------------------------------------------------------------------------------

router.route('/identification')
    .get(identificationUser);

module.exports = router;