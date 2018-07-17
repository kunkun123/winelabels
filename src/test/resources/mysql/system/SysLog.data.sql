-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100000','系统管理','MENU',true,'','','/system','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('102100','日志','MENULINK',true,'100000','','/views/system/syslog/syslog.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('102100','SYSTEM','GECKO_SYSTEM_SYSTEM_SYS_LOGS_QUERY','日志查询','102100','1.0'),
  ('102101','SYSTEM','GECKO_SYSTEM_SYSTEM_SYS_LOGS_VIEW','日志查看','102100','2.0'),
  ('102102','SYSTEM','GECKO_SYSTEM_SYSTEM_SYS_LOGS_NEW','日志新建','102100','3.0'),
  ('102103','SYSTEM','GECKO_SYSTEM_SYSTEM_SYS_LOGS_EDIT','日志编辑','102100','4.0'),
  ('102104','SYSTEM','GECKO_SYSTEM_SYSTEM_SYS_LOGS_DELETE','日志删除','102100','5.0'),
  ('102105','SYSTEM','GECKO_SYSTEM_SYSTEM_SYS_LOGS_EXPORT','日志导出','102100','6.0'),
