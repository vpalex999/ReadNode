
set catalog SOLID_DB_CATALOG;
commit work;



CREATE TABLE cns_grpdest (
       nodeid               integer NOT NULL,
       cns_grpname          WVARCHAR(20) DEFAULT '' NOT NULL,
       cns_grpmemberdn      varchar(20) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid, cns_grpname, cns_grpmemberdn)
);



CREATE TABLE cns_notification (
       nodeid               integer NOT NULL,
       cns_ntfid            integer DEFAULT 0 NOT NULL,
       cns_waitend          tinyint DEFAULT 0 NOT NULL,
       cns_destination      WVARCHAR(20) DEFAULT '' NOT NULL,
       cns_url              varchar(200) DEFAULT '' NOT NULL,
       cns_mlpp             smallint DEFAULT 0,
       cns_repeatnr         smallint DEFAULT 0,
       cns_repeatperiod     smallint DEFAULT 0,
       cns_repeatmaxtime    smallint DEFAULT 0,
       cns_invocationdelay  integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cns_ntfid, cns_waitend, cns_destination, cns_url)
);



commit work;


