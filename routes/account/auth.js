var express = require('express');
var router = express.Router();
const middleware = require('../middleware');

let authController = require('../../controllers/authController.js');
let messageController = require('../../controllers/messageController.js');


router.post("/login", async (req, res) => {
	try {
		let result = await authController.login(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.post("/register", async (req, res) => {
	try {
		let result = await authController.register(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.post("/ownerRegister", async (req, res) => {
	try {
		let result = await authController.ownerRegister(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.post("/advertiserRegister", async (req, res) => {
	try {
		let result = await authController.advertiserRegister(req.body, res);
	} catch(err) {
		console.log(err);
	}
});


router.get("/info", middleware.authenticate,  async (req, res) => {
	try {
		let result = await authController.info(req.session, res);
	} catch(err) {
		console.log(err);
	}
});

router.post("/forgotPassword", async (req, res) => {
	try {
		let result = await authController.forgotPassword(req.body, res);
	} catch(err) {
		console.log(err);
	}
});
router.post("/ResetPassword", async (req, res) => {
	try {
		let result = await authController.ResetPassword(req.body, res);
	} catch(err) {
		console.log(err);
	}
});


router.post("/updateProfile",middleware.authenticate, async (req, res) => {
	try {
		let result = await authController.updateProfile(req.session, req.body, res);
	} catch(err) {
		console.log(err);
	}
});

router.post("/startMessage",middleware.authenticate, async (req, res) => {
	try {
		let result = await messageController.startMessage(req.session, req.body, res);
	} catch(err) {
		console.log(err);
	}
});

router.post("/sendMessage",middleware.authenticate, async (req, res) => {
	try {
		let result = await messageController.sendMessage(req.session, req.body, res);
	} catch(err) {
		console.log(err);
	}
});

router.get("/getMessages",middleware.authenticate, async (req, res) => {
	try {
		let result = await messageController.getMessages(req.session, req.query, res);
	} catch(err) {
		console.log(err);
	}
});
router.get("/getMessageById/:message_id",middleware.authenticate, async (req, res) => {
	try {
		let result = await messageController.getMessageById(req.session, req.params.message_id, res);
	} catch(err) {
		console.log(err);
	}
});


module.exports = router;