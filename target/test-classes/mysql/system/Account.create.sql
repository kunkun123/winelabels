drop table if exists system_accounts;
create table system_accounts(
	id varchar(32) not null ,

	real_name varchar(10),

	principal varchar(50),

	gender varchar(50),

	credential varchar(50),

	locked int(50),

	salt varchar(50),

	mobile_phone varchar(50),

	tel_phone varchar(50),

	qq varchar(50),

	email varchar(50),

	create_time datetime(50),
	unique(principal)
) engine=InnoDB default charset=utf8;
