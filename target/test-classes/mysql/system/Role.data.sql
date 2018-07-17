-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100000','系统管理','MENU',true,'','','/system','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('101900','角色','MENULINK',true,'100000','','/views/system/role/role.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('101900','SYSTEM','GECKO_SYSTEM_SYSTEM_ROLES_QUERY','角色查询','101900','1.0'),
  ('101901','SYSTEM','GECKO_SYSTEM_SYSTEM_ROLES_VIEW','角色查看','101900','2.0'),
  ('101902','SYSTEM','GECKO_SYSTEM_SYSTEM_ROLES_NEW','角色新建','101900','3.0'),
  ('101903','SYSTEM','GECKO_SYSTEM_SYSTEM_ROLES_EDIT','角色编辑','101900','4.0'),
  ('101904','SYSTEM','GECKO_SYSTEM_SYSTEM_ROLES_DELETE','角色删除','101900','5.0'),
  ('101905','SYSTEM','GECKO_SYSTEM_SYSTEM_ROLES_EXPORT','角色导出','101900','6.0'),
