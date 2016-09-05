
set catalog SOLID_DB_CATALOG;
commit work;


CREATE TRANSIENT TABLE subs_state_s (
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



CREATE TRANSIENT TABLE subs_state_p (
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



CREATE TRANSIENT TABLE ar_data (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       ar_nr                char(25) NOT NULL,
       ar_date              smallint NOT NULL,
       ar_time              smallint NOT NULL,
       clir_ind             smallint NOT NULL,
       PRIMARY KEY (nodeid, dn, basic_id)
);



CREATE TRANSIENT TABLE lnr (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       fullnr               char(25) NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



commit work;


