let statusCode = require("../Util/statusCode.js")
let baseResponse = require("../Util/baseResponse.js");
const dbConstants = require('../Util/dbConstants.js');
const jwtHelper = require('../Util/jwtHelper');
const UserModel = require('../models/UserModel.js');
const adminModel = require('../models/adminModel.js');

const stripe = require('stripe')


class stripeController {

	

    stripeSecretKey = async () => {

    	let ad = new adminModel();
		let stripePrivateKey = await ad.getAdminSetting().then(async result => {
								//console.log("*******",result)
								if(result && result.success == true){
							        if(result.data && result.data.stripe_private_key){
							       	  return result.data.stripe_private_key;
							        }else{
							        	return null;
							        }
							    }else{
							    	return null;
							    }
							}).catch(error => {
					          	return null;
					        });
        return stripePrivateKey;

    }
    adminSettings = async () => {

    	let ad = new adminModel();
		let stripePrivateKey = await ad.getAdminSetting().then(async result => {
								//console.log("*******",result)
								if(result && result.success == true){
							        return result.data;
							    }else{
							    	return null;
							    }
							}).catch(error => {
					          	return null;
					        });
        return stripePrivateKey;

    }
    charge = async (body, booking, owner_stripe_account, booking_id) => {

    	let returnData = {success : false, data : null, message : ""};



		let adminSettings = await this.adminSettings();

		let admin_fee = 0;
		let stripe_private_key = "";
		let stripe_currency = "";

		if(adminSettings && adminSettings.admin_fee && adminSettings.admin_fee != "" ){
            admin_fee = Number(adminSettings.admin_fee);
		}else{
			returnData.message = "Admin fee not defined!";
			return returnData;
		}

		if(adminSettings && adminSettings.stripe_private_key && adminSettings.stripe_private_key != "" ){
            stripe_private_key = adminSettings.stripe_private_key;
		}else{
			returnData.message = "Stripe secret key not configured!";
			return returnData;
		}

		if(adminSettings && adminSettings.stripe_currency && adminSettings.stripe_currency != "" ){
            stripe_currency = adminSettings.stripe_currency;
		}else{
			returnData.message = "Stripe currency not configured!";
			return returnData;
		}

		const Stripe = stripe(stripe_private_key, {
		  apiVersion: '2022-08-01'
		})

		try {


			let amount = booking.data.amount * 100;

			admin_fee = (booking.data.amount * admin_fee) / 100;

			admin_fee =  Math.round(admin_fee);

			let app_fee = admin_fee * 100;

			const charge = await Stripe.charges.create(
								  {
								    amount: amount,
								    currency: stripe_currency,
								    source: body.token,
								    application_fee_amount: app_fee,
								  },
								  {
								    stripeAccount: owner_stripe_account,
								  }
								);

			
            if(charge && charge.status && charge.status == "succeeded"){

            	returnData.success = true;
            	returnData.data = { charge_id : charge.id, admin_fee : admin_fee};

            }else{
            	returnData.message = "Payment failed!";
            }
            return returnData;

		} catch(err) {

			returnData.message = err.message;
			return returnData;
		}
		return returnData;

	}



	makeConnection = async (email) => {

		let secretKey = await this.stripeSecretKey();

		const Stripe = stripe(secretKey, {
		  apiVersion: '2022-08-01'
		})

		let returnData = {stripe_account : null, expires_at : null, url : null};


		try {

			let account = await this.addAcccount(email,Stripe);

			if(account.id){
               let setupAccount = await this.setupStripe(account.id,Stripe);

               if(setupAccount.url && setupAccount.expires_at){
               	  returnData.stripe_account = account.id;
               	  returnData.expires_at = setupAccount.expires_at;
               	  returnData.url = setupAccount.url;
               	  return returnData;
               }
			}
			return null;


		} catch(err) {
			console.log(err);
			return null;
		}

		return true;
	}

	addAcccount = async (email,Stripe) => {

	   try{



	        const account = await Stripe.accounts.create({
	          type: 'standard',
	          country: "AU",
	          email: email,

	        }).then((account) => {

	          return account;
	             
	        }).catch(
	              (error) => {
	                return error.message;
	              }
	        )


	      return account;

	  } catch(err) {
	    return err.message;
	   
	  }
	  
	}

	setupStripe = async (stripe_account_id, Stripe) => {

	   try{

	        const account = await Stripe.accountLinks.create({
	          account: stripe_account_id,
	          refresh_url: process.env.SITE_URL+"/owner/setting",
	          return_url: process.env.SITE_URL+"/owner/setting?success=true",
	          type: 'account_onboarding',
	        }).then((account) => {

	          return account; 
	             
	        }).catch(
	              (error) => {
	              	console.log(error)
	                return null;
	              }
	        )
	     return account;
	  } catch(err) {
	    return err.message;
	   
	  }
	  
	}
}


module.exports = stripeController