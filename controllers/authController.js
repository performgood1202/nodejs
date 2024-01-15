let statusCode = require("../Util/statusCode.js")
let baseResponse = require("../Util/baseResponse.js");
const dbConstants = require('../Util/dbConstants.js');
const jwtHelper = require('../Util/jwtHelper');
const UserModel = require('../models/UserModel.js');

const login = async (body, res) => {
	const response = new baseResponse(res);
	try {

			let uM = new UserModel();

			let username = body.username;
			let password = body.password;

			data = await uM.autheticate(username,password).then(async result => {

          			if(result && result.success == true){

          				let tokenObj = result.data

          				let userType = await uM.getUserType(tokenObj.groups);

          				let owner_id = null; 
          				let advertiser_id = null; 

          				if(userType == "owner"){

          					owner_id = await uM.getOwnerId(tokenObj.id);
          					

          				}else if(userType == "advertiser"){

          					advertiser_id = await uM.getAdvertiserId(tokenObj.id);

          				}
          				

          				tokenObj.userType = userType;
          				tokenObj.owner_id = owner_id;
          				tokenObj.advertiser_id = advertiser_id;
          				
					        let token = await jwtHelper.getToken(tokenObj);

					        let result_data = {
					        	user : tokenObj,
					        	token : token
					        }



          				response.sendResponse(result_data, true, "", 200, null);

          			}else{
          				response.sendResponse(null, false, result.message, 401, null);
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
const ownerRegister = async (body, res) => {


	const response = new baseResponse(res);

	try {
		let uM = new UserModel();


		data = await uM.ownerRegister(body).then(async result => {

      			if(result && result.success == true){

			        let result_data = {
			        	message : result.message
			        };

      				response.sendResponse(result_data, true, "", 200, null);

      			}else{
      				response.sendResponse(null, false, result.message, 401, null);
      			}
      			
    		})
    		.catch(error => {
      			response.sendResponse(null, false, error.message, 500, null);
    		});
		
	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", statusCode.error, null);
	}

	return true;
}

const advertiserRegister = async (body, res) => {


	const response = new baseResponse(res);

	try {
		let uM = new UserModel();


		data = await uM.advertiserRegister(body).then(async result => {

      			if(result && result.success == true){

			        let result_data = {
			        	message : result.message
			        };

      				response.sendResponse(result_data, true, "", 200, null);

      			}else{
      				response.sendResponse(null, false, result.message, 401, null);
      			}
      			
    		})
    		.catch(error => {
      			response.sendResponse(null, false, error.message, 500, null);
    		});
		
	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", statusCode.error, null);
	}

	return true;
}

const info = async(session, res) => {
	const response = new baseResponse(res);

	let uM = new UserModel();

    let user_info = await uM.info(session).then(async result => {

  			if(result && result.success == true){

	        return result.data;

  			}else{
  				return null;
  			}
  			
		})
		.catch(error => {
  			return null;
		});

    let obj = {
			user: session,
			user_info,
		}
    response.sendResponse(obj, true, "", statusCode.success, null);

	
	return true;
}
const forgotPassword = async(body, res) => {
	const response = new baseResponse(res);

	try {
		let uM = new UserModel();


		data = await uM.forgotPassword(body).then(async result => {

      			if(result && result.success == true){

			        let result_data = {
			        	message : result.message
			        };

      				response.sendResponse(result_data, true, "", 200, null);

      			}else{
      				response.sendResponse(null, false, result.message, 401, null);
      			}
      			
    		})
    		.catch(error => {
      			response.sendResponse(null, false, error.message, 500, null);
    		});
		
	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", statusCode.error, null);
	}

	return true;
}

const updateProfile = async(session, body, res) => {
	const response = new baseResponse(res);

	try {
		
		let uM = new UserModel();


		body.session_id = session.id;
		body.userType = session.userType;
		body.session_password = session.password;


		data = await uM.updateProfile(body).then(async result => {

      			if(result && result.success == true){

    			     	let tokenObj = result.data


        				let userType = await uM.getUserType(tokenObj.groups);
        				let owner_id = null; 
        				let advertiser_id = null; 

        				if(userType == "owner"){

        					owner_id = await uM.getOwnerId(tokenObj.id);
        					

        				}else if(userType == "advertiser"){

        					advertiser_id = await uM.getAdvertiserId(tokenObj.id);

        				}

        				tokenObj.userType = userType;
        				tokenObj.owner_id = owner_id;
        				
				        let token = await jwtHelper.getToken(tokenObj);

				        let result_data = {
				        	user : tokenObj,
				        	token : token,
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
		
	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", statusCode.error, null);
	}

	return true;
}


module.exports = {
	login,
	ownerRegister,
	advertiserRegister,
	info,
	forgotPassword,
	updateProfile
}