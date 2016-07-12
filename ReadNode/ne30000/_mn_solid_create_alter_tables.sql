
set catalog SOLID_DB_CATALOG;
commit work;



ALTER TABLE cnf_dialin ADD FOREIGN KEY (nodeid, cnf_id) REFERENCES conference;



ALTER TABLE cnf_mixer ADD FOREIGN KEY (nodeid, cnf_id) REFERENCES conference;



ALTER TABLE vm_box ADD FOREIGN KEY (nodeid, prs_box_feat_id) REFERENCES vm_prs_box_feature;



commit work;
