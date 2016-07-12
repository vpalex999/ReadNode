
set catalog SOLID_DB_CATALOG;
commit work;



CREATE TABLE att_file (
       nodeid               integer NOT NULL,
       att_file_id          integer NOT NULL,
       att_file_name        varchar(30) NOT NULL,
       att_file_uri         varchar(120) NOT NULL,
       att_file_size        integer NOT NULL,
       PRIMARY KEY (nodeid, att_file_id)
);



CREATE UNIQUE INDEX AK1_att_file ON att_file
(
	nodeid                ASC,
	att_file_name         ASC
);



CREATE SEQUENCE seq_att_file_id;



CREATE TABLE att_scenario (
       nodeid               integer NOT NULL,
       att_scen_id          integer NOT NULL,
       att_scen_name        varchar(30) NOT NULL,
       scen_enbl            tinyint NOT NULL,
       welcome_id           integer NOT NULL,
       no_input_id          integer NOT NULL,
       no_match_id          integer NOT NULL,
       PRIMARY KEY (nodeid, att_scen_id),
       FOREIGN KEY (nodeid, welcome_id)
                             REFERENCES att_file,
       FOREIGN KEY (nodeid, no_input_id)
                             REFERENCES att_file,
       FOREIGN KEY (nodeid, no_match_id)
                             REFERENCES att_file
);



CREATE UNIQUE INDEX AK1_att_scenario ON att_scenario
(
	nodeid                ASC,
	att_scen_name         ASC
);



CREATE SEQUENCE seq_att_scen_id;



CREATE TABLE att_scenario2phone (
       nodeid               integer NOT NULL,
       phoneid              integer NOT NULL,
       att_scen_id          integer NOT NULL,
       PRIMARY KEY (nodeid, phoneid),
       FOREIGN KEY (nodeid, att_scen_id)
                             REFERENCES att_scenario,
       FOREIGN KEY (nodeid, phoneid)
                             REFERENCES phone
);



CREATE TABLE att_schedule (
       nodeid               integer NOT NULL,
       att_sch_id           integer NOT NULL,
       att_sch_name         varchar(30) NOT NULL,
       sch_begin_time       timestamp,
       sch_end_time         timestamp,
       week_day_mask        tinyint NOT NULL,
       PRIMARY KEY (nodeid, att_sch_id)
);



CREATE UNIQUE INDEX AK1_att_schedule ON att_schedule
(
	nodeid                ASC,
	att_sch_name          ASC
);



CREATE SEQUENCE seq_att_sch_id;



CREATE TABLE att_dialogue (
       nodeid               integer NOT NULL,
       att_dialog_id        integer NOT NULL,
       att_dialog_name      varchar(30) NOT NULL,
       dialog_enbl          tinyint DEFAULT 1 NOT NULL,
       att_scen_id          integer NOT NULL,
       att_sch_id           integer NOT NULL,
       welcome_id           integer NOT NULL,
       help_id              integer,
       dialog_number        tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, att_dialog_id),
       FOREIGN KEY (nodeid, att_scen_id)
                             REFERENCES att_scenario,
       FOREIGN KEY (nodeid, att_sch_id)
                             REFERENCES att_schedule,
       FOREIGN KEY (nodeid, welcome_id)
                             REFERENCES att_file,
       FOREIGN KEY (nodeid, help_id)
                             REFERENCES att_file
);



CREATE UNIQUE INDEX AK1_att_dialogue ON att_dialogue
(
	nodeid                ASC,
	att_dialog_name       ASC
);



CREATE SEQUENCE seq_att_dialog_id;



CREATE TABLE att_option (
       nodeid               integer NOT NULL,
       att_option_id        integer NOT NULL,
       att_option_name      varchar(30) NOT NULL,
       att_dialog_id        integer NOT NULL,
       att_option_uri       varchar(120) NOT NULL,
       option_dtmf          tinyint NOT NULL,
       PRIMARY KEY (nodeid, att_option_id),
       FOREIGN KEY (nodeid, att_dialog_id)
                             REFERENCES att_dialogue
);



CREATE UNIQUE INDEX AK1_att_option ON att_option
(
	nodeid                ASC,
	att_option_name       ASC
);



CREATE UNIQUE INDEX AK2_att_option ON att_option
(
	nodeid                ASC,
	att_dialog_id         ASC,
	option_dtmf           ASC
);



CREATE SEQUENCE seq_att_option_id;



commit work;


