-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('400000','基础数据','MENU',true,'','','/pubdata','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('400700','职务管理','MENULINK',true,'400000','','/views/pubdata/pubbaseinfosyspost/pubbaseinfosyspost.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('400700','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_QUERY','职务管理查询','400700','1.0'),
  ('400701','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_VIEW','职务管理查看','400700','2.0'),
  ('400702','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_NEW','职务管理新建','400700','3.0'),
  ('400703','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_EDIT','职务管理编辑','400700','4.0'),
  ('400704','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_DELETE','职务管理删除','400700','5.0'),
  ('400705','SYSTEM','GECKO_PUBDATA_PUB_BASEINFO_SYSPOST_EXPORT','职务管理导出','400700','6.0'),
