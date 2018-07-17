-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100000','系统管理','MENU',true,'','','/system','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100700','权限','MENULINK',true,'100000','','/views/system/authority/authority.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('100700','SYSTEM','GECKO_SYSTEM_SYSTEM_AUTHORITIES_QUERY','权限查询','100700','1.0'),
  ('100701','SYSTEM','GECKO_SYSTEM_SYSTEM_AUTHORITIES_VIEW','权限查看','100700','2.0'),
  ('100702','SYSTEM','GECKO_SYSTEM_SYSTEM_AUTHORITIES_NEW','权限新建','100700','3.0'),
  ('100703','SYSTEM','GECKO_SYSTEM_SYSTEM_AUTHORITIES_EDIT','权限编辑','100700','4.0'),
  ('100704','SYSTEM','GECKO_SYSTEM_SYSTEM_AUTHORITIES_DELETE','权限删除','100700','5.0'),
  ('100705','SYSTEM','GECKO_SYSTEM_SYSTEM_AUTHORITIES_EXPORT','权限导出','100700','6.0'),
