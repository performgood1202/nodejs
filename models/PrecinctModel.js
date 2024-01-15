const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');


class PrecinctModel {
	constructor() {
		this.tableName = Dbprefix+"wb_precinct_type";
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
			message: "Precinct Type list"
		}
		return resObj;
	}
}

module.exports = PrecinctModel;