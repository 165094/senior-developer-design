/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/6/5 9:30:22                             */
/*==============================================================*/


drop table if exists PACK_TASK;

drop table if exists PACK_TASK_DETAIL;

drop table if exists PACK_TASK_RECORD;

drop index PT_RD_INDEX_PRI on PT_RECORD_DETAIL;

drop table if exists PT_RECORD_DETAIL;

drop table if exists VERSION_LIST;

drop table if exists VERSION_LIST_DETAIL;

/*==============================================================*/
/* Table: PACK_TASK                                             */
/*==============================================================*/
create table PACK_TASK
(
   PACK_TASK_ID         varchar(16) not null,
   LIST_ID              varchar(16) comment '�嵥ID',
   SUBMIT_LIST_PERSON   varchar(32) comment '�嵥�ύ��',
   SUBMIT_TIME          timestamp,
   SUBMIT_BS            varchar(32) comment '��Ҫ�ϵ�BS',
   STATUS               char(1) comment '0-�ύ
            1-�����
            2-������
            3-���ϻ���
            4-ʧ��',
   primary key (PACK_TASK_ID)
);

alter table PACK_TASK comment '��������';

/*==============================================================*/
/* Table: PACK_TASK_DETAIL                                      */
/*==============================================================*/
create table PACK_TASK_DETAIL
(
   PT_DETAIL_ID         varchar(16) not null comment '���������ϸID',
   PACK_TASK_ID         varchar(16) comment '�������ID',
   DETAIL_ID            varchar(16) comment '�嵥��ϸ��ID',
   CODE_SUB_PERSON      varchar(32) comment '�����ύ��',
   CODE_SUB_TIME        timestamp comment '�����ύʱ��',
   CODE_BRANCH_VERSION  varchar(32) comment '��֧�İ汾',
   CODE_MAIN_VERSION    varchar(16) comment '�����Ӧ�������ɵİ汾',
   primary key (PT_DETAIL_ID)
);

alter table PACK_TASK_DETAIL comment '���������ϸ';

/*==============================================================*/
/* Table: PACK_TASK_RECORD                                      */
/*==============================================================*/
create table PACK_TASK_RECORD
(
   PACK_RECORD_ID       varchar(16) not null comment '�����¼ID',
   EXECUTANT_NAME       varchar(32) comment 'ִ����',
   EXECUTE_TIME         timestamp comment 'ִ��ʱ��',
   BS                   varchar(16) comment '�ϵ�BS',
   primary key (PACK_RECORD_ID)
);

alter table PACK_TASK_RECORD comment '�����¼(��¼RCT����ļ�¼)';

/*==============================================================*/
/* Table: PT_RECORD_DETAIL                                      */
/*==============================================================*/
create table PT_RECORD_DETAIL
(
   PACK_RECORD_ID       varchar(16) comment '�����¼ID',
   PACK_TASK_ID         varchar(16) comment '�������ID'
);

alter table PT_RECORD_DETAIL comment '��������¼��ϸ(��¼RCT�������ϸ)';

/*==============================================================*/
/* Index: PT_RD_INDEX_PRI                                       */
/*==============================================================*/
create index PT_RD_INDEX_PRI on PT_RECORD_DETAIL
(
   
);

/*==============================================================*/
/* Table: VERSION_LIST                                          */
/*==============================================================*/
create table VERSION_LIST
(
   LIST_ID              varchar(16) not null comment '�嵥ID',
   LIST_NAME            varchar(128) comment '�嵥����',
   ASSIGNMENT_NO        varchar(32) comment '������',
   DEVELOPMENT_NO       varchar(32) comment '�������',
   PLAN_ON_DATE         datetime comment 'Ԥ������ʱ��',
   primary key (LIST_ID)
);

alter table VERSION_LIST comment '�嵥�б�';

/*==============================================================*/
/* Table: VERSION_LIST_DETAIL                                   */
/*==============================================================*/
create table VERSION_LIST_DETAIL
(
   DETAIL_ID            varchar(16) not null comment '��ϸ�嵥ID',
   LIST_ID              varchar(16) comment '�嵥ID',
   MODIFY_PROJECT       varchar(64) comment '�޸Ĺ���',
   EXPORT_TYPE          varchar(2) comment '��������',
   EXPORT_NAME          varchar(128) comment '����what',
   EXPORT_LOCATION      varchar(32) comment '������where',
   CODE_LOCATION        varchar(512) comment '����Ŀ¼',
   BRANCH_EFFECT_VERSION varchar(32) comment '��֧��Ч�汾',
   BRANCH_OLD_VERSION   varchar(32) comment '�޸�ǰ�汾',
   CHECK_PERSON         varchar(32) comment '�����',
   primary key (DETAIL_ID)
);

alter table VERSION_LIST_DETAIL comment '�嵥��ϸ�б�';

