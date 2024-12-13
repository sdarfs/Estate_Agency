class HouseQueries {
	static getOneById(id) {
		return 'select "estate_object".address, "estate_object".object_id, "estate_object"."cost", "estate_object".description, "estate_object"."rooms_number", "estate_object".area, "district"."name" as "districtName", "city"."name" as "cityName", "estate_puprose"."name" as "housePurposeName", "estate_type"."name" as "houseTypeName" from "estate_object"' +
			'left join "district" ON "district".district_id = "estate_object"."district_id"' +
			'left join "city" ON "city".city_id = "district"."city_id"' +
			'left join "estate_puprose" ON "estate_puprose".estate_purpose_id = "estate_object"."estate_purpose_id"' +
			'left join "estate_type" ON "estate_type".estate_type_id = "estate_object"."estate_type_id"' +
			'where "estate_object".object_id = ${id}';
	}

	static getAll() {
		return 'select "estate_object".address, "estate_object".object_id, "district"."name" as "districtName", "city"."name" as "cityName" from "estate_object"' +
			'left join "district" ON "district".district_id = "estate_object"."district_id"' +
			'left join "city" ON "city".city_id = "district"."city_id"'
	}

	static postNew(address, cost, desc, roomCount, area, houseTypeId, housePurposeId, districtId, cityId) {
		return 'insert into "estate_object" ("address", "cost", "description", "rooms_number", "area",  "district_id","city_id")\n' +
			`values ('${address}', ${cost}, '${desc}', ${roomCount}, ${area}, ${districtId}, ${cityId})`
	}
}

module.exports = HouseQueries