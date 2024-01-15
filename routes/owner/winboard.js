var express = require('express');
var router = express.Router();
const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");

let winboardController = require('../../controllers/owner/winboardController.js');

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


router.post("/addWinboard", middleware.authenticate, middleware.isOwner, upload, async (req, res) => {
	try {

		let req_data = {data:req.body,winboard_images:[]};

		if(req.files && req.files.length > 0){

			req.files.forEach(function(image){

				if(image.fieldname == "winboard_images[]"){

					req_data.winboard_images.push(image.path);
				}        

			})
		}

        let result = await winboardController.addWinboard(req_data, req.session, res);

	} catch(err) {
		console.log(err);
	}
});

router.post("/editWinboard/:id", middleware.authenticate, middleware.isOwner, upload, async (req, res) => {
	try {

		let req_data = {data:req.body,winboard_images:[]};

		if(req.files && req.files.length > 0){

			req.files.forEach(function(image){

				if(image.fieldname == "winboard_images[]"){

					req_data.winboard_images.push(image.path);
				}        

			})
		}


        let result = await winboardController.editWinboard(req_data, req.params.id, req.session, res);

	} catch(err) {
		console.log(err);
	}
});
router.get("/getOwnerWinboards", middleware.authenticate, middleware.isOwner, upload, async (req, res) => {
	try {
        let result = await winboardController.getOwnerWinboards(req.query, req.session, res);

	} catch(err) {
		console.log(err);
	}
});
router.get("/getOwnerWinboardById/:id", middleware.authenticate, middleware.isOwner, upload, async (req, res) => {
	try {
        let result = await winboardController.getOwnerWinboardById(req.params.id, req.session, res);

	} catch(err) {
		console.log(err);
	}
});



module.exports = router;