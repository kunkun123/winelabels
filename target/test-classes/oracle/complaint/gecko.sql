-----------------------------------------------
-- Export file for user GECKO_DEMO@ORCL      --
-- Created by lenovo on 2017/10/18, 10:27:12 --
-----------------------------------------------

set define off
spool gecko.log

prompt
prompt Creating table ACT_EVT_LOG
prompt ==========================
prompt
create table GECKO_DEMO.ACT_EVT_LOG
(
  log_nr_       NUMBER(19) not null,
  type_         NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  time_stamp_   TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  data_         BLOB,
  lock_owner_   NVARCHAR2(255),
  lock_time_    TIMESTAMP(6),
  is_processed_ NUMBER(3) default 0
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
alter table GECKO_DEMO.ACT_EVT_LOG
  add primary key (LOG_NR_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_RE_DEPLOYMENT
prompt ================================
prompt
create table GECKO_DEMO.ACT_RE_DEPLOYMENT
(
  id_          NVARCHAR2(64) not null,
  name_        NVARCHAR2(255),
  category_    NVARCHAR2(255),
  tenant_id_   NVARCHAR2(255) default '',
  deploy_time_ TIMESTAMP(6)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RE_DEPLOYMENT
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table ACT_GE_BYTEARRAY
prompt ===============================
prompt
create table GECKO_DEMO.ACT_GE_BYTEARRAY
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  name_          NVARCHAR2(255),
  deployment_id_ NVARCHAR2(64),
  bytes_         BLOB,
  generated_     NUMBER(1)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_BYTEAR_DEPL on GECKO_DEMO.ACT_GE_BYTEARRAY (DEPLOYMENT_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_GE_BYTEARRAY
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_GE_BYTEARRAY
  add constraint ACT_FK_BYTEARR_DEPL foreign key (DEPLOYMENT_ID_)
  references GECKO_DEMO.ACT_RE_DEPLOYMENT (ID_);
alter table GECKO_DEMO.ACT_GE_BYTEARRAY
  add check (GENERATED_ IN (1,0));

prompt
prompt Creating table ACT_GE_PROPERTY
prompt ==============================
prompt
create table GECKO_DEMO.ACT_GE_PROPERTY
(
  name_  NVARCHAR2(64) not null,
  value_ NVARCHAR2(300),
  rev_   INTEGER
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_GE_PROPERTY
  add primary key (NAME_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table ACT_HI_ACTINST
prompt =============================
prompt
create table GECKO_DEMO.ACT_HI_ACTINST
(
  id_                NVARCHAR2(64) not null,
  proc_def_id_       NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64) not null,
  execution_id_      NVARCHAR2(64) not null,
  act_id_            NVARCHAR2(255) not null,
  task_id_           NVARCHAR2(64),
  call_proc_inst_id_ NVARCHAR2(64),
  act_name_          NVARCHAR2(255),
  act_type_          NVARCHAR2(255) not null,
  assignee_          NVARCHAR2(255),
  start_time_        TIMESTAMP(6) not null,
  end_time_          TIMESTAMP(6),
  duration_          NUMBER(19),
  tenant_id_         NVARCHAR2(255) default ''
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_ACT_INST_END on GECKO_DEMO.ACT_HI_ACTINST (END_TIME_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_ACT_INST_EXEC on GECKO_DEMO.ACT_HI_ACTINST (EXECUTION_ID_, ACT_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_ACT_INST_PROCINST on GECKO_DEMO.ACT_HI_ACTINST (PROC_INST_ID_, ACT_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_ACT_INST_START on GECKO_DEMO.ACT_HI_ACTINST (START_TIME_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_HI_ACTINST
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table ACT_HI_ATTACHMENT
prompt ================================
prompt
create table GECKO_DEMO.ACT_HI_ATTACHMENT
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  user_id_      NVARCHAR2(255),
  name_         NVARCHAR2(255),
  description_  NVARCHAR2(2000),
  type_         NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  url_          NVARCHAR2(2000),
  content_id_   NVARCHAR2(64),
  time_         TIMESTAMP(6)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
alter table GECKO_DEMO.ACT_HI_ATTACHMENT
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_HI_COMMENT
prompt =============================
prompt
create table GECKO_DEMO.ACT_HI_COMMENT
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255),
  time_         TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  action_       NVARCHAR2(255),
  message_      NVARCHAR2(2000),
  full_msg_     BLOB
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_HI_COMMENT
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table ACT_HI_DETAIL
prompt ============================
prompt
create table GECKO_DEMO.ACT_HI_DETAIL
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255) not null,
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  act_inst_id_  NVARCHAR2(64),
  name_         NVARCHAR2(255) not null,
  var_type_     NVARCHAR2(64),
  rev_          INTEGER,
  time_         TIMESTAMP(6) not null,
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_HI_DETAIL_ACT_INST on GECKO_DEMO.ACT_HI_DETAIL (ACT_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_HI_DETAIL_NAME on GECKO_DEMO.ACT_HI_DETAIL (NAME_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_HI_DETAIL_PROC_INST on GECKO_DEMO.ACT_HI_DETAIL (PROC_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_HI_DETAIL_TASK_ID on GECKO_DEMO.ACT_HI_DETAIL (TASK_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_HI_DETAIL_TIME on GECKO_DEMO.ACT_HI_DETAIL (TIME_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_HI_DETAIL
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_HI_IDENTITYLINK
prompt ==================================
prompt
create table GECKO_DEMO.ACT_HI_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_IDENT_LNK_PROCINST on GECKO_DEMO.ACT_HI_IDENTITYLINK (PROC_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_IDENT_LNK_TASK on GECKO_DEMO.ACT_HI_IDENTITYLINK (TASK_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_IDENT_LNK_USER on GECKO_DEMO.ACT_HI_IDENTITYLINK (USER_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_HI_IDENTITYLINK
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table ACT_HI_PROCINST
prompt ==============================
prompt
create table GECKO_DEMO.ACT_HI_PROCINST
(
  id_                        NVARCHAR2(64) not null,
  proc_inst_id_              NVARCHAR2(64) not null,
  business_key_              NVARCHAR2(255),
  proc_def_id_               NVARCHAR2(64) not null,
  start_time_                TIMESTAMP(6) not null,
  end_time_                  TIMESTAMP(6),
  duration_                  NUMBER(19),
  start_user_id_             NVARCHAR2(255),
  start_act_id_              NVARCHAR2(255),
  end_act_id_                NVARCHAR2(255),
  super_process_instance_id_ NVARCHAR2(64),
  delete_reason_             NVARCHAR2(2000),
  tenant_id_                 NVARCHAR2(255) default '',
  name_                      NVARCHAR2(255)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_PRO_INST_END on GECKO_DEMO.ACT_HI_PROCINST (END_TIME_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_PRO_I_BUSKEY on GECKO_DEMO.ACT_HI_PROCINST (BUSINESS_KEY_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_HI_PROCINST
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_HI_PROCINST
  add unique (PROC_INST_ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table ACT_HI_TASKINST
prompt ==============================
prompt
create table GECKO_DEMO.ACT_HI_TASKINST
(
  id_             NVARCHAR2(64) not null,
  proc_def_id_    NVARCHAR2(64),
  task_def_key_   NVARCHAR2(255),
  proc_inst_id_   NVARCHAR2(64),
  execution_id_   NVARCHAR2(64),
  parent_task_id_ NVARCHAR2(64),
  name_           NVARCHAR2(255),
  description_    NVARCHAR2(2000),
  owner_          NVARCHAR2(255),
  assignee_       NVARCHAR2(255),
  start_time_     TIMESTAMP(6) not null,
  claim_time_     TIMESTAMP(6),
  end_time_       TIMESTAMP(6),
  duration_       NUMBER(19),
  delete_reason_  NVARCHAR2(2000),
  priority_       INTEGER,
  due_date_       TIMESTAMP(6),
  form_key_       NVARCHAR2(255),
  category_       NVARCHAR2(255),
  tenant_id_      NVARCHAR2(255) default ''
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_TASK_INST_PROCINST on GECKO_DEMO.ACT_HI_TASKINST (PROC_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_HI_TASKINST
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table ACT_HI_VARINST
prompt =============================
prompt
create table GECKO_DEMO.ACT_HI_VARINST
(
  id_                NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64),
  execution_id_      NVARCHAR2(64),
  task_id_           NVARCHAR2(64),
  name_              NVARCHAR2(255) not null,
  var_type_          NVARCHAR2(100),
  rev_               INTEGER,
  bytearray_id_      NVARCHAR2(64),
  double_            NUMBER(*,10),
  long_              NUMBER(19),
  text_              NVARCHAR2(2000),
  text2_             NVARCHAR2(2000),
  create_time_       TIMESTAMP(6),
  last_updated_time_ TIMESTAMP(6)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_PROCVAR_NAME_TYPE on GECKO_DEMO.ACT_HI_VARINST (NAME_, VAR_TYPE_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_PROCVAR_PROC_INST on GECKO_DEMO.ACT_HI_VARINST (PROC_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_HI_PROCVAR_TASK_ID on GECKO_DEMO.ACT_HI_VARINST (TASK_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_HI_VARINST
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table ACT_ID_GROUP
prompt ===========================
prompt
create table GECKO_DEMO.ACT_ID_GROUP
(
  id_   NVARCHAR2(64) not null,
  rev_  INTEGER,
  name_ NVARCHAR2(255),
  type_ NVARCHAR2(255)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
alter table GECKO_DEMO.ACT_ID_GROUP
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_ID_INFO
prompt ==========================
prompt
create table GECKO_DEMO.ACT_ID_INFO
(
  id_        NVARCHAR2(64) not null,
  rev_       INTEGER,
  user_id_   NVARCHAR2(64),
  type_      NVARCHAR2(64),
  key_       NVARCHAR2(255),
  value_     NVARCHAR2(255),
  password_  BLOB,
  parent_id_ NVARCHAR2(255)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
alter table GECKO_DEMO.ACT_ID_INFO
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_ID_USER
prompt ==========================
prompt
create table GECKO_DEMO.ACT_ID_USER
(
  id_         NVARCHAR2(64) not null,
  rev_        INTEGER,
  first_      NVARCHAR2(255),
  last_       NVARCHAR2(255),
  email_      NVARCHAR2(255),
  pwd_        NVARCHAR2(255),
  picture_id_ NVARCHAR2(64)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
alter table GECKO_DEMO.ACT_ID_USER
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_ID_MEMBERSHIP
prompt ================================
prompt
create table GECKO_DEMO.ACT_ID_MEMBERSHIP
(
  user_id_  NVARCHAR2(64) not null,
  group_id_ NVARCHAR2(64) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_MEMB_GROUP on GECKO_DEMO.ACT_ID_MEMBERSHIP (GROUP_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_MEMB_USER on GECKO_DEMO.ACT_ID_MEMBERSHIP (USER_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_ID_MEMBERSHIP
  add primary key (USER_ID_, GROUP_ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_GROUP foreign key (GROUP_ID_)
  references GECKO_DEMO.ACT_ID_GROUP (ID_);
alter table GECKO_DEMO.ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_USER foreign key (USER_ID_)
  references GECKO_DEMO.ACT_ID_USER (ID_);

prompt
prompt Creating table ACT_RE_PROCDEF
prompt =============================
prompt
create table GECKO_DEMO.ACT_RE_PROCDEF
(
  id_                     NVARCHAR2(64) not null,
  rev_                    INTEGER,
  category_               NVARCHAR2(255),
  name_                   NVARCHAR2(255),
  key_                    NVARCHAR2(255) not null,
  version_                INTEGER not null,
  deployment_id_          NVARCHAR2(64),
  resource_name_          NVARCHAR2(2000),
  dgrm_resource_name_     VARCHAR2(4000),
  description_            NVARCHAR2(2000),
  has_start_form_key_     NUMBER(1),
  has_graphical_notation_ NUMBER(1),
  suspension_state_       INTEGER,
  tenant_id_              NVARCHAR2(255) default ''
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RE_PROCDEF
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RE_PROCDEF
  add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_, TENANT_ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RE_PROCDEF
  add check (HAS_START_FORM_KEY_ IN (1,0));
alter table GECKO_DEMO.ACT_RE_PROCDEF
  add check (HAS_GRAPHICAL_NOTATION_ IN (1,0));

prompt
prompt Creating table ACT_PROCDEF_INFO
prompt ===============================
prompt
create table GECKO_DEMO.ACT_PROCDEF_INFO
(
  id_           NVARCHAR2(64) not null,
  proc_def_id_  NVARCHAR2(64) not null,
  rev_          INTEGER,
  info_json_id_ NVARCHAR2(64)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_PROCDEF_INFO_JSON on GECKO_DEMO.ACT_PROCDEF_INFO (INFO_JSON_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_PROCDEF_INFO_PROC on GECKO_DEMO.ACT_PROCDEF_INFO (PROC_DEF_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_PROCDEF_INFO
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_PROCDEF_INFO
  add constraint ACT_UNIQ_INFO_PROCDEF unique (PROC_DEF_ID_);
alter table GECKO_DEMO.ACT_PROCDEF_INFO
  add constraint ACT_FK_INFO_JSON_BA foreign key (INFO_JSON_ID_)
  references GECKO_DEMO.ACT_GE_BYTEARRAY (ID_);
alter table GECKO_DEMO.ACT_PROCDEF_INFO
  add constraint ACT_FK_INFO_PROCDEF foreign key (PROC_DEF_ID_)
  references GECKO_DEMO.ACT_RE_PROCDEF (ID_);

prompt
prompt Creating table ACT_RE_MODEL
prompt ===========================
prompt
create table GECKO_DEMO.ACT_RE_MODEL
(
  id_                           NVARCHAR2(64) not null,
  rev_                          INTEGER,
  name_                         NVARCHAR2(255),
  key_                          NVARCHAR2(255),
  category_                     NVARCHAR2(255),
  create_time_                  TIMESTAMP(6),
  last_update_time_             TIMESTAMP(6),
  version_                      INTEGER,
  meta_info_                    NVARCHAR2(2000),
  deployment_id_                NVARCHAR2(64),
  editor_source_value_id_       NVARCHAR2(64),
  editor_source_extra_value_id_ NVARCHAR2(64),
  tenant_id_                    NVARCHAR2(255) default ''
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_MODEL_DEPLOYMENT on GECKO_DEMO.ACT_RE_MODEL (DEPLOYMENT_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_MODEL_SOURCE on GECKO_DEMO.ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_MODEL_SOURCE_EXTRA on GECKO_DEMO.ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_RE_MODEL
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_RE_MODEL
  add constraint ACT_FK_MODEL_DEPLOYMENT foreign key (DEPLOYMENT_ID_)
  references GECKO_DEMO.ACT_RE_DEPLOYMENT (ID_);
alter table GECKO_DEMO.ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE foreign key (EDITOR_SOURCE_VALUE_ID_)
  references GECKO_DEMO.ACT_GE_BYTEARRAY (ID_);
alter table GECKO_DEMO.ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE_EXTRA foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  references GECKO_DEMO.ACT_GE_BYTEARRAY (ID_);

prompt
prompt Creating table ACT_RU_EXECUTION
prompt ===============================
prompt
create table GECKO_DEMO.ACT_RU_EXECUTION
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  proc_inst_id_     NVARCHAR2(64),
  business_key_     NVARCHAR2(255),
  parent_id_        NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  super_exec_       NVARCHAR2(64),
  act_id_           NVARCHAR2(255),
  is_active_        NUMBER(1),
  is_concurrent_    NUMBER(1),
  is_scope_         NUMBER(1),
  is_event_scope_   NUMBER(1),
  suspension_state_ INTEGER,
  cached_ent_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  name_             NVARCHAR2(255),
  lock_time_        TIMESTAMP(6)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_EXEC_BUSKEY on GECKO_DEMO.ACT_RU_EXECUTION (BUSINESS_KEY_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_EXE_PARENT on GECKO_DEMO.ACT_RU_EXECUTION (PARENT_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_EXE_PROCDEF on GECKO_DEMO.ACT_RU_EXECUTION (PROC_DEF_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_EXE_PROCINST on GECKO_DEMO.ACT_RU_EXECUTION (PROC_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_EXE_SUPER on GECKO_DEMO.ACT_RU_EXECUTION (SUPER_EXEC_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PARENT foreign key (PARENT_ID_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCDEF foreign key (PROC_DEF_ID_)
  references GECKO_DEMO.ACT_RE_PROCDEF (ID_);
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_SUPER foreign key (SUPER_EXEC_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add check (IS_ACTIVE_ IN (1,0));
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add check (IS_CONCURRENT_ IN (1,0));
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add check (IS_SCOPE_ IN (1,0));
alter table GECKO_DEMO.ACT_RU_EXECUTION
  add check (IS_EVENT_SCOPE_ IN (1,0));

prompt
prompt Creating table ACT_RU_EVENT_SUBSCR
prompt ==================================
prompt
create table GECKO_DEMO.ACT_RU_EVENT_SUBSCR
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  event_type_    NVARCHAR2(255) not null,
  event_name_    NVARCHAR2(255),
  execution_id_  NVARCHAR2(64),
  proc_inst_id_  NVARCHAR2(64),
  activity_id_   NVARCHAR2(64),
  configuration_ NVARCHAR2(255),
  created_       TIMESTAMP(6) not null,
  proc_def_id_   NVARCHAR2(64),
  tenant_id_     NVARCHAR2(255) default ''
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_EVENT_SUBSCR on GECKO_DEMO.ACT_RU_EVENT_SUBSCR (EXECUTION_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_EVENT_SUBSCR_CONFIG_ on GECKO_DEMO.ACT_RU_EVENT_SUBSCR (CONFIGURATION_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_RU_EVENT_SUBSCR
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_RU_EVENT_SUBSCR
  add constraint ACT_FK_EVENT_EXEC foreign key (EXECUTION_ID_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table ACT_RU_TASK
prompt ==========================
prompt
create table GECKO_DEMO.ACT_RU_TASK
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  execution_id_     NVARCHAR2(64),
  proc_inst_id_     NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  name_             NVARCHAR2(255),
  parent_task_id_   NVARCHAR2(64),
  description_      NVARCHAR2(2000),
  task_def_key_     NVARCHAR2(255),
  owner_            NVARCHAR2(255),
  assignee_         NVARCHAR2(255),
  delegation_       NVARCHAR2(64),
  priority_         INTEGER,
  create_time_      TIMESTAMP(6),
  due_date_         TIMESTAMP(6),
  category_         NVARCHAR2(255),
  suspension_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  form_key_         NVARCHAR2(255)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_TASK_CREATE on GECKO_DEMO.ACT_RU_TASK (CREATE_TIME_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_TASK_EXEC on GECKO_DEMO.ACT_RU_TASK (EXECUTION_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_TASK_PROCDEF on GECKO_DEMO.ACT_RU_TASK (PROC_DEF_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_TASK_PROCINST on GECKO_DEMO.ACT_RU_TASK (PROC_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RU_TASK
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RU_TASK
  add constraint ACT_FK_TASK_EXE foreign key (EXECUTION_ID_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);
alter table GECKO_DEMO.ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF foreign key (PROC_DEF_ID_)
  references GECKO_DEMO.ACT_RE_PROCDEF (ID_);
alter table GECKO_DEMO.ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCINST foreign key (PROC_INST_ID_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table ACT_RU_IDENTITYLINK
prompt ==================================
prompt
create table GECKO_DEMO.ACT_RU_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_ATHRZ_PROCEDEF on GECKO_DEMO.ACT_RU_IDENTITYLINK (PROC_DEF_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_IDENT_LNK_GROUP on GECKO_DEMO.ACT_RU_IDENTITYLINK (GROUP_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_IDENT_LNK_USER on GECKO_DEMO.ACT_RU_IDENTITYLINK (USER_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_IDL_PROCINST on GECKO_DEMO.ACT_RU_IDENTITYLINK (PROC_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_TSKASS_TASK on GECKO_DEMO.ACT_RU_IDENTITYLINK (TASK_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RU_IDENTITYLINK
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RU_IDENTITYLINK
  add constraint ACT_FK_ATHRZ_PROCEDEF foreign key (PROC_DEF_ID_)
  references GECKO_DEMO.ACT_RE_PROCDEF (ID_);
alter table GECKO_DEMO.ACT_RU_IDENTITYLINK
  add constraint ACT_FK_IDL_PROCINST foreign key (PROC_INST_ID_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);
alter table GECKO_DEMO.ACT_RU_IDENTITYLINK
  add constraint ACT_FK_TSKASS_TASK foreign key (TASK_ID_)
  references GECKO_DEMO.ACT_RU_TASK (ID_);

prompt
prompt Creating table ACT_RU_JOB
prompt =========================
prompt
create table GECKO_DEMO.ACT_RU_JOB
(
  id_                  NVARCHAR2(64) not null,
  rev_                 INTEGER,
  type_                NVARCHAR2(255) not null,
  lock_exp_time_       TIMESTAMP(6),
  lock_owner_          NVARCHAR2(255),
  exclusive_           NUMBER(1),
  execution_id_        NVARCHAR2(64),
  process_instance_id_ NVARCHAR2(64),
  proc_def_id_         NVARCHAR2(64),
  retries_             INTEGER,
  exception_stack_id_  NVARCHAR2(64),
  exception_msg_       NVARCHAR2(2000),
  duedate_             TIMESTAMP(6),
  repeat_              NVARCHAR2(255),
  handler_type_        NVARCHAR2(255),
  handler_cfg_         NVARCHAR2(2000),
  tenant_id_           NVARCHAR2(255) default ''
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
create index GECKO_DEMO.ACT_IDX_JOB_EXCEPTION on GECKO_DEMO.ACT_RU_JOB (EXCEPTION_STACK_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_RU_JOB
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;
alter table GECKO_DEMO.ACT_RU_JOB
  add constraint ACT_FK_JOB_EXCEPTION foreign key (EXCEPTION_STACK_ID_)
  references GECKO_DEMO.ACT_GE_BYTEARRAY (ID_);
alter table GECKO_DEMO.ACT_RU_JOB
  add check (EXCLUSIVE_ IN (1,0));

prompt
prompt Creating table ACT_RU_VARIABLE
prompt ==============================
prompt
create table GECKO_DEMO.ACT_RU_VARIABLE
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  type_         NVARCHAR2(255) not null,
  name_         NVARCHAR2(255) not null,
  execution_id_ NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_VARIABLE_TASK_ID on GECKO_DEMO.ACT_RU_VARIABLE (TASK_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_VAR_BYTEARRAY on GECKO_DEMO.ACT_RU_VARIABLE (BYTEARRAY_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_VAR_EXE on GECKO_DEMO.ACT_RU_VARIABLE (EXECUTION_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index GECKO_DEMO.ACT_IDX_VAR_PROCINST on GECKO_DEMO.ACT_RU_VARIABLE (PROC_INST_ID_)
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RU_VARIABLE
  add primary key (ID_)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_BYTEARRAY foreign key (BYTEARRAY_ID_)
  references GECKO_DEMO.ACT_GE_BYTEARRAY (ID_);
alter table GECKO_DEMO.ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_EXE foreign key (EXECUTION_ID_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);
alter table GECKO_DEMO.ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_PROCINST foreign key (PROC_INST_ID_)
  references GECKO_DEMO.ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table CP_COMPLAINTINFO
prompt ===============================
prompt
create table GECKO_DEMO.CP_COMPLAINTINFO
(
  id                 NUMBER(22) not null,
  temp2              VARCHAR2(80),
  temp1              VARCHAR2(80),
  ip                 VARCHAR2(20),
  complainanttype    VARCHAR2(2),
  complainantlicense VARCHAR2(60),
  address            VARCHAR2(80),
  tel                VARCHAR2(20),
  zipcode            VARCHAR2(10),
  complainantname    VARCHAR2(20),
  email              VARCHAR2(60),
  licensetype        VARCHAR2(2)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table CP_COMPLAINTPRODUCT
prompt ==================================
prompt
create table GECKO_DEMO.CP_COMPLAINTPRODUCT
(
  id                NUMBER(22) not null,
  validitydate      VARCHAR2(10),
  manufacturer      VARCHAR2(30),
  lastupdatetime    DATE,
  dateofmanufacture VARCHAR2(10),
  spec              VARCHAR2(30),
  operator          VARCHAR2(10),
  temp1             VARCHAR2(80),
  isimport          VARCHAR2(5),
  approval          VARCHAR2(20),
  productchannel    VARCHAR2(10),
  product           VARCHAR2(30),
  batch             VARCHAR2(20),
  temp2             VARCHAR2(80),
  producttype       VARCHAR2(5)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table CP_COMPLAINTSREPORT
prompt ==================================
prompt
create table GECKO_DEMO.CP_COMPLAINTSREPORT
(
  id                  NUMBER(22) not null,
  responsedate        DATE,
  content             VARCHAR2(4000),
  audiourl            VARCHAR2(80),
  accepted            DATE,
  importance          VARCHAR2(10),
  isanonymous         VARCHAR2(1),
  acceptype           VARCHAR2(5),
  respondent          NUMBER(22),
  closedate           DATE,
  supervisionperson   NUMBER(22),
  supervisiondate     DATE,
  classification      VARCHAR2(10),
  supervisionedperson NUMBER(22),
  registration        NUMBER(22),
  channel             VARCHAR2(2),
  attachurl           VARCHAR2(80),
  temp5               VARCHAR2(80),
  limitdate           DATE,
  registerdate        DATE,
  temp4               VARCHAR2(80),
  responsecontent     VARCHAR2(4000),
  title               VARCHAR2(100),
  currentflow         NUMBER(22),
  callstarttime       TIMESTAMP(6),
  feedbacktel         VARCHAR2(20),
  enttypename         VARCHAR2(20),
  area                VARCHAR2(50),
  temp6               VARCHAR2(80),
  caseno              VARCHAR2(32),
  product             NUMBER(22),
  callserial          VARCHAR2(32),
  complainant         NUMBER(22),
  acceptance          VARCHAR2(10),
  business            VARCHAR2(5),
  enttype             NUMBER(22),
  operator            VARCHAR2(10),
  isdelay             VARCHAR2(5),
  keyword             CHAR(10),
  problem             VARCHAR2(10),
  supervision         VARCHAR2(5),
  refid               NUMBER(22),
  iscase              VARCHAR2(5),
  opinion             VARCHAR2(80),
  isotherdept         VARCHAR2(5),
  delayreason         VARCHAR2(300),
  source              VARCHAR2(5),
  otherdept           NUMBER(22),
  isfirst             VARCHAR2(5),
  accept              VARCHAR2(20),
  calltel             VARCHAR2(22),
  temp1               VARCHAR2(80),
  feedback            VARCHAR2(10),
  querycode           VARCHAR2(30),
  infoid              VARCHAR2(32),
  lastupdatetime      DATE,
  seatno              VARCHAR2(32),
  registrationarea    NUMBER(22),
  temp2               VARCHAR2(80),
  status              VARCHAR2(2),
  temp3               VARCHAR2(80),
  callendtime         TIMESTAMP(6),
  fistcomplaint       NUMBER(22)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table CP_RESPONDENT
prompt ============================
prompt
create table GECKO_DEMO.CP_RESPONDENT
(
  id                NUMBER(22) not null,
  respondentaddress VARCHAR2(80),
  temp1             VARCHAR2(80),
  temp2             VARCHAR2(80),
  respondenttel     VARCHAR2(20),
  respondenttype    VARCHAR2(2),
  respondentname    VARCHAR2(20)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table PUB_ENTTYPE
prompt ==========================
prompt
create table GECKO_DEMO.PUB_ENTTYPE
(
  id            NUMBER not null,
  sourceid      VARCHAR2(30),
  groupid       NUMBER,
  enttypenum    VARCHAR2(30),
  enttypename   VARCHAR2(30),
  parententtype NUMBER,
  creator       NUMBER
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.PUB_ENTTYPE
  add constraint PK_PUB_SYSUNIT primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_ACCOUNTS
prompt ==============================
prompt
create table GECKO_DEMO.SYSTEM_ACCOUNTS
(
  id           VARCHAR2(32 CHAR) not null,
  real_name    VARCHAR2(10 CHAR) not null,
  principal    VARCHAR2(50 CHAR) not null,
  gender       VARCHAR2(50 CHAR),
  credential   VARCHAR2(50 CHAR),
  locked       NUMBER(10),
  salt         VARCHAR2(50 CHAR),
  mobile_phone VARCHAR2(50 CHAR),
  tel_phone    VARCHAR2(50 CHAR),
  qq           VARCHAR2(50 CHAR),
  email        VARCHAR2(50 CHAR),
  create_time  DATE not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_ACCOUNTS
  add constraint PRIMARY_2 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_ACCOUNTS
  add constraint PRINCIPAL unique (PRINCIPAL)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_ACCOUNT_RESOURCES
prompt =======================================
prompt
create table GECKO_DEMO.SYSTEM_ACCOUNT_RESOURCES
(
  id          NUMBER(32) not null,
  account_id  VARCHAR2(50 CHAR) not null,
  resource_id VARCHAR2(50 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_ACCOUNT_RESOURCES
  add constraint PRIMARY primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_ACCOUNT_ROLES
prompt ===================================
prompt
create table GECKO_DEMO.SYSTEM_ACCOUNT_ROLES
(
  id         NUMBER(32) not null,
  account_id VARCHAR2(500 CHAR) not null,
  role_id    VARCHAR2(50 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_ACCOUNT_ROLES
  add constraint PRIMARY_15 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_AUTHORITIES
prompt =================================
prompt
create table GECKO_DEMO.SYSTEM_AUTHORITIES
(
  id             VARCHAR2(32 CHAR) not null,
  authority_type VARCHAR2(10 CHAR) not null,
  authority_code VARCHAR2(50 CHAR) not null,
  authority_name VARCHAR2(50 CHAR) not null,
  resource_      VARCHAR2(50 CHAR) not null,
  sort_index     FLOAT
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_AUTHORITIES
  add constraint PRIMARY_3 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_DICTIONARIES
prompt ==================================
prompt
create table GECKO_DEMO.SYSTEM_DICTIONARIES
(
  id              VARCHAR2(32 CHAR) not null,
  dic_code        VARCHAR2(50 CHAR) not null,
  dic_name        VARCHAR2(50 CHAR) not null,
  discription     VARCHAR2(50 CHAR),
  sort_index      FLOAT,
  dictionary_type VARCHAR2(50 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_DICTIONARIES
  add constraint PRIMARY_4 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_DICTIONARY_TYPES
prompt ======================================
prompt
create table GECKO_DEMO.SYSTEM_DICTIONARY_TYPES
(
  id             VARCHAR2(200 CHAR) not null,
  dic_type_code  VARCHAR2(50 CHAR) not null,
  dic_type_name  VARCHAR2(50 CHAR) not null,
  dic_type_class VARCHAR2(200 CHAR) not null,
  discription    VARCHAR2(50 CHAR)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_DICTIONARY_TYPES
  add constraint PRIMARY_5 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_DICTIONARY_TYPES
  add constraint DIC_TYPE_CODE unique (DIC_TYPE_CODE)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_DUTIES
prompt ============================
prompt
create table GECKO_DEMO.SYSTEM_DUTIES
(
  id   VARCHAR2(32 CHAR) not null,
  name VARCHAR2(100 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_DUTIES
  add constraint PRIMARY_6 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_DUTY_ACCOUNT
prompt ==================================
prompt
create table GECKO_DEMO.SYSTEM_DUTY_ACCOUNT
(
  id         NUMBER(10) not null,
  duty_id    VARCHAR2(64 CHAR) not null,
  account_id VARCHAR2(64 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_DUTY_ACCOUNT
  add constraint PRIMARY_7 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_LOGS
prompt ==========================
prompt
create table GECKO_DEMO.SYSTEM_LOGS
(
  id                VARCHAR2(32 CHAR) not null,
  content           BLOB,
  current_user_name VARCHAR2(50 CHAR) not null,
  ip                VARCHAR2(50 CHAR),
  log_level         VARCHAR2(50 CHAR) not null,
  record_time       DATE not null,
  request_url       VARCHAR2(50 CHAR) not null,
  request_params    VARCHAR2(2000 CHAR),
  call_method       VARCHAR2(500 CHAR),
  return_value      VARCHAR2(2800)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_LOGS
  add constraint PRIMARY_8 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_ORGANIZATIONS
prompt ===================================
prompt
create table GECKO_DEMO.SYSTEM_ORGANIZATIONS
(
  id           VARCHAR2(32 CHAR) not null,
  org_name     VARCHAR2(50 CHAR) not null,
  org_code     VARCHAR2(50 CHAR),
  org_category VARCHAR2(50 CHAR) not null,
  parent_org   VARCHAR2(50 CHAR),
  org_seq      VARCHAR2(500 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_ORGANIZATIONS
  add constraint PRIMARY_10 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_ORG_ACCOUNT
prompt =================================
prompt
create table GECKO_DEMO.SYSTEM_ORG_ACCOUNT
(
  id             NUMBER(32) not null,
  orgnization_id VARCHAR2(50 CHAR) not null,
  account_id     VARCHAR2(50 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_ORG_ACCOUNT
  add constraint PRIMARY_9 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_POSITIONS
prompt ===============================
prompt
create table GECKO_DEMO.SYSTEM_POSITIONS
(
  id   VARCHAR2(32 CHAR) not null,
  name VARCHAR2(50 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_POSITIONS
  add constraint PRIMARY_12 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_POSITIONS
  add constraint NAME unique (NAME)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_POSITION_ACCOUNT
prompt ======================================
prompt
create table GECKO_DEMO.SYSTEM_POSITION_ACCOUNT
(
  id          NUMBER(32) not null,
  account_id  VARCHAR2(64 CHAR) not null,
  position_id VARCHAR2(64 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_POSITION_ACCOUNT
  add constraint PRIMARY_11 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_RESOURCES
prompt ===============================
prompt
create table GECKO_DEMO.SYSTEM_RESOURCES
(
  id            VARCHAR2(32 CHAR) not null,
  source_name   VARCHAR2(50 CHAR) not null,
  resource_type VARCHAR2(50 CHAR) not null,
  is_platform   NUMBER(10) default '2' not null,
  parent_id     VARCHAR2(50 CHAR),
  resource_seq  VARCHAR2(500 CHAR),
  uri           VARCHAR2(50 CHAR),
  icon_cls      VARCHAR2(50 CHAR),
  sort_index    FLOAT,
  available     NUMBER(10),
  description   VARCHAR2(3000)
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_RESOURCES
  add constraint PRIMARY_13 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_ROLES
prompt ===========================
prompt
create table GECKO_DEMO.SYSTEM_ROLES
(
  id          VARCHAR2(32 CHAR) not null,
  role_name   VARCHAR2(50 CHAR) not null,
  description VARCHAR2(50 CHAR),
  role_type   NUMBER(3),
  available   NUMBER(10) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_ROLES
  add constraint PRIMARY_1 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table SYSTEM_ROLE_AUTHORITY
prompt ====================================
prompt
create table GECKO_DEMO.SYSTEM_ROLE_AUTHORITY
(
  id           NUMBER(32) not null,
  role_id      VARCHAR2(50 CHAR) not null,
  authority_id VARCHAR2(50 CHAR) not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.SYSTEM_ROLE_AUTHORITY
  add constraint PRIMARY_14 primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table T_COMPLAIN
prompt =========================
prompt
create table GECKO_DEMO.T_COMPLAIN
(
  id            VARCHAR2(10) not null,
  complainer    VARCHAR2(20) default '' not null,
  complainstate VARCHAR2(10) default '' not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GECKO_DEMO.T_COMPLAIN
  add primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table USPTOTEST
prompt ========================
prompt
create table GECKO_DEMO.USPTOTEST
(
  id            VARCHAR2(10) not null,
  complainer    VARCHAR2(20) default '' not null,
  complainstate VARCHAR2(10) default '' not null
)
tablespace GECKO_DEMO
  pctfree 10
  initrans 1
  maxtrans 255;
alter table GECKO_DEMO.USPTOTEST
  add primary key (ID)
  using index 
  tablespace GECKO_DEMO
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating sequence ACT_EVT_LOG_SEQ
prompt =================================
prompt
create sequence GECKO_DEMO.ACT_EVT_LOG_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SYSTEM_ACCOUNT_RESOURCES_ID_SE
prompt ================================================
prompt
create sequence GECKO_DEMO.SYSTEM_ACCOUNT_RESOURCES_ID_SE
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SYSTEM_ACCOUNT_ROLES_ID_SEQ
prompt =============================================
prompt
create sequence GECKO_DEMO.SYSTEM_ACCOUNT_ROLES_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SYSTEM_DUTY_ACCOUNT_ID_SEQ
prompt ============================================
prompt
create sequence GECKO_DEMO.SYSTEM_DUTY_ACCOUNT_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SYSTEM_ORG_ACCOUNT_ID_SEQ
prompt ===========================================
prompt
create sequence GECKO_DEMO.SYSTEM_ORG_ACCOUNT_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SYSTEM_POSITION_ACCOUNT_ID_SEQ
prompt ================================================
prompt
create sequence GECKO_DEMO.SYSTEM_POSITION_ACCOUNT_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SYSTEM_ROLE_AUTHORITY_ID_SEQ
prompt ==============================================
prompt
create sequence GECKO_DEMO.SYSTEM_ROLE_AUTHORITY_ID_SEQ
minvalue 1
maxvalue 999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating trigger SYSTEM_ACCOUNT_RESOURCES_ID_TR
prompt ===============================================
prompt
CREATE OR REPLACE TRIGGER GECKO_DEMO."SYSTEM_ACCOUNT_RESOURCES_ID_TR" BEFORE INSERT ON system_account_resources
FOR EACH ROW
DECLARE
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  system_account_resources_id_SE.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM system_account_resources;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT system_account_resources_id_SE.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger SYSTEM_ACCOUNT_ROLES_ID_TRG
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER GECKO_DEMO."SYSTEM_ACCOUNT_ROLES_ID_TRG" BEFORE INSERT ON system_account_roles
FOR EACH ROW
DECLARE
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  system_account_roles_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM system_account_roles;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT system_account_roles_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger SYSTEM_DUTY_ACCOUNT_ID_TRG
prompt ===========================================
prompt
CREATE OR REPLACE TRIGGER GECKO_DEMO."SYSTEM_DUTY_ACCOUNT_ID_TRG" BEFORE INSERT ON system_duty_account
FOR EACH ROW
DECLARE
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  system_duty_account_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM system_duty_account;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT system_duty_account_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger SYSTEM_ORG_ACCOUNT_ID_TRG
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER GECKO_DEMO."SYSTEM_ORG_ACCOUNT_ID_TRG" BEFORE INSERT ON system_org_account
FOR EACH ROW
DECLARE
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  system_org_account_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM system_org_account;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT system_org_account_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger SYSTEM_POSITION_ACCOUNT_ID_TRG
prompt ===============================================
prompt
CREATE OR REPLACE TRIGGER GECKO_DEMO."SYSTEM_POSITION_ACCOUNT_ID_TRG" BEFORE INSERT ON system_position_account
FOR EACH ROW
DECLARE
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  system_position_account_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM system_position_account;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT system_position_account_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/

prompt
prompt Creating trigger SYSTEM_ROLE_AUTHORITY_ID_TRG
prompt =============================================
prompt
CREATE OR REPLACE TRIGGER GECKO_DEMO."SYSTEM_ROLE_AUTHORITY_ID_TRG" BEFORE INSERT ON system_role_authority
FOR EACH ROW
DECLARE
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.id IS NULL THEN
    SELECT  system_role_authority_id_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN
      --get the max indentity value from the table
      SELECT NVL(max(id),0) INTO v_newVal FROM system_role_authority;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT system_role_authority_id_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal;
   -- assign the value from the sequence to emulate the identity column
   :new.id := v_newVal;
  END IF;
END;
/


spool off
