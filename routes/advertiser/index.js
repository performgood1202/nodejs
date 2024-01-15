var express = require('express');
var router = express.Router();

/* Booking Routes*/

const booking = require('./booking.js');

router.use('/', booking);




module.exports = router;