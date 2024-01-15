let statusCode = require("../Util/statusCode.js")
let baseResponse = require("../Util/baseResponse.js");
const StateModel = require('../models/StateModel.js');



const states = async(req, res) => {
	const response = new baseResponse(res);
	try{
		let cm = new StateModel();
		data = await cm.findAll().then(async result => {
			if(result && result.success == true){
				let resObj = result.data
		        let result_data = {
		        	states : resObj
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
	states
}