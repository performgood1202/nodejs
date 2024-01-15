var express = require('express');
var router = express.Router();
const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");

let bookingController = require('../../controllers/advertiser/bookingController.js');

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


router.post("/winboardBook/:winboard_id", middleware.authenticate, middleware.isAdvertiser, upload, async (req, res) => {
	try {

		let req_data = {data:req.body,artwork:null,brief:null};

		if(req.files && req.files.length > 0){

			req.files.forEach(function(image){

				if(image.fieldname == "artwork"){

					req_data.artwork = image.path;
				}    
				if(image.fieldname == "brief"){

					req_data.brief = image.path;
				}    

			})
		}

    let result = await bookingController.winboardBook(req_data, req.params.winboard_id, req.session, res);

	} catch(err) {
		console.log(err);
	}
});


router.post("/bookingUpdate/:booking_id", middleware.authenticate, middleware.isAdvertiser, upload, async (req, res) => {
	try {
		let req_data = {data:req.body,artwork:null,brief:null};
		if(req.files && req.files.length > 0){
			req.files.forEach(function(image){
				if(image.fieldname == "artwork"){
					req_data.artwork = image.path;
				}    
				if(image.fieldname == "brief"){
					req_data.brief = image.path;
				}    
			})
		}
    let result = await bookingController.bookingUpdate(req_data, req.params.booking_id, req.session, res);
	} catch(err) {
		console.log(err);
	}
});

router.post("/bookingPay/:booking_id", middleware.authenticate, middleware.isAdvertiser,  async (req, res) => {
	try {
    let result = await bookingController.bookingPay(req.body, req.params.booking_id, req.session, res);
	} catch(err) {
		console.log(err);
	}
});

router.get("/getAdvertiserBookings/", middleware.authenticate, middleware.isAdvertiser,  async (req, res) => {
	try {
    let result = await bookingController.getAdvertiserBookings(req.query, req.session, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/getAdvertiserBookingId/:booking_id", middleware.authenticate, middleware.isAdvertiser,  async (req, res) => {
	try {
    let result = await bookingController.getAdvertiserBookingId(req.params.booking_id, req.session, res);
	} catch(err) {
		console.log(err);
	}
});

module.exports = router;