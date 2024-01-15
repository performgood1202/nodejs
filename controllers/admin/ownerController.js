let statusCode = require("../../Util/statusCode.js")
let baseResponse = require("../../Util/baseResponse.js");
const ownerModel = require('../../models/ownerModel.js');
const userModel = require('../../models/UserModel.js');


const getOwners = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ow = new ownerModel();
		data = await ow.getOwners(body).then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	owners : resObj
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
const getOwnerByUserId = async(body, res) => {
	const response = new baseResponse(res);
	try{

		let ow = new ownerModel();
		data = await ow.getOwnerByUserId(body.user_id).then(async result => {
			//console.log("*******",result)
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	owner : resObj
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
const updateOwnerUser = async(body, params, res) => {
	const response = new baseResponse(res);
	try{

		let ur = new userModel();
		user = await ur.getUser(params.user_id).then(async result => {
			return result;
		}).catch(error => {
          	return null
        });

        if(user && user.id && user.userType == "owner"){

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
	getOwners,
	getOwnerByUserId,
	updateOwnerUser
}