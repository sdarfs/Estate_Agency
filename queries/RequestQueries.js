class RequestQueries {
	static getAll() {
		return 'select "request".request_id, "request".number, public."request_type"."name" as "requestTypeName", public."request_status"."name" as "requestStateName" from "request"' +
			'left join "request_status" ON "request_status".status_id = "request"."status_id"' +
			'left join "request_type" ON "request_type".request_type_id = "request"."request_type_id"'
	}

	static getAllByWorkerId(id) {
		return 'select "request".request_id, "request".number, public."request_type"."name" as "requestTypeName", public."request_status"."name" as "requestStateName" from "request"' +
			'left join "request_status" ON "request_status".status_id = "request"."status_id"' +
			'left join "request_type" ON "request_type".request_type_id = "request"."request_type_id"' +
			`where "request"."worker_id" = ${id}`
	}

	static getAllByClientId(id) {
		return 'select "request".request_id, "request".number, public."request_type"."name" as "requestTypeName", public."request_status"."name" as "requestStateName" from "request"' +
			'left join "request_status" ON "request_status".status_id = "request"."status_id"' +
			'left join "request_type" ON "request_type".request_type_id = "request"."request_type_id"' +
			`where "request".client_id = ${id}`;
	}

	static getOneById(id) {
		return 'select "request".request_id,"request".number,"request".create_time,"request"."details",\n' +
			'"request"."close_time","department"."department_id" as "departmentId","department"."name" as "departmentName",\n' +
			'"worker"."surname" as "workerSurname","worker"."name" as "workerName", "client"."surname" as "clientSurname",\n' +
			'"client"."name" as "clientName","estate_object"."address" as "address", "district"."name" as "districtName",\n' +
			'"city"."name" as "cityName","request_status"."name" as "status", "estate_object".object_id as "houseId"\n' +
			'from "request"\n' +
			'left join "client" ON "client".client_id = "request"."client_id"\n' +
			'left join "department" ON "department".department_id = "request"."department_id"\n' +
			'left join "worker" ON "worker".worker_id = "request"."worker_id"\n' +
			'left JOIN "estate_object" ON "estate_object".object_id = "request"."object_id"\n' +
			'left join "district" ON "district".district_id = "estate_object"."district_id"\n' +
			'left join "city" ON "city".city_id = "district"."city_id"\n' +
			'left join "request_status" ON "request_status".status_id = "request"."status_id"\n' +
			`where "request".request_id = ${id}`
	}

	static getOneByNumber(number) {
		return 'select "request".request_id,"request".number,"request".create_time,"request"."details",\n' +
			'"request"."close_time","department"."department_id" as "departmentId","department"."name" as "departmentName",\n' +
			'"worker"."surname" as "workerSurname","worker"."name" as "workerName", "client"."surname" as "clientSurname",\n' +
			'"client"."name" as "clientName","estate_object"."address" as "address", "district"."name" as "districtName",\n' +
			'"city"."name" as "cityName","request_status"."name" as "status", "estate_object".object_id as "houseId"\n' +
			'from "request"\n' +
			'left join "client" ON "client".client_id = "request"."client_id"\n' +
			'left join "department" ON "department".department_id = "request"."department_id"\n' +
			'left join "worker" ON "worker".worker_id = "request"."worker_id"\n' +
			'left JOIN "estate_object" ON "estate_object".object_id = "request"."object_id"\n' +
			'left join "district" ON "district".district_id = "estate_object"."district_id"\n' +
			'left join "city" ON "city".city_id = "district"."city_id"\n' +
			'left join "request_status" ON "request_status".status_id = "request"."status_id"\n' +
			`where "request".number = ${number}`
	}

	static deleteById(id) {
		return 'delete from "request"\n' +
			`where "request_id" = ${id}`
	}

	static updateFinishById(id) {
		return 'update "request"\n' +
			'set "status_id" = 2\n' +
			`where "request_id" = ${id}`
	}

	static updateCloseById(id) {
		return 'update "request"\n' +
			'set "status_id" = 2\n' +
			`where "request_id" = ${id}`
	}

	static updateWorkerById(id, workerId) {
		return 'update "Request"\n' +
			`set "worker_id" = ${workerId}\n` +
			`where "request_id" = ${id}`
	}


	//values("InNumber", LOCALTIMESTAMP, "InDetails", "InStatusID",
	// "InClientID","InDepID","InObjID","InReqType");
	static postNew(number, details,InStatusId, clientId,inDepId,inObjID,requestTypeId) {
		return `CALL public."AddRequest"(
						\t'${number}', 
						\t'${details}', 
						\t1,
						\t${clientId}, 
						\t${inDepId},
						\t${inObjID},
						\t${requestTypeId}
						)`
	}
}

module.exports = RequestQueries