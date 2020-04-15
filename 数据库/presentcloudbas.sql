/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/3/27 10:05:18                           */
/*==============================================================*/


drop table if exists tb_call_theroll;

drop table if exists tb_course;

drop table if exists tb_course_time;

drop table if exists tb_course_time_rel;

drop table if exists tb_dict;

drop table if exists tb_mark;

drop table if exists tb_menu;

drop table if exists tb_permi;

drop table if exists tb_question;

drop table if exists tb_role;

drop table if exists tb_role_permi_rel;

drop table if exists tb_school_info;

drop table if exists tb_teach_stu;

drop table if exists tb_user;

drop table if exists tb_user_course_rel;

/*==============================================================*/
/* Table: tb_call_theroll                                       */
/*==============================================================*/
create table tb_call_theroll
(
   call_theroll_id      int(10) not null comment '��¼��ʶ',
   course_id            int(10) comment '�γ�ID',
   course_name          varchar(32) comment '�γ�����',
   user_id              int(10) comment '�û�ID',
   stu_no               varchar(100) comment 'ѧ��',
   stu_name             varchar(50) comment 'ѧ������',
   call_state           int(1) comment 'ǩ��״̬',
   call_date            datetime comment 'ǩ������',
   call_position        varchar(10) comment 'ǩ��λ��',
   primary key (call_theroll_id)
);

alter table tb_call_theroll comment 'ǩ����';

/*==============================================================*/
/* Table: tb_course                                             */
/*==============================================================*/
create table tb_course
(
   course_id            int(10) not null comment '��¼��ʶ',
   course_name          varchar(100) comment '�γ�����',
   description          varchar(500) comment '�γ�����',
   term                 varchar(10) comment 'ѧ��',
   class_date           varchar(10) comment 'ѧ��',
   class_order          int comment 'ѧ��',
   daily_weight         double comment '�ճ�����',
   final_weight         double,
   picket_line          int,
   creat_id             int(10),
   creat_date           datetime,
   primary key (course_id)
);

alter table tb_course comment '�γ̱�';

/*==============================================================*/
/* Table: tb_course_time                                        */
/*==============================================================*/
create table tb_course_time
(
   course_time_id       int(10) not null comment '��¼��ʶ',
   week                 int(1) comment '����(0-6)',
   start_period         int(2) comment '�ڴ�',
   end_period           int(2),
   class_location       varchar(100) comment '�Ͽεص�',
   shape                varchar(30) comment '���Ҳ���',
   is_active            int,
   primary key (course_time_id)
);

alter table tb_course_time comment '�γ�ʱ���';

/*==============================================================*/
/* Table: tb_course_time_rel                                    */
/*==============================================================*/
create table tb_course_time_rel
(
   couse_time_rel_id    int(10) not null comment '��¼��ʶ',
   course_id            int(10) comment '�γ�ID',
   course_time_id       int(10) comment '�γ�ʱ��ID',
   primary key (couse_time_rel_id)
);

alter table tb_course_time_rel comment '�γ�ʱ�������';

/*==============================================================*/
/* Table: tb_dict                                               */
/*==============================================================*/
create table tb_dict
(
   dict_id              int(10) not null comment '��¼��ʶ',
   dict_name            varchar(20) default NULL comment '�ֵ�����',
   dict_value           varchar(100) default NULL comment '�ֵ�ֵ',
   dict_category        varchar(20) default NULL comment '�ֵ����',
   parent_id            int(10) default NULL comment '�����ֵ�id',
   description          varchar(500) default NULL comment '�ֵ�����',
   creat_id             int(10),
   create_time          datetime default NULL comment '����ʱ��',
   up_id                int(10),
   up_time              datetime,
   primary key (dict_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֵ��';

alter table tb_dict comment '�ֵ��';

/*==============================================================*/
/* Table: tb_mark                                               */
/*==============================================================*/
create table tb_mark
(
   mark_id              int(10) not null comment '��¼��ʶ',
   course_id            int(10) comment '�γ�ID',
   user_id              int(10) not null comment '�û�ID',
   daily_score          float comment 'ƽʱ��',
   final_score          float comment '��ĩ��',
   exam_score           float,
   creat_id             int(10),
   datetime             datetime,
   up_id                int(10),
   up_date              datetime,
   primary key (mark_id)
);

alter table tb_mark comment '�γ̳ɼ���';

/*==============================================================*/
/* Table: tb_menu                                               */
/*==============================================================*/
create table tb_menu
(
   menu_id              int(10) not null comment '��¼��ʶ',
   parent_id            int(10) default NULL comment '����˵�id',
   menu_name            varchar(100) default NULL comment '�˵�����',
   level                int(11) default NULL comment '�˵�����',
   menu_url             varchar(255) default NULL comment '�˵���ַ',
   is_leaf              int(1) default NULL comment '�Ƿ�Ҷ�ڵ㣨0���ǣ�1����',
   css_class            varchar(100) comment '��ʽ',
   menu_icon_path       varchar(100) default NULL comment '�˵�ͼ��·��',
   creat_id             int(10),
   create_time          datetime default NULL comment '����ʱ��',
   up_id                int(10),
   up_time              datetime,
   is_visable           int(1) default NULL comment '�Ƿ���Ч��0���ǣ�1��',
   primary key (menu_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�˵���';

alter table tb_menu comment '�˵���';

/*==============================================================*/
/* Table: tb_permi                                              */
/*==============================================================*/
create table tb_permi
(
   permi_id             int(10) not null comment '��¼��ʶ',
   permi_name           varchar(100) default NULL comment 'Ȩ������',
   description          varchar(200) default NULL comment 'Ȩ������',
   req_url              varchar(200) default NULL comment '�����ַ',
   is_page              int(1) comment '�Ƿ�ҳ�棨0���ǣ�1����',
   is_menu              int(1) default NULL comment '�Ƿ�˵����ǣ�0����1��',
   create_time          datetime default NULL comment '����ʱ��',
   user_id              int(10) default NULL comment '�������û�id',
   up_id                int(10),
   up_time              datetime,
   permi_type           int(1) default 0 comment '�Ƿ�ɷ��ʣ�0���ɷ��ʣ�1���ܾ����ʣ�',
   primary key (permi_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ȩ�ޱ�';

alter table tb_permi comment 'Ȩ�ޱ�';

/*==============================================================*/
/* Table: tb_question                                           */
/*==============================================================*/
create table tb_question
(
   question_id          int(10) not null comment '��¼��ʶ',
   course_id            int(10) comment '�γ�ID',
   course_name          varchar(100) comment '�γ�����',
   user_id              int(10) comment '�û�ID',
   question_date        datetime comment '��������',
   score                double comment '����',
   primary key (question_id)
);

alter table tb_question comment '�����';

/*==============================================================*/
/* Table: tb_role                                               */
/*==============================================================*/
create table tb_role
(
   role_id              int(10) not null comment '��¼��ʶ',
   role_name            varchar(100) not null comment '��ɫ����',
   create_time          datetime default NULL comment '����ʱ��',
   description          varchar(500) comment '��ɫ����',
   primary key (role_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫ��';

alter table tb_role comment '��ɫ��';

/*==============================================================*/
/* Table: tb_role_permi_rel                                     */
/*==============================================================*/
create table tb_role_permi_rel
(
   role_permi_rel_id    int(10) not null comment '��¼��ʶ',
   role_id              int(10) default NULL comment '��ɫid',
   permi_id             int(10) default NULL comment 'Ȩ��id',
   primary key (role_permi_rel_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɫȨ�ޱ�';

alter table tb_role_permi_rel comment '��ɫȨ�ޱ�';

/*==============================================================*/
/* Table: tb_school_info                                        */
/*==============================================================*/
create table tb_school_info
(
   school_info_id       int(10) not null,
   school               varchar(100) not null comment 'ѧУ',
   college              varchar(100) not null comment 'ѧԺ',
   department           varchar(100) comment 'ϵ��',
   primary key (school_info_id)
);

alter table tb_school_info comment 'ѧУ��';

/*==============================================================*/
/* Table: tb_teach_stu                                          */
/*==============================================================*/
create table tb_teach_stu
(
   teach_stu_id         int(10) not null comment '��¼��ʶ',
   no                   varchar(20) comment 'ѧ��',
   name                 varchar(200) comment '����',
   gender               int(1) comment '�Ա�',
   birthday             datetime comment '����',
   grade                varchar(10) comment '�꼶',
   major                varchar(255) comment 'רҵ',
   class_no             int(2) comment '�༶',
   is_teacher           int(1) comment '�Ƿ��ʦ��0���ǣ�1����',
   user_id              int(10) comment '�û�ID',
   school_info_id       int(10),
   primary key (teach_stu_id)
);

alter table tb_teach_stu comment '��ʦѧ����';

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
create table tb_user
(
   user_id              int(10) not null comment '��¼��ʶ',
   user_no              varchar(100) not null default NULL comment '�û����',
   user_name            varchar(100) not null comment '�û���',
   role_id              int(10),
   pwd                  varchar(100) not null comment '����',
   phone                varchar(11) default NULL comment '�ֻ�����',
   email                varchar(100) default NULL comment '��������',
   create_time          datetime default NULL comment '����ʱ��',
   login_time           datetime default NULL comment '��½ʱ��',
   last_login_time      datetime default NULL comment '�ϴε�½ʱ��',
   count                int(10) default NULL comment '��½����',
   login_type           int(2) comment '��½��ʽ',
   status               int(1) comment '�û�״̬',
   primary key (user_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���';

alter table tb_user comment '�û���';

/*==============================================================*/
/* Table: tb_user_course_rel                                    */
/*==============================================================*/
create table tb_user_course_rel
(
   user_course_rel_id   int(10) not null comment '��¼��ʶ',
   user_id              int(10) comment '�û�ID',
   course_id            int(10) comment '�γ�ID',
   course_time_id       int(10),
   course_class_no      int(2) comment '�γ̰༶',
   primary key (user_course_rel_id)
);

alter table tb_user_course_rel comment '�û��γ̱�';

alter table tb_call_theroll add constraint FK_Reference_13 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_call_theroll add constraint FK_Reference_14 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_course_time_rel add constraint FK_Reference_10 foreign key (course_time_id)
      references tb_course_time (course_time_id) on delete restrict on update restrict;

alter table tb_course_time_rel add constraint FK_Reference_9 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_mark add constraint FK_Reference_17 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_mark add constraint FK_Reference_18 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_menu add constraint FK_Reference_21 foreign key (parent_id)
      references tb_menu (menu_id) on delete restrict on update restrict;

alter table tb_question add constraint FK_Reference_15 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_question add constraint FK_Reference_16 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_role_permi_rel add constraint FK_Reference_5 foreign key (permi_id)
      references tb_permi (permi_id) on delete restrict on update restrict;

alter table tb_role_permi_rel add constraint FK_Reference_6 foreign key (role_id)
      references tb_role (role_id) on delete restrict on update restrict;

alter table tb_teach_stu add constraint FK_Reference_11 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_teach_stu add constraint FK_Reference_19 foreign key (school_info_id)
      references tb_school_info (school_info_id) on delete restrict on update restrict;

alter table tb_user add constraint FK_Reference_22 foreign key (role_id)
      references tb_role (role_id) on delete restrict on update restrict;

alter table tb_user_course_rel add constraint FK_Reference_20 foreign key (course_time_id)
      references tb_course_time (course_time_id) on delete restrict on update restrict;

alter table tb_user_course_rel add constraint FK_Reference_7 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_user_course_rel add constraint FK_Reference_8 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

