drop table if exists system_authorities;
create table system_authorities(
	id varchar(32) not null ,

	id varchar(50),

	authority_type varchar(10),

	authority_code varchar(50),

	authority_name varchar(50),

	resource varchar(50),

	sort_index double(50),
	unique(authority_code)
) engine=InnoDB default charset=utf8;
