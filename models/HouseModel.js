const db = require('../config/db')
const HouseQueries = require("../queries/HouseQueries");

class HouseModel {
	static async getHouseById(id) {
		return await db.query(HouseQueries.getOneById(id))
	}

	static async getAll() {
		return await db.query(HouseQueries.getAll())
	}

	static async postHouse(data) {
		return await db.query(HouseQueries.postNew(data.address, data.cost, data.description, data.rooms_number, data.area, data.estate_type_id, data.estate_purpose_id, data.district_id,data.city_id))
	}
}

module.exports = HouseModel