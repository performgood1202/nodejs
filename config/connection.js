const mysql = require('mysql'); // Node Tool for MongoDB


let db = process.env;
let databaseName = db.DB_DATABASE; // Database name
let host = db.DB_HOST;
let user = db.DB_USERNAME;
let password = db.DB_PASSWORD;

var connection = mysql.createPool({
	    connectionLimit: 5,
	    host: host,
	    user: user,
	    password: password,
	    database: databaseName,
	    timezone: 'Z',
	    
	});

	connection.getConnection(function(err, connection) {
	  if (err) throw err;
	  console.log('Connected to ' + databaseName);
	});

module.exports = connection