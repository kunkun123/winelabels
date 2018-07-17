-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('600000','投诉管理','MENU',true,'','','/trusteeship','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('600100','托管信息表','MENULINK',true,'600000','','/views/trusteeship/mgtrusteeship/mgtrusteeship.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('600100','SYSTEM','GECKO_TRUSTEESHIP_MG_TRUSTEESHIP_QUERY','托管信息表查询','600100','1.0'),
  ('600101','SYSTEM','GECKO_TRUSTEESHIP_MG_TRUSTEESHIP_VIEW','托管信息表查看','600100','2.0'),
  ('600102','SYSTEM','GECKO_TRUSTEESHIP_MG_TRUSTEESHIP_NEW','托管信息表新建','600100','3.0'),
  ('600103','SYSTEM','GECKO_TRUSTEESHIP_MG_TRUSTEESHIP_EDIT','托管信息表编辑','600100','4.0'),
  ('600104','SYSTEM','GECKO_TRUSTEESHIP_MG_TRUSTEESHIP_DELETE','托管信息表删除','600100','5.0'),
  ('600105','SYSTEM','GECKO_TRUSTEESHIP_MG_TRUSTEESHIP_EXPORT','托管信息表导出','600100','6.0'),
