const bcrypt = require('bcrypt');
const connection = require('../config/dbManager.js');
const Dbprefix = process.env.DB_PREFIX;
const axios = require('axios');
const fs = require('fs');

const path = require('path');

const FormData = require('form-data');


class winboardModel {
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



	async getWinboards(body) {


		let $perPage = 10;

		let $page = (body.page && body.page > 0) ? parseInt(body.page) : 1;

		let $startAt = $perPage * ($page - 1);



		

		
		

		let query = `SELECT p.*,`;
		query += ` winboard.date_from, winboard.date_to,`;
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
			console.log(result)
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

	async whereWinboard(body) {

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
	async getOwnerWinboards(body, owner_id = null) {


		let $perPage = 10;

		let $page = (body.page && body.page > 0) ? parseInt(body.page) : 1;

		let $startAt = $perPage * ($page - 1);
		let ids;

		if(owner_id){

			ids = await this.getOwnerPropertiesIds(owner_id);

			if(ids && ids.length > 0){

			}else{
				ids = [348783748934];
			}
			ids = ids.join(",");
		}

		

		

		

		let query = `SELECT w.*,`;
		query += ` (SELECT wp.filename FROM ${Dbprefix+"wb_winboard_photo"} AS wp WHERE wp.winboard_id = w.id ORDER BY wp.ordering LIMIT 1) AS _image,`;
		query += ` (SELECT winboard_type.name FROM ${this.tbl_wb_winboard_type} AS winboard_type WHERE winboard_type.id = w.winboard_type_id LIMIT 1) AS _winboard_type_name,`;

		query += ` (SELECT p.title FROM ${this.tbl_wb_property} AS p WHERE p.id = w.property_id LIMIT 1) AS _property_name,`;

		let state_q = `(SELECT s.name FROM ${this.tbl_wb_state} AS s WHERE s.id = p.state_id LIMIT 1)`;

		let owner_q = ` (SELECT CONCAT(IFNULL(o.first_name, ''), ' ', IFNULL(o.surname, '')) FROM ${this.tbl_wb_owner} AS o WHERE o.id = p.owner_id LIMIT 1)`;

		let property_type_q = ` (SELECT pt.name FROM ${this.tbl_wb_property_type} AS pt WHERE pt.id = p.property_type_id LIMIT 1)`;
		let precinct_type_q = ` (SELECT pt.name FROM ${this.tbl_wb_precinct_type} AS pt WHERE pt.id = p.precinct_type_id LIMIT 1)`;
		let city_q = ` (SELECT c.name FROM ${this.tbl_wb_city} AS c WHERE c.id = p.city_id LIMIT 1)`;
		let street_q = ` (SELECT s.name FROM ${this.tbl_wb_street} AS s WHERE s.id = p.street_id LIMIT 1)`;
		let postcode_q = ` (SELECT s.name FROM ${this.tbl_wb_postcode} AS s WHERE s.id = p.postcode_id LIMIT 1) `;

		query += ` (SELECT JSON_ARRAYAGG( 
		                              JSON_OBJECT('title', p.title, 'verified', p.verified, 'state', ${state_q}, 'owner', ${owner_q}, 'property_type', ${property_type_q}, 'precinct_type', ${precinct_type_q}, 'city', ${city_q}, 'street', ${street_q}, 'postcode', ${postcode_q}  )
		                      ) FROM ${this.tbl_wb_property} AS p WHERE w.property_id = p.id ) as property_data`;


		query += ` FROM ${this.tbl_wb_winboard} AS w`;

		if(owner_id){
			query += ` WHERE w.property_id in (`+ids+`) `;
		}
		query += ` ORDER BY w.created DESC`;

		console.log(query)

		let dataCount = await connection.query(query).then(async result => {
			if(result && result.length > 0){
				return result.length;
			}else{
				return 0;
			}
			
		})
		.catch(error => {	
			console.log(error.message)
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
			message: "No Winboards found!"
		}


		if(data){

			let data_return = {winboards : data, total_records: total_records, total_page: $totalPages, current_page : $page, perPage : $perPage}
			resObj.data = data_return;
			resObj.success = true;
			resObj.message = "Winboard list";

		}
		
		return resObj;
	}
	async getOwnerId(winboard_id) {

		let query = `SELECT w.* `;

		query += ` FROM ${this.tbl_wb_winboard} AS w`;

		query += ` WHERE id = ${winboard_id}`;

		



		let data = await connection.query(query).then(async result => {
			if(result && result.length > 0){
				return result[0];
			}else{
				return null;
			}
			
		})
		.catch(error => {	
			return null;   
		});

		if(data && data.property_id){



			let query = `SELECT p.* `;

			query += ` FROM ${this.tbl_wb_property} AS p`;

			query += ` WHERE id = ${data.property_id}`;

			



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

		}

		return null;   

	}
	async getOwnerWinboardById(winboard_id, owner_id, user_type = "") {

		if(user_type && (user_type == "admin" || user_type == "public" || user_type == "advertiser" )){
            
           owner_id =  await this.getOwnerId(winboard_id);

		}


		let ids = await this.getOwnerPropertiesIds(owner_id);

		

		if(ids && ids.length > 0){

		}else{
			ids = [348783748934];
		}
		ids = ids.join(",");

		

		let query = `SELECT w.* `;

		query += ` FROM ${this.tbl_wb_winboard} AS w`;

		query += ` WHERE id = ${winboard_id} AND  w.property_id in (`+ids+`) `;

		



		let data = await connection.query(query).then(async result => {
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
			message: "No Winboards found!"
		}


		if(data){

			data.winboard_images = await this.getWinboardImages(winboard_id);
			data.winboard_selected_medias = await this.getSelectedMedias(winboard_id);
			
			let owner_properties = await this.getOwnerPropertiesArray(owner_id);
			let winboard_all_types = await this.getWinboardTypes();
			let winboard_all_medias = await this.getAllMedias();

			let data_return = {winboard : data, winboard_all_medias, winboard_all_types, owner_properties}
			resObj.data = data_return;
			resObj.success = true;
			resObj.message = "Winboard list";

		}
		
		return resObj;
	}
	
	async addWinboard(body,session) {

		

		let resObj = {
			data : null,
			success: false,
			message: ""
		}
		

		let { data } = body;

		let { name, description, winboard_type_id, property_id, published, width, height, depth, date_from, date_to, price, traffic, location, bump_in_out, media } = data;



		if(property_id){

			    let array_column = [];
				array_column["name"] = name;

				array_column["winboard_type_id"] = winboard_type_id;

				array_column["property_id"] = property_id;

				if(published){
					array_column["published"] = published;
				}
				if(width){
					array_column["width"] = width;
				}
				if(height){
					array_column["height"] = height;
				}
				if(depth){
					array_column["depth"] = depth;
				}
				if(date_from){
					array_column["date_from"] = date_from;
				}
				if(date_to){
					array_column["date_to"] = date_to;
				}
				if(price){
					array_column["price"] = price;
				}
				if(traffic){
					array_column["traffic"] = traffic;
				}
				if(location){
					array_column["location"] = location;
				}
				if(bump_in_out){
					array_column["bump_in_out"] = bump_in_out;
				}

				let cols = Object.keys(array_column);
				let values = Object.values(array_column);
				let values_question = [];

				cols.forEach(function(col){
				  values_question.push("?");
				});

				cols = cols.join(",");
				values_question = values_question.join(",");

				var sql2 = "INSERT INTO " + this.tbl_wb_winboard + " ("+cols+") VALUES ("+values_question+")";

				const result = await connection.query(sql2, values);

				if(result && result.insertId){

					if(data.media && data.media.length > 0){
						    let that = this;
						    await data.media.forEach(async function(media){

								    await that.saveMediaWinboard(media,result.insertId);

							});
					}

					await this.uploadPhotos(body.winboard_images,result.insertId);

					await this.deleteOldImages();
	                
	                resObj.success = 1;
					resObj.message = "Add winboard successfully!"
					return resObj;	


				}else{
					resObj.message = "Data not insert!"
					return resObj;	
				}



		}else{
			resObj.message = "property not exist!"

			return resObj;	

		}

		


	}
	async editWinboard(body,winboard_id,session,user_type = "") {

		

		let resObj = {
			data : null,
			success: false,
			message: ""
		}
		

		let { data } = body;

		let { name, description, winboard_type_id, property_id, published, width, height, depth, date_from, date_to, price, traffic, location, bump_in_out, media } = data;


		if(property_id){


			try {

				let array_column = [];
				array_column["name"] = name;

				array_column["winboard_type_id"] = winboard_type_id;

				array_column["property_id"] = property_id;

				if(published){
					array_column["published"] = published;
				}
				if(width){
					array_column["width"] = width;
				}
				if(height){
					array_column["height"] = height;
				}
				if(depth){
					array_column["depth"] = depth;
				}
				if(date_from){
					array_column["date_from"] = date_from;
				}
				if(date_to){
					array_column["date_to"] = date_to;
				}
				if(price){
					array_column["price"] = price;
				}
				if(traffic){
					array_column["traffic"] = traffic;
				}
				if(location){
					array_column["location"] = location;
				}
				if(bump_in_out){
					array_column["bump_in_out"] = bump_in_out;
				}

				let cols_values = [];

				for (const [key_col, value_col] of Object.entries(array_column)) {
                     cols_values.push(key_col+" = ?");
				}

				cols_values = cols_values.join(", ");

				let values = Object.values(array_column);


				var sql2 = "UPDATE " + this.tbl_wb_winboard + " set "+cols_values+" where id = "+winboard_id;

				const result = await connection.query(sql2, values);

				if(winboard_id){

					if(data.media && data.media.length > 0){
						    let that = this;

						    await that.deleteMediaWinboard(winboard_id);

						    await data.media.forEach(async function(media){

								    await that.saveMediaWinboard(media,winboard_id);

							});
					}

					await this.uploadPhotos(body.winboard_images,winboard_id);

					await this.deleteOldImages();
	                
	                resObj.success = 1;
					resObj.message = "Update winboard successfully!"
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
			resObj.message = "property not exist!"

			return resObj;	

		}


	}
	async saveMediaWinboard(mediaid,winboard_id) {

		try {

			if(mediaid != ""){

			    var sql2 = "INSERT INTO " + Dbprefix + "wb_winboard_media (media_id,winboard_id) VALUES (?,?)";

				const result = await connection.query(sql2, [mediaid,winboard_id]);

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
	async deleteMediaWinboard(winboard_id) {

		try {

			if(winboard_id != ""){

			    var sql2 = "DELETE FROM " + Dbprefix + "wb_winboard_media where winboard_id = ?";

				const result = await connection.query(sql2, [winboard_id]);

				if(result && result.affectedRows){
					return result.affectedRows;
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

	async uploadPhotos(images,winboard_id) {


		const formData = new FormData();

		if(images.length > 0){


			for (var keyy = 0; keyy < images.length; keyy++) {
				let path_stream = path.resolve()+"/"+images[keyy];
				let stream = await fs.createReadStream(path_stream);
				formData.append('photos[]', stream);
			}
			formData.append("winboard_id",winboard_id);

		    let api_url = process.env.SITE_URL+"?option=com_winboardapi&task=winboardapi.uploadWinboardPhoto";

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
	async getOwnerPropertiesIds(owner_id) {


		try {

			if(owner_id != ""){

			    var sql2 = "SELECT id FROM " + Dbprefix + "wb_property where owner_id = ?";

				const result = await connection.query(sql2, [owner_id]);

				if(result && result.length > 0){

					let ids = [];

					result.forEach(function(ids_v){

						ids.push(ids_v.id);

					});


					return ids;
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
	async getWinboardImages(winboard_id) {




		try {


			if(winboard_id != ""){

			    var sql2 = "SELECT * FROM " + Dbprefix + "wb_winboard_photo where winboard_id = ?";

				const result = await connection.query(sql2, [winboard_id]);

				if(result && result.length > 0){


					return result;

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
	async getSelectedMedias(winboard_id) {


		try {

			if(winboard_id != ""){

			    var sql2 = "SELECT * FROM " + Dbprefix + "wb_winboard_media where winboard_id = ?";

				const result = await connection.query(sql2, [winboard_id]);

				if(result && result.length > 0){


					return result;

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
	async getMediaTypes() {


		let resObj = {
			data : null,
			success: false,
			message: "Media types!"
		}


		try {
			resObj.data = await this.getAllMedias();
			resObj.success = true;
			return resObj;
		} catch (ex) {
			console.log(ex)
			return null;
		}
		
	}
	async getAllMedias() {


		try {
			    var sql2 = "SELECT * FROM " + Dbprefix + "wb_media";

				const result = await connection.query(sql2, []);

				if(result && result.length > 0){


					return result;

				}else{
					return null;
				}
		} catch (ex) {
			console.log(ex)
			return null;
		}
		
	}
	async getOwnerPropertiesArray(owner_id) {


		try {

			if(owner_id != ""){

			    var sql2 = "SELECT id,title FROM " + Dbprefix + "wb_property where owner_id = ?";

				const result = await connection.query(sql2, [owner_id]);

				if(result && result.length > 0){

					return result;

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
	async getWinboardTypes() {


		try {

			

			    var sql2 = "SELECT * FROM " + Dbprefix + "wb_winboard_type where published = ?";

				const result = await connection.query(sql2, [1]);

				if(result && result.length > 0){

					return result;

				}else{
					return null;
				}
		} catch (ex) {
			console.log(ex)
			return null;
		}
		
	}
}

module.exports = winboardModel;