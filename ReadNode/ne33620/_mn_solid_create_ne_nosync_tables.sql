
set catalog SOLID_DB_CATALOG;
commit work;



CREATE TABLE ne_node_status (
       nodeid               integer NOT NULL,
       geo_status           tinyint NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE ims_user_chrg_dgn (
       nodeid               integer NOT NULL,
       subs_alias           char(50) NOT NULL,
       PRIMARY KEY (nodeid, subs_alias)
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



CREATE TABLE ne_node_version (
       nodeid               integer NOT NULL,
       db_release           char(8) NOT NULL,
       data_release         char(8) NOT NULL,
       node_dataset         char(20),
       PRIMARY KEY (nodeid)
);



commit work;


