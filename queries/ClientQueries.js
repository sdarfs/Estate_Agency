class ClientQueries {
	static getClientByEmail(email) {
		return 'select * from "client"\n' +
			`\t\twhere "email" = '${email}'`
	}

	static create(surname, name, secondName, phoneNumber, email, password) {
		return `insert into "client" ("surname", "name", "second_name", "phone_number", "email", "password")
						values ('${surname}', '${name}', '${secondName}', '${phoneNumber}', '${email}', '${password}')`
	}
}

module.exports = ClientQueries