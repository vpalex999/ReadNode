




set catalog SOLID_DB_CATALOG;
commit work;











CREATE TABLE ne_node_version (
       nodeid               integer NOT NULL,
       db_release           char(8) NOT NULL,
       data_release         char(8) NOT NULL,
       node_dataset         char(20),
       PRIMARY KEY (nodeid)
);



commit work;


