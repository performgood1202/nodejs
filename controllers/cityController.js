let statusCode = require("../Util/statusCode.js")
let baseResponse = require("../Util/baseResponse.js");
const CityModel = require('../models/CityModel.js');
const PostalCodeModel = require('../models/PostalCodeModel.js');
const StreetModel = require('../models/StreetModel.js');


const cities = async(req, res) => {
	const response = new baseResponse(res);
	try{
		let cm = new CityModel();
		data = await cm.findAll().then(async result => {
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	cities : resObj
		        }
		        response.sendResponse(result_data, true, "", 200, null);
		    }else{
		    	response.sendResponse(null, false, result.message, 401, null);
		    }
		}).catch(error => {
          	response.sendResponse(null, false, error.message, 500, null);
        });
	}catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}
}

const postalcodes = async(req, res) => {
	const response = new baseResponse(res);
	try{
		let pcModel = new PostalCodeModel();
		data = await pcModel.findAll().then(async result => {
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	postalcode : resObj
		        }
		        response.sendResponse(result_data, true, "", 200, null);
		    }else{
		    	response.sendResponse(null, false, result.message, 401, null);
		    }
		}).catch(error => {
          	response.sendResponse(null, false, error.message, 500, null);
        });
	}catch(err){
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}
}

const street = async(req, res) => {
	const response = new baseResponse(res);
	try{
		let streetModel = new StreetModel();
		data = await streetModel.findAll().then(async result => {
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	street : resObj
		        }
		        response.sendResponse(result_data, true, "", 200, null);
		    }else{
		    	response.sendResponse(null, false, result.message, 401, null);
		    }
		}).catch(error => {
          	response.sendResponse(null, false, error.message, 500, null);
        });
	}catch(err){
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}
}


module.exports = {
	cities,
	postalcodes,
	street
}