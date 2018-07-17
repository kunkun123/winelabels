drop table if exists PUB_BASEINFO_SYSUNIT;
create table PUB_BASEINFO_SYSUNIT(
	ID NUMBER(22) not null ,

	SOURCEID VARCHAR2(60),

	ISCITYAREA NUMBER(22),

	UNITLEVELNAME VARCHAR2(30),

	UNITLEVEL NUMBER(22),

	UNITNAME VARCHAR2(300),

	UNITFULLNAME VARCHAR2(300),

	CITYNAME VARCHAR2(60),

	PARENTUNIT NUMBER(22),

	UNITNUM VARCHAR2(60)
);