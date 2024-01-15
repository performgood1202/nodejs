const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');


class StateModel {
	constructor() {
		this.tableName = Dbprefix+"wb_state";
	}

	async findAll() {
		let query = "SELECT * FROM " + this.tableName;
		let data = await connection.query(query).then(async result => {
			return result;      			
		})
		.catch(error => {
			return null;   
		});
    	let resObj = "";
		resObj = {
			data : data,
			success: true,
			message: "States list"
		}
		return resObj;
	}
}

module.exports = StateModel;