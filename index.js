require('dotenv').config();
const express = require('express');
const path = require('path');
const util = require('util');
const cookieParser = require('cookie-parser');
let dbConfig = require(`./config/connection.js`);
let useragent = require('express-useragent');
let cors = require('cors');
var jwt = require('jsonwebtoken');

let indexRoute = require('./routes/index.js');
let authRoute = require('./routes/account/auth.js');
let ownerRoute = require('./routes/owner/index.js');
let adminRoute = require('./routes/admin/index.js');
let advertiserRoute = require('./routes/advertiser/index.js');


var app = express();

app.use(express.static('public')); 
app.use('/uploads', express.static('uploads'));
app.use('/public/files', express.static('public/files'));

var http = require('http').createServer(app);

//dbConfig.setConnection();


app.use(cors())
app.options('*', cors())

app.use(express.urlencoded({
  	extended: false
}))
app.use(express.json())
app.use(cookieParser());
app.use(useragent.express());

app.use(function(req, res, next) {
  	res.header('server', '*');
 	next();
});
app.use("/", indexRoute);
app.use("/auth", authRoute);
app.use("/owner", ownerRoute);
app.use("/admin", adminRoute);
app.use("/advertiser", advertiserRoute);

/*app.use("/", indexRoute);
app.use("/auth", authRoute);*/

http.listen(process.env.PORT || 9001, function () {
	let _msgg = `Server listening on port: ${http.address().port} with config: ${process.env.NODE_ENV}`;
  	console.log(_msgg)
});



