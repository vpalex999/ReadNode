
set catalog SOLID_DB_CATALOG;
commit work;



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


