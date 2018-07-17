-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('500000','投诉管理','MENU',true,'','','/complaint','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('500700','投诉人信息','MENULINK',true,'500000','','/views/complaint/cpcomplaintinfo/cpcomplaintinfo.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('500700','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTINFO_QUERY','投诉人信息查询','500700','1.0'),
  ('500701','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTINFO_VIEW','投诉人信息查看','500700','2.0'),
  ('500702','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTINFO_NEW','投诉人信息新建','500700','3.0'),
  ('500703','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTINFO_EDIT','投诉人信息编辑','500700','4.0'),
  ('500704','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTINFO_DELETE','投诉人信息删除','500700','5.0'),
  ('500705','SYSTEM','GECKO_COMPLAINT_CP_COMPLAINTINFO_EXPORT','投诉人信息导出','500700','6.0'),
