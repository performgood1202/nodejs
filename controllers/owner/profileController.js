let statusCode = require("../../Util/statusCode.js")
let baseResponse = require("../../Util/baseResponse.js");
const winboardModel = require('../../models/winboardModel.js');
const UserModel = require('../../models/UserModel.js');

const stripeController = require('..//stripeController.js');


const getStripeConnection = async(body, session, res) => {
	const response = new baseResponse(res);
	try{
		let urM = new UserModel();

		let checkStripeExistAccount = await urM.checkStripeExist(session.id);



		if(checkStripeExistAccount.success && checkStripeExistAccount.exist == false){

			let stripeCont = new stripeController;

			let stripe_dd = await stripeCont.makeConnection(body.email);

			if(stripe_dd && stripe_dd.url){

				
				data = await urM.addStripeAccount(stripe_dd,session.id).then(async result => {
					//console.log("*******",result)
					if(result && result.success == true){

				        let result_data = {
				        	url : stripe_dd.url,
				        }
				        response.sendResponse(result_data, true, "", 200, null);
				    }else{
				    	response.sendResponse(null, false, result.message, 201, null);
				    }
				}).catch(error => {
		          	response.sendResponse(null, false, error.message, 500, null);
		        });



			}else{
				response.sendResponse(null, false, "Stripe account not created!", 500, null);
			}
		}else if(checkStripeExistAccount.success && checkStripeExistAccount.exist == true){
			response.sendResponse(null, false, "Stripe Account already exist!", 500, null);
		}else{
			response.sendResponse(null, false, "Something went wrong!", 500, null);
		}	
		/*let pr = new winboardModel();
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
        });*/
	}catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}
}


module.exports = {
	getStripeConnection
}