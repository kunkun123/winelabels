-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1000000','企业申请','MENU',true,'','','/ent','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1000100','酒标申请记录','MENULINK',true,'1000000','','/views/ent/entapplication/entapplication.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('1000100','SYSTEM','GECKO_ENT_ENT_APPLICATION_QUERY','酒标申请记录查询','1000100','1.0'),
  ('1000101','SYSTEM','GECKO_ENT_ENT_APPLICATION_VIEW','酒标申请记录查看','1000100','2.0'),
  ('1000102','SYSTEM','GECKO_ENT_ENT_APPLICATION_NEW','酒标申请记录新建','1000100','3.0'),
  ('1000103','SYSTEM','GECKO_ENT_ENT_APPLICATION_EDIT','酒标申请记录编辑','1000100','4.0'),
  ('1000104','SYSTEM','GECKO_ENT_ENT_APPLICATION_DELETE','酒标申请记录删除','1000100','5.0'),
  ('1000105','SYSTEM','GECKO_ENT_ENT_APPLICATION_EXPORT','酒标申请记录导出','1000100','6.0'),
