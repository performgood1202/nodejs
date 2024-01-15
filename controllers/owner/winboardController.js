let statusCode = require("../../Util/statusCode.js")
let baseResponse = require("../../Util/baseResponse.js");
const winboardModel = require('../../models/winboardModel.js');


const addWinboard = async(body, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new winboardModel();
		data = await pr.addWinboard(body,session).then(async result => {
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
const editWinboard = async(body, winboard_id, session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new winboardModel();
		data = await pr.editWinboard(body,winboard_id,session).then(async result => {
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
const getOwnerWinboards = async(body,  session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new winboardModel();
		data = await pr.getOwnerWinboards(body,session.owner_id).then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){

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
const getOwnerWinboardById = async(winboard_id,  session, res) => {
	const response = new baseResponse(res);
	try{
		let pr = new winboardModel();
		data = await pr.getOwnerWinboardById(winboard_id,session.owner_id).then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){

		        let result_data = result.data;
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
	addWinboard,
	editWinboard,
	getOwnerWinboards,
	getOwnerWinboardById
}