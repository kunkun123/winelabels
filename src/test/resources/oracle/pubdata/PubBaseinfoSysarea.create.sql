drop table if exists PUB_BASEINFO_SYSAREA;
create table PUB_BASEINFO_SYSAREA(
	ID NUMBER(22) not null ,

	AREALEVEL VARCHAR2(30),

	AREANAME VARCHAR2(300),

	PARENTAREA NUMBER(22),

	REMARK CLOB(4000),

	AREANUM VARCHAR2(30),

	AREALEVELNAME VARCHAR2(30),

	SOURCEID VARCHAR2(60)
);
