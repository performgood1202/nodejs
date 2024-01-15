const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');

let authController = require('../controllers/authController.js');


class adminModel {
	constructor() {
	}

	async addPropertyType(body) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(body.name != ""){

			    var sql2 = "INSERT INTO " + Dbprefix + "wb_property_type (name) VALUES (?)";

				const result = await connection.query(sql2, [body.name]);

				if(result && result.insertId){
					data_return.success = true;
			        data_return.message = "Successfully added!";
				}else{
			       data_return.message = "Data not store!";
				}

			}else{
				data_return.message = "Name not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async editPropertyType(body,id) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(body.name != ""){

			    var sql2 = "UPDATE " + Dbprefix + "wb_property_type set name = ? where id = ?";

				const result = await connection.query(sql2, [body.name, id]);

				if(result && result.affectedRows){
					data_return.success = true;
			        data_return.message = "Successfully updated!";
				}else{
			       data_return.message = "Data not store!";
				}

			}else{
				data_return.message = "Name not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async addPrecinctType(body) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(body.name != ""){

			    var sql2 = "INSERT INTO " + Dbprefix + "wb_precinct_type (name) VALUES (?)";

				const result = await connection.query(sql2, [body.name]);

				if(result && result.insertId){
					data_return.success = true;
			        data_return.message = "Successfully added!";
				}else{
			       data_return.message = "Data not store!";
				}

			}else{
				data_return.message = "Name not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async editPrecinctType(body,id) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(body.name != ""){

			    var sql2 = "UPDATE " + Dbprefix + "wb_precinct_type set name = ? where id = ?";

				const result = await connection.query(sql2, [body.name, id]);

				if(result && result.affectedRows){
					data_return.success = true;
			        data_return.message = "Successfully updated!";
				}else{
			       data_return.message = "Data not store!";
				}

			}else{
				data_return.message = "Name not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async addMediaType(body) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(body.name != ""){

			    var sql2 = "INSERT INTO " + Dbprefix + "wb_media (name) VALUES (?)";

				const result = await connection.query(sql2, [body.name]);

				if(result && result.insertId){
					data_return.success = true;
			        data_return.message = "Successfully added!";
				}else{
			       data_return.message = "Data not store!";
				}

			}else{
				data_return.message = "Name not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async editMediaType(body,id) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(body.name != ""){

			    var sql2 = "UPDATE " + Dbprefix + "wb_media set name = ? where id = ?";

				const result = await connection.query(sql2, [body.name, id]);

				if(result && result.affectedRows){
					data_return.success = true;
			        data_return.message = "Successfully updated!";
				}else{
			       data_return.message = "Data not store!";
				}

			}else{
				data_return.message = "Name not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async addWinboardType(body) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			let {name,icon,published,ordering} = body;

			if(body.name != ""){

			    var sql2 = "INSERT INTO " + Dbprefix + "wb_winboard_type (name,icon,published,ordering) VALUES (?,?,?,?)";

				const result = await connection.query(sql2, [name,icon,published,ordering]);

				if(result && result.insertId){
					data_return.success = true;
			        data_return.message = "Successfully added!";
				}else{
			       data_return.message = "Data not store!";
				}

			}else{
				data_return.message = "Name not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async editWinboardType(body,id) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			let {name,icon,published,ordering} = body;

			if(body.name != ""){

			    var sql2 = "UPDATE " + Dbprefix + "wb_winboard_type set name = ?, icon = ?, published = ?, ordering = ? where id = ?";

				const result = await connection.query(sql2, [name,icon,published,ordering,id]);

				if(result && result.affectedRows){
					data_return.success = true;
			        data_return.message = "Successfully updated!";
				}else{
			       data_return.message = "Data not store!";
				}

			}else{
				data_return.message = "Name not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	
	async deletePropertyType(id) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(id != ""){

			    var sql2 = "delete from " + Dbprefix + "wb_property_type where id = ?";

				const result = await connection.query(sql2, [id]);

				if(result && result.affectedRows){
					data_return.success = true;
			        data_return.message = "Successfully deleted!";
				}else{
			       data_return.message = "Data not delete!";
				}

			}else{
				data_return.message = "Id not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async deletePrecinctType(id) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(id != ""){

			    var sql2 = "delete from " + Dbprefix + "wb_precinct_type where id = ?";

				const result = await connection.query(sql2, [id]);

				if(result && result.affectedRows){
					data_return.success = true;
			        data_return.message = "Successfully deleted!";
				}else{
			       data_return.message = "Data not delete!";
				}

			}else{
				data_return.message = "Id not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async deleteMediaType(id) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(id != ""){

			    var sql2 = "delete from " + Dbprefix + "wb_media where id = ?";

				const result = await connection.query(sql2, [id]);

				if(result && result.affectedRows){
					data_return.success = true;
			        data_return.message = "Successfully deleted!";
				}else{
			       data_return.message = "Data not delete!";
				}

			}else{
				data_return.message = "Id not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async deleteWinboardType(id) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			if(id != ""){

			    var sql2 = "delete from " + Dbprefix + "wb_winboard_type where id = ?";

				const result = await connection.query(sql2, [id]);

				if(result && result.affectedRows){
					data_return.success = true;
			        data_return.message = "Successfully deleted!";
				}else{
			       data_return.message = "Data not delete!";
				}

			}else{
				data_return.message = "Id not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}

	async getAdminSetting() {

		let data_return = {success:false,data:null,message:""};
		
		try {

			var sql2 = "SELECT params from  " + Dbprefix + "extensions where element = ?";

			const result = await connection.query(sql2, ["com_winboard"]);

			if(result && result.length > 0){
				let data = result[0].params;

				data = JSON.parse(data);

				if(data){

					let data_admin = {};
					data_admin.admin_email = data.admin_email;
					data_admin.admin_fee = data.admin_fee;
					data_admin.stripe_public_key = data.stripe_public_key;
					data_admin.stripe_private_key = data.stripe_private_key;
					data_admin.stripe_currency = data.stripe_currency;

					data_return.success = true;
					data_return.data = data_admin;


                }else{
                	data_return.message = "Not found!";
                }
			}else{
		       data_return.message = "Data not store!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async updateAdminSetting(body) {

		let data_return = {success:false,data:null,message:""};
		
		try {

			let {admin_email, admin_fee, stripe_public_key, stripe_private_key, stripe_currency} = body;

			var sql2 = "SELECT params from  " + Dbprefix + "extensions where element = ?";

			const result = await connection.query(sql2, ["com_winboard"]);

			if(result && result.length > 0){
				let data = result[0].params;

				data = JSON.parse(data);

				if(data){

					data.admin_email = admin_email;
					data.admin_fee = admin_fee;
					data.stripe_public_key = stripe_public_key;
					data.stripe_private_key = stripe_private_key;
					data.stripe_currency = stripe_currency;

					data = JSON.stringify(data);

					var sql2 = "UPDATE " + Dbprefix + "extensions set params = ? where element = ?";

					const result = await connection.query(sql2, [data, "com_winboard"]);

					if(result && result.affectedRows){
						data_return.success = true;
				        data_return.message = "Successfully updated!";
					}else{
				       data_return.message = "Data not store!";
					}

                }else{
                	data_return.message = "Not found!";
                }
			}else{
		       data_return.message = "Data not store!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}


	
}

module.exports = adminModel;