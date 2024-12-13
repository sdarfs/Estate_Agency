class DistrictQueries {
	static getAll(city_id) {
		return 'SELECT name FROM district WHERE ${city_id} =(select * from city c, district d where c.${city_id} = d.city_id )';
	}
}



module.exports = DistrictQueries