const authController = require('../controllers/authController.js')
//const appAccountController = require('../controllers/app/accountController.js')
const jwtHelper = require('../Util/jwtHelper');
const dbConstants = require('../Util/dbConstants.js');
const appConfig = require('../appConfig.json');
let appBaseResponse = require("../Util/appBaseResponse.js");
let baseResponse = require("../Util/baseResponse.js");

const send401 = (res,message = "") => {

    const response = new baseResponse(res);

    response.sendResponse(null, false, message, 401, null);


}
const send403 = (res) => {
    const response = new baseResponse(res);

    response.sendResponse(null, false, "Session expired!", 403, null);
}

const authenticate = async (req, res, next) => {

    const Authorization = req.get('Authorization')
    let token = null;
    let result = null;
    if (Authorization) {
        token = Authorization.replace('Bearer ', '');
        try{
            
            result = await jwtHelper.decodeToken(token);

        }catch(e){

           send401(res,"Authentication failed!");
           return

        }
        
    }
    //console.log(result)
    if(result && result.id){

        req.session = result;
        next();

    }else if (null === token || result == null) {
        send401(res,"Authentication failed!");
        return
    } else if (token == appConfig.superKey) {
        req.session = null;
        next();
    } else {
        send401(res,"Authentication failed!");
        return
    }


}

const isAdmin = async (req, res, next) => {

	let { groups } = req.session;

    const { Admin } = dbConstants.roles;

    let groups_ids = [];

    Object.keys(groups).forEach(function(key) {

      groups_ids.push(parseInt(key));

    });

    if(groups_ids.includes(Admin)) {
        next();
    } else {
        send401(res,"you have no access!");
    }
}

const isOwner = async (req, res, next) => {

	let { groups } = req.session;

	const { Owner } = dbConstants.roles;

    let groups_ids = [];

    Object.keys(groups).forEach(function(key) {

      groups_ids.push(parseInt(key));

    });

	if(groups_ids.includes(Owner)) {
		next();
	} else {
		send401(res,"you have no access!");
	}
}
const isAdvertiser = async (req, res, next) => {
    let { groups } = req.session;

    const { Advertiser } = dbConstants.roles;

    let groups_ids = [];

    Object.keys(groups).forEach(function(key) {

      groups_ids.push(parseInt(key));

    });

    if(groups_ids.includes(Advertiser)) {
        next();
    } else {
        send401(res,"you have no access!");
    }
}


module.exports = {
	authenticate,
	isAdmin,
	isOwner,
    isAdvertiser,
}