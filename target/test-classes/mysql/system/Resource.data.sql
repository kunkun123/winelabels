-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100000','系统管理','MENU',true,'','','/system','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100100','资源','MENULINK',true,'100000','','/views/system/resource/resource.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('100100','SYSTEM','GECKO_SYSTEM_SYSTEM_RESOURCES_QUERY','资源查询','100100','1.0'),
  ('100101','SYSTEM','GECKO_SYSTEM_SYSTEM_RESOURCES_VIEW','资源查看','100100','2.0'),
  ('100102','SYSTEM','GECKO_SYSTEM_SYSTEM_RESOURCES_NEW','资源新建','100100','3.0'),
  ('100103','SYSTEM','GECKO_SYSTEM_SYSTEM_RESOURCES_EDIT','资源编辑','100100','4.0'),
  ('100104','SYSTEM','GECKO_SYSTEM_SYSTEM_RESOURCES_DELETE','资源删除','100100','5.0'),
  ('100105','SYSTEM','GECKO_SYSTEM_SYSTEM_RESOURCES_EXPORT','资源导出','100100','6.0'),
