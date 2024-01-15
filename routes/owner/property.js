var express = require('express');
var router = express.Router();
const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");

let cityController = require('../../controllers/cityController.js');
let stateController = require('../../controllers/stateController.js');
let propertyController = require('../../controllers/owner/propertyController.js');

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


router.post("/addProperty", middleware.authenticate, middleware.isOwner, upload, async (req, res) => {
	try {

		let req_data = {data:req.body,building_photo:[],precinct_photo:[],upload_verification:[]};

		if(req.files && req.files.length > 0){

			req.files.forEach(function(image){

				if(image.fieldname == "building_photo[]"){

					req_data.building_photo.push(image.path);
				}
				if(image.fieldname == "precinct_photo[]"){

					req_data.precinct_photo.push(image.path);
				}
				if(image.fieldname == "upload_verification[]"){

					req_data.upload_verification.push(image.path);
				}

                

			})
		}

        let result = await propertyController.addProperty(req_data, req.session, res);

	} catch(err) {
		console.log(err);
	}
});

router.post("/editProperty/:id", middleware.authenticate, middleware.isOwner, upload, async (req, res) => {
	try {

		let req_data = {data:req.body,building_photo:[],precinct_photo:[],upload_verification:[]};

		if(req.files && req.files.length > 0){

			req.files.forEach(function(image){

				if(image.fieldname == "building_photo[]"){

					req_data.building_photo.push(image.path);
				}
				if(image.fieldname == "precinct_photo[]"){

					req_data.precinct_photo.push(image.path);
				}
				if(image.fieldname == "upload_verification[]"){

					req_data.upload_verification.push(image.path);
				}
       

			})
		}

        let result = await propertyController.editProperty(req_data, req.params.id, req.session, res);

	} catch(err) {
		console.log(err);
	}
});
router.get("/getOwnerProperties", middleware.authenticate, middleware.isOwner, upload, async (req, res) => {
	try {
        let result = await propertyController.getOwnerProperties(req.query, req.session, res);

	} catch(err) {
		console.log(err);
	}
});
router.get("/getOwnerPropertyById/:id", middleware.authenticate, middleware.isOwner, upload, async (req, res) => {
	try {
        let result = await propertyController.getOwnerPropertyById(req.params.id, req.session, res);

	} catch(err) {
		console.log(err);
	}
});


module.exports = router;