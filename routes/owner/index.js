var express = require('express');
var router = express.Router();

const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");

let profileController = require('../../controllers/owner/profileController.js');



router.post("/getStripeConnection", middleware.authenticate, middleware.isOwner, async (req, res) => {
	try {
        let result = await profileController.getStripeConnection(req.body, req.session, res);

	} catch(err) {
		console.log(err);
	}
});


/* Property Routes*/

const property = require('./property.js');

router.use('/', property);

/* Winboard Routes*/

const winboard = require('./winboard.js');

router.use('/', winboard);

/* Booking Routes*/

const booking = require('./booking.js');

router.use('/', booking);



module.exports = router;