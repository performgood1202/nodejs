const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const dbConstants = require('../Util/dbConstants.js');

const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');

const moment = require('moment');


class messageModel {
	constructor() {
		this.winboard_message = Dbprefix+"wb_winboard_message";
		this.winboard_message_chat = Dbprefix+"wb_winboard_message_chat";
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
	async startMessage(body,session) {

		let data_return = {success:false,data:null,message:""};


		try {

			let messageId = await this.getWinboardMessageId(body);

			if(messageId){

				let saveM = await this.saveMessageChat(messageId,session.id,body.to_user_id, body.message);

				if(saveM){

					data_return.success = 1;
					data_return.message = "Successfully send!";

				}else{
					data_return.message = "Message not send!";
				}

			}else{

				data_return.message = "MessageId not generated!";

			}
		} catch (ex) {
			data_return.message = ex.message;
		}

		return data_return;
	}
	async saveMessageChat(messageId,from_user_id,to_user_id,message) {

		
		try {

			var sql2 = "INSERT INTO " + this.winboard_message_chat + " (message_id, from_user_id, to_user_id, message) VALUES (?,?,?,?)";
			const result = await connection.query(sql2, [messageId, from_user_id,to_user_id,message]);
			
			if(result && result.affectedRows){
				return true;
			}else{
				return false;	
			}
		} catch (ex) {
			return null;
		}
	}
	async sendMessage(body,session) {

		
		let data_return = {success:false,data:null,message:""};


		try {

			if(body.messageId){

				let saveM = await this.saveMessageChat(body.messageId,session.id,body.to_user_id, body.message);

				if(saveM){

					data_return.success = 1;
					data_return.message = "Successfully send!";

				}else{
					data_return.message = "Message not send!";
				}

			}else{

				data_return.message = "MessageId not generated!";

			}
		} catch (ex) {
			data_return.message = ex.message;
		}

		return data_return;
	}
	async getWinboardMessageId(body) {

		
		try {

			let sql = 'SELECT * FROM ' + this.winboard_message + ' where obj_id = ? AND obj_type = ?'

			const result = await this.executeSql(sql,[body.obj_id, body.obj_type]);

			

			if(result && result.length > 0){
				return result[0].id
			}else{
				let dd =  await this.saveWinboardMessage(body);



				if(dd){
					return await this.getWinboardMessageId(body);
				}else{
					return null;
				}
			}
		} catch (ex) {
			return null;
		}
	}

	async saveWinboardMessage(body) {

		
		try {

			var sql2 = "INSERT INTO " + this.winboard_message + " (obj_id, obj_type) VALUES (?,?)";
			const result = await connection.query(sql2, [body.obj_id, body.obj_type]);
			
			if(result && result.affectedRows){
				return true;
			}else{
				return false;	
			}
		} catch (ex) {
			console.log(ex)
			return null;
		}
	}


	
	async getMessages(body, session) {

		let data_return = {success:false,data:null,message:""};
		
		try {


			let sql = 'select m1.* from ' + this.winboard_message_chat + ' m1 join ( SELECT MAX(id) as id FROM ' + this.winboard_message_chat + ' GROUP BY message_id ) m2 on m1.id = m2.id where m1.from_user_id  = ? OR m1.to_user_id = ? ORDER BY m1.id DESC';


			const result = await this.executeSql(sql,[session.id,session.id]);

			if(result && result.length > 0){

				let data = [];
				for (const [key_res, res] of Object.entries(result)) {

					let from_user_info = await this.getBookingUserInfo(res.from_user_id,"wb_owner");
					let to_user_info = await this.getBookingUserInfo(res.to_user_id,"wb_owner");
					res.from_user_info = from_user_info;
					res.to_user_info = to_user_info;

					data.push(res)

				}
				data_return.success = true;
				data_return.data = data;
			}else{
				data_return.message = "Messages not found!";
			}
		} catch (ex) {
			data_return.message = ex.message;
		}

		return data_return;
	}
	async getMessageById(message_id,session) {

		let data_return = {success:false,data:null,message:""};
		
		try {


			let sql = 'select m1.* from ' + this.winboard_message_chat + ' as m1 where m1.message_id  = ? AND (m1.from_user_id  = ? OR m1.to_user_id = ?) order by id desc';


			const result = await this.executeSql(sql,[parseInt(message_id),session.id, session.id]);


			if(result && result.length > 0){
				
				let data = [];
				for (const [key_res, res] of Object.entries(result)) {

					let from_user_info = await this.getBookingUserInfo(res.from_user_id,"wb_owner");
					let to_user_info = await this.getBookingUserInfo(res.to_user_id,"wb_owner");
					res.from_user_info = from_user_info;
					res.to_user_info = to_user_info;

					data.push(res)

				}
				data_return.success = true;
				data_return.data = data;

			}else{
				data_return.message = "Messages not found!";
			}
		} catch (ex) {
			data_return.message = ex.message;
		}

		return data_return;
	}
	async getBookingUserInfo(user_id, table_name) {
		
		try {


			let sql = 'select * from ' + Dbprefix + table_name+' where user_id = ?';


			const result = await this.executeSql(sql,[user_id]);

			if(result && result.length > 0){
				return result[0];
			}else{
				let dd =  await this.getBookingUserInfo(user_id, "wb_advertiser");

				return dd;
			}
		} catch (ex) {
			return null;
		}
	}
}

module.exports = messageModel;