var express = require('express');
var router = express.Router();
const middleware = require('../middleware');
var statusCode = require("../../Util/statusCode.js")
var baseResponse = require("../../Util/baseResponse.js");

let cityController = require('../../controllers/cityController.js');
let stateController = require('../../controllers/stateController.js');
let propertyController = require('../../controllers/owner/propertyController.js');
let adminPropertyController = require('../../controllers/admin/propertyController.js');
let adminWinboardController = require('../../controllers/admin/winboardController.js');

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


router.get("/getAdminProperties", middleware.authenticate, middleware.isAdmin, async (req, res) => {
    try {
        let result = await adminPropertyController.getAdminProperties(req.query, req.session, res);
    } catch(err) {  
        console.log(err);
    }
});
router.get("/getAdminPropertyById/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
    try {
        let result = await adminPropertyController.getAdminPropertyById(req.params.id, req.session, res);
    } catch(err) {  
        console.log(err);
    }
});
router.post("/adminEditProperty/:id", middleware.authenticate, middleware.isAdmin, upload, async (req, res) => {
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

        let result = await adminPropertyController.adminEditProperty(req_data, req.params.id, req.session, res);
    } catch(err) {  
        console.log(err);
    }
});

router.post("/verifyProperty/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
    try {
        let result = await adminPropertyController.verifyProperty(req.params, res);
    } catch(err) {
        console.log(err);
    }
});

router.post("/verifyPropertyImage/:property_id/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
    try {
        let result = await adminPropertyController.verifyPropertyImage(req.params, res);
    } catch(err) {
        console.log(err);
    }
});







module.exports = router;