const router = require("express-promise-router")();

const {insertUser, insertNewPlaceParking} = require("../../controllers/users");


router.route("/users")
    .post(insertUser)

module.exports = router;