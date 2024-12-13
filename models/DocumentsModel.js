const db = require('../config/db')
const DocumentQueries = require("../queries/DocumentQueries");

class DocumentsModel {
	static async getAllByRequestId (id) {
		return await db.query(DocumentQueries.getAllByRequestId(id))
	}

	static async create(body) {
		return await db.query(DocumentQueries.create(body.doc_number, body.type_id, body.request_id))
	}

	static async getOneById(id) {
		return await db.query(DocumentQueries.getOneById(id));
	}
}

module.exports = DocumentsModel