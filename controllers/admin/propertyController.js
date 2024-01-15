let statusCode = require("../../Util/statusCode.js")
let baseResponse = require("../../Util/baseResponse.js");
const propertyModel = require('../../models/propertyModel.js');
// const propertyModel = require('../models/propertyModel.js');
// const PrecinctModel = require('../models/PrecinctModel.js');
// const PropertyTypeModel = require('../models/PropertyTypeModel.js');
// const WinboardTypeModel = require('../models/WinboardTypeModel.js');

const getAdminProperties = async(body, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new propertyModel();
		//console.log(session.id);
		data = await pr.getAdminProperties(body).then(async result => {
			if(result && result.success == true){

				//console.log(result)
		        let result_data = {
		        	data : result.data
		        }
		        response.sendResponse(result_data, true, "", 200, null);
		    }else{
		    	response.sendResponse(null, false, result.message, 201, null);
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
const getAdminPropertyById = async(property_id, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new propertyModel();
		//console.log(session.id);
		data = await pr.getOwnerPropertyById(property_id,"","admin").then(async result => {
			if(result && result.success == true){

				//console.log(result)
		        let result_data = {
		        	data : result.data
		        }
		        response.sendResponse(result_data, true, "", 200, null);
		    }else{
		    	response.sendResponse(null, false, result.message, 201, null);
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
const adminEditProperty = async(body, property_id, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new propertyModel();
		data = await pr.editProperty(body,property_id,session,"admin").then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){

				console.log(result)
		        let result_data = {
		        	message : result.message
		        }
		        response.sendResponse(result_data, true, "", 200, null);
		    }else{
		    	response.sendResponse(null, false, result.message, 201, null);
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

const verifyProperty = async(params, res) => {
	const response = new baseResponse(res);
	try{
		let pm = new propertyModel();
		data = await pm.verifyPropertyStatus(params.id).then(async result => {
			if(result && result.success == true){
		        let result_data = {
		        	message : result.message
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
const verifyPropertyImage = async(params, res) => {
	const response = new baseResponse(res);
	try{
		let pm = new propertyModel();
		data = await pm.verifyPropertyImage(params.property_id,params.id).then(async result => {
			if(result && result.success == true){
		        let result_data = {
		        	message : result.message
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


module.exports = {
	getAdminProperties,
	getAdminPropertyById,
	adminEditProperty,
	verifyProperty,
	verifyPropertyImage
}