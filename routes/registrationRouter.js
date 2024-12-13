const express = require("express");
const registrationRouter = express.Router();
const RegistrationController = require("../controllers/RegistrationController");
const isAuth = require("../middlewares/isAuth");
const isWorker = require("../middlewares/isWorker");

registrationRouter.get('/', RegistrationController.getRegistrationPage)

registrationRouter.post('/', RegistrationController.registerClient)

registrationRouter.get('/worker', isAuth, isWorker, RegistrationController.getRegistrationWorkerPage)

registrationRouter.post('/worker', isAuth, isWorker, RegistrationController.registerWorker)

module.exports = registrationRouter;