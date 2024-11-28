CREATE TABLE public."City" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
)WITH (autovacuum_enabled='true');

CREATE TABLE public."Client" (
    id integer NOT NULL,
    surname character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    "secondName" character varying(128),
    "phoneNumber" character varying(16),
    email character varying(64),
    password character varying(64)
) WITH (autovacuum_enabled='true');

CREATE TABLE public."Department" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
)WITH (autovacuum_enabled='true');

CREATE TABLE public."District" (
    id integer NOT NULL,
    "Name" character varying(255) NOT NULL,
    "CityId" integer
)WITH (autovacuum_enabled='true');

CREATE TABLE public."Document" (
    id integer NOT NULL,
    "docNumber" character varying(255) NOT NULL,
    "createStamp" timestamp without time zone NOT NULL,
    "finishStamp" timestamp without time zone,
    "RequestId" integer,
    "DocumentTypeId" integer
) WITH (autovacuum_enabled='true');

CREATE TABLE public."DocumentField" (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    label character varying(128)
)WITH (autovacuum_enabled='true');

CREATE TABLE public."DocumentType" (
    id integer NOT NULL,
    "updateStamp" timestamp without time zone NOT NULL,
    "fileName" character varying(255) NOT NULL
)WITH (autovacuum_enabled='true');

CREATE TABLE public."Document_Field" (
    "DocumentFieldId" integer NOT NULL,
    "DocumentId" integer NOT NULL,
    "Field" character varying(255) NOT NULL
) WITH (autovacuum_enabled='true');


CREATE TABLE public."House" (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    cost bigint,
    description text,
    "roomCount" integer,
    area integer NOT NULL,
    "HouseTypeId" integer,
    "HousePurposeId" integer,
    "DistrictId" integer
)WITH (autovacuum_enabled='true');

CREATE TABLE public."HousePurpose" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
)WITH (autovacuum_enabled='true');


CREATE TABLE public."HouseType" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
)WITH (autovacuum_enabled='true');


CREATE TABLE public."Image" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer,
    extension character varying(8),
    "HouseId" integer
)WITH (autovacuum_enabled='true');

CREATE TABLE public."Passport" (
    id integer NOT NULL,
    series character varying(4) NOT NULL,
    number character varying(6) NOT NULL,
    "issuedBy" text,
    "issuedDate" date,
    birthday date,
    "isArchive" boolean NOT NULL,
    "ClientId" integer,
    "WorkerId" integer
)WITH (autovacuum_enabled='true');


CREATE TABLE public."Position" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
)WITH (autovacuum_enabled='true');

CREATE TABLE public."Request" (
    id integer NOT NULL,
    number character varying(32) NOT NULL,
    "createStamp" timestamp without time zone NOT NULL,
    "closeStamp" timestamp without time zone,
    details text,
    "statusUpdateStamp" timestamp without time zone,
    "HouseId" integer,
    "RequestStateId" integer,
    "ClientId" integer,
    "RequestTypeId" integer,
    "DepartmentId" integer,
    "WorkerId" integer
)WITH (autovacuum_enabled='true');

CREATE TABLE public."RequestState" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
) WITH (autovacuum_enabled='true');


CREATE TABLE public."RequestType" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
)WITH (autovacuum_enabled='true');


CREATE TABLE public."Worker" (
    id integer NOT NULL,
    surname character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    "secondName" character varying(128),
    "DepartmentId" integer,
    "PositionId" integer,
    password character varying(64),
    email character varying(64)
)WITH (autovacuum_enabled='true');

