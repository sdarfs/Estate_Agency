class HouseQueries {
	static getOneById(id) {
		return 'select "House".address, "House".id, "House"."cost", "House".description, "House"."roomCount", "House".area, "District"."Name" as "districtName", "City"."name" as "cityName", "HousePurpose"."name" as "housePurposeName", "HouseType"."name" as "houseTypeName" from "House"\n' +
			'left join "District" ON "District".id = "House"."DistrictId"\n' +
			'left join "City" ON "City".id = "District"."CityId"\n' +
			'left join "HousePurpose" ON "HousePurpose".id = "House"."HousePurposeId"\n' +
			'left join "HouseType" ON "HouseType".id = "House"."HouseTypeId"\n' +
			`where "House".id = ${id}`
	}

	static getAll() {
		return 'select "House".address, "House".id, "District"."Name" as "districtName", "City"."name" as "cityName" from "House"\n' +
			'left join "District" ON "District".id = "House"."DistrictId"\n' +
			'left join "City" ON "City".id = "District"."CityId"'
	}

	static postNew(address, cost, desc, roomCount, area, houseTypeId, housePurposeId, districtId) {
		return 'insert into "House" ("address", "cost", "description", "roomCount", "area", "HouseTypeId", "HousePurposeId", "DistrictId")\n' +
			`values ('${address}', ${cost}, '${desc}', ${roomCount}, ${area}, ${houseTypeId}, ${housePurposeId}, ${districtId}) RETURNING "id"`
	}
}

module.exports = HouseQueries