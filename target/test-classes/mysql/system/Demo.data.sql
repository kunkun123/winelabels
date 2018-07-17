-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100000','系统管理','MENU',true,'','','/system','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('102300','测试专用','MENULINK',true,'100000','','/views/system/demo/demo.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('102300','SYSTEM','GECKO_SYSTEM_SYSTEM_DEMOS_QUERY','测试专用查询','102300','1.0'),
  ('102301','SYSTEM','GECKO_SYSTEM_SYSTEM_DEMOS_VIEW','测试专用查看','102300','2.0'),
  ('102302','SYSTEM','GECKO_SYSTEM_SYSTEM_DEMOS_NEW','测试专用新建','102300','3.0'),
  ('102303','SYSTEM','GECKO_SYSTEM_SYSTEM_DEMOS_EDIT','测试专用编辑','102300','4.0'),
  ('102304','SYSTEM','GECKO_SYSTEM_SYSTEM_DEMOS_DELETE','测试专用删除','102300','5.0'),
  ('102305','SYSTEM','GECKO_SYSTEM_SYSTEM_DEMOS_EXPORT','测试专用导出','102300','6.0'),
