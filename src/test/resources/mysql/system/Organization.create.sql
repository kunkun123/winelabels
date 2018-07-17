drop table if exists system_organizations;
create table system_organizations(
	id varchar(32) not null ,

	org_name varchar(50),

	org_code varchar(50),

	org_category varchar(50),

	parent_org varchar(50),

	org_seq varchar(500)
) engine=InnoDB default charset=utf8;
