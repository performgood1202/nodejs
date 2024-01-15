let statusCode = require("../../Util/statusCode.js")
let baseResponse = require("../../Util/baseResponse.js");
const propertyModel = require('../../models/propertyModel.js');



const getOwnerProperties = async(body, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new propertyModel();
		data = await pr.getOwnerProperties(body,session.owner_id).then(async result => {
			//console.log("*******",result)
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
	}catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}
}
const getOwnerPropertyById = async(property_id, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new propertyModel();
		data = await pr.getOwnerPropertyById(property_id,session.owner_id).then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){

				let resObj = result.data;

				//console.log(result)
		        let result_data = {
		        	property : resObj.property,
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

const addProperty = async(body, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new propertyModel();
		data = await pr.addProperty(body,session).then(async result => {
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
const editProperty = async(body, property_id, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new propertyModel();
		data = await pr.editProperty(body,property_id,session).then(async result => {
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



module.exports = {
	getOwnerProperties,
	getOwnerPropertyById,
	addProperty,
	editProperty
}