
set catalog SOLID_DB_CATALOG;
commit work;



CREATE INDEX IE1_digitmap_profile ON digitmap_profile
(
	nodeid                ASC,
	digitmap_name         ASC
);




CREATE INDEX IE1_mn_dsp_ip_feature ON mn_dsp_ip_feature
(
	nodeid                ASC,
	dsp_ip_name           ASC
);


CREATE INDEX IE1_mn_rtp_profile ON mn_rtp_profile
(
	nodeid                ASC,
	rtp_name              ASC
);



CREATE INDEX IE1_mn_sys_interface ON mn_sys_interface
(
	nodeid                ASC,
	sys_intf_name         ASC
);




CREATE INDEX IE1_mn_access ON mn_access
(
	nodeid                ASC,
	access_name           ASC
);




CREATE INDEX IE1_h248_nonstd_prf ON h248_nonstd_prf
(
	nodeid                ASC,
	h248_prf_name         ASC
);



CREATE INDEX AK1_h248_intf_profile ON h248_intf_profile
(
	nodeid                ASC,
	profile_name          ASC
);




CREATE INDEX IE1_h248_interface ON h248_interface
(
	nodeid                ASC,
	h248_domain_name      ASC,
	h248_side             ASC
);



CREATE INDEX IE1_mgcp_intf_profile ON mgcp_intf_profile
(
	nodeid                ASC,
	profile_name          ASC
);




CREATE INDEX IE1_mgcp_interface ON mgcp_interface
(
	nodeid                ASC,
	mgcp_domain_name      ASC,
	mgcp_side             ASC
);


CREATE INDEX IE1_subs_dn_sn_conv ON subs_dn_sn_conv
(
	nodeid                ASC,
	subs_nr               ASC,
	ndc_id                ASC
);

commit work;


