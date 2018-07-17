-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('700000','备忘录','MENU',true,'','','/memo','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('700100','MG_MEMO','MENULINK',true,'700000','','/views/memo/mgmemo/mgmemo.jsp','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('700100','SYSTEM','GECKO_MEMO_MG_MEMO_QUERY','MG_MEMO查询','700100','1.0'),
  ('700101','SYSTEM','GECKO_MEMO_MG_MEMO_VIEW','MG_MEMO查看','700100','2.0'),
  ('700102','SYSTEM','GECKO_MEMO_MG_MEMO_NEW','MG_MEMO新建','700100','3.0'),
  ('700103','SYSTEM','GECKO_MEMO_MG_MEMO_EDIT','MG_MEMO编辑','700100','4.0'),
  ('700104','SYSTEM','GECKO_MEMO_MG_MEMO_DELETE','MG_MEMO删除','700100','5.0'),
  ('700105','SYSTEM','GECKO_MEMO_MG_MEMO_EXPORT','MG_MEMO导出','700100','6.0'),
