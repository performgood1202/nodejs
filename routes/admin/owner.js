var express = require('express');
var router = express.Router();
const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");

let ownerController = require('../../controllers/admin/ownerController.js');


router.get("/getOwners", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await ownerController.getOwners(req.body, res);

	} catch(err) {
		console.log(err);
	}
});

router.get("/getOwnerByUserId/:user_id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		//console.log(req.params);

		let result = await ownerController.getOwnerByUserId(req.params, res);

	} catch(err) {
		console.log(err);
	}
});

router.post("/updateOwnerUser/:user_id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await ownerController.updateOwnerUser(req.body, req.params, res);

	} catch(err) {
		console.log(err);
	}
});


module.exports = router;