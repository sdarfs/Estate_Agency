const db = require('../config/db')
const DistrictQueries = require("../queries/DistrictQueries");

class DistrictModel {
	static async getAllDistricts(city_id) {
		return db.query(DistrictQueries.getAll(city_id))
	}
}

module.exports = DistrictModel