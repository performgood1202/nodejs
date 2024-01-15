let statusCode = require("../Util/statusCode.js")
let baseResponse = require("../Util/baseResponse.js");

const UserModel = require('../models/UserModel.js');



const fetchUser = async (body, res) => {
	const response = new baseResponse(res);
	try {
		try {
			data = UserModel.findAll().then(response => {
          			console.log(response);
          			return res.send({ error: false, data: response, message: 'users list.' });
        		})
        		.catch(error => {
          			console.log(error);
        		});
		} catch (ex) {
			console.log(ex);
			throw ex;
			response.sendResponse(null, false, "Something went wrong", 500, null);
		}

	} catch(err) {
		console.log(err);
		throw err;
		response.sendResponse(null, false, "Something went wrong", 500, null);
	}

	return true;
}
module.exports = {
	fetchUser,
}