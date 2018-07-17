-- menus
INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('900000','酒标','MENU',true,'','','/wineLabels','',0.0,true);

INSERT INTO system_resources
(id,source_name,resource_type,is_platform,parent_id,resource_seq,uri,icon_cls,sort_index,available)
VALUES
('900500','产品流通信息表','MENULINK',true,'900000','','/views/wineLabels/alcirculation/alcirculation.html','',0.0,true);

-- authoritis
INSERT INTO system_authorities(id,authority_type,authority_code,authority_name,resource,sort_index)VALUES
  ('900500','SYSTEM','GECKO_WINELABELS_AL_CIRCULATION_QUERY','产品流通信息表查询','900500','1.0'),
  ('900501','SYSTEM','GECKO_WINELABELS_AL_CIRCULATION_VIEW','产品流通信息表查看','900500','2.0'),
  ('900502','SYSTEM','GECKO_WINELABELS_AL_CIRCULATION_NEW','产品流通信息表新建','900500','3.0'),
  ('900503','SYSTEM','GECKO_WINELABELS_AL_CIRCULATION_EDIT','产品流通信息表编辑','900500','4.0'),
  ('900504','SYSTEM','GECKO_WINELABELS_AL_CIRCULATION_DELETE','产品流通信息表删除','900500','5.0'),
  ('900505','SYSTEM','GECKO_WINELABELS_AL_CIRCULATION_EXPORT','产品流通信息表导出','900500','6.0'),
