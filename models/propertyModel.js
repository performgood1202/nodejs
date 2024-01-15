const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');
const fs = require('fs');

const path = require('path');

const FormData = require('form-data');

const winboardModel = require('./winboardModel.js');


class propertyModel {
	constructor() {
		this.tbl_wb_property = Dbprefix+"wb_property";
		this.tbl_wb_winboard_type = Dbprefix+"wb_winboard_type";
		this.tbl_wb_property_photo = Dbprefix+"wb_property_photo";
		this.tbl_wb_state = Dbprefix+"wb_state";
		this.tbl_wb_owner = Dbprefix+"wb_owner";
		this.tbl_wb_property_type = Dbprefix+"wb_property_type";
		this.tbl_wb_precinct_type = Dbprefix+"wb_precinct_type";
		this.tbl_wb_city = Dbprefix+"wb_city";
		this.tbl_wb_street = Dbprefix+"wb_street";
		this.tbl_wb_postcode = Dbprefix+"wb_postcode";
		this.tbl_wb_winboard = Dbprefix+"wb_winboard";
	}



	async getProperties(body) {


		let $perPage = 10;

		let $page = (body.page && body.page > 0) ? parseInt(body.page) : 1;

		let $startAt = $perPage * ($page - 1);


		let query = `SELECT p.*,`;
		query += ` (SELECT pp.filename FROM ${this.tbl_wb_property_photo} AS pp WHERE pp.property_id = p.id AND pp.type = 'building' ORDER BY pp.ordering LIMIT 1) AS _image,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_state} AS s WHERE s.id = p.state_id LIMIT 1) AS _state_name,`;
		query += ` (SELECT CONCAT(IFNULL(o.first_name, ''), ' ', IFNULL(o.surname, '')) FROM ${this.tbl_wb_owner} AS o WHERE o.id = p.owner_id LIMIT 1) AS _owner_name,`;
		query += ` (SELECT pt.name FROM ${this.tbl_wb_property_type} AS pt WHERE pt.id = p.property_type_id LIMIT 1) AS _property_type_name,`;
		query += ` (SELECT pt.name FROM ${this.tbl_wb_precinct_type} AS pt WHERE pt.id = p.precinct_type_id LIMIT 1) AS _precinct_type_name,`;
		query += ` (SELECT c.name FROM ${this.tbl_wb_city} AS c WHERE c.id = p.city_id LIMIT 1) AS _city_name,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_street} AS s WHERE s.id = p.street_id LIMIT 1) AS _street_name,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_postcode} AS s WHERE s.id = p.postcode_id LIMIT 1) AS _postcode_name,`;

		let wid_query = "";


		if(body.winboard_type_id && body.winboard_type_id != ""){
			wid_query = "AND w.winboard_type_id = "+body.winboard_type_id;
		}


		query += ` (SELECT MIN(w.price) FROM ${this.tbl_wb_winboard} AS w WHERE w.published = 1 AND w.property_id = p.id ${wid_query}) AS _min_price`;
		query += ` FROM ${this.tbl_wb_property} AS p`;
		query += ` LEFT JOIN ${this.tbl_wb_winboard} AS winboard ON winboard.property_id = p.id`;

		let whereProperty = await this.whereProperty(body);

		query += ` WHERE `+whereProperty;
		query += ` GROUP BY winboard.property_id, p.id`;
		query += ` ORDER BY p.created DESC`;


		let dataCount = await connection.query(query).then(async result => {
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


		query += ` LIMIT ${$startAt}, ${$perPage}`;

		


		let data = await connection.query(query).then(async result => {
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

		let resObj = {
			data : null,
			success: false,
			message: "No properties found!"
		}


		if(data){

			let data_return = {properties : data, total_records: total_records, total_page: $totalPages, current_page : $page, perPage : $perPage}
			resObj.data = data_return;
			resObj.success = true;
			resObj.message = "Properties list";

		}
		
		return resObj;
	}

	async whereProperty(body) {

		let $where = [];

		$where.push('p.verified = 1');
		$where.push('winboard.published = 1');


		if(body.city_id && body.city_id != ""){
            $where.push('p.city_id ='+body.city_id);
		}

		if(body.title && body.title != ""){
            $where.push("p.title LIKE '%"+body.title+"%'");
		}

		if(body.winboard_type_id && body.winboard_type_id != ""){
            $where.push('winboard.winboard_type_id ='+body.winboard_type_id);
		}

		if(body.date_from && body.date_from != ""){
            $where.push( `winboard.date_from >= '${body.date_from}'`);
		}

		if(body.date_to && body.date_to != ""){
             $where.push( `winboard.date_to <= '${body.date_to}'`);
		}

		let $queryWhere = $where.join(" AND ");

		return $queryWhere;


	}
	async getAdminProperties(body) {


		let $perPage = 10;

		let $page = (body.page && body.page > 0) ? parseInt(body.page) : 1;

		let $startAt = $perPage * ($page - 1);



		
        let win_query = ` (SELECT CONCAT(property_type.name) FROM ${this.tbl_wb_winboard_type} AS property_type WHERE win.winboard_type_id = property_type.id) AS _namess)`;
		
		

		let query = `SELECT p.*,`;
		query += ` (SELECT pp.filename FROM ${this.tbl_wb_property_photo} AS pp WHERE pp.property_id = p.id AND pp.type = 'building' ORDER BY pp.ordering LIMIT 1) AS _image,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_state} AS s WHERE s.id = p.state_id LIMIT 1) AS _state_name,`;
		query += ` (SELECT CONCAT(IFNULL(o.first_name, ''), ' ', IFNULL(o.surname, '')) FROM ${this.tbl_wb_owner} AS o WHERE o.id = p.owner_id LIMIT 1) AS _owner_name,`;
		query += ` (SELECT pt.name FROM ${this.tbl_wb_property_type} AS pt WHERE pt.id = p.property_type_id LIMIT 1) AS _property_type_name,`;
		query += ` (SELECT pt.name FROM ${this.tbl_wb_precinct_type} AS pt WHERE pt.id = p.precinct_type_id LIMIT 1) AS _precinct_type_name,`;
		query += ` (SELECT c.name FROM ${this.tbl_wb_city} AS c WHERE c.id = p.city_id LIMIT 1) AS _city_name,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_street} AS s WHERE s.id = p.street_id LIMIT 1) AS _street_name,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_postcode} AS s WHERE s.id = p.postcode_id LIMIT 1) AS _postcode_name, `;
		query += ` (
		             select ( select JSON_ARRAYAGG(data)  from (select 
		               ( 
		                   SELECT 
		                      JSON_ARRAYAGG( 
		                              JSON_OBJECT('name', property_type.name, 'count', count(win.id))
		                      ) FROM ${this.tbl_wb_property_type} AS property_type 
		                   WHERE win.winboard_type_id = property_type.id
		               ) as data
		               from b5651_wb_winboard as win WHERE win.property_id = p.id GROUP BY win.winboard_type_id) as data )
		            ) as winboard_data`;

		query += ` FROM ${this.tbl_wb_property} AS p`;
		query += ` LEFT JOIN ${this.tbl_wb_winboard} AS winboard ON winboard.property_id = p.id`;

		let whereAdminProperty = await this.whereAdminProperty(body);

		if(whereAdminProperty){

			query += ` WHERE `+whereAdminProperty;
		}

		query += ` GROUP BY winboard.property_id, p.id`;
		query += ` ORDER BY p.created DESC`;



		let dataCount = await connection.query(query).then(async result => {
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


		query += ` LIMIT ${$startAt}, ${$perPage}`;

		


		let data = await connection.query(query).then(async result => {
			if(result && result.length > 0){
				return result;
			}else{
				return null;
			}
			
		})
		.catch(error => {	
			return null;   
		});

		let resObj = {
			data : null,
			success: false,
			message: "No properties found!"
		}


		if(data){

			let data_return = {properties : data, total_records: total_records, total_page: $totalPages, current_page : $page, perPage : $perPage}
			resObj.data = data_return;
			resObj.success = true;
			resObj.message = "Properties list";

		}
		
		return resObj;
	}

	async whereAdminProperty(body) {

		let $where = [];


		if(body.city_id && body.city_id != ""){
            $where.push('p.city_id ='+body.city_id);
		}
		if(body.verified && body.verified != ""){
            $where.push('p.verified ='+body.verified);
		}

		if(body.search && body.search != ""){
            $where.push("p.title LIKE '%"+body.search+"%'");
		}

		if(body.winboard_type_id && body.winboard_type_id != ""){
            $where.push('winboard.winboard_type_id ='+body.winboard_type_id);
		}

		if(body.date_from && body.date_from != ""){
            $where.push( `winboard.date_from >= '${body.date_from}'`);
		}

		if(body.date_to && body.date_to != ""){
             $where.push( `winboard.date_to <= '${body.date_to}'`);
		}

		let $queryWhere = $where.join(" AND ");

		return $queryWhere;


	}
	async getOwnerProperties(body,owner_id) {


		let $perPage = 10;

		let $page = (body.page && body.page > 0) ? parseInt(body.page) : 1;

		let $startAt = $perPage * ($page - 1);

		

		let query = `SELECT p.*,`;
		query += ` (SELECT pp.filename FROM ${this.tbl_wb_property_photo} AS pp WHERE pp.property_id = p.id AND pp.type = 'building' ORDER BY pp.ordering LIMIT 1) AS _image,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_state} AS s WHERE s.id = p.state_id LIMIT 1) AS _state_name,`;
		query += ` (SELECT CONCAT(IFNULL(o.first_name, ''), ' ', IFNULL(o.surname, '')) FROM ${this.tbl_wb_owner} AS o WHERE o.id = p.owner_id LIMIT 1) AS _owner_name,`;
		query += ` (SELECT pt.name FROM ${this.tbl_wb_property_type} AS pt WHERE pt.id = p.property_type_id LIMIT 1) AS _property_type_name,`;
		query += ` (SELECT pt.name FROM ${this.tbl_wb_precinct_type} AS pt WHERE pt.id = p.precinct_type_id LIMIT 1) AS _precinct_type_name,`;
		query += ` (SELECT c.name FROM ${this.tbl_wb_city} AS c WHERE c.id = p.city_id LIMIT 1) AS _city_name,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_street} AS s WHERE s.id = p.street_id LIMIT 1) AS _street_name,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_postcode} AS s WHERE s.id = p.postcode_id LIMIT 1) AS _postcode_name`;
		query += ` FROM ${this.tbl_wb_property} AS p`;
		query += ` where p.owner_id = ?`;

		
		let dataCount = await connection.query(query, [owner_id]).then(async result => {
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


		query += ` LIMIT ${$startAt}, ${$perPage}`;

		


		let data = await connection.query(query, [owner_id]).then(async result => {
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

		let resObj = {
			data : null,
			success: false,
			message: "No properties found!"
		}


		if(data){

			let data_return = {properties : data, total_records: total_records, total_page: $totalPages, current_page : $page, perPage : $perPage}
			resObj.data = data_return;
			resObj.success = true;
			resObj.message = "Properties list";

		}
		
		return resObj;
	}
	async getOwnerPropertyById(property_id,owner_id = "",user_type = "") {


		

		let query = `SELECT p.*,`;
		query += ` (SELECT pp.filename FROM ${this.tbl_wb_property_photo} AS pp WHERE pp.property_id = p.id AND pp.type = 'building' ORDER BY pp.ordering LIMIT 1) AS _image,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_state} AS s WHERE s.id = p.state_id LIMIT 1) AS _state_name,`;
		query += ` (SELECT CONCAT(IFNULL(o.first_name, ''), ' ', IFNULL(o.surname, '')) FROM ${this.tbl_wb_owner} AS o WHERE o.id = p.owner_id LIMIT 1) AS _owner_name,`;
		query += ` (SELECT pt.name FROM ${this.tbl_wb_property_type} AS pt WHERE pt.id = p.property_type_id LIMIT 1) AS _property_type_name,`;
		query += ` (SELECT pt.name FROM ${this.tbl_wb_precinct_type} AS pt WHERE pt.id = p.precinct_type_id LIMIT 1) AS _precinct_type_name,`;
		query += ` (SELECT c.name FROM ${this.tbl_wb_city} AS c WHERE c.id = p.city_id LIMIT 1) AS _city_name,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_street} AS s WHERE s.id = p.street_id LIMIT 1) AS _street_name,`;
		query += ` (SELECT s.name FROM ${this.tbl_wb_postcode} AS s WHERE s.id = p.postcode_id LIMIT 1) AS _postcode_name`;
		query += ` FROM ${this.tbl_wb_property} AS p`;
		query += ` where p.id = `+property_id; 

		if(owner_id){
			query += ` AND p.owner_id = `+owner_id;
		}

		if(user_type == "public"){
			query += ` AND verified = 1`; 
		}


		let data = await connection.query(query, []).then(async result => {
			
			if(result && result.length > 0){
				return result[0];
			}else{
				return null;
			}
			
		})
		.catch(error => {	
			return null;   
		});

		

		let resObj = {
			data : null,
			success: false,
			message: "No property found!"
		}


		if(data){
			let property_images = await this.getPropertyImages(property_id);
			let verification_images = await this.getVerificationImages(property_id);
			let winboards = await this.getWinboards(property_id,user_type);
		
			data.property_images = property_images;
			data.verification_images = verification_images;
			data.winboards = winboards;

			let data_return = {property : data};

			resObj.data = data_return;
			resObj.success = true;
			resObj.message = "Properties list";

		}
		
		return resObj;
	}
	async getCity(name,state_id = "") {



		
		try {
			if(name != ""){
				let sql = 'SELECT * FROM ' + Dbprefix + 'wb_city where name = ?';

				const result = await connection.query(sql, [name]);

				if(result && result.length > 0){

					let data = result[0];

					return data.id;

				}else{

					var sql2 = "INSERT INTO " + Dbprefix + "wb_city (state_id, name) VALUES (?, ?)";

					const result = await connection.query(sql2, [state_id,name]);

					if(result && result.insertId){
						return result.insertId;
					}else{
						return null;
					}

				}
			}else{
				return null;
			}
		} catch (ex) {
			return null;
		}

	}
	async getStreet(name) {

		
		try {
			if(name != ""){
				let sql = 'SELECT * FROM ' + Dbprefix + 'wb_street where name = ?';
				const result = await connection.query(sql, [name]);
				if(result && result.length > 0){

					let data = result[0];

					return data.id;

				}else{


					var sql2 = "INSERT INTO " + Dbprefix + "wb_street (name) VALUES (?)";

					const result = await connection.query(sql2, [name]);

					if(result && result.insertId){
						return result.insertId;
					}else{
						return null;
					}

				}
			}else{
				return null;
			}	
		} catch (ex) {
			return null;
		}

	}
	async getPostcode(name,city_id) {

		
		try {

			if(name != ""){

			    let sql = 'SELECT * FROM ' + Dbprefix + 'wb_postcode where name = ?';
				const result = await connection.query(sql, [name]);
				if(result && result.length > 0){

					let data = result[0];

					return data.id;

				}else{


					var sql2 = "INSERT INTO " + Dbprefix + "wb_postcode (city_id,name) VALUES (?,?)";

					const result = await connection.query(sql2, [city_id,name]);

					if(result && result.insertId){
						return result.insertId;
					}else{
						return null;
					}

				}
			}else{
				return null;
			}
		} catch (ex) {
			return null;
		}

	}
	async addProperty(body,session) {

		

		let resObj = {
			data : null,
			success: false,
			message: ""
		}
		

		let { data } = body;

		let { title, description, state, street_number, property_type_id, precinct_type_id, latitude, longitude, precinct } = data;

		let owner_id = session.owner_id;

		

		if(owner_id){

			let city_id  = await this.getCity(data.city,data.state);

			let street_id  = await this.getStreet(data.street);

			let postcode_id  = await this.getPostcode(data.postcode,city_id);

			try {

				let array_column = [];
				array_column["owner_id"] = owner_id;
				array_column["property_type_id"] = property_type_id;
				array_column["precinct_type_id"] = property_type_id;

				if(street_number){
					array_column["street_number"] = street_number;
				}
				array_column["street_id"] = street_id;
				array_column["postcode_id"] = postcode_id;
				array_column["city_id"] = city_id;
				array_column["state_id"] = state;
				if(latitude){
					array_column["latitude"] = latitude;
				}
				if(longitude){
					array_column["longitude"] = longitude;
				}
				if(precinct){
					array_column["precinct"] = precinct;
				}
				if(description){
					array_column["description"] = description;
				}
				array_column["title"] = title;

				let cols = Object.keys(array_column);
				let values = Object.values(array_column);
				let values_question = [];

				cols.forEach(function(col){
				  values_question.push("?");
				});

				cols = cols.join(",");
				values_question = values_question.join(",");


		        var sql2 = "INSERT INTO " + this.tbl_wb_property + " ("+cols+") VALUES ("+values_question+")";

				const result = await connection.query(sql2, values);

				if(result && result.insertId){

					if(data.new_winboards && data.new_winboards.length > 0){
						    let that = this;
						    await data.new_winboards.forEach(async function(winboard){

								    await that.savePropertyWinboard(winboard,result.insertId);

							});
					}

					await this.uploadPhotos(body.building_photo,"building",result.insertId);
					await this.uploadPhotos(body.precinct_photo,"precinct",result.insertId);
					await this.uploadVarification(body.upload_verification,result.insertId);

					await this.deleteOldImages();
	                
	                resObj.success = 1;
					resObj.message = "Add property successfully!"
					return resObj;	


				}else{
					resObj.message = "Data not insert!"
					return resObj;	
				}

			} catch (ex) {

				return resObj;		
			}
		}else{
			resObj.message = "Owner not exist!"

			return resObj;	

		}	


	}
	async getOwnerId(property_id) {

		
		let query = `SELECT p.* `;

		query += ` FROM ${this.tbl_wb_property} AS p`;

		query += ` WHERE id = ${property_id}`;

		



		let data2 = await connection.query(query).then(async result => {
			if(result && result.length > 0){
				return result[0];
			}else{
				return null;
			}
			
		})
		.catch(error => {	
			return null;   
		});

		if(data2 && data2.owner_id){
			return data2.owner_id;
		}
		return null;   

	}
	async editProperty(body,property_id,session, user_type = "") {

		

		let resObj = {
			data : null,
			success: false,
			message: ""
		}


		let { data } = body;

		let { title, description, state, street_number, property_type_id, precinct_type_id, latitude, longitude, precinct } = data;


		let owner_id = session.owner_id;

		if(user_type == "admin"){
			
            owner_id =  await this.getOwnerId(property_id);

		}

		


		if(owner_id){

			let city_id  = await this.getCity(data.city,data.state);

			let street_id  = await this.getStreet(data.street);

			let postcode_id  = await this.getPostcode(data.postcode,city_id);

			try {

				let array_column = [];
				array_column["owner_id"] = owner_id;
				array_column["property_type_id"] = property_type_id;
				array_column["precinct_type_id"] = property_type_id;

				if(street_number){
					array_column["street_number"] = street_number;
				}
				array_column["street_id"] = street_id;
				array_column["postcode_id"] = postcode_id;
				array_column["city_id"] = city_id;
				array_column["state_id"] = state;
				if(latitude){
					array_column["latitude"] = latitude;
				}
				if(longitude){
					array_column["longitude"] = longitude;
				}
				if(precinct){
					array_column["precinct"] = precinct;
				}
				if(description){
					array_column["description"] = description;
				}
				array_column["title"] = title;

				let cols_values = [];

				for (const [key_col, value_col] of Object.entries(array_column)) {
                     cols_values.push(key_col+" = ?");
				}

				cols_values = cols_values.join(", ");

				let values = Object.values(array_column);


				var sql2 = "UPDATE " + this.tbl_wb_property + " set "+cols_values+" where id = "+property_id;

				const result = await connection.query(sql2, values);

				if(property_id){

					if(data.new_winboards && data.new_winboards.length > 0){
						    let that = this;
						    await data.new_winboards.forEach(async function(winboard){

								    await that.savePropertyWinboard(winboard,property_id);

							});
					}

					await this.uploadPhotos(body.building_photo,"building",property_id);
					await this.uploadPhotos(body.precinct_photo,"precinct",property_id);
					await this.uploadVarification(body.upload_verification,property_id);

					await this.deleteOldImages();
	                
	                resObj.success = 1;
					resObj.message = "Update property successfully!"
					return resObj;	


				}else{
					resObj.message = "Data not insert!"
					return resObj;	
				}


		        /*var sql2 = "INSERT INTO " + this.tbl_wb_property + " ("+cols+") VALUES ("+values_question+")";

				const result = await connection.query(sql2, values);

				if(result && result.insertId){

					if(data.new_winboards && data.new_winboards.length > 0){
						    let that = this;
						    await data.new_winboards.forEach(async function(winboard){

								    await that.savePropertyWinboard(winboard,result.insertId);

							});
					}

					await this.uploadPhotos(body.building_photo,"building",result.insertId);
					await this.uploadPhotos(body.precinct_photo,"precinct",result.insertId);
					await this.uploadVarification(body.upload_verification,result.insertId);

					await this.deleteOldImages();
	                
	                resObj.success = 1;
					resObj.message = "Add property successfully!"
					return resObj;	


				}else{
					resObj.message = "Data not insert!"
					return resObj;	
				}*/

			} catch (ex) {
				resObj.message = ex.message;
				return resObj;		
			}
		}else{
			resObj.message = "Owner not exist!"

			return resObj;	

		}	


	}


	async savePropertyWinboard(winboard,property_id) {

		try {

			if(winboard.winboard_type_id != ""){

			    var sql2 = "INSERT INTO " + Dbprefix + "wb_winboard (winboard_type_id,property_id,width,height,depth) VALUES (?,?,?,?,?)";

				const result = await connection.query(sql2, [winboard.winboard_type_id,property_id,winboard.width,winboard.height,winboard.depth]);

				if(result && result.insertId){
					return result.insertId;
				}else{
					return null;
				}
			}else{
				return null;
			}
		} catch (ex) {
			console.log(ex)
			return null;
		}

	}
	async uploadPhotos(images,type,property_id) {


		const formData = new FormData();

		if(images.length > 0){

			for (var keyy = 0; keyy < images.length; keyy++) {
				let path_stream = path.resolve()+"/"+images[keyy];
				let stream = await fs.createReadStream(path_stream);
				formData.append('photos[]', stream);
			}
			formData.append("type",type);
			formData.append("property_id",property_id);

		    let api_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.uploadPhoto";

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
	}
	async uploadVarification(images,property_id) {


		const formData = new FormData();

		if(images.length > 0){

			for (var keyy = 0; keyy < images.length; keyy++) {
				let path_stream = path.resolve()+"/"+images[keyy];
				let stream = await fs.createReadStream(path_stream);
				formData.append('photos[]', stream);
			}
			formData.append("property_id",property_id);

		    let api_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.uploadVarification";

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

	async verifyPropertyStatus(property_id) {
		let data_return = {success:false,data:null,message:""};
		try {
			if(property_id != ""){
				var checkDataExists = "SELECT * from " + this.tbl_wb_property + " where id = ?";
				const resultData = await connection.query(checkDataExists, [property_id]);
				if(resultData && resultData.length > 0){
					var verifiedStatus = resultData[0].verified;
					var updateVStatus = 1;
					if(verifiedStatus == 1){
						updateVStatus = 0;
					}
					var updateStatus = "UPDATE "+ this.tbl_wb_property +" set verified = ? where id = ?";
					const resData = await connection.query(updateStatus, [updateVStatus, property_id]);
					if(resData && resData.affectedRows){
						data_return.success = true;
				        data_return.message = "Successfully verify status updated!";
					}else{
				       data_return.message = "Verify status not updated!";
					}
				}else{
			       data_return.message = "Record not found!";
				}
			}else{
				data_return.message = "Record not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async verifyPropertyImage(property_id,id) {
		let data_return = {success:false,data:null,message:""};
		try {
			if(property_id && id){
				var checkDataExists = "SELECT * from " + Dbprefix + "wb_property_verification where property_id = ? AND id = ?";
				const resultData = await connection.query(checkDataExists, [property_id,id]);
				if(resultData && resultData.length > 0){
					var verifiedStatus = resultData[0].verified;
					var updateVStatus = 1;
					if(verifiedStatus == 1){
						updateVStatus = 0;
					}

					var updateStatus = "UPDATE "+ Dbprefix + "wb_property_verification set verified = ? where id = ?";
					const resData = await connection.query(updateStatus, [updateVStatus, id]);
					if(resData && resData.affectedRows){
						data_return.success = true;
				        data_return.message = "Successfully verify status updated!";
					}else{
				       data_return.message = "Verify status not updated!";
					}

					await this.checkPropertyVerfication(property_id);
				}else{
			       data_return.message = "Record not found!";
				}
			}else{
				data_return.message = "Record not exist!";
			}
			return data_return;
		} catch (ex) {
			data_return.message = ex.message;
			return data_return;
		}
	}
	async checkPropertyVerfication(property_id) {



		try {
			if(property_id){
				var checkDataExists = "SELECT * from " + Dbprefix + "wb_property_verification where property_id = ?";
				const resultData = await connection.query(checkDataExists, [property_id]);
				if(resultData && resultData.length > 0){

					let  verifyPr = false;

					Object.values(resultData).forEach(res => {
					    if(res.verified == 1){
                          verifyPr = true;
                        }
					});

					var updateStatus = "UPDATE "+ this.tbl_wb_property +" set verified = ? where id = ?";
					const resData = await connection.query(updateStatus, [verifyPr, property_id]);
					return true;
				}else{
			       data_return.message = "Record not found!";
				}
			}
			return null;
		} catch (ex) {
			return null;
		}

	}
	async getPropertyImages(property_id) {
		try {
			if(property_id != ""){
				var sql = "SELECT * from " + Dbprefix + "wb_property_photo where property_id = ?";
				const resultData = await connection.query(sql, [property_id]);
				if(resultData && resultData.length > 0){
					return resultData;
				}else{
			      return null;
				}
			}else{
				return null;
			}
			return data_return;
		} catch (ex) {
			return null;
		}
	}

	async getVerificationImages(property_id) {
		try {
			if(property_id != ""){
				var sql = "SELECT * from " + Dbprefix + "wb_property_verification where property_id = ?";
				const resultData = await connection.query(sql, [property_id]);
				if(resultData && resultData.length > 0){
					return resultData;
				}else{
			       return null;
				}
			}else{
				return null;
			}
			return data_return;
		} catch (ex) {
			return null;
		}
	}
	async getWinboards(property_id,user_type = "") {
		try {
			if(property_id != ""){
				var sql = "SELECT * from " + Dbprefix + "wb_winboard where property_id = ?";
				const resultData = await connection.query(sql, [property_id]);
				if(resultData && resultData.length > 0){


					let resData = [];

					let winM = new winboardModel();

					for (const [key, res] of Object.entries(resultData)) {


					    if(res.published == 1){

                           var winboard_images = await winM.getWinboardImages(res.id);

                           if(winboard_images && winboard_images.length > 0){
                           	  res.winboard_image = winboard_images[0].filename;
                           }else{
                           	  res.winboard_image = null;
                           }

                           resData.push(res)
                        }
					}



					return resData;
				}else{
			       return null;
				}
			}else{
				return null;
			}
			return data_return;
		} catch (ex) {
			console.log(ex)
			return null;
		}
	}
	async getMediaType() {
		try {
			if(property_id != ""){
				var sql = "SELECT * from " + Dbprefix + "wb_winboard where property_id = ?";
				const resultData = await connection.query(sql, [property_id]);
				if(resultData && resultData.length > 0){
					return resultData;
				}else{
			       return null;
				}
			}else{
				return null;
			}
			return data_return;
		} catch (ex) {
			return null;
		}
	}


}

module.exports = propertyModel;