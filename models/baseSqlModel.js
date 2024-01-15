const connection = require('../config/dbManager.js');

class Model {
	constructor(tableName) {
		this.tableName = tableName
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
}

module.exports = Model;