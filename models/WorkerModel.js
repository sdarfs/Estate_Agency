const db = require('../config/db')
const WorkerQueries = require("../queries/WorkerQueries");

class WorkerModel {
	static async getWorkersByDepartmentId(id) {
		return await db.query(WorkerQueries.getWorkersByDepartmentId(id))
	}

	static async getOneByEmail(email) {
		return await db.query(WorkerQueries.getWorkerByEmail(email))
	}

	static async create(data) {
		return await db.query(WorkerQueries.create("surname", "name", "second_name", "department_id", "password", "email"))
	}
}

module.exports = WorkerModel