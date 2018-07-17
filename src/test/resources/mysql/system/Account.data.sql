-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('100000','系统管理','MENU',true,'','','/system','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('101300','账号','MENULINK',true,'100000','','/views/system/account/account.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('101300','SYSTEM','GECKO_SYSTEM_SYSTEM_ACCOUNTS_QUERY','账号查询','101300','1.0'),
  ('101301','SYSTEM','GECKO_SYSTEM_SYSTEM_ACCOUNTS_VIEW','账号查看','101300','2.0'),
  ('101302','SYSTEM','GECKO_SYSTEM_SYSTEM_ACCOUNTS_NEW','账号新建','101300','3.0'),
  ('101303','SYSTEM','GECKO_SYSTEM_SYSTEM_ACCOUNTS_EDIT','账号编辑','101300','4.0'),
  ('101304','SYSTEM','GECKO_SYSTEM_SYSTEM_ACCOUNTS_DELETE','账号删除','101300','5.0'),
  ('101305','SYSTEM','GECKO_SYSTEM_SYSTEM_ACCOUNTS_EXPORT','账号导出','101300','6.0'),
