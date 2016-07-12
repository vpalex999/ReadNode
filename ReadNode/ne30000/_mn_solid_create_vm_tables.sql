
set catalog SOLID_DB_CATALOG;
commit work;



CREATE TABLE vm_system (
       nodeid               integer NOT NULL,
       vm_active            tinyint NOT NULL,
       vm_language          char(5) NOT NULL,
       session_timeout      smallint DEFAULT 300 NOT NULL,
       system_email         char(50) NOT NULL,
       cfx_email            char(50) NOT NULL,
       anonymous_email      char(50) NOT NULL,
       auth_attempts        tinyint DEFAULT 3 NOT NULL,
       vm_notify_url        char(255) NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE vm_domain (
       nodeid               integer NOT NULL,
       domain_id            smallint NOT NULL,
       domain_name          char(80) NOT NULL,
       transport_pfx        char(32) NOT NULL,
       domain_active        smallint NOT NULL,
       max_alias_cnt        smallint DEFAULT 20 NOT NULL,
       max_mailbox_cnt      smallint DEFAULT 100 NOT NULL,
       PRIMARY KEY (nodeid, domain_id)
);



CREATE UNIQUE INDEX AK1_vm_domain ON vm_domain
(
	nodeid                ASC,
	domain_name           ASC
);



CREATE TABLE vm_grp_box_feature (
       nodeid               integer NOT NULL,
       grp_box_feat_id      smallint NOT NULL,
       sent_folder_enbl     tinyint DEFAULT 0 NOT NULL,
       allow_transfer_ext   tinyint DEFAULT 0 NOT NULL,
       assist_dstdn         char(25),
       del_folder_enbl      tinyint DEFAULT 0 NOT NULL,
       asr_enabled          tinyint DEFAULT 0 NOT NULL,
       inbox_lifetime       smallint DEFAULT 10 NOT NULL,
       vm_language          char(5) NOT NULL,
       max_disk_quota       integer DEFAULT 7200000 NOT NULL,
       max_greet_cnt        tinyint DEFAULT 1 NOT NULL,
       max_greet_dur        tinyint DEFAULT 15 NOT NULL,
       max_msg_cnt          smallint DEFAULT 50 NOT NULL,
       max_msg_size         integer DEFAULT 480000 NOT NULL,
       mwi_enabled          tinyint DEFAULT 1 NOT NULL,
       sent_lifetime        smallint DEFAULT 0 NOT NULL,
       settings_name        char(32) NOT NULL,
       sms_enabled          tinyint DEFAULT 0 NOT NULL,
       deleted_lifetime     smallint DEFAULT 10 NOT NULL,
       use_dtmf             tinyint DEFAULT 1 NOT NULL,
       use_tts              tinyint DEFAULT 0 NOT NULL,
       email_enabled        tinyint DEFAULT 0 NOT NULL,
       vm_callbackphoneid   integer DEFAULT NULL,
       PRIMARY KEY (nodeid, grp_box_feat_id),
       FOREIGN KEY (nodeid, vm_callbackphoneid)
                             REFERENCES phone
);



CREATE TABLE vm_box (
       nodeid               integer NOT NULL,
       box_id               integer NOT NULL,
       vm_box_name          char(32) NOT NULL,
       callback_dstdn       char(25) NOT NULL,
       disk_usage           integer NOT NULL,
       custom_greet_valid   char(8) DEFAULT 0 NOT NULL,
       mail_dir             char(255) NOT NULL,
       mwi_status           tinyint DEFAULT 0 NOT NULL,
       box_overflowed       tinyint DEFAULT 0 NOT NULL,
       password_expired     tinyint DEFAULT 1 NOT NULL,
       trust_personal_nr    tinyint DEFAULT 1 NOT NULL,
       use_sent_folder      tinyint DEFAULT 0 NOT NULL,
       use_del_folder       tinyint DEFAULT 0 NOT NULL,
       box_username         char(64) NOT NULL,
       box_active           smallint DEFAULT 1 NOT NULL,
       custom_greeting_id   char(8) DEFAULT 0 NOT NULL,
       box_pswd             varchar(32) NOT NULL,
       system_greeting_fn   char(128) NOT NULL,
       prs_box_feat_id      smallint,
       grp_box_feat_id      smallint NOT NULL,
       domain_id            smallint NOT NULL,
       msg_count            smallint DEFAULT 0 NOT NULL,
       queued_disk_usage    integer DEFAULT 0 NOT NULL,
       queued_msg_count     smallint DEFAULT 0 NOT NULL,
       email_new_msg        tinyint DEFAULT 0 NOT NULL,
       email_overflow       tinyint DEFAULT 0 NOT NULL,
       notification_email   char(50),
       PRIMARY KEY (nodeid, box_id),
       FOREIGN KEY (nodeid, domain_id)
                             REFERENCES vm_domain,
       FOREIGN KEY (nodeid, grp_box_feat_id)
                             REFERENCES vm_grp_box_feature
);



CREATE UNIQUE INDEX AK1_vm_box ON vm_box
(
	nodeid                ASC,
	vm_box_name           ASC
);



CREATE TABLE vm_user (
       nodeid               integer NOT NULL,
       phoneid              integer NOT NULL,
       personal_phone       tinyint DEFAULT 0 NOT NULL,
       dflt_callback_nr     tinyint DEFAULT 0 NOT NULL,
       mwi_new_msg          tinyint DEFAULT 0 NOT NULL,
       sms_new_msg          tinyint DEFAULT 0 NOT NULL,
       mwi_emulation        tinyint DEFAULT 0 NOT NULL,
       sms_overflow         tinyint NOT NULL,
       box_id               integer NOT NULL,
       PRIMARY KEY (phoneid, nodeid),
       FOREIGN KEY (nodeid, box_id)
                             REFERENCES vm_box
);



CREATE TABLE vm_admin_event (
       nodeid               integer NOT NULL,
       vm_event_id          tinyint NOT NULL,
       vm_event_desc        char(128) NOT NULL,
       sms_ordered          tinyint DEFAULT 0 NOT NULL,
       call_ordered         tinyint DEFAULT 0 NOT NULL,
       notify_number        char(25) NOT NULL,
       email_ordered        tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, vm_event_id)
);



CREATE TABLE vm_file_log (
       nodeid               integer NOT NULL,
       file_log_id          tinyint NOT NULL,
       max_file_size        integer DEFAULT 4096 NOT NULL,
       max_archive_cnt      tinyint DEFAULT 4 NOT NULL,
       log_level            tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, file_log_id)
);



CREATE TABLE vm_mail_client_set (
       nodeid               integer NOT NULL,
       mail_settings_id     smallint NOT NULL,
       vm_smtp_address      varchar(100) NOT NULL,
       vm_pop_address       varchar(100) DEFAULT NULL,
       vm_client_username   varchar(30) NOT NULL,
       vm_client_password   varchar(100) NOT NULL,
       vm_smtp_port         integer DEFAULT 25 NOT NULL,
       vm_pop_port          integer DEFAULT 110 NOT NULL,
       vm_smtp_auth_type    tinyint DEFAULT 0 NOT NULL,
       vm_pop_auth_type     tinyint DEFAULT 0 NOT NULL,
       vm_mail_client_add   varchar(60),
       PRIMARY KEY (nodeid, mail_settings_id)
);



CREATE TABLE vm_feature_mail_client (
       nodeid               integer NOT NULL,
       mail_settings_id     smallint NOT NULL,
       grp_box_feat_id      smallint NOT NULL,
       PRIMARY KEY (nodeid, mail_settings_id, grp_box_feat_id),
       FOREIGN KEY (nodeid, mail_settings_id)
                             REFERENCES vm_mail_client_set,
       FOREIGN KEY (nodeid, grp_box_feat_id)
                             REFERENCES vm_grp_box_feature
);



CREATE TABLE vm_admin (
       nodeid               integer NOT NULL,
       vm_admin_id          integer NOT NULL,
       sms_sys_overflow     tinyint DEFAULT 0 NOT NULL,
       sms_user_overflow    tinyint DEFAULT 0 NOT NULL,
       admin_email          char(50) NOT NULL,
       admin_sms_nr         char(25) NOT NULL,
       phoneid              integer DEFAULT NULL,
       mail_settings_id     smallint DEFAULT NULL,
       PRIMARY KEY (nodeid, vm_admin_id),
       FOREIGN KEY (nodeid, mail_settings_id)
                             REFERENCES vm_mail_client_set,
       FOREIGN KEY (nodeid, phoneid)
                             REFERENCES phone
);



commit work;


