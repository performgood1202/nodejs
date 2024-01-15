var express = require('express');
var router = express.Router();
const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");

let advertiserController = require('../../controllers/admin/advertiserController.js');


router.get("/getAdvertisers", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await advertiserController.getAdvertisers(req.body, res);

	} catch(err) {
		console.log(err);
	}
});

router.get("/getAdvertiserByUserId/:user_id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		//console.log(req.params);

		let result = await advertiserController.getAdvertiserByUserId(req.params, res);

	} catch(err) {
		console.log(err);
	}
});

router.post("/updateAdvertiserUser/:user_id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await advertiserController.updateAdvertiserUser(req.body, req.params, res);

	} catch(err) {
		console.log(err);
	}
});


module.exports = router;