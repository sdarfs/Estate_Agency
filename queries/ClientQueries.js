class ClientQueries {
	static getClientByEmail(email) {
		return 'select * from "Client"\n' +
			`\t\twhere "email" = '${email}'`
	}

	static create(surname, name, secondName, phoneNumber, email, password) {
		return `insert into "Client" ("surname", "name", "secondName", "phoneNumber", "email", "password")
						values ('${surname}', '${name}', '${secondName}', '${phoneNumber}', '${email}', '${password}')`
	}
}

module.exports = ClientQueries