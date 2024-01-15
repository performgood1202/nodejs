let statusCode = require("../../Util/statusCode.js")
let baseResponse = require("../../Util/baseResponse.js");

const adminModel = require('../../models/adminModel.js');





const addPropertyType = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.addPropertyType(body).then(async result => {
			//console.log("*******",result)
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
const editPropertyType = async(body, params, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.editPropertyType(body, params.id).then(async result => {
			//console.log("*******",result)
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
const addPrecinctType = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.addPrecinctType(body).then(async result => {
			//console.log("*******",result)
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
const editPrecinctType = async(body, params, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.editPrecinctType(body, params.id).then(async result => {
			//console.log("*******",result)
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
const deletePropertyType = async(params, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.deletePropertyType(params.id).then(async result => {
			//console.log("*******",result)
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

const deletePrecinctType = async(params, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.deletePrecinctType(params.id).then(async result => {
			//console.log("*******",result)
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
const addMediaType = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.addMediaType(body).then(async result => {
			//console.log("*******",result)
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
const editMediaType = async(body, params, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.editMediaType(body, params.id).then(async result => {
			//console.log("*******",result)
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
const deleteMediaType = async(params, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.deleteMediaType(params.id).then(async result => {
			//console.log("*******",result)
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
const addWinboardType = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.addWinboardType(body).then(async result => {
			//console.log("*******",result)
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
const editWinboardType = async(body, params, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.editWinboardType(body, params.id).then(async result => {
			//console.log("*******",result)
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
const deleteWinboardType = async(params, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.deleteWinboardType(params.id).then(async result => {
			//console.log("*******",result)
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
const getAdminSetting = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.getAdminSetting().then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){
		        let result_data = {
		        	settings : result.data
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
const updateAdminSetting = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new adminModel();
		data = await ad.updateAdminSetting(body).then(async result => {
			//console.log("*******",result)
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
	addPropertyType,
	editPropertyType,
	addPrecinctType,
	editPrecinctType,
	deletePropertyType,
	deletePrecinctType,
	addMediaType,
	editMediaType,
	deleteMediaType,
	addWinboardType,
	editWinboardType,
	deleteWinboardType,
	getAdminSetting,
	updateAdminSetting
}