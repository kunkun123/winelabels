-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1100000','生产线管理表','MENU',true,'','','/manager','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1100700','酒标信息表','MENULINK',true,'1100000','','/views/manager/alalcohollable/alalcohollable.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('1100700','SYSTEM','GECKO_MANAGER_AL_ALCOHOLLABLE_QUERY','酒标信息表查询','1100700','1.0'),
  ('1100701','SYSTEM','GECKO_MANAGER_AL_ALCOHOLLABLE_VIEW','酒标信息表查看','1100700','2.0'),
  ('1100702','SYSTEM','GECKO_MANAGER_AL_ALCOHOLLABLE_NEW','酒标信息表新建','1100700','3.0'),
  ('1100703','SYSTEM','GECKO_MANAGER_AL_ALCOHOLLABLE_EDIT','酒标信息表编辑','1100700','4.0'),
  ('1100704','SYSTEM','GECKO_MANAGER_AL_ALCOHOLLABLE_DELETE','酒标信息表删除','1100700','5.0'),
  ('1100705','SYSTEM','GECKO_MANAGER_AL_ALCOHOLLABLE_EXPORT','酒标信息表导出','1100700','6.0'),
