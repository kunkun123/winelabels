-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1100000','生产线管理表','MENU',true,'','','/manager','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('1100300','MG_PRODUCTLINE','MENULINK',true,'1100000','','/views/manager/mgproductline/mgproductline.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('1100300','SYSTEM','GECKO_MANAGER_MG_PRODUCTLINE_QUERY','MG_PRODUCTLINE查询','1100300','1.0'),
  ('1100301','SYSTEM','GECKO_MANAGER_MG_PRODUCTLINE_VIEW','MG_PRODUCTLINE查看','1100300','2.0'),
  ('1100302','SYSTEM','GECKO_MANAGER_MG_PRODUCTLINE_NEW','MG_PRODUCTLINE新建','1100300','3.0'),
  ('1100303','SYSTEM','GECKO_MANAGER_MG_PRODUCTLINE_EDIT','MG_PRODUCTLINE编辑','1100300','4.0'),
  ('1100304','SYSTEM','GECKO_MANAGER_MG_PRODUCTLINE_DELETE','MG_PRODUCTLINE删除','1100300','5.0'),
  ('1100305','SYSTEM','GECKO_MANAGER_MG_PRODUCTLINE_EXPORT','MG_PRODUCTLINE导出','1100300','6.0'),
