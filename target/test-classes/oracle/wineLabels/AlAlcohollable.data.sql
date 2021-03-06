-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('900000','酒标信息表','MENU',true,'','','/wineLabels','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('900300','酒标信息表','MENULINK',true,'900000','','/views/wineLabels/alalcohollable/alalcohollable.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('900300','SYSTEM','GECKO_WINELABELS_AL_ALCOHOLLABLE_QUERY','酒标信息表查询','900300','1.0'),
  ('900301','SYSTEM','GECKO_WINELABELS_AL_ALCOHOLLABLE_VIEW','酒标信息表查看','900300','2.0'),
  ('900302','SYSTEM','GECKO_WINELABELS_AL_ALCOHOLLABLE_NEW','酒标信息表新建','900300','3.0'),
  ('900303','SYSTEM','GECKO_WINELABELS_AL_ALCOHOLLABLE_EDIT','酒标信息表编辑','900300','4.0'),
  ('900304','SYSTEM','GECKO_WINELABELS_AL_ALCOHOLLABLE_DELETE','酒标信息表删除','900300','5.0'),
  ('900305','SYSTEM','GECKO_WINELABELS_AL_ALCOHOLLABLE_EXPORT','酒标信息表导出','900300','6.0'),
