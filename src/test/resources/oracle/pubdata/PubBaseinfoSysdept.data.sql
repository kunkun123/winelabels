-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('400000','基础数据','MENU',true,'','','/pubdata','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('400100','部门管理','MENULINK',true,'400000','','/views/pubdata/pubbaseinfosysdept/pubbaseinfosysdept.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('400100','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSDEPT_QUERY','部门管理查询','400100','1.0'),
  ('400101','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSDEPT_VIEW','部门管理查看','400100','2.0'),
  ('400102','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSDEPT_NEW','部门管理新建','400100','3.0'),
  ('400103','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSDEPT_EDIT','部门管理编辑','400100','4.0'),
  ('400104','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSDEPT_DELETE','部门管理删除','400100','5.0'),
  ('400105','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSDEPT_EXPORT','部门管理导出','400100','6.0'),
