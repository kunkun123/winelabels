drop table if exists MG_CAMERA;
create table MG_CAMERA(
	ID VARCHAR2(10) not null ,

	TEMP4 VARCHAR2(200),

	TEMP3 VARCHAR2(200),

	TEMP1 VARCHAR2(200),

	TEMP2 VARCHAR2(200),

	LASTUPDATETIME DATE(7),

	CAMERAIP VARCHAR2(30),

	SELLERID VARCHAR2(10),

	LINEID VARCHAR2(10),

	CREATOR VARCHAR2(10),

	STATUS VARCHAR2(10)
);