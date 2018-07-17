-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('200000','demooxxx','MENU',true,'','','/demo','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('200100','PUB_ENTTYPE','MENULINK',true,'200000','','/views/demo/pubenttype/pubenttype.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('200100','SYSTEM','GECKO_DEMO_PUB_ENTTYPE_QUERY','PUB_ENTTYPE查询','200100','1.0'),
  ('200101','SYSTEM','GECKO_DEMO_PUB_ENTTYPE_VIEW','PUB_ENTTYPE查看','200100','2.0'),
  ('200102','SYSTEM','GECKO_DEMO_PUB_ENTTYPE_NEW','PUB_ENTTYPE新建','200100','3.0'),
  ('200103','SYSTEM','GECKO_DEMO_PUB_ENTTYPE_EDIT','PUB_ENTTYPE编辑','200100','4.0'),
  ('200104','SYSTEM','GECKO_DEMO_PUB_ENTTYPE_DELETE','PUB_ENTTYPE删除','200100','5.0'),
  ('200105','SYSTEM','GECKO_DEMO_PUB_ENTTYPE_EXPORT','PUB_ENTTYPE导出','200100','6.0'),
