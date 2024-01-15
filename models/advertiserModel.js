const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');
const fs = require('fs');

const path = require('path');

const FormData = require('form-data');


class advertiserModel {
	constructor() {
		this.tbl_wb_advertiser = Dbprefix+"wb_advertiser";
	}

	async getAdvertisers(body) {

		let data_return = {success:false,data:null,message:""};


		try {
			let sql = 'SELECT * FROM ' + this.tbl_wb_advertiser;

			const result = await connection.query(sql,[]);
			if(result && result.length > 0){
				data_return.data = result;
			}else{
				data_return.message = "No Data!"
			}
			data_return.success = 1;


			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}

	}
	async getAdvertiserByUserId(user_id) {

		let data_return = {success:false,data:null,message:""};


		try {
			let sql = 'SELECT * FROM ' + this.tbl_wb_advertiser+' where user_id = ?';

			const result = await connection.query(sql,[user_id]);
			if(result && result.length > 0){
				data_return.data = result[0];
			}else{
				data_return.message = "No Data!"
			}
			data_return.success = 1;


			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}

	}
	
	
}

module.exports = advertiserModel;