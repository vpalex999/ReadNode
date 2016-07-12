
set catalog SOLID_DB_CATALOG;
commit work;



CREATE TABLE cnf_config (
       nodeid               integer NOT NULL,
       cnf_charge           tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE presence_server (
       nodeid               integer NOT NULL,
       prsn_server_id       integer NOT NULL,
       prsn_server_host     varchar(64) NOT NULL,
       prsn_server_port     integer NOT NULL,
       prsn_server_type     tinyint NOT NULL,
       PRIMARY KEY (nodeid, prsn_server_id)
);



CREATE SEQUENCE seq_prsn_server_id;



CREATE TABLE user_profile (
       nodeid               integer NOT NULL,
       user_profile_id      integer NOT NULL,
       user_profile_name    char(50) NOT NULL,
       user_profile_desc    wvarchar(64) NOT NULL,
       PRIMARY KEY (nodeid, user_profile_id)
);



CREATE UNIQUE INDEX AK1_user_profile ON user_profile
(
	nodeid                ASC,
	user_profile_name     ASC
);



CREATE TABLE enterprise_profile (
       nodeid               integer NOT NULL,
       ent_profile_id       smallint NOT NULL,
       ent_profile_name     wvarchar(64) NOT NULL,
       PRIMARY KEY (nodeid, ent_profile_id)
);



CREATE TABLE enterprise (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       ent_name             wvarchar(64) NOT NULL,
       ent_profile_id       smallint,
       ctx_inter_length     tinyint DEFAULT 0 NOT NULL,
       external_id          wvarchar(64),
       PRIMARY KEY (nodeid, bgid),
       FOREIGN KEY (nodeid, ent_profile_id)
                             REFERENCES enterprise_profile
);



CREATE UNIQUE INDEX AK1_enterprise ON enterprise
(
	nodeid                ASC,
	ent_name              ASC
);



CREATE DENSE SEQUENCE SEQ_enterprise;



CREATE TABLE department (
       nodeid               integer NOT NULL,
       dep_id               integer NOT NULL,
       dep_name             wvarchar(64) NOT NULL,
       bgid                 integer,
       PRIMARY KEY (nodeid, dep_id),
       FOREIGN KEY (nodeid, bgid)
                             REFERENCES enterprise
);



CREATE DENSE SEQUENCE SEQ_department;



CREATE TABLE as_user (
       nodeid               integer NOT NULL,
       userid               integer NOT NULL,
       usr_username         wvarchar(64) NOT NULL,
       usr_password         wvarchar(64) NOT NULL,
       usr_first_name       wvarchar(64),
       usr_last_name        wvarchar(64),
       usr_email            varchar(64),
       usr_state            tinyint DEFAULT 1 NOT NULL,
       usr_role             tinyint DEFAULT 2 NOT NULL,
       usr_desc             wvarchar(255),
       usr_remark           wvarchar(255),
       usr_middle_name      wvarchar(64),
       bgid                 integer DEFAULT 1 NOT NULL,
       dep_id               integer,
       user_profile_id      integer,
       usr_password2        wvarchar(64) DEFAULT NULL,
       PRIMARY KEY (nodeid, userid),
       FOREIGN KEY (nodeid, user_profile_id)
                             REFERENCES user_profile,
       FOREIGN KEY (nodeid, bgid)
                             REFERENCES enterprise,
       FOREIGN KEY (nodeid, dep_id)
                             REFERENCES department
);



CREATE UNIQUE INDEX AK1_as_user ON as_user
(
	nodeid                ASC,
	usr_username          ASC
);



CREATE TABLE presence_account (
       nodeid               integer NOT NULL,
       prsn_acnt_id         integer NOT NULL,
       userid               integer NOT NULL,
       prsn_acnt_user       wvarchar(64) NOT NULL,
       prsn_acnt_pwd        wvarchar(64) NOT NULL,
       prsn_acnt_autolog    tinyint DEFAULT 0 NOT NULL,
       prsn_server_id       integer NOT NULL,
       PRIMARY KEY (nodeid, prsn_acnt_id),
       FOREIGN KEY (nodeid, prsn_server_id)
                             REFERENCES presence_server,
       FOREIGN KEY (nodeid, userid)
                             REFERENCES as_user
);



CREATE SEQUENCE seq_prsn_acnt_id;



CREATE TABLE as_appl_server (
       nodeid               integer NOT NULL,
       appl_server_id       integer NOT NULL,
       as_hostname          varchar(64) NOT NULL,
       PRIMARY KEY (nodeid, appl_server_id)
);



CREATE UNIQUE INDEX AK1_as_appl_server ON as_appl_server
(
	nodeid                ASC,
	as_hostname           ASC
);



CREATE TABLE gta (
       nodeid               integer NOT NULL,
       gtaid                integer NOT NULL,
       gta_name             varchar(64) NOT NULL,
       appl_server_id       integer NOT NULL,
       gta_oosi             tinyint DEFAULT 0 NOT NULL,
       appl_password        wvarchar(64) NOT NULL,
       gta_password         wvarchar(64) NOT NULL,
       gta_state            tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, gtaid),
       FOREIGN KEY (nodeid, appl_server_id)
                             REFERENCES as_appl_server
);



CREATE UNIQUE INDEX AK1_gta ON gta
(
	nodeid                ASC,
	appl_server_id        ASC
);



CREATE TABLE call_server (
       nodeid               integer NOT NULL,
       cs_id                integer NOT NULL,
       cs_name              varchar(64) NOT NULL,
       cs_hostname          varchar(64) NOT NULL,
       cs_hostname_sec      varchar(64),
       csta_port            integer NOT NULL,
       dn_oper_mode         tinyint DEFAULT 0 NOT NULL,
       sip_port             integer,
       PRIMARY KEY (nodeid, cs_id)
);



CREATE TABLE gta_call_server (
       nodeid               integer NOT NULL,
       cs_id                integer NOT NULL,
       gtaid                integer NOT NULL,
       gta_cs_priority      tinyint DEFAULT 2 NOT NULL,
       gta_cs_oosi          tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cs_id, gtaid),
       FOREIGN KEY (nodeid, gtaid)
                             REFERENCES gta,
       FOREIGN KEY (nodeid, cs_id)
                             REFERENCES call_server
);



CREATE TABLE as_common_version (
       nodeid               integer NOT NULL,
       db_release           char(8) NOT NULL,
       data_release         char(8),
       PRIMARY KEY (nodeid)
);



CREATE TABLE phone_group (
       nodeid               integer NOT NULL,
       phone_groupid        tinyint NOT NULL,
       phone_group_name     varchar(50) NOT NULL,
       PRIMARY KEY (nodeid, phone_groupid)
);



CREATE UNIQUE INDEX AK1_phone_group ON phone_group
(
	nodeid                ASC,
	phone_group_name      ASC
);



CREATE TABLE phone (
       nodeid               integer NOT NULL,
       phoneid              integer NOT NULL,
       cs_id                integer,
       phone_number         varchar(20) NOT NULL,
       adtn_dn              varchar(20),
       phone_groupid        tinyint,
       dn_for_cdr           varchar(20),
       len_lac_for_cdr      tinyint DEFAULT 0 NOT NULL,
       dn_id                integer DEFAULT NULL,
       PRIMARY KEY (nodeid, phoneid),
       FOREIGN KEY (nodeid, phone_groupid)
                             REFERENCES phone_group,
       FOREIGN KEY (nodeid, cs_id)
                             REFERENCES call_server,
       FOREIGN KEY (nodeid, dn_id)
                             REFERENCES subs_dn_sn_conv
);



CREATE TABLE cnf_announcement (
       nodeid               integer NOT NULL,
       phoneid              integer NOT NULL,
       cnf_ann_type         tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, phoneid),
       FOREIGN KEY (nodeid, phoneid)
                             REFERENCES phone
);



CREATE TABLE cnf_dialin (
       nodeid               integer NOT NULL,
       phoneid              integer NOT NULL,
       cnf_id               bigint,
       reserved             tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, phoneid),
       FOREIGN KEY (nodeid, phoneid)
                             REFERENCES phone
);



CREATE TABLE cnf_mixer (
       nodeid               integer NOT NULL,
       phoneid              integer NOT NULL,
       cnf_id               bigint,
       PRIMARY KEY (nodeid, phoneid),
       FOREIGN KEY (nodeid, phoneid)
                             REFERENCES phone
);



CREATE TABLE mail_server (
       nodeid               integer NOT NULL,
       mail_server_id       integer NOT NULL,
       mail_server_name     varchar(32) NOT NULL,
       mail_server_addr     varchar(64) NOT NULL,
       from_addr            varchar(64),
       mail_server_type     tinyint DEFAULT 1 NOT NULL,
       from_addr_password   wvarchar(64),
       mail_server_port     integer DEFAULT 465 NOT NULL,
       PRIMARY KEY (nodeid, mail_server_id)
);



CREATE UNIQUE INDEX AK1_mail_server ON mail_server
(
	nodeid                ASC,
	mail_server_name      ASC
);



CREATE TABLE mc_data (
       nodeid               integer NOT NULL,
       mc_id                integer NOT NULL,
       mc_name              varchar(50) NOT NULL,
       mc_dflt              tinyint DEFAULT 0 NOT NULL,
       mc_enbl              tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, mc_id)
);



CREATE UNIQUE INDEX AK1_mc_data ON mc_data
(
	nodeid                ASC,
	mc_name               ASC
);



CREATE SEQUENCE seq_mc_id;



CREATE TABLE mc_property (
       nodeid               integer NOT NULL,
       mc_id                integer NOT NULL,
       mc_prop_name         varchar(50) NOT NULL,
       mc_prop_value        varchar(50) NOT NULL,
       PRIMARY KEY (nodeid, mc_id, mc_prop_name),
       FOREIGN KEY (nodeid, mc_id)
                             REFERENCES mc_data
);



CREATE TABLE as_application (
       nodeid               integer NOT NULL,
       appid                tinyint NOT NULL,
       app_name             varchar(25) NOT NULL,
       app_type             tinyint DEFAULT 2 NOT NULL,
       PRIMARY KEY (nodeid, appid)
);



CREATE UNIQUE INDEX AK1_as_application ON as_application
(
	nodeid                ASC,
	app_name              ASC
);



CREATE TABLE srv_perm (
       nodeid               integer NOT NULL,
       srv_permid           integer NOT NULL,
       srv_perm_name        varchar(64) NOT NULL,
       appid                tinyint NOT NULL,
       srv_perm_type        tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, srv_permid),
       FOREIGN KEY (nodeid, appid)
                             REFERENCES as_application
);



CREATE UNIQUE INDEX AK1_srv_perm ON srv_perm
(
	nodeid                ASC,
	srv_perm_name         ASC
);



CREATE TABLE phone_grp_srv_perm (
       nodeid               integer NOT NULL,
       phone_groupid        tinyint NOT NULL,
       srv_permid           integer NOT NULL,
       PRIMARY KEY (nodeid, phone_groupid, srv_permid),
       FOREIGN KEY (nodeid, srv_permid)
                             REFERENCES srv_perm,
       FOREIGN KEY (nodeid, phone_groupid)
                             REFERENCES phone_group
);



CREATE TABLE user_phone (
       nodeid               integer NOT NULL,
       userid               integer NOT NULL,
       phoneid              integer NOT NULL,
       PRIMARY KEY (nodeid, userid, phoneid),
       FOREIGN KEY (nodeid, userid)
                             REFERENCES as_user,
       FOREIGN KEY (nodeid, phoneid)
                             REFERENCES phone
);



CREATE TABLE user_centrex_auth (
       nodeid               integer NOT NULL,
       userid               integer NOT NULL,
       bgid                 integer NOT NULL,
       cgid                 smallint NOT NULL,
       user_ctx_desc        wvarchar(64) NOT NULL,
       PRIMARY KEY (nodeid, userid, bgid, cgid),
       FOREIGN KEY (nodeid, userid)
                             REFERENCES as_user
);



CREATE TABLE log_setting (
       nodeid               integer NOT NULL,
       log_setting_id       tinyint NOT NULL,
       log_sett_name        varchar(30) NOT NULL,
       max_log_file         integer NOT NULL,
       total_log_file       integer NOT NULL,
       detail_level         tinyint NOT NULL,
       thread_name_pt       tinyint DEFAULT 1 NOT NULL,
       thread_id_pt         tinyint DEFAULT 1 NOT NULL,
       caller_method_pt     tinyint DEFAULT 0 NOT NULL,
       console_output       tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, log_setting_id)
);



CREATE UNIQUE INDEX AK1_log_setting ON log_setting
(
	nodeid                ASC,
	log_sett_name         ASC
);



CREATE TABLE app_cs (
       nodeid               integer NOT NULL,
       cs_id                integer NOT NULL,
       appid                tinyint NOT NULL,
       PRIMARY KEY (nodeid, cs_id, appid),
       FOREIGN KEY (nodeid, appid)
                             REFERENCES as_application,
       FOREIGN KEY (nodeid, cs_id)
                             REFERENCES call_server
);



CREATE TABLE rmi_registry (
       nodeid               integer NOT NULL,
       rmi_name             varchar(255) NOT NULL,
       rmi_object           long varbinary,
       PRIMARY KEY (nodeid, rmi_name)
);



CREATE TABLE ent_services (
       nodeid               integer NOT NULL,
       srv_permid           integer NOT NULL,
       ent_profile_id       smallint NOT NULL,
       perm_quantity        integer NOT NULL,
       PRIMARY KEY (nodeid, srv_permid, ent_profile_id),
       FOREIGN KEY (nodeid, srv_permid)
                             REFERENCES srv_perm,
       FOREIGN KEY (nodeid, ent_profile_id)
                             REFERENCES enterprise_profile
);



CREATE TABLE message_channel (
       nodeid               integer NOT NULL,
       ch_id                integer NOT NULL,
       ch_name              varchar(50) NOT NULL,
       ch_type              varchar(50) NOT NULL,
       PRIMARY KEY (nodeid, ch_id)
);



CREATE UNIQUE INDEX AK1_message_channel ON message_channel
(
	nodeid                ASC,
	ch_name               ASC
);



CREATE SEQUENCE seq_ch_id;



CREATE TABLE incm_sms_rule (
       nodeid               integer NOT NULL,
       rule_id              integer NOT NULL,
       ch_id                integer,
       service_pattern      varchar(50),
       dest_number          varchar(50),
       PRIMARY KEY (nodeid, rule_id),
       FOREIGN KEY (nodeid, ch_id)
                             REFERENCES message_channel
		ON DELETE SET NULL
		ON UPDATE SET NULL
);



CREATE SEQUENCE seq_sms_rule_id;



CREATE TABLE service_code (
       nodeid               integer NOT NULL,
       sc_id                integer NOT NULL,
       mc_id                integer,
       sc_string            varchar(50) NOT NULL,
       PRIMARY KEY (nodeid, sc_id),
       FOREIGN KEY (nodeid, mc_id)
                             REFERENCES mc_data
		ON DELETE SET NULL
		ON UPDATE SET NULL
);



CREATE UNIQUE INDEX AK1_service_code ON service_code
(
	nodeid                ASC,
	mc_id                 ASC,
	sc_string             ASC
);



CREATE SEQUENCE seq_sc_id;



CREATE TABLE incm_ussd_rule (
       nodeid               integer NOT NULL,
       rule_id              integer NOT NULL,
       ch_id                integer NOT NULL,
       sc_id                integer NOT NULL,
       PRIMARY KEY (nodeid, rule_id),
       FOREIGN KEY (nodeid, ch_id)
                             REFERENCES message_channel
		ON DELETE SET NULL
		ON UPDATE SET NULL,
       FOREIGN KEY (nodeid, sc_id)
                             REFERENCES service_code
		ON DELETE SET NULL
		ON UPDATE SET NULL
);



CREATE SEQUENCE seq_ussd_rule_id;



CREATE TABLE app_mc (
       nodeid               integer NOT NULL,
       appid                tinyint NOT NULL,
       mc_id                integer NOT NULL,
       PRIMARY KEY (nodeid, appid),
       FOREIGN KEY (nodeid, mc_id)
                             REFERENCES mc_data,
       FOREIGN KEY (nodeid, appid)
                             REFERENCES as_application
);



CREATE TABLE user_profile_perm (
       nodeid               integer NOT NULL,
       user_profile_id      integer NOT NULL,
       srv_permid           integer NOT NULL,
       PRIMARY KEY (nodeid, srv_permid, user_profile_id),
       FOREIGN KEY (nodeid, user_profile_id)
                             REFERENCES user_profile,
       FOREIGN KEY (nodeid, srv_permid)
                             REFERENCES srv_perm
);



CREATE TABLE connection_type (
       nodeid               integer NOT NULL,
       conn_type_id         tinyint NOT NULL,
       conn_type_name       varchar(3) NOT NULL,
       PRIMARY KEY (nodeid, conn_type_id)
);



CREATE UNIQUE INDEX AK1_connection_type ON connection_type
(
	nodeid                ASC,
	conn_type_name        ASC
);



CREATE TABLE mc_connection (
       nodeid               integer NOT NULL,
       connection_id        integer NOT NULL,
       mc_id                integer,
       connection_name      varchar(50) NOT NULL,
       connect_address      varchar(50) NOT NULL,
       connect_port         integer,
       conn_username        varchar(50),
       conn_password        varchar(50),
       conn_type_id         tinyint,
       PRIMARY KEY (nodeid, connection_id),
       FOREIGN KEY (nodeid, mc_id)
                             REFERENCES mc_data
		ON DELETE SET NULL
		ON UPDATE SET NULL,
       FOREIGN KEY (nodeid, conn_type_id)
                             REFERENCES connection_type
		ON DELETE SET NULL
		ON UPDATE SET NULL
);



CREATE UNIQUE INDEX AK1_mc_connection ON mc_connection
(
	nodeid                ASC,
	connection_name       ASC
);



CREATE SEQUENCE seq_connection_id;



CREATE TABLE app_channel (
       nodeid               integer NOT NULL,
       appid                tinyint NOT NULL,
       ch_id                integer NOT NULL,
       PRIMARY KEY (nodeid, appid, ch_id),
       FOREIGN KEY (nodeid, ch_id)
                             REFERENCES message_channel,
       FOREIGN KEY (nodeid, appid)
                             REFERENCES as_application
);



CREATE TABLE appl_deploy (
       nodeid               integer NOT NULL,
       deploy_id            integer NOT NULL,
       appl_server_id       integer NOT NULL,
       appid                tinyint NOT NULL,
       part_name            varchar(32) NOT NULL,
       part_version         varchar(8),
       appl_status          tinyint,
       start_flag           tinyint DEFAULT 0 NOT NULL,
       appl_remark          wvarchar(255),
       enable_flag          tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, deploy_id),
       FOREIGN KEY (nodeid, appid)
                             REFERENCES as_application,
       FOREIGN KEY (nodeid, appl_server_id)
                             REFERENCES as_appl_server
);



CREATE SEQUENCE seq_deploy_id;



CREATE TABLE user_device (
       nodeid               integer NOT NULL,
       userid               integer NOT NULL,
       deviceid             varchar(32) NOT NULL,
       PRIMARY KEY (nodeid, userid, deviceid),
       FOREIGN KEY (nodeid, userid)
                             REFERENCES as_user
);



CREATE TABLE user_phone_appl (
       nodeid               integer NOT NULL,
       userid               integer NOT NULL,
       phoneid              integer NOT NULL,
       appid                tinyint NOT NULL,
       PRIMARY KEY (nodeid, userid, phoneid, appid),
       FOREIGN KEY (nodeid, userid)
                             REFERENCES as_user,
       FOREIGN KEY (nodeid, phoneid)
                             REFERENCES phone,
       FOREIGN KEY (nodeid, appid)
                             REFERENCES as_application
);



CREATE TABLE calllog (
       nodeid               integer NOT NULL,
       calllogid            integer NOT NULL,
       calllog_name         varchar(64) NOT NULL,
       appl_server_id       integer NOT NULL,
       iptv_hostname        varchar(64),
       iptv_dstport         integer DEFAULT 0 NOT NULL,
       iptv_srcport         integer DEFAULT 0 NOT NULL,
       calllog_state        tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, calllogid),
       FOREIGN KEY (nodeid, appl_server_id)
                             REFERENCES as_appl_server
);



CREATE UNIQUE INDEX AK1_calllog ON calllog
(
	nodeid                ASC,
	appl_server_id        ASC
);



CREATE TABLE calllog_profile (
       nodeid               integer NOT NULL,
       cl_profileid         smallint NOT NULL,
       cl_profile_name      varchar(64) NOT NULL,
       calllogid            integer NOT NULL,
       phone_groupid        tinyint NOT NULL,
       cl_state             tinyint DEFAULT 1 NOT NULL,
       cl_record_lifetime   integer DEFAULT 0 NOT NULL,
       cl_maxrecords        integer DEFAULT 0 NOT NULL,
       cl_dbwrite           tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, cl_profileid),
       FOREIGN KEY (nodeid, phone_groupid)
                             REFERENCES phone_group,
       FOREIGN KEY (nodeid, calllogid)
                             REFERENCES calllog
);



CREATE UNIQUE INDEX AK1_calllog_profile ON calllog_profile
(
	nodeid                ASC,
	cl_profile_name       ASC
);



CREATE UNIQUE INDEX AK2_calllog_profile ON calllog_profile
(
	nodeid                ASC,
	phone_groupid         ASC
);



commit work;


