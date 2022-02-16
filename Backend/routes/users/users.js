const router = require("express-promise-router")();

const { updateUser, insertUser } = require("../../controllers/users");


router.route("/users")
    .post(insertUser);

router.route('/users/:id')
    .put(updateUser)


module.exports = router;