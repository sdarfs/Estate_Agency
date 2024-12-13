class DocumentQueries {
	static getAllByRequestId(id) {
		return' select "doc_number", "create_date", "document_id" from "document"\n' +
			`\t\twhere "request_id" = ${id}`
	}

	static create(docNumber, type, request) {
		return `insert into "document" ("doc_number", "type_id", "request_id", "create_date")
		values('${docNumber}', '${type}', '${request}', '${new Date().toISOString()}') RETURNING id`
	}

	static getOneById(id) {
		return `select * from "document" where "document_id" = ${id}`
	}
}

module.exports = DocumentQueries