-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('400000','基础数据','MENU',true,'','','/pubdata','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('400500','单位管理','MENULINK',true,'400000','','/views/pubdata/pubbaseinfosysunit/pubbaseinfosysunit.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('400500','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSUNIT_QUERY','单位管理查询','400500','1.0'),
  ('400501','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSUNIT_VIEW','单位管理查看','400500','2.0'),
  ('400502','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSUNIT_NEW','单位管理新建','400500','3.0'),
  ('400503','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSUNIT_EDIT','单位管理编辑','400500','4.0'),
  ('400504','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSUNIT_DELETE','单位管理删除','400500','5.0'),
  ('400505','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSUNIT_EXPORT','单位管理导出','400500','6.0'),
