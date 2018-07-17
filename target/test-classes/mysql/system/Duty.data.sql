-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100000','系统管理','MENU',true,'','','/system','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100900','职务','MENULINK',true,'100000','','/views/system/duty/duty.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('100900','SYSTEM','GECKO_SYSTEM_SYSTEM_DUTIES_QUERY','职务查询','100900','1.0'),
  ('100901','SYSTEM','GECKO_SYSTEM_SYSTEM_DUTIES_VIEW','职务查看','100900','2.0'),
  ('100902','SYSTEM','GECKO_SYSTEM_SYSTEM_DUTIES_NEW','职务新建','100900','3.0'),
  ('100903','SYSTEM','GECKO_SYSTEM_SYSTEM_DUTIES_EDIT','职务编辑','100900','4.0'),
  ('100904','SYSTEM','GECKO_SYSTEM_SYSTEM_DUTIES_DELETE','职务删除','100900','5.0'),
  ('100905','SYSTEM','GECKO_SYSTEM_SYSTEM_DUTIES_EXPORT','职务导出','100900','6.0'),
