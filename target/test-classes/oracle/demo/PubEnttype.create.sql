drop table if exists PUB_ENTTYPE;
create table PUB_ENTTYPE(
	ID NUMBER(22) not null ,

	CREATOR NUMBER(22),

	PARENTENTTYPE NUMBER(22),

	ENTTYPENAME VARCHAR2(30),

	ENTTYPENUM VARCHAR2(30),

	GROUPID NUMBER(22),

	SOURCEID VARCHAR2(30)
);
