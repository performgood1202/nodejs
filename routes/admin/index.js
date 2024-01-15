var express = require('express');
var router = express.Router();

const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");


let adminController = require('../../controllers/admin/adminController.js');


router.post("/addPropertyType", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.addPropertyType(req.body, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/editPropertyType/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.editPropertyType(req.body, req.params, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/deletePropertyType/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.deletePropertyType(req.params, res);

	} catch(err) {
		console.log(err);
	}
});

router.post("/addPrecinctType", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.addPrecinctType(req.body, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/editPrecinctType/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.editPrecinctType(req.body, req.params, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/deletePrecinctType/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.deletePrecinctType(req.params, res);

	} catch(err) {
		console.log(err);
	}
});

router.post("/addMediaType", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.addMediaType(req.body, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/editMediaType/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.editMediaType(req.body, req.params, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/deleteMediaType/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.deleteMediaType(req.params, res);

	} catch(err) {
		console.log(err);
	}
});

router.post("/addWinboardType", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.addWinboardType(req.body, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/editWinboardType/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.editWinboardType(req.body, req.params, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/deleteWinboardType/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.deleteWinboardType(req.params, res);

	} catch(err) {
		console.log(err);
	}
});

router.get("/getAdminSetting/", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.getAdminSetting(req.params, res);

	} catch(err) {
		console.log(err);
	}
});
router.post("/updateAdminSetting/", middleware.authenticate, middleware.isAdmin, async (req, res) => {
	try {

		let result = await adminController.updateAdminSetting(req.body, res);

	} catch(err) {
		console.log(err);
	}
});


/* Property Routes*/

const property = require('./property.js');

router.use('/', property);


/* owners Routes*/

const owner = require('./owner.js');

router.use('/', owner);

/* Advertiser Routes*/

const advertiser = require('./advertiser.js');

router.use('/', advertiser);

/* Winboards Routes*/

const winboards = require('./winboards.js');

router.use('/', winboards);





module.exports = router;