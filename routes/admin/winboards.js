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


router.get("/getAdminWinboards", middleware.authenticate, middleware.isAdmin, async (req, res) => {
    try {
        let result = await adminWinboardController.getAdminWinboards(req.query, req.session, res);
    } catch(err) {  
        console.log(err);
    }
});

router.get("/getAdminWinboardById/:id", middleware.authenticate, middleware.isAdmin, async (req, res) => {
    try {
        let result = await adminWinboardController.getAdminWinboardById(req.params.id, req.session, res);
    } catch(err) {  
        console.log(err);
    }
});

router.post("/adminEditWinboard/:id", middleware.authenticate, middleware.isAdmin, upload, async (req, res) => {
    try {

        let req_data = {data:req.body,winboard_images:[]};

        if(req.files && req.files.length > 0){

            req.files.forEach(function(image){

                if(image.fieldname == "winboard_images[]"){

                    req_data.winboard_images.push(image.path);
                }        

            })
        }


        let result = await adminWinboardController.adminEditWinboard(req_data, req.params.id, req.session, res);

    } catch(err) {
        console.log(err);
    }
});






module.exports = router;