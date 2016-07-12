
set catalog SOLID_DB_CATALOG;
commit work;



CREATE TABLE ims_user_chrg_dgn (
       nodeid               integer NOT NULL,
       subs_alias           char(50) NOT NULL,
       PRIMARY KEY (nodeid, subs_alias)
);



CREATE TABLE shelf_status (
       nodeid               integer NOT NULL,
       record_type          tinyint NOT NULL,
       hw_id                char(32) DEFAULT '' NOT NULL,
       shelf_timestamp      integer DEFAULT 0 NOT NULL,
       shelf_response       char(32) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid, record_type)
);



CREATE TABLE subs_state_s (
       nodeid               integer NOT NULL,
       notify_grp           integer NOT NULL,
       ims_reg_subs_idx     integer NOT NULL,
       call_id              varchar(127) NOT NULL,
       dn                   integer NOT NULL,
       locseqnr             integer NOT NULL,
       event_type           tinyint NOT NULL,
       sip_msg              varchar(500) NOT NULL,
       sip_msg_len          smallint NOT NULL,
       sdl_pid              integer,
       expires              integer NOT NULL,
       subscribe_expires    integer NOT NULL,
       PRIMARY KEY (nodeid, notify_grp, ims_reg_subs_idx)
);



CREATE TABLE subs_state_p (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ims_reg_subs_idx     integer NOT NULL,
       call_id              varchar(127) NOT NULL,
       monitored_nr         char(25) NOT NULL,
       locseqnr             integer NOT NULL,
       event_type           tinyint NOT NULL,
       sip_msg              varchar(500) NOT NULL,
       sip_msg_len          smallint NOT NULL,
       sdl_pid              integer,
       expires              integer NOT NULL,
       subscribe_expires    integer NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, ims_reg_subs_idx)
);



CREATE TABLE agcf_registration (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       agcf_rgstr_sts       smallint DEFAULT 1 NOT NULL,
       agcf_auth_resp       char(32) DEFAULT NULL,
       ims_routeid          smallint DEFAULT 0 NOT NULL,
       agcf_nonce           char(64) DEFAULT NULL,
       agcf_opaque          char(64) DEFAULT NULL,
       agcf_qop             tinyint DEFAULT 0 NOT NULL,
       agcf_nonce_count     smallint DEFAULT 0 NOT NULL,
       agcf_search_sts      tinyint DEFAULT 0 NOT NULL,
       dial_tone_type       tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr)
);



CREATE INDEX IE1_agcf_registration ON agcf_registration
(
	nodeid                ASC,
	agcf_rgstr_sts        ASC,
	agcf_search_sts       ASC,
	ims_routeid           ASC
);



CREATE TABLE ims_srvprf (
       nodeid               integer NOT NULL,
       ims_user_prfid       integer NOT NULL,
       xml_prf              varchar(15000) NOT NULL,
       PRIMARY KEY (nodeid, ims_user_prfid)
);



CREATE TABLE delivery_report (
       nodeid               integer NOT NULL,
       dr_id                integer NOT NULL,
       appid                tinyint,
       dr_msg_id            varchar(50) NOT NULL,
       mc_session_id        varchar(50) NOT NULL,
       msg_text_ucs2        WVARCHAR(160) NOT NULL,
       dr_as_id             varchar(50) NOT NULL,
       dest_number          varchar(50) NOT NULL,
       src_number           varchar(50) NOT NULL,
       sms_status           tinyint NOT NULL,
       errcod               integer DEFAULT 0 NOT NULL,
       wait_until           timestamp,
       sms_send_time        timestamp NOT NULL,
       receipt_type         tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, dr_id),
       FOREIGN KEY (nodeid, appid)
                             REFERENCES as_application
		ON DELETE SET NULL
		ON UPDATE SET NULL
);



CREATE SEQUENCE seq_dr_id;



CREATE TABLE as_it_gen_nm_items (
       table_name           varchar(255) NOT NULL,
       trigger_type         varchar(255) NOT NULL,
       table_key            varchar(255) NOT NULL,
       PRIMARY KEY (table_name, trigger_type)
);



CREATE TABLE call_record (
       nodeid               integer NOT NULL,
       call_recordid        integer NOT NULL,
       cr_type              tinyint NOT NULL,
       cr_date_time         bigint NOT NULL,
       phoneid              integer NOT NULL,
       party_dn             varchar(25) NOT NULL,
       cr_duration          varchar(8) NOT NULL,
       PRIMARY KEY (nodeid, call_recordid),
       FOREIGN KEY (nodeid, phoneid)
                             REFERENCES phone
);



CREATE INDEX IE1_call_record ON call_record
(
	nodeid                ASC,
	phoneid               ASC,
	cr_type               ASC,
	call_recordid         ASC
);



CREATE SEQUENCE seq_call_recordid;



CREATE TABLE conference (
       nodeid               integer NOT NULL,
       cnf_id               bigint NOT NULL,
       cnf_request_id       varchar(20) NOT NULL,
       appl_server_id       integer NOT NULL,
       cnf_type             tinyint DEFAULT 0 NOT NULL,
       cnf_moderator_id     integer NOT NULL,
       cnf_maxparticipant   integer,
       cnf_security_type    tinyint DEFAULT 0 NOT NULL,
       cnf_pin              varchar(9),
       cnf_state            tinyint DEFAULT 0 NOT NULL,
       cnf_start_date       bigint DEFAULT 0 NOT NULL,
       cnf_stop_date        bigint DEFAULT 0 NOT NULL,
       cnf_delete_on_end    tinyint DEFAULT 1 NOT NULL,
       cnf_name             wvarchar(25),
       PRIMARY KEY (nodeid, cnf_id),
       FOREIGN KEY (nodeid, cnf_moderator_id)
                             REFERENCES as_user,
       FOREIGN KEY (nodeid, appl_server_id)
                             REFERENCES as_appl_server
);



CREATE SEQUENCE seq_cnf_id;



CREATE TABLE cnf_part_config (
       nodeid               integer NOT NULL,
       cnf_id               bigint NOT NULL,
       cnf_part_uri         varchar(60) NOT NULL,
       participant_role     tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cnf_id, cnf_part_uri),
       FOREIGN KEY (nodeid, cnf_id)
                             REFERENCES conference
);



CREATE TABLE db_notification (
       nodeid               integer NOT NULL,
       catalog_name         varchar(25) NOT NULL,
       PRIMARY KEY (nodeid, catalog_name)
);



CREATE TABLE scheduled_task (
       nodeid               integer NOT NULL,
       stsk_id              bigint NOT NULL,
       stsk_app_snd_id      integer DEFAULT 0 NOT NULL,
       stsk_app_snd_name    varchar(50),
       stsk_app_rcv_id      integer NOT NULL,
       stsk_app_rcv_name    varchar(50),
       stsk_name            varchar(50) NOT NULL,
       stsk_desc            varchar(250),
       stsk_ord_time        timestamp NOT NULL,
       stsk_parameter       varchar(250),
       stsk_state           tinyint NOT NULL,
       stsk_start_time      timestamp,
       stsk_end_time        timestamp,
       stsk_scenario        varchar(50),
       stsk_exec_time       timestamp,
       stsk_mis_time_flg    tinyint,
       stsk_pause           integer,
       stsk_recurr_num      integer,
       stsk_type            tinyint NOT NULL,
       stsk_parameter_l     long varchar,
       PRIMARY KEY (nodeid, stsk_id),
       FOREIGN KEY (nodeid, stsk_app_rcv_id)
                             REFERENCES as_application
);



CREATE SEQUENCE seq_stsk_id;



CREATE TABLE cnf_participant (
       nodeid               integer NOT NULL,
       cnf_participant_id   bigint NOT NULL,
       cnf_id               bigint NOT NULL,
       cnf_part_uri         varchar(60) NOT NULL,
       participant_state    tinyint DEFAULT 0 NOT NULL,
       cnf_user_callid      varchar(128) NOT NULL,
       cnf_channel_callid   varchar(128) NOT NULL,
       PRIMARY KEY (nodeid, cnf_participant_id),
       FOREIGN KEY (nodeid, cnf_id)
                             REFERENCES conference
);



CREATE SEQUENCE seq_cnf_participant_id;



CREATE TABLE pxgw_call_dir (
       nodeid               integer NOT NULL,
       appl_server_id       integer NOT NULL,
       phone_number         varchar(20) NOT NULL,
       handled_call_event   char(20),
       correlator           char(15) NOT NULL,
       handle_call_uri      char(200) NOT NULL,
       used_service         tinyint NOT NULL,
       PRIMARY KEY (nodeid, appl_server_id, phone_number),
       FOREIGN KEY (nodeid, appl_server_id)
                             REFERENCES as_appl_server
);



CREATE TABLE vm_prs_box_feature (
       nodeid               integer NOT NULL,
       prs_box_feat_id      smallint NOT NULL,
       sent_folder_enbl     tinyint DEFAULT 0,
       allow_transfer_ext   tinyint DEFAULT 0,
       assist_dstdn         char(25),
       del_folder_enbl      tinyint DEFAULT 0,
       asr_enabled          tinyint DEFAULT 0,
       inbox_lifetime       smallint DEFAULT 10,
       vm_language          char(5),
       max_disk_quota       integer DEFAULT 7200000,
       max_greet_cnt        tinyint DEFAULT 1,
       max_greet_dur        tinyint DEFAULT 15,
       max_msg_cnt          smallint DEFAULT 50,
       max_msg_size         integer DEFAULT 480000 NOT NULL,
       mwi_enabled          tinyint DEFAULT 1,
       sent_lifetime        smallint DEFAULT 0,
       settings_name        char(32),
       sms_enabled          tinyint DEFAULT 0,
       deleted_lifetime     smallint DEFAULT 10,
       use_dtmf             tinyint DEFAULT 1,
       use_tts              tinyint DEFAULT 0,
       email_enabled        tinyint DEFAULT 0,
       vm_callbackphoneid   integer DEFAULT NULL,
       PRIMARY KEY (nodeid, prs_box_feat_id),
       FOREIGN KEY (nodeid, vm_callbackphoneid)
                             REFERENCES phone
);



CREATE TABLE vm_feature_grp_admin (
       nodeid               integer NOT NULL,
       grp_box_feat_id      smallint NOT NULL,
       vm_admin_id          integer NOT NULL,
       PRIMARY KEY (nodeid, grp_box_feat_id),
       FOREIGN KEY (nodeid, grp_box_feat_id)
                             REFERENCES vm_grp_box_feature,
       FOREIGN KEY (nodeid, vm_admin_id)
                             REFERENCES vm_admin
);



CREATE TABLE prepaid_subscriber (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       account_status       smallint NOT NULL,
       account_balance      integer NOT NULL,
       date_of_last_used    smallint NOT NULL,
       date_of_expiry       smallint NOT NULL,
       language_code        smallint NOT NULL,
       unsuc_recharge_att   smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       prepaid_set_id       smallint NOT NULL,
       no_active_calls      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dn),
       FOREIGN KEY (nodeid, prepaid_set_id)
                             REFERENCES prepaid_subs_set
);



CREATE TABLE prepaid_identity (
       nodeid               integer NOT NULL,
       prepaid_pin1         integer NOT NULL,
       prepaid_pin2         integer NOT NULL,
       account_id           char(15) NOT NULL,
       dn                   integer NOT NULL,
       PRIMARY KEY (nodeid, prepaid_pin1, prepaid_pin2, account_id),
       FOREIGN KEY (nodeid, dn)
                             REFERENCES prepaid_subscriber
);



CREATE TABLE ne_node_version (
       nodeid               integer NOT NULL,
       db_release           char(8) NOT NULL,
       data_release         char(8) NOT NULL,
       node_dataset         char(20),
       PRIMARY KEY (nodeid)
);



commit work;


