let statusCode = require("../Util/statusCode.js")
let baseResponse = require("../Util/baseResponse.js");
const dbConstants = require('../Util/dbConstants.js');
const jwtHelper = require('../Util/jwtHelper');
const messageModel = require('../models/messageModel.js');

const startMessage = async (session, body, res) => {
	const response = new baseResponse(res);
	try {
		let msgM = new messageModel();
		data = await msgM.startMessage(body,session).then(async result => {
			if(result && result.success == true){
                let result_data = {
		        	message : result.message
		        }
		        response.sendResponse(result_data, true, "", 200, null);
  			}else{
  				response.sendResponse(null, false, result.message, 500, null);
  			}  			
		})
		.catch(error => {
  			response.sendResponse(null, false, error.message, 500, null);
		});
	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}

	return true;
}
const sendMessage = async (session, body, res) => {
	const response = new baseResponse(res);
	try {
		let msgM = new messageModel();
		data = await msgM.sendMessage(body,session).then(async result => {
			if(result && result.success == true){
                let result_data = {
		        	message : result.message
		        }
		        response.sendResponse(result_data, true, "", 200, null);
  			}else{
  				response.sendResponse(null, false, result.message, 500, null);
  			}  			
		})
		.catch(error => {
  			response.sendResponse(null, false, error.message, 500, null);
		});
	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}

	return true;
}
const getMessages = async (session, body, res) => {
	const response = new baseResponse(res);
	try {
		let msgM = new messageModel();
		data = await msgM.getMessages(body,session).then(async result => {
			if(result && result.success == true){
                let result_data = result.data
		        response.sendResponse(result_data, true, "", 200, null);
  			}else{
  				response.sendResponse(null, false, result.message, 500, null);
  			}  			
		})
		.catch(error => {
  			response.sendResponse(null, false, error.message, 500, null);
		});
	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}

	return true;
}
const getMessageById = async (session, message_id, res) => {
	const response = new baseResponse(res);
	try {
		let msgM = new messageModel();
		data = await msgM.getMessageById(message_id,session).then(async result => {
			if(result && result.success == true){
                let result_data = result.data
		        response.sendResponse(result_data, true, "", 200, null);
  			}else{
  				response.sendResponse(null, false, result.message, 500, null);
  			}  			
		})
		.catch(error => {
  			response.sendResponse(null, false, error.message, 500, null);
		});
	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}

	return true;
}

module.exports = {
	startMessage,
	sendMessage,
	getMessages,
	getMessageById
}