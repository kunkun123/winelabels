-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('500000','投诉管理','MENU',true,'','','/complaint','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('500100','投诉举报信息表','MENULINK',true,'500000','','/views/complaint/cpcomplaintsreport/cpcomplaintsreport.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('500100','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTSREPORT_QUERY','投诉举报信息表查询','500100','1.0'),
  ('500101','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTSREPORT_VIEW','投诉举报信息表查看','500100','2.0'),
  ('500102','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTSREPORT_NEW','投诉举报信息表新建','500100','3.0'),
  ('500103','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTSREPORT_EDIT','投诉举报信息表编辑','500100','4.0'),
  ('500104','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTSREPORT_DELETE','投诉举报信息表删除','500100','5.0'),
  ('500105','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTSREPORT_EXPORT','投诉举报信息表导出','500100','6.0'),
