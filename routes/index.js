var express = require('express');
var router = express.Router();
var statusCode = require("../Util/statusCode.js")
var baseResponse = require("../Util/baseResponse.js");

let testController = require('../controllers/testController.js');
let cityController = require('../controllers/cityController.js');
let propertyController = require('../controllers/propertyController.js');
let stateController = require('../controllers/stateController.js');


router.post("/test", async (req, res) => {
	try {
		let result = await testController.fetchUser(req.body, res);
	} catch(err) {
		console.log(err);
	}
});

router.get("/cities", async (req, res) => {
	try {
		let result = await cityController.cities(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/postalcodes", async (req, res) => {
	try {
		let result = await cityController.postalcodes(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/street", async (req, res) => {
	try {
		let result = await cityController.street(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/precinctype", async (req, res) => {
	try {
		let result = await propertyController.precinctType(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/propertytype", async (req, res) => {
	try {
		let result = await propertyController.propertyType(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/winboardtype", async (req, res) => {
	try {
		let result = await propertyController.winboardType(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/mediatype", async (req, res) => {
	try {
		let result = await propertyController.mediatype(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/states", async (req, res) => {
	try {
		let result = await stateController.states(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/getProperties", async (req, res) => {
	try {
		let result = await propertyController.getProperties(req.query, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/getPropertyById/:property_id", async (req, res) => {
	try {
		let result = await propertyController.getPropertyById(req.params.property_id, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/getWinboardById/:winboard_id", async (req, res) => {
	try {
		let result = await propertyController.getWinboardById(req.params.winboard_id, res);
	} catch(err) {
		console.log(err);
	}
});


module.exports = router;