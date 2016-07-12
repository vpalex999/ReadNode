




set catalog SOLID_DB_CATALOG;
commit work;











CREATE TABLE trunk_mn (
       nodeid               integer NOT NULL,
       trunkid              smallint NOT NULL,
       trunk_oosi_dyn       smallint NOT NULL,
       trunk_oosi_spd       smallint NOT NULL
);



CREATE TABLE test_prog_error (
       nodeid               integer NOT NULL,
       errcod               integer NOT NULL,
       tescod               smallint NOT NULL,
       PRIMARY KEY (nodeid, errcod, tescod)
);



CREATE TABLE mn_node_version (
       db_release           char(8) NOT NULL,
       data_release         char(8) NOT NULL,
       PRIMARY KEY (db_release, data_release)
);



CREATE TABLE gui_config (
       gui_name             char(30) NOT NULL,
       gui_property         smallint NOT NULL,
       gui_property_value   smallint NOT NULL,
       PRIMARY KEY (gui_name, gui_property)
);



CREATE TABLE it_gen_nm_items (
       table_name           varchar(255) NOT NULL,
       trigger_type         varchar(255) NOT NULL,
       PRIMARY KEY (table_name, trigger_type)
);



CREATE TABLE port_mn (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       oosi                 smallint NOT NULL,
       local_blocking       smallint NOT NULL
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



CREATE TABLE ne_profile (
       nodeid               integer NOT NULL,
       ne_hw_type           smallint NOT NULL,
       nr_of_boards         smallint NOT NULL,
       PRIMARY KEY (nodeid)
);



commit work;


