var express = require('express');
var router = express.Router();
const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");

let bookingController = require('../../controllers/owner/bookingController.js');

const multer = require("multer");

var storage = multer.diskStorage ({
  destination : "public/files",
  filename: function (req, file, cb) {
    cb (null, file.originalname)
  }
})

var upload = multer({ storage: storage }).any();


const fs = require('fs');

const path = require('path');

router.get("/getOwnerBookings/", middleware.authenticate, middleware.isOwner,  async (req, res) => {
	try {
    let result = await bookingController.getOwnerBookings(req.query, req.session, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/getOwnerBookingById/:booking_id", middleware.authenticate, middleware.isOwner,  async (req, res) => {
	try {
    let result = await bookingController.getOwnerBookingById(req.params.booking_id, req.session, res);
	} catch(err) {
		console.log(err);
	}
});



router.post("/bookingCancel/:booking_id", middleware.authenticate, middleware.isOwner,  async (req, res) => {
	try {
    let result = await bookingController.bookingCancel(req.body, req.params.booking_id, req.session, res);
	} catch(err) {
		console.log(err);
	}
});

router.post("/bookingConfirm/:booking_id", middleware.authenticate, middleware.isOwner,  async (req, res) => {
	try {
    let result = await bookingController.bookingConfirm(req.body, req.params.booking_id, req.session, res);
	} catch(err) {
		console.log(err);
	}
});

module.exports = router;