-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1100000','生产线管理表','MENU',true,'','','/manager','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1100900','商品表','MENULINK',true,'1100000','','/views/manager/alproduct/alproduct.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('1100900','SYSTEM','GECKO_MANAGER_AL_PRODUCT_QUERY','商品表查询','1100900','1.0'),
  ('1100901','SYSTEM','GECKO_MANAGER_AL_PRODUCT_VIEW','商品表查看','1100900','2.0'),
  ('1100902','SYSTEM','GECKO_MANAGER_AL_PRODUCT_NEW','商品表新建','1100900','3.0'),
  ('1100903','SYSTEM','GECKO_MANAGER_AL_PRODUCT_EDIT','商品表编辑','1100900','4.0'),
  ('1100904','SYSTEM','GECKO_MANAGER_AL_PRODUCT_DELETE','商品表删除','1100900','5.0'),
  ('1100905','SYSTEM','GECKO_MANAGER_AL_PRODUCT_EXPORT','商品表导出','1100900','6.0'),
