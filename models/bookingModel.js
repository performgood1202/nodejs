const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const dbConstants = require('../Util/dbConstants.js');

const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');

const moment = require('moment');

const winboardModel = require('../models/winboardModel.js');
const propertyModel = require('../models/propertyModel.js');
const userModel = require('../models/UserModel.js');

const fs = require('fs');

const path = require('path');

const FormData = require('form-data');

const stripeController = require('../controllers/stripeController.js');


class bookingModel {
	constructor() {
		this.tbl_booking = Dbprefix+"wb_winboard_booking";
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
		let sql = 'SELECT * FROM ' + this.tbl_booking + ';'
		try {
			const result = await this.executeSql(sql,[]);
			return result;
		} catch (ex) {
			console.log(ex);
			throw ex
		}
	}
	async book(body,winboard_id,session) {

		let resObj = {
			data : null,
			success: false,
			message: ""
		}

		try {
			let wM = new winboardModel();
			let winboard = await wM.getOwnerWinboardById(winboard_id, "", "advertiser")

			if(winboard && winboard.data && winboard.data.winboard && winboard.data.winboard.price){
				let price = winboard.data.winboard.price;

				// To set two dates to two variables
			    var date1 = new Date(body.data.date_from);
			    var date2 = new Date(body.data.date_to);
			      
			    // To calculate the time difference of two dates
			    var Difference_In_Time = date2.getTime() - date1.getTime();
			      
			    // To calculate the no. of days between two dates
			    var days = Difference_In_Time / (1000 * 3600 * 24);

			    let total_price = price * days;

			    let array_column = [];

			    array_column["date_from"] = body.data.date_from;
			    array_column["date_to"] = body.data.date_to;
			    array_column["winboard_id"] = winboard_id;
			    array_column["advertiser_id"] = session.advertiser_id;
			    array_column["amount"] = total_price;
			   /*
			    if(body.artwork && body.artwork != ""){
			    	array_column["artwork"] = body.artwork;
			    }
			    if(body.brief && body.brief != ""){
			    	array_column["brief"] = body.brief;
			    }*/

			    let cols = Object.keys(array_column);
				let values = Object.values(array_column);
				let values_question = [];

				cols.forEach(function(col){
				  values_question.push("?");
				});

				cols = cols.join(",");
				values_question = values_question.join(",");
			    


			    var sql2 = "INSERT INTO " + this.tbl_booking + " ("+cols+") VALUES ("+values_question+")";

				const result = await connection.query(sql2, values);

				if(result && result.insertId){


					if(body.artwork && body.artwork != ""){
						await this.uploadBookingData(result.insertId,body.artwork,"artwork");
					}
					if(body.brief && body.brief != ""){
						await this.uploadBookingData(result.insertId,body.brief,"brief");
					}


					await this.deleteOldImages();
	                
	                resObj.success = 1;
					resObj.message = "Add Booking successfully!"
					return resObj;	


				}else{
					resObj.message = "Data not insert!"
					return resObj;	
				}
			}else{
					resObj.message = "Winboard not found!"
					return resObj;	
			}
			
		} catch (ex) {
			resObj.message = ex.message

			return resObj;	
		}
	}

	async adUpdate(body,booking_id,session) {
		let resObj = {
			data : null,
			success: false,
			message: ""
		}
		try {
			let result = await this.getBookingData(booking_id);
			let data = JSON.stringify(result);
		
			let wM = new winboardModel();
			let winboard = await wM.getOwnerWinboardById(result.data.winboard_id, "", "advertiser")

			if(body.artwork && body.artwork != ""){
				await this.uploadBookingData(booking_id,body.artwork,"artwork");
			}
			if(body.brief && body.brief != ""){
				await this.uploadBookingData(booking_id,body.brief,"brief");
			}

			await this.deleteOldImages();
			if(winboard && winboard.data && winboard.data.winboard && winboard.data.winboard.price){
				let price = winboard.data.winboard.price;

				let total_price =  0;
				// To set two dates to two variables
				if((body.data.date_from !== undefined && body.data.date_from != "") || (body.data.date_to !== undefined && body.data.date_to != "")){
				    var date1 = new Date(body.data.date_from);
				    var date2 = new Date(body.data.date_to);
				      
				    // To calculate the time difference of two dates
				    var Difference_In_Time = date2.getTime() - date1.getTime();
				      
				    // To calculate the no. of days between two dates
				    var days = Difference_In_Time / (1000 * 3600 * 24) + 1;

				    total_price = price * days;
				}

			    let queryData = '';
			    if(body.data.date_from !== undefined && body.data.date_from != ""){
			    	queryData = 'date_from="'+body.data.date_from+'"';
			    }
			    if(body.data.date_to !== undefined && body.data.date_to != ""){
			    	queryData = queryData+',date_to="'+body.data.date_to+'"';
			    }
			    if(total_price !== undefined && total_price != "" && total_price != 0){
			    	queryData = queryData+',amount='+total_price;
			    }

			    if(queryData != ""){
				    var sql = "UPDATE " + this.tbl_booking + " SET "+queryData+" WHERE id=?";
					const result = await connection.query(sql, [booking_id]);
					
					if(result && result.affectedRows){
						resObj.success = 1;
						resObj.message = "Booking data updated successfully!"
						return resObj;
					}else{
						resObj.message = "Data not updated!"
						return resObj;	
					}
				}

				resObj.message = "Booking Data updated!"
				return resObj;
				// if(result && result.insertId){

				
	                
	            //     resObj.success = 1;
				// 	resObj.message = "Booking updated successfully!"
				// 	return resObj;	


				// }else{
				// 	resObj.message = "Data not updated!"
				// 	return resObj;	
				// }
			}else{
					resObj.message = "Winboard not found!"
					return resObj;	
			}
			return resObj;
			
		} catch (ex) {
			resObj.message = ex.message

			return resObj;	
		}
	}
	async uploadBookingData(booking_id,file,type) {


		const formData = new FormData();

		let path_stream = path.resolve()+"/"+file;
		let stream = await fs.createReadStream(path_stream);
		formData.append('file', stream);
		formData.append("booking_id",booking_id);
		formData.append("type",type);

	    let api_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.uploadBookingData";

	    const response = await axios.post(api_url, formData, {
		    headers: {
		      'Content-Type': `multipart/form-data; boundary=${formData.getBoundary()}`,
		    },
		    maxBodyLength: Infinity,
		    maxContentLength: Infinity,
		}).then(function (response) {
        	//console.log(response)
        	return response.data;
		})
		 .catch(function (error) {
		 	//console.log(error)
		    return null;
		});
	}
	async bookingCancel(booking_id,session) {


		let resObj = {
			data : null,
			success: false,
			message: ""
		}
		try {

			let result = await this.getBookingData(booking_id);
			let data = JSON.stringify(result);
		
			let wM = new winboardModel();
			let winboard = await wM.getOwnerWinboardById(result.data.winboard_id, "", "advertiser")

			if(winboard && winboard.data && winboard.data.winboard && winboard.data.winboard.id){

				let owner_id = await wM.getOwnerId(winboard.data.winboard.id);

				if(owner_id && owner_id == session.owner_id){

					if(result.data.status == "pending"){
						var sql = "UPDATE " + this.tbl_booking + " SET status = ? WHERE id=?";
						const result = await connection.query(sql, ["canceled",booking_id]);
						
						if(result && result.affectedRows){
							resObj.success = 1;
							resObj.message = "Booking canceled successfully!"
						}else{
							resObj.message = "Data not updated!"
						}
					}else if(result.data.status == "canceled"){
                         resObj.message = "Booking already canceled!"
					}else{
						resObj.message = "Booking Not canceled!";
					}	
					return resObj;
				}else{
					resObj.message = "Owner not match!"
				    return resObj;	
				}

			}else{

				resObj.message = "Winboard not found!"
				return resObj;	

			}
			   /* var sql = "UPDATE " + this.tbl_booking + " SET status = ? WHERE id=? AND ";
				const result = await connection.query(sql, ["canceled",booking_id]);
				
				if(result && result.affectedRows){
					resObj.success = 1;
					resObj.message = "Booking data updated successfully!"
					return resObj;
				}else{
					resObj.message = "Data not updated!"
					return resObj;	
				}
				
				resObj.message = "Booking Data updated!"
				return resObj;*/
			
		} catch (ex) {
			resObj.message = ex.message

			return resObj;	
		}
	}
	async bookingConfirm(booking_id,session) {


		let resObj = {
			data : null,
			success: false,
			message: ""
		}
		try {

			let result = await this.getBookingData(booking_id);
			let data = JSON.stringify(result);
		
			let wM = new winboardModel();
			let winboard = await wM.getOwnerWinboardById(result.data.winboard_id, "", "advertiser")

			if(winboard && winboard.data && winboard.data.winboard && winboard.data.winboard.id){

				let owner_id = await wM.getOwnerId(winboard.data.winboard.id);

				if(owner_id && owner_id == session.owner_id){

					if(result.data.status == "pending"){
						var sql = "UPDATE " + this.tbl_booking + " SET status = ? WHERE id=?";
						const result = await connection.query(sql, ["accepted",booking_id]);
						
						if(result && result.affectedRows){
							resObj.success = 1;
							resObj.message = "Booking confirmed successfully!"
						}else{
							resObj.message = "Data not updated!"
						}
					}else if(result.data.status == "accepted"){
                         resObj.message = "Booking already accepted!"
					}else{
						resObj.message = "Booking Not confirmed!";
					}	
					return resObj;
				}else{
					resObj.message = "Owner not match!"
				    return resObj;	
				}

			}else{

				resObj.message = "Winboard not found!"
				return resObj;	

			}
			   /* var sql = "UPDATE " + this.tbl_booking + " SET status = ? WHERE id=? AND ";
				const result = await connection.query(sql, ["canceled",booking_id]);
				
				if(result && result.affectedRows){
					resObj.success = 1;
					resObj.message = "Booking data updated successfully!"
					return resObj;
				}else{
					resObj.message = "Data not updated!"
					return resObj;	
				}
				
				resObj.message = "Booking Data updated!"
				return resObj;*/
			
		} catch (ex) {
			resObj.message = ex.message

			return resObj;	
		}
	}
	async bookingPay(body,booking_id,session) {


		let resObj = {
			data : null,
			success: false,
			message: ""
		}
		try {

			let booking = await this.getBookingData(booking_id);

			if(booking && booking.data && booking.data.status == "accepted"){
				let wM = new winboardModel();
				let userM = new userModel();

				let owner_id = await wM.getOwnerId(booking.data.winboard_id);

				let owner_data = await userM.getOwnerInfo(owner_id);

				if(owner_data && owner_data.data && owner_data.data.stripe_account && owner_data.data.stripe_account != ""){

					let owner_stripe_account = owner_data.data.stripe_account;

					let stripeCont = new stripeController;

			        let stripe_dd = await stripeCont.charge(body, booking, owner_stripe_account, booking_id);

			        if(stripe_dd && stripe_dd.success == true && stripe_dd.data.charge_id){

			        	let admin_fee = stripe_dd.data.admin_fee;
			        	let date_paid = new Date;

			        	date_paid = moment(date_paid).format("YYYY-MM-DD HH:mm:ss");

			        	var sql = "UPDATE " + this.tbl_booking + " SET status = ?, admin_fee = ?, date_paid = ? WHERE id = ?";
						const result = await connection.query(sql, ["paid", admin_fee, date_paid, booking_id]);
						
						if(result && result.affectedRows){
							resObj.success = 1;
							resObj.message = "Booking paid successfully!"
						}else{
							resObj.message = "Booking not paid!"
						}

			        }else if(stripe_dd && stripe_dd.success == false){


			        	resObj.message = stripe_dd.message;

			        }else{
			        	resObj.message = "Payment not proceed!";
			        }
                     

				}else{
					resObj.message = "Stripe account not configured for owner!"
				}

			}else{

				resObj.message = "Booking not accepted!"

			}

			return resObj;

			
			
		} catch (ex) {
			resObj.message = ex.message

			return resObj;	
		}
	}
	async deleteOldImages() {


		const directory = path.resolve()+"/public/files";


		await fs.readdir(directory, async (err, files) => {
			  if (err) throw err;

			  for (const file of files) {
			    fs.unlink(path.join(directory, file), (err) => {
			      if (err) throw err;
			    });
			  }
			});
		return 1;
		
	}

	async getBookingData(booking_id) {
		let resObj = {
			data : null,
			success: false,
			message: ""
		}
		try {
			let sql = 'SELECT * FROM ' + this.tbl_booking+' where id = ?';

			const result = await connection.query(sql,[booking_id]);
			if(result && result.length > 0){
				resObj.data = result[0];
			}else{
				resObj.message = "No Data!"
			}
			resObj.success = 1;
			return resObj;			
		} catch (ex) {
			resObj.message = ex.message
			return resObj;	
		}
	}

	async getBookings(body,session) {
		let resObj = {
			data : null,
			success: false,
			message: "No booking found!"
		}


		try {

			let $perPage = 10;

			let $page = (body.page && body.page > 0) ? parseInt(body.page) : 1;

			let $startAt = $perPage * ($page - 1);

			let sql = 'SELECT wb.*, w.property_id, w.name AS _winboard_name, w.width AS _winboard_width, w.height AS _winboard_height,'
		    sql += 'p.title AS _property_title,'
		    sql += 'p.agent_name AS _property_agent_name,'
		    sql += 'p.agent_phone AS _property_agent_phone,'
		    sql += 'p.agent_email AS _property_agent_email,'
		    sql += 'p.street_number AS _property_street_number,'
		    sql += '(SELECT wp.filename FROM `'+Dbprefix+'wb_winboard_photo` AS wp WHERE wp.winboard_id = w.id ORDER BY wp.ordering LIMIT 1) AS _image,'
		    sql += '(SELECT s.name FROM `'+Dbprefix+'wb_state` AS s WHERE s.id = p.state_id LIMIT 1) AS _state_name,'
		    sql += '(SELECT CONCAT(IFNULL(o.first_name, \'\'), \' \', IFNULL(o.surname, \'\')) FROM `'+Dbprefix+'wb_owner` AS o WHERE o.id = p.owner_id LIMIT 1) AS _owner_name,'
		    sql += '(SELECT pt.name FROM `'+Dbprefix+'wb_property_type` AS pt WHERE pt.id = p.property_type_id LIMIT 1) AS _property_type_name,'
		    sql += '(SELECT pt.name FROM `'+Dbprefix+'wb_precinct_type` AS pt WHERE pt.id = p.precinct_type_id LIMIT 1) AS _precinct_type_name,'
		    sql += '(SELECT c.name FROM `'+Dbprefix+'wb_city` AS c WHERE c.id = p.city_id LIMIT 1) AS _city_name,'
		    sql += '(SELECT s.name FROM `'+Dbprefix+'wb_street` AS s WHERE s.id = p.street_id LIMIT 1) AS _street_name,'
		    sql += '(SELECT s.name FROM `'+Dbprefix+'wb_postcode` AS s WHERE s.id = p.postcode_id LIMIT 1) AS _postcode_name,'
		    sql += '(SELECT wb.name FROM `'+Dbprefix+'wb_winboard_type` AS wb WHERE wb.id = w.winboard_type_id LIMIT 1) AS _winboard_type_name FROM  `'+Dbprefix+'wb_winboard_booking` AS wb,`'+Dbprefix+'wb_winboard` AS w LEFT JOIN `'+Dbprefix+'wb_property` AS p ON p.id = w.property_id';

		    let whereBooking = await this.whereBooking(body,session);

			sql += ` WHERE `+whereBooking;
			sql += ` ORDER BY wb.created DESC`;

			let dataCount = await connection.query(sql).then(async result => {
				//console.log(result)
				if(result && result.length > 0){
					return result.length;
				}else{
					return 0;
				}
				
			})
			.catch(error => {	
				return 0;   
			});

			let $totalPages = Math.ceil(dataCount / $perPage);

			let total_records = dataCount;


			sql += ` LIMIT ${$startAt}, ${$perPage}`;

			


			let data = await connection.query(sql).then(async result => {
				//console.log(result)
				if(result && result.length > 0){
					return result;
				}else{
					return null;
				}
				
			})
			.catch(error => {	
				return null;   
			});

			
			if(data){

				let data_return = {bookings : data, total_records: total_records, total_page: $totalPages, current_page : $page, perPage : $perPage}
				resObj.data = data_return;
				resObj.success = true;
				resObj.message = "Booking list";

			}	

		} catch (ex) {
			resObj.message = ex.message
			
		}
		return resObj;	
	}
	async getBookingById(booking_id,session) {
		let resObj = {
			data : null,
			success: false,
			message: "No booking found!"
		}


		try {


			let sql = 'SELECT wb.*, w.property_id FROM  `'+Dbprefix+'wb_winboard_booking` AS wb,`'+Dbprefix+'wb_winboard` AS w LEFT JOIN `'+Dbprefix+'wb_property` AS p ON p.id = w.property_id';

	        let $where = [];

	        $where.push('w.id = wb.winboard_id');


			if(session.owner_id){
				$where.push('p.owner_id = '+session.owner_id);
			}else if(session.advertiser_id){
				$where.push('wb.advertiser_id = '+session.advertiser_id);
			}
			$where.push('wb.id = '+booking_id);

			let $queryWhere = $where.join(" AND ");

			sql += ` WHERE `+$queryWhere;

			
			

			let data = await connection.query(sql).then(async result => {
				//console.log(result)
				if(result && result.length > 0){
					return result[0];
				}else{
					return null;
				}
				
			})
			.catch(error => {	
				return null;   
			});

			
			if(data){
				let pM = new propertyModel();

				let propertyData = await pM.getOwnerPropertyById(data.property_id);

				if(propertyData && propertyData.data && propertyData.data.property){
					data.property = propertyData.data.property;
				}else{
					data.property = null;
				}

				let winM = new winboardModel();

				let winboardData = await winM.getOwnerWinboardById(data.winboard_id,"","public");

				if(winboardData && winboardData.data && winboardData.data.winboard){
					data.winboard =winboardData.data.winboard;
				}else{
					data.winboard = null;
				}

				let data_return = {booking : data}
				resObj.data = data_return;
				resObj.success = true;

			}	

		} catch (ex) {
			resObj.message = ex.message
			
		}
		return resObj;	
	}

	async whereBooking(body,session) {

		let $where = [];

		$where.push('w.id = wb.winboard_id');

		if(session.owner_id){
			$where.push('p.owner_id = '+session.owner_id);
		}else if(session.advertiser_id){
			$where.push('wb.advertiser_id = '+session.advertiser_id);
		}


		if(body.search && body.search != ""){
            $where.push('p.search LIKE "%'+body.city_id+'%"');
		}


		if(body.property_id && body.property_id != ""){
            $where.push('w.property_id ='+body.property_id);
		}

		if(body.status && body.status != ""){

			if(body.status == "active"){
				$where.push('wb.status IN ("paid","accepted")');
			}else{
				$where.push('wb.status = "'+body.status+'"');
			}
            
		}

		let $queryWhere = $where.join(" AND ");


		return $queryWhere;


	}
	
}

module.exports = bookingModel;