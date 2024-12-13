class WorkerQueries {
	static getWorkersByDepartmentId(id) {
		return 'select * from "worker"\n' +
			`\t\twhere "department_id" = ${id}`
	}

	static getWorkerByEmail(email) {
		return 'select * from "worker"\n' +
			`\t\twhere "email" = '${email}'`
	}

	static create(surname, name, secondName, departmentId, password, email) {
		return `insert into "worker" ("surname", "name", "second_name", "department_id", "password", "email")
						values ('${surname}', '${name}', '${secondName}', ${departmentId}, '${password}', '${email}')`
	}
}

module.exports = WorkerQueries