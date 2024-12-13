class ImageQueries {
	static create(name, houseId) {
		return `insert into "Image" ("name", "object_id")
		values ('${name}', ${houseId})`
	}
}

module.exports = ImageQueries