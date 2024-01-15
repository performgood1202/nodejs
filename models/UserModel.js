const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const dbConstants = require('../Util/dbConstants.js');

const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');

const moment = require('moment');


class UserModel {
	constructor() {
		this.tableName = Dbprefix+"users";
		this.ownerTable = Dbprefix+"wb_owner";
		this.advertiserTable = Dbprefix+"wb_advertiser";
	}

	async executeSql(sql, params) {
		try {
			var results = await connection.query(sql, params);
			// console.log(results);
			return results;
		} catch (ex) {
			console.log(ex);
			throw ex
		}
	}

	async findAll() {
		let sql = 'SELECT * FROM ' + this.tableName + ';'
		try {
			const result = await this.executeSql(sql,[]);
			return result;
		} catch (ex) {
			console.log(ex);
			throw ex
		}
	}
	async getOwnerId(user_id) {
		let sql = 'SELECT * FROM ' + this.ownerTable + ' where user_id = ?'
		try {
			const result = await this.executeSql(sql,[user_id]);
			if(result && result.length > 0){
				return result[0].id
			}else{
				return null;
			}
		} catch (ex) {
			return null;
		}
	}
	async getAdvertiserId(user_id) {
		let sql = 'SELECT * FROM ' + this.advertiserTable + ' where user_id = ?'
		try {
			const result = await this.executeSql(sql,[user_id]);
			if(result && result.length > 0){
				return result[0].id
			}else{
				return null;
			}
		} catch (ex) {
			return null;
		}
	}
	async autheticate(username,password) {

		let data_post = {
            username,
            password
		};

		let data_return = {success:false,data:null,message:""};


		try {
			let login_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.login";

		    const response = await axios.post(login_url, data_post, {
                headers: {
                    'Content-Type': 'application/json',
                }
            }).then(function (response) {
            	// console.log(response)
			    return response.data;
			})
			 .catch(function (error) {
			    return null;
			});



			if(response &&  response.success == true){
                data_return.success = true;
				data_return.data = response.data;

			}else if(response && response.success == false){

				 data_return.message = response.message;

			}else{
              data_return.message = "somthing went wrong";
			}

			return data_return;
		} catch (ex) {
			throw ex
		}
	}

    async ownerRegister(body) {


		let data_return = {success:false,data:null,message:""};


		try {
			let login_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.ownerRegister";

		    const response = await axios.post(login_url, body, {
                headers: {
                    'Content-Type': 'application/json',
                }
            }).then(function (response) {
            	console.log(response)
            	return response.data;
			})
			 .catch(function (error) {
			    return null;
			});



			if(response &&  response.success == true){
                data_return.success = true;
				data_return.message = response.message;

			}else if(response && response.success == false){

				 data_return.message = response.message;

			}else{
              data_return.message = "somthing went wrong";
			}

			return data_return;
		} catch (ex) {
			throw ex
		}
	}
	async advertiserRegister(body) {


		let data_return = {success:false,data:null,message:""};


		try {
			let login_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.advertiserRegister";

		    const response = await axios.post(login_url, body, {
                headers: {
                    'Content-Type': 'application/json',
                }
            }).then(function (response) {
            	return response.data;
			})
			 .catch(function (error) {
			    return null;
			});



			if(response &&  response.success == true){
                data_return.success = true;
				data_return.message = response.message;

			}else if(response && response.success == false){

				 data_return.message = response.message;

			}else{
              data_return.message = "somthing went wrong";
			}

			return data_return;
		} catch (ex) {
			throw ex
		}
	}
	async forgotPassword(body) {


		let data_return = {success:false,data:null,message:""};


		try {
			let login_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.forgotPassword";

		    const response = await axios.post(login_url, body, {
                headers: {
                    'Content-Type': 'application/json',
                }
            }).then(function (response) {
            	return response.data;
			})
			 .catch(function (error) {
			    return null;
			});



			if(response &&  response.success == true){
                data_return.success = true;
				data_return.message = response.message;

			}else if(response && response.success == false){

				 data_return.message = response.message;

			}else{
              data_return.message = "somthing went wrong";
			}

			return data_return;
		} catch (ex) {
			throw ex
		}
	}
	async updateProfile(body) {


		let data_return = {success:false,data:null,message:""};


		try {

			let login_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.updateProfile";

		    const response = await axios.post(login_url, body, {
                headers: {
                    'Content-Type': `multipart/form-data`,
                }
            }).then(function (response) {
            	console.log(response)
            	return response.data;
			})
			 .catch(function (error) {
			    return null;
			});



			if(response &&  response.success == true){
                data_return.success = true;
                data_return.data = response.data;
				data_return.message = response.message;

			}else if(response && response.success == false){

				 data_return.message = response.message;

			}else{
              data_return.message = "somthing went wrong";
			}

			return data_return;
		} catch (ex) {
			throw ex
		}
	}
	async info(session) {


		let data_return = {success:false,data:null,message:""};

		if(session.userType == "owner" || session.userType == "advertiser"){

			let tableName = "";

			if(session.userType == "owner"){
                tableName = this.ownerTable;
			}else{
				tableName = this.advertiserTable;

			}
			//console.log(session);


			try {
				let sql = 'SELECT * FROM ' + tableName + ' where user_id ='+session.id;
				try {
					const result = await this.executeSql(sql,[]);
					data_return.success = 1;
					data_return.data = result;
				} catch (ex) {
					console.log(ex);
					throw ex
				}
				//console.log(data_return)
				return data_return;
			} catch (ex) {
				throw ex
			}
		}else{
			return data_return;
		}
	}
	async getOwnerInfo(owner_id) {


		let data_return = {success:false,data:null,message:""};


			let tableName = this.ownerTable;
			//console.log(session);


			try {
				let sql = 'SELECT * FROM ' + tableName + ' where id ='+owner_id;
				try {
					const result = await connection.query(sql,[]);
			        if(result && result.length > 0){

			        	data_return.success = 1;
					    data_return.data = result[0];

					    return data_return;

			        }else{
			        	return null;
			        }
					
				} catch (ex) {
					return null;
				}
				//console.log(data_return)
				return data_return;
			} catch (ex) {
				return null;
			}
	}
	async getUser(user_id) {


		try {
			let sql = 'SELECT * FROM ' + Dbprefix + 'users where id ='+user_id;
			try {
				const result = await this.executeSql(sql,[]);

				if(result && result.length > 0){

					let user = result[0];

					let api_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.getUser";

				    const response = await axios.post(api_url, user, {
		                headers: {
					      'Content-Type': `multipart/form-data`,
					    },
		            }).then(function (response) {
		            	//console.log(response)
		            	return response.data;
					})
					 .catch(function (error) {
					    return null;
					});


					if(response &&  response.success == true){
						let userData  = response.data;





						let userType = await this.getUserType(userData.groups);



          				let owner_id = null; 
          				let advertiser_id = null; 

          				if(userType == "owner"){



          					owner_id = await this.getOwnerId(userData.id);

          					

          				}else if(userType == "advertiser"){

          					advertiser_id = await this.getAdvertiserId(userData.id);

          				}

          				userData.userType = userType;
          				userData.owner_id = owner_id;
          				userData.advertiser_id = advertiser_id;

		                return userData;

					}else {
                       
                       return null;
					}

				}else{
					return null;
				}
				

			} catch (ex) {
				console.log(ex)

				return null;
			}
			//console.log(data_return)
			return null;
		} catch (ex) {
			return null;
		}
	}

	async getUserType(groups)  {

		const { Admin, Owner, Advertiser } = dbConstants.roles;

		let groups_ids = [];

	    Object.keys(groups).forEach(function(key) {

	      groups_ids.push(parseInt(key));

	    });

		if(groups_ids.includes(Admin)) {
			return "admin";
		}else if(groups_ids.includes(Owner)) {
			return "owner";
		}else{
	        return "advertiser";
		}
	   
	}
	async addStripeAccount(stripeData,user_id)  {

		let expires_at = moment.unix(stripeData.expires_at).format("YYYY-MM-DD HH:mm:ss");

		let data_return = {success:false,data:null,message:""};

		var updateStatus = "UPDATE "+ Dbprefix +"wb_owner set stripe_account = ?, stripe_connection_expires = ? where user_id = ?";
		const resData = await connection.query(updateStatus, [stripeData.stripe_account, expires_at, user_id]);
		if(resData && resData.affectedRows){
			data_return.success = true;
	        data_return.message = "Successfully updated!";
		}else{
	       data_return.message = "Not updated!";
		}
		return data_return;
	   
	}
	async checkStripeExist(user_id)  {

		let data_return = {success:false, exist: false};

		let sql = 'SELECT * FROM ' + this.ownerTable + ' where user_id = ?'
		try {

			const result = await this.executeSql(sql,[user_id]);

			data_return.success = true;

			if(result && result.length > 0){
				
				if(result[0].stripe_account && result[0].stripe_account != ""){
					data_return.exist = true;
				}
			}
		} catch (ex) {
			return data_return;
		}
		return data_return;
	   
	}
	

	async hashPassword(plaintextPassword) {
		 const saltRounds = 10;

		  // First method to generate a salt and then create hash
		  const salt = await bcrypt.genSalt(saltRounds);
		  return await bcrypt.hash(plaintextPassword, salt);
	}
}

module.exports = UserModel;