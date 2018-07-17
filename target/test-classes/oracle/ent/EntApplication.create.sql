drop table if exists ENT_APPLICATION;
create table ENT_APPLICATION(
	ID VARCHAR2(10) not null ,

	LASTUPDATETIME DATE(7),

	TEMP4 VARCHAR2(200),

	TEMP3 VARCHAR2(200),

	TEMP2 VARCHAR2(200),

	TEMP1 VARCHAR2(200),

	CREATOR VARCHAR2(10),

	ADUITTYPE VARCHAR2(2),

	PRODUCTTYPE VARCHAR2(2),

	REASON VARCHAR2(100),

	PRODUCTNUMBER VARCHAR2(10),

	AUDITDATE DATE(7),

	AUDITOR VARCHAR2(10),

	APPLICANDATE DATE(7),

	APPLICANT VARCHAR2(10),

	AUDITINGSTATUS VARCHAR2(2)
);