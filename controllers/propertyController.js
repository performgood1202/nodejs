let statusCode = require("../Util/statusCode.js")
let baseResponse = require("../Util/baseResponse.js");
const propertyModel = require('../models/propertyModel.js');
const winboardModel = require('../models/winboardModel.js');
const PrecinctModel = require('../models/PrecinctModel.js');
const PropertyTypeModel = require('../models/PropertyTypeModel.js');
const WinboardTypeModel = require('../models/WinboardTypeModel.js');


const getProperties = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let pr = new propertyModel();
		data = await pr.getProperties(body).then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	properties : resObj.properties,
		        	total_records : resObj.total_records,
		        	total_page: resObj.total_page,
		        	current_page : resObj.current_page,
		        	perPage : resObj.perPage
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
const getPropertyById = async(property_id, res) => {
	const response = new baseResponse(res);
	try{

		let pr = new propertyModel();
		data = await pr.getOwnerPropertyById(property_id,"","public").then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = resObj
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
const getWinboardById = async(winboard_id, res) => {
	const response = new baseResponse(res);
	try{

		let winM = new winboardModel();
		data = await winM.getOwnerWinboardById(winboard_id,"","public").then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = resObj
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

const precinctType = async(req, res) => {
	const response = new baseResponse(res);
	try{
		let preModel = new PrecinctModel();
		data = await preModel.findAll().then(async result => {
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	precinct_type : resObj
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

const propertyType = async(req, res) => {
	const response = new baseResponse(res);
	try{
		let ptypeModel = new PropertyTypeModel();
		data = await ptypeModel.findAll().then(async result => {
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	property_type : resObj
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

const winboardType = async(req, res) => {
	const response = new baseResponse(res);
	try{
		let wtypeModel = new WinboardTypeModel();
		data = await wtypeModel.findAll().then(async result => {
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	winboard_type : resObj
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
const mediatype = async(req, res) => {
	const response = new baseResponse(res);
	try{
		let mediaTypeM = new winboardModel();
		data = await mediaTypeM.getMediaTypes().then(async result => {
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	media_type : resObj
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
	getProperties,
	getPropertyById,
	getWinboardById,
	precinctType,
	propertyType,
	winboardType,
	mediatype
}