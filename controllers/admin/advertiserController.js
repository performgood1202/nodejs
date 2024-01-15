let statusCode = require("../../Util/statusCode.js")
let baseResponse = require("../../Util/baseResponse.js");
const advertiserModel = require('../../models/advertiserModel.js');
const userModel = require('../../models/UserModel.js');



const getAdvertisers = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new advertiserModel();
		data = await ad.getAdvertisers(body).then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	advertisers : resObj
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
const getAdvertiserByUserId = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ad = new advertiserModel();
		data = await ad.getAdvertiserByUserId(body.user_id).then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	advertiser : resObj
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
const updateAdvertiserUser = async(body, params, res) => {
	const response = new baseResponse(res);
	try{

		let ur = new userModel();
		user = await ur.getUser(params.user_id).then(async result => {
			return result;
		}).catch(error => {
          	return null
        });

        if(user && user.id && user.userType == "advertiser"){

        	body.session_id = user.id;
        	body.userType = user.userType;
        	body.session_password = user.password;

        	data = await ur.updateProfile(body).then(async result => {

      			if(result && result.success == true){

    			     	let userD = result.data

				        let result_data = {
				        	message : result.message,
				        }


      				  response.sendResponse(result_data, true, "", 200, null);

      			}else{
      				response.sendResponse(null, false, result.message, 401, null);
      			}
      			
    		})
    		.catch(error => {
      			response.sendResponse(null, false, error.message, 500, null);
    		});

        }else{
        	response.sendResponse(null, false, "User not found!", 201, null);
        }

	}catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}
}
module.exports = {
	getAdvertisers,
	getAdvertiserByUserId,
	updateAdvertiserUser
}