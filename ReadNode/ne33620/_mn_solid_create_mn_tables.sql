
set catalog SOLID_DB_CATALOG;
commit work;



CREATE TABLE otc_diagnostic (
       nodeid               integer NOT NULL,
       otc_dgn_id           tinyint NOT NULL,
       otc_dgn_name         varchar(50) NOT NULL,
       otc_dgn_status       tinyint DEFAULT 1 NOT NULL,
       otc_dgn_type         tinyint DEFAULT 1 NOT NULL,
       all_dspt_circ        tinyint DEFAULT 1 NOT NULL,
       otc_dspt_circnr      char(2),
       time_check           tinyint DEFAULT 1 NOT NULL,
       user_party_nr_check  tinyint DEFAULT 0 NOT NULL,
       user_conn_pnt_check  tinyint DEFAULT 0 NOT NULL,
       used_channels_check  tinyint DEFAULT 0 NOT NULL,
       otc_node_check       tinyint DEFAULT 1 NOT NULL,
       all_otc_node         tinyint DEFAULT 1 NOT NULL,
       otc_nodeid           smallint,
       otc_dspt_check       tinyint DEFAULT 1 NOT NULL,
       all_otc_dspt         tinyint DEFAULT 1 NOT NULL,
       otc_dsptdn           integer,
       otc_dspt_show        tinyint DEFAULT 1 NOT NULL,
       otc_duty_check       tinyint DEFAULT 1 NOT NULL,
       all_otc_duty         tinyint DEFAULT 1 NOT NULL,
       otc_duty_id          char(3),
       otc_duty_show        tinyint DEFAULT 1 NOT NULL,
       otc_trunk_check      tinyint DEFAULT 1 NOT NULL,
       all_otc_trunk        tinyint DEFAULT 1 NOT NULL,
       otc_trunkid          smallint,
       otc_trunk_show       tinyint DEFAULT 1 NOT NULL,
       dgn_capture_mode     tinyint DEFAULT 1 NOT NULL,
       dgn_duration         integer,
       dur_begin_time       timestamp,
       PRIMARY KEY (nodeid, otc_dgn_id)
);



CREATE UNIQUE INDEX AK1_otc_diagnostic ON otc_diagnostic
(
	nodeid                ASC,
	otc_dgn_name          ASC
);



CREATE TABLE break_minor_upgrade (
       dbschema_old         char(20) NOT NULL,
       dbschema_new         char(20) NOT NULL,
       breaking_rule        tinyint DEFAULT 0 NOT NULL,
       break_table_attr     char(512),
       PRIMARY KEY (dbschema_old, dbschema_new)
);



CREATE TABLE ims_mcid_report (
       nodeid               integer NOT NULL,
       mcid_sip_header      char(380) NOT NULL,
       act_date             integer NOT NULL,
       act_time             smallint NOT NULL,
       mcid_id              smallint DEFAULT 0 NOT NULL
);



CREATE TABLE it_gen_nm_items (
       table_name           varchar(255) NOT NULL,
       trigger_type         varchar(255) NOT NULL,
       PRIMARY KEY (table_name, trigger_type)
);



CREATE TABLE acs_report (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       invoc_date           integer NOT NULL,
       invoc_time           smallint NOT NULL,
       acs_status           smallint NOT NULL,
       act_date             integer NOT NULL,
       act_time             smallint NOT NULL,
       bgid                 integer,
       cgid                 smallint,
       invoc_dstdn          char(25),
       suppl_id             smallint
);



CREATE TABLE rsup_report (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       rsup_pin             integer NOT NULL,
       rsup_code            integer NOT NULL,
       act_date             integer NOT NULL,
       act_time             smallint NOT NULL,
       bgid                 integer,
       cgid                 smallint
);



CREATE TABLE mcid_report (
       nodeid               integer NOT NULL,
       cgpn                 char(25),
       trunkid              integer,
       forward_cdpn         char(25),
       cdpn                 char(25) NOT NULL,
       act_date             integer NOT NULL,
       act_time             smallint NOT NULL,
       subaddress           char(40),
       out_trunkid          integer
);



CREATE TABLE fun_group_seizure (
       nodeid               integer NOT NULL,
       fun_group_id         char(60) NOT NULL,
       mng_type             smallint,
       user_id              char(20) NOT NULL,
       user_type            smallint NOT NULL,
       session_id           integer NOT NULL,
       seizure_time         timestamp NOT NULL,
       PRIMARY KEY (nodeid, fun_group_id)
);



CREATE TABLE mn_node_version (
       db_release           char(8) NOT NULL,
       data_release         char(8) NOT NULL,
       PRIMARY KEY (db_release, data_release)
);



commit work;


