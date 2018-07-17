drop table if exists system_demos;
create table system_demos(
	id varchar(32) not null ,

	name varchar(50),

	gender varchar(50)
) engine=InnoDB default charset=utf8;
