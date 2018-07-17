drop table if exists system_resources;
create table system_resources(
	id varchar(32) not null ,

	id varchar(50),

	source_name varchar(50),

	resource_type varchar(50),

	is_platform int(50),

	parent_id varchar(50),

	resource_seq varchar(500),

	uri varchar(50),

	icon_cls varchar(50),

	sort_index double(50),

	available int(50),
	unique(uri)
) engine=InnoDB default charset=utf8;
