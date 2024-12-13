/*
Created: 26.11.2024
Modified: 08.12.2024
Model: Lmodel
Database: PostgreSQL 12
*/

-- Create tables section -------------------------------------------------

-- Table request

CREATE TABLE "request"
(
    "request_id" Serial NOT NULL,
    "number" Character varying(32) NOT NULL,
    "create_time" Timestamp NOT NULL,
    "close_time" Timestamp,
    "details" Text,
    "status_update_time" Timestamp,
    "worker_id" Integer,
    "status_id" Integer,
    "client_id" Integer NOT NULL,
    "department_id" Integer,
    "object_id" Integer,
    "request_type_id" Integer,
    "district_id" Integer,
    "city_id" Integer
)
    WITH (
        autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship1" ON "request" ("worker_id")
;

CREATE INDEX "IX_Relationship3" ON "request" ("status_id")
;

CREATE INDEX "IX_Relationship22" ON "request" ("client_id")
;

CREATE INDEX "IX_Relationship25" ON "request" ("department_id")
;

CREATE INDEX "IX_Relationship32" ON "request" ("request_type_id")
;

CREATE INDEX "IX_Relationship28" ON "request" ("object_id","district_id","city_id")
;

ALTER TABLE "request" ADD CONSTRAINT "Unique_Identifier1" PRIMARY KEY ("request_id")
;

-- Table worker

CREATE TABLE "worker"
(
    "worker_id" Serial NOT NULL,
    "surname" Character varying(50) NOT NULL,
    "name" Character varying(50) NOT NULL,
    "second_name" Character varying(50),
    "department_id" Integer NOT NULL,
    "position_id" Integer
)
    WITH (
        autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship15" ON "worker" ("department_id")
;

CREATE INDEX "IX_Relationship24" ON "worker" ("position_id")
;

ALTER TABLE "worker" ADD CONSTRAINT "Unique_Identifier2" PRIMARY KEY ("worker_id")
;

-- Table request_type

CREATE TABLE "request_type"
(
    "request_type_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "request_type" ADD CONSTRAINT "Unique_Identifier3" PRIMARY KEY ("request_type_id")
;

-- Table request_status

CREATE TABLE "request_status"
(
    "status_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "request_status" ADD CONSTRAINT "Unique_Identifier4" PRIMARY KEY ("status_id")
;

-- Table passport

CREATE TABLE "passport"
(
    "passport_id" Serial NOT NULL,
    "series" Character varying(4) NOT NULL,
    "number" Character varying(6) NOT NULL,
    "issued_by" Text NOT NULL,
    "issued_date" Date NOT NULL,
    "date_of_birth" Date NOT NULL,
    "is_archive" Boolean NOT NULL,
    "client_id" Integer NOT NULL,
    "worker_id" Integer NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship5" ON "passport" ("client_id")
;

CREATE INDEX "IX_Relationship29" ON "passport" ("worker_id")
;

ALTER TABLE "passport" ADD CONSTRAINT "Unique_Identifier5" PRIMARY KEY ("passport_id")
;

-- Table client

CREATE TABLE "client"
(
    "client_id" Serial NOT NULL,
    "surname" Character varying(50) NOT NULL,
    "name" Character varying(50) NOT NULL,
    "second_name" Character varying(50),
    "phone_number" Character varying(16) NOT NULL,
    "email" Character varying(64) NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "client" ADD CONSTRAINT "Unique_Identifier6" PRIMARY KEY ("client_id")
;

-- Table document

CREATE TABLE "document"
(
    "document_id" Serial NOT NULL,
    "doc_number" Character varying(255) NOT NULL,
    "create_date" Timestamp NOT NULL,
    "finish_time" Timestamp,
    "doc_text" Text NOT NULL,
    "request_id" Integer NOT NULL,
    "type_id" Integer
)
    WITH (
        autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship23" ON "document" ("request_id")
;

CREATE INDEX "IX_Relationship34" ON "document" ("type_id")
;

ALTER TABLE "document" ADD CONSTRAINT "Unique_Identifier7" PRIMARY KEY ("document_id")
;

-- Table estate_object

CREATE TABLE "estate_object"
(
    "object_id" Serial NOT NULL,
    "address" Character varying(255) NOT NULL,
    "cost" Integer NOT NULL,
    "description" Text,
    "rooms_number" Integer NOT NULL,
    "area" Numeric(5,2) NOT NULL,
    "status" Character varying(255) NOT NULL DEFAULT 'false', -- Здесь 'available' - значение по умолчанию
    "estate_type_id" Integer,
    "estate_purpose_id" Integer,
    "district_id" Integer NOT NULL,
    "city_id" Integer NOT NULL
)

    WITH (
        autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship30" ON "estate_object" ("estate_type_id")
;

CREATE INDEX "IX_Relationship31" ON "estate_object" ("estate_purpose_id")
;

ALTER TABLE "estate_object" ADD CONSTRAINT "Unique_Identifier8" PRIMARY KEY ("object_id","district_id","city_id")
;

-- Table estate_type

CREATE TABLE "estate_type"
(
    "estate_type_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "estate_type" ADD CONSTRAINT "Unique_Identifier9" PRIMARY KEY ("estate_type_id")
;

-- Table district

CREATE TABLE "district"
(
    "district_id" Serial NOT NULL,
    "name" Character varying(30) NOT NULL,
    "city_id" Integer NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "district" ADD CONSTRAINT "Unique_Identifier10" PRIMARY KEY ("district_id","city_id")
;

-- Table city

CREATE TABLE "city"
(
    "city_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "city" ADD CONSTRAINT "Unique_Identifier11" PRIMARY KEY ("city_id")
;

-- Table estate_puprose

CREATE TABLE "estate_puprose"
(
    "estate_purpose_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "estate_puprose" ADD CONSTRAINT "Unique_Identifier12" PRIMARY KEY ("estate_purpose_id")
;

-- Table Image

CREATE TABLE "Image"
(
    "image_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL,
    "size" Double precision NOT NULL,
    "extention" Character varying(8) NOT NULL,
    "object_id" Integer NOT NULL,
    "district_id" Integer NOT NULL,
    "city_id" Integer NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "Image" ADD CONSTRAINT "Unique_Identifier13" PRIMARY KEY ("image_id","object_id","district_id","city_id")
;

-- Table position

CREATE TABLE "position"
(
    "position_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "position" ADD CONSTRAINT "Unique_Identifier15" PRIMARY KEY ("position_id")
;

-- Table department

CREATE TABLE "department"
(
    "department_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "department" ADD CONSTRAINT "Unique_Identifier16" PRIMARY KEY ("department_id")
;

-- Table doc_type

CREATE TABLE "doc_type"
(
    "type_id" Serial NOT NULL,
    "name" Character varying(255) NOT NULL,
    "update_time" Timestamp NOT NULL
)
    WITH (
        autovacuum_enabled=true)
;

ALTER TABLE "doc_type" ADD CONSTRAINT "Unique_Identifier17" PRIMARY KEY ("type_id")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "request"
    ADD CONSTRAINT "Relationship1"
        FOREIGN KEY ("worker_id")
            REFERENCES "worker" ("worker_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "request"
    ADD CONSTRAINT "Relationship3"
        FOREIGN KEY ("status_id")
            REFERENCES "request_status" ("status_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "passport"
    ADD CONSTRAINT "Relationship5"
        FOREIGN KEY ("client_id")
            REFERENCES "client" ("client_id")
            ON DELETE CASCADE
            ON UPDATE RESTRICT
;

ALTER TABLE "worker"
    ADD CONSTRAINT "Relationship15"
        FOREIGN KEY ("department_id")
            REFERENCES "department" ("department_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "request"
    ADD CONSTRAINT "Relationship22"
        FOREIGN KEY ("client_id")
            REFERENCES "client" ("client_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "document"
    ADD CONSTRAINT "Relationship23"
        FOREIGN KEY ("request_id")
            REFERENCES "request" ("request_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "worker"
    ADD CONSTRAINT "Relationship24"
        FOREIGN KEY ("position_id")
            REFERENCES "position" ("position_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "request"
    ADD CONSTRAINT "Relationship25"
        FOREIGN KEY ("department_id")
            REFERENCES "department" ("department_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "request"
    ADD CONSTRAINT "Relationship28"
        FOREIGN KEY ("object_id", "district_id", "city_id")
            REFERENCES "estate_object" ("object_id", "district_id", "city_id")
            ON DELETE CASCADE
            ON UPDATE RESTRICT
;

ALTER TABLE "passport"
    ADD CONSTRAINT "Relationship29"
        FOREIGN KEY ("worker_id")
            REFERENCES "worker" ("worker_id")
            ON DELETE CASCADE
            ON UPDATE RESTRICT
;

ALTER TABLE "estate_object"
    ADD CONSTRAINT "Relationship30"
        FOREIGN KEY ("estate_type_id")
            REFERENCES "estate_type" ("estate_type_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "estate_object"
    ADD CONSTRAINT "Relationship31"
        FOREIGN KEY ("estate_purpose_id")
            REFERENCES "estate_puprose" ("estate_purpose_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "request"
    ADD CONSTRAINT "Relationship32"
        FOREIGN KEY ("request_type_id")
            REFERENCES "request_type" ("request_type_id")
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
;

ALTER TABLE "estate_object"
    ADD CONSTRAINT "Relationship33"
        FOREIGN KEY ("district_id", "city_id")
            REFERENCES "district" ("district_id", "city_id")
            ON DELETE CASCADE
            ON UPDATE RESTRICT
;

ALTER TABLE "document"
    ADD CONSTRAINT "Relationship34"
        FOREIGN KEY ("type_id")
            REFERENCES "doc_type" ("type_id")
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
;

ALTER TABLE "district"
    ADD CONSTRAINT "Relationship35"
        FOREIGN KEY ("city_id")
            REFERENCES "city" ("city_id")
            ON DELETE CASCADE
            ON UPDATE RESTRICT
;

ALTER TABLE "Image"
    ADD CONSTRAINT "Relationship36"
        FOREIGN KEY ("object_id", "district_id", "city_id")
            REFERENCES "estate_object" ("object_id", "district_id", "city_id")
            ON DELETE CASCADE
            ON UPDATE RESTRICT
;

