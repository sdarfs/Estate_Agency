const db = require('../config/db')
const ClientQueries = require("../queries/ClientQueries");

class ClientModel {
	static async getOneByEmail(email) {
		return await db.query(ClientQueries.getClientByEmail(email))
	}

	static async create(data) {
		return await db.query(ClientQueries.create("surname", "name", "second_name", "phone_number", "password", "email"))
	}
}

module.exports = ClientModel