let statusCode = require("../../Util/statusCode.js")
let baseResponse = require("../../Util/baseResponse.js");
const dbConstants = require('../../Util/dbConstants.js');
const jwtHelper = require('../../Util/jwtHelper');
const UserModel = require('../../models/UserModel.js');
const bookingModel = require('../../models/bookingModel.js');

const winboardBook = async (body, winboard_id, session, res) => {
	const response = new baseResponse(res);
	try {

			let bM = new bookingModel();

			data = await bM.book(body,winboard_id,session).then(async result => {

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

const bookingUpdate = async (body, booking_id, session, res) => {
	const response = new baseResponse(res);
	try {
		let bM = new bookingModel();
		data = await bM.adUpdate(body,booking_id,session).then(async result => {
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
const bookingPay = async (body, booking_id, session, res) => {
	const response = new baseResponse(res);
	try {
		let bM = new bookingModel();
		data = await bM.bookingPay(body,booking_id,session).then(async result => {
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

const getAdvertiserBookings = async (body, session, res) => {
	const response = new baseResponse(res);
	try {
		let bM = new bookingModel();
		data = await bM.getBookings(body,session).then(async result => {
			if(result && result.success == true){
                let resObj = result.data
		        let result_data = {
		        	bookings : resObj.bookings,
		        	total_records : resObj.total_records,
		        	total_page: resObj.total_page,
		        	current_page : resObj.current_page,
		        	perPage : resObj.perPage
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
const getAdvertiserBookingId = async (booking_id, session, res) => {
	const response = new baseResponse(res);
	try {
		let bM = new bookingModel();
		data = await bM.getBookingById(booking_id,session).then(async result => {
			if(result && result.success == true){
                let resObj = result.data
		        let result_data = {
		        	booking : resObj.booking,
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


module.exports = {
	winboardBook,
	bookingUpdate,
	bookingPay,
	getAdvertiserBookings,
	getAdvertiserBookingId
}