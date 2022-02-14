const router = require("express-promise-router")();

const { test } = require("../../controllers/users");

router.route("/")
    .post(test);


module.exports = router;