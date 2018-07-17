-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100000','系统管理','MENU',true,'','','/system','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('101500','机构','MENULINK',true,'100000','','/views/system/organization/organization.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('101500','SYSTEM','GECKO_SYSTEM_SYSTEM_ORGANIZATIONS_QUERY','机构查询','101500','1.0'),
  ('101501','SYSTEM','GECKO_SYSTEM_SYSTEM_ORGANIZATIONS_VIEW','机构查看','101500','2.0'),
  ('101502','SYSTEM','GECKO_SYSTEM_SYSTEM_ORGANIZATIONS_NEW','机构新建','101500','3.0'),
  ('101503','SYSTEM','GECKO_SYSTEM_SYSTEM_ORGANIZATIONS_EDIT','机构编辑','101500','4.0'),
  ('101504','SYSTEM','GECKO_SYSTEM_SYSTEM_ORGANIZATIONS_DELETE','机构删除','101500','5.0'),
  ('101505','SYSTEM','GECKO_SYSTEM_SYSTEM_ORGANIZATIONS_EXPORT','机构导出','101500','6.0'),
