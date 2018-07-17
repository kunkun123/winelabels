-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('500000','投诉管理','MENU',true,'','','/complaint','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('500300','被投诉人信息','MENULINK',true,'500000','','/views/complaint/cprespondent/cprespondent.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('500300','SYSTEM','GECKO_COMPLAINT_CP_RESPONDENT_QUERY','被投诉人信息查询','500300','1.0'),
  ('500301','SYSTEM','GECKO_COMPLAINT_CP_RESPONDENT_VIEW','被投诉人信息查看','500300','2.0'),
  ('500302','SYSTEM','GECKO_COMPLAINT_CP_RESPONDENT_NEW','被投诉人信息新建','500300','3.0'),
  ('500303','SYSTEM','GECKO_COMPLAINT_CP_RESPONDENT_EDIT','被投诉人信息编辑','500300','4.0'),
  ('500304','SYSTEM','GECKO_COMPLAINT_CP_RESPONDENT_DELETE','被投诉人信息删除','500300','5.0'),
  ('500305','SYSTEM','GECKO_COMPLAINT_CP_RESPONDENT_EXPORT','被投诉人信息导出','500300','6.0'),
