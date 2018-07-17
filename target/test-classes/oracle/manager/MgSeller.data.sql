-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1100000','销售管理表','MENU',true,'','','/manager','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1100100','MG_SELLER','MENULINK',true,'1100000','','/views/manager/mgseller/mgseller.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('1100100','SYSTEM','GECKO_MANAGER_MG_SELLER_QUERY','MG_SELLER查询','1100100','1.0'),
  ('1100101','SYSTEM','GECKO_MANAGER_MG_SELLER_VIEW','MG_SELLER查看','1100100','2.0'),
  ('1100102','SYSTEM','GECKO_MANAGER_MG_SELLER_NEW','MG_SELLER新建','1100100','3.0'),
  ('1100103','SYSTEM','GECKO_MANAGER_MG_SELLER_EDIT','MG_SELLER编辑','1100100','4.0'),
  ('1100104','SYSTEM','GECKO_MANAGER_MG_SELLER_DELETE','MG_SELLER删除','1100100','5.0'),
  ('1100105','SYSTEM','GECKO_MANAGER_MG_SELLER_EXPORT','MG_SELLER导出','1100100','6.0'),
