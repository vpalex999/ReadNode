
set catalog SOLID_DB_CATALOG;
commit work;



CREATE TABLE bwdth_limit_ctrl (
       nodeid               integer NOT NULL,
       bwdth_grpid          smallint NOT NULL,
       bwdth_limit          integer NOT NULL,
       video_br_offr_fact   smallint DEFAULT 100 NOT NULL,
       high_br_offr_fact    smallint DEFAULT 100 NOT NULL,
       PRIMARY KEY (nodeid, bwdth_grpid)
);



CREATE TABLE mlpp_common_data (
       nodeid               integer NOT NULL,
       mlpp_common_id       smallint NOT NULL,
       mlpp_srv_domain      integer DEFAULT 0 NOT NULL,
       mlpp_net_identity    char(4),
       PRIMARY KEY (nodeid, mlpp_common_id)
);



CREATE TABLE sigtrace_numbers (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       sigtrace_nr_type     tinyint NOT NULL,
       sigtrace_nr          char(20) NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       sigtrace_status      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid, sigtrace_nr_type, sigtrace_nr)
);



CREATE TABLE ann_variants (
       nodeid               integer NOT NULL,
       ann_variant          smallint NOT NULL,
       ann_variant_desc     char(40) NOT NULL,
       PRIMARY KEY (nodeid, ann_variant)
);



CREATE TABLE feature_subs_set (
       nodeid               integer NOT NULL,
       feature_set_id       smallint NOT NULL,
       feature_set_name     char(15) NOT NULL,
       subsctg              smallint NOT NULL,
       cfu_auth             smallint NOT NULL,
       cfb_auth             smallint NOT NULL,
       cfnr_auth            smallint NOT NULL,
       cbsc_auth            smallint NOT NULL,
       hoti_auth            smallint NOT NULL,
       hotd_auth            smallint NOT NULL,
       dnd_auth             smallint NOT NULL,
       dndo_auth            smallint NOT NULL,
       dndo_invmode         smallint NOT NULL,
       camp_auth            smallint NOT NULL,
       camp_invmode         smallint NOT NULL,
       campp_auth           smallint NOT NULL,
       cint_auth            smallint NOT NULL,
       cint_invmode         smallint NOT NULL,
       cintp_auth           smallint NOT NULL,
       clip_auth            smallint NOT NULL,
       clip_cliro           smallint NOT NULL,
       clir_auth            smallint NOT NULL,
       colp_auth            smallint NOT NULL,
       colp_colro           smallint NOT NULL,
       colr_auth            smallint NOT NULL,
       s3pty_auth           smallint NOT NULL,
       conf_auth            smallint NOT NULL,
       cw_auth              smallint NOT NULL,
       ct_auth              smallint DEFAULT 0 NOT NULL,
       cbac_barrclass       smallint,
       ccbs_auth            smallint NOT NULL,
       acs_auth             smallint NOT NULL,
       uus_auth             smallint NOT NULL,
       cfut_auth            smallint NOT NULL,
       cpu_auth             smallint NOT NULL,
       fwuui_auth           smallint NOT NULL,
       abds_category        smallint NOT NULL,
       aoc_auth             smallint NOT NULL,
       icb_ctg              smallint NOT NULL,
       cd_auth              smallint NOT NULL,
       sub_auth             smallint NOT NULL,
       mcid_auth            smallint NOT NULL,
       cfxd1_auth           smallint NOT NULL,
       cfxd2_auth           smallint NOT NULL,
       cfxd3_auth           smallint NOT NULL,
       cfxd4_auth           smallint NOT NULL,
       inband_ind_type      smallint NOT NULL,
       display_ring_type    smallint NOT NULL,
       ddi_auth             smallint NOT NULL,
       present_subsnr       char(15),
       present_ctx_subsnr   char(15),
       dn_range_auth        smallint NOT NULL,
       rmtuser_auth         smallint DEFAULT 0 NOT NULL,
       cn_auth              smallint DEFAULT 0 NOT NULL,
       ann_variant          smallint NOT NULL,
       orig_ctx_rstr        smallint DEFAULT 0 NOT NULL,
       term_ctx_rstr        smallint DEFAULT 0 NOT NULL,
       ctx_attendant        smallint DEFAULT 0 NOT NULL,
       cfx_param            smallint DEFAULT 0 NOT NULL,
       nc_auth              smallint DEFAULT 0 NOT NULL,
       ncbs_auth            smallint DEFAULT 0 NOT NULL,
       cac_dial_auth        smallint DEFAULT 0 NOT NULL,
       carr_presel_auth     smallint DEFAULT 0 NOT NULL,
       peoc_auth            smallint DEFAULT 0 NOT NULL,
       hold_auth            smallint DEFAULT 1 NOT NULL,
       tw_auth              smallint DEFAULT 0 NOT NULL,
       mwi_auth             smallint DEFAULT 0 NOT NULL,
       opc_auth             smallint DEFAULT 0 NOT NULL,
       ar_auth              smallint DEFAULT 0 NOT NULL,
       acr_auth             smallint DEFAULT 0 NOT NULL,
       fcr_auth             smallint DEFAULT 0 NOT NULL,
       send_subsctg         smallint DEFAULT 0 NOT NULL,
       dicon_group          smallint DEFAULT 0 NOT NULL,
       ute_auth             smallint DEFAULT 0 NOT NULL,
       ann_conn_auth        smallint DEFAULT 0 NOT NULL,
       sr_auth              smallint DEFAULT 0 NOT NULL,
       sr_type              smallint DEFAULT 0 NOT NULL,
       cfnrc_auth           smallint DEFAULT 0 NOT NULL,
       subs_status          smallint DEFAULT 0 NOT NULL,
       vxml_auth            smallint DEFAULT 0 NOT NULL,
       mmc_auth             smallint DEFAULT 0 NOT NULL,
       ann_ctxsubs_auth     smallint DEFAULT 0 NOT NULL,
       srv_auth1            smallint DEFAULT 0 NOT NULL,
       srv_auth2            smallint DEFAULT 0 NOT NULL,
       srv_auth3            smallint DEFAULT 0 NOT NULL,
       virts_auth           smallint NOT NULL,
       cat_auth_act         smallint DEFAULT 0 NOT NULL,
       licence_type         smallint DEFAULT 0 NOT NULL,
       acc_feature_id       smallint DEFAULT 0 NOT NULL,
       pdcnf_auth           tinyint DEFAULT 0 NOT NULL,
       def_prec_level       smallint DEFAULT 9 NOT NULL,
       max_prec_level       smallint DEFAULT 9 NOT NULL,
       acc_res_nonpreempt   smallint DEFAULT 0 NOT NULL,
       mlpp_id              smallint DEFAULT 0 NOT NULL,
       rcc_auth             tinyint DEFAULT 0 NOT NULL,
       present_numtype      tinyint DEFAULT 4 NOT NULL,
       intercom_auth        tinyint DEFAULT 0 NOT NULL,
       suppl_sts_auth       tinyint DEFAULT 0 NOT NULL,
       uicct_auth           tinyint DEFAULT 0 NOT NULL,
       uiccp_auth           tinyint DEFAULT 0 NOT NULL,
       former_ngn_set_id    smallint DEFAULT '-1' NOT NULL,
       rem_sts_auth         tinyint DEFAULT 0 NOT NULL,
       otc_auth             tinyint DEFAULT 0 NOT NULL,
       dndgm_auth           tinyint DEFAULT 0 NOT NULL,
       preempt_mode         tinyint DEFAULT 0 NOT NULL,
       tap_auth             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, feature_set_id),
       FOREIGN KEY (nodeid, ann_variant)
                             REFERENCES ann_variants
);



CREATE TABLE basic_service (
       nodeid               integer NOT NULL,
       basic_id             smallint NOT NULL,
       infotrcpb            smallint NOT NULL,
       infotrrate           smallint NOT NULL,
       tele_id              smallint NOT NULL,
       PRIMARY KEY (nodeid, basic_id)
);



CREATE TABLE announcement (
       nodeid               integer NOT NULL,
       ann_id               smallint NOT NULL,
       ann_desc             char(40) NOT NULL,
       dflt_ann_variant     smallint,
       sync_bcst_dly        smallint,
       PRIMARY KEY (nodeid, ann_id)
);



CREATE TABLE subscriber (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       pswdkey              char(4) NOT NULL,
       cfu_act              smallint NOT NULL,
       cfb_act              smallint NOT NULL,
       cfnr_act             smallint NOT NULL,
       cbsc_act             smallint NOT NULL,
       cbsc_barrclass       smallint NOT NULL,
       hoti_act             smallint NOT NULL,
       hotd_act             smallint NOT NULL,
       dnd_act              smallint NOT NULL,
       campp_act            smallint NOT NULL,
       cw_act               smallint NOT NULL,
       lh_group_id          integer NOT NULL,
       lh_act               smallint NOT NULL,
       ctgioc               smallint NOT NULL,
       cfut_act             smallint NOT NULL,
       cpup_act             smallint NOT NULL,
       cpug_group_id        integer,
       org_charge_code      smallint NOT NULL,
       crg_class            smallint DEFAULT 0 NOT NULL,
       cug_auth             smallint NOT NULL,
       pcug                 smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       access_group_id      smallint NOT NULL,
       feature_set_id       smallint,
       cgid                 smallint DEFAULT 0 NOT NULL,
       ctx_intercom         integer,
       cfxd_act             smallint DEFAULT 0 NOT NULL,
       cid1                 smallint NOT NULL,
       cid2                 smallint NOT NULL,
       routing_group        smallint DEFAULT 0 NOT NULL,
       prng_group_id        integer NOT NULL,
       prng_act             smallint NOT NULL,
       tw_act               smallint DEFAULT 0 NOT NULL,
       mwi_act              smallint DEFAULT 0 NOT NULL,
       ar_act               smallint DEFAULT 0 NOT NULL,
       acr_act              smallint DEFAULT 0 NOT NULL,
       fcr_act              smallint DEFAULT 0 NOT NULL,
       clir_act             smallint DEFAULT 0 NOT NULL,
       ute_act              smallint DEFAULT 0 NOT NULL,
       sr_act               smallint DEFAULT 0 NOT NULL,
       cfnrc_act            smallint DEFAULT 0 NOT NULL,
       outsrv_id            smallint DEFAULT 0 NOT NULL,
       ann_ring             smallint NOT NULL,
       ann_hold             smallint NOT NULL,
       ann_param1           integer,
       srv_act1             smallint DEFAULT 0 NOT NULL,
       srv_act2             smallint DEFAULT 0 NOT NULL,
       srv_act3             smallint DEFAULT 0 NOT NULL,
       ims_user_prfid       integer DEFAULT 0 NOT NULL,
       reg_status           smallint,
       implicit_grp         integer,
       notify_grp           integer DEFAULT 0 NOT NULL,
       barring_ind          smallint,
       rcc_act              tinyint DEFAULT 0 NOT NULL,
       bsns_user_group_id   integer DEFAULT 0 NOT NULL,
       suppl_sts_act        tinyint DEFAULT 0 NOT NULL,
       uicct_act            tinyint DEFAULT 0 NOT NULL,
       uiccpp_act           tinyint DEFAULT 0 NOT NULL,
       ggrphc_area_id       smallint DEFAULT 0 NOT NULL,
       cat_act              smallint DEFAULT 0 NOT NULL,
       cat_auth             integer DEFAULT 0 NOT NULL,
       fa_group_id          integer DEFAULT 0 NOT NULL,
       fa_act               tinyint DEFAULT 0 NOT NULL,
       subsl_type           smallint DEFAULT '-1' NOT NULL,
       cbex_barrclass       smallint DEFAULT 0 NOT NULL,
       dndgm_act            tinyint DEFAULT 0 NOT NULL,
       subscr_type          smallint DEFAULT '-1' NOT NULL,
       present_subsnr       char(15) DEFAULT NULL,
       present_numtype      tinyint DEFAULT 4 NOT NULL,
       present_ctx_subsnr   char(15) DEFAULT NULL,
       tap_act              tinyint DEFAULT 0 NOT NULL,
       nplan_id             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dn, basic_id),
       FOREIGN KEY (nodeid, basic_id)
                             REFERENCES basic_service,
       FOREIGN KEY (nodeid, feature_set_id)
                             REFERENCES feature_subs_set,
       FOREIGN KEY (nodeid, ann_ring)
                             REFERENCES announcement,
       FOREIGN KEY (nodeid, ann_hold)
                             REFERENCES announcement
);



CREATE INDEX IE1_subscriber ON subscriber
(
	modulenr              ASC,
	portnr                ASC
);



CREATE INDEX IE2_subscriber ON subscriber
(
	nodeid                ASC,
	lh_group_id           ASC,
	lh_act                ASC,
	bsns_user_group_id    ASC
);



CREATE INDEX IE3_subscriber ON subscriber
(
	nodeid                ASC,
	bsns_user_group_id    ASC,
	dn                    ASC
);



CREATE INDEX IE4_subscriber ON subscriber
(
	portnr                ASC
);



CREATE DENSE SEQUENCE seq_subscr_portnr;



CREATE TABLE cfut_dstdn (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       switch_time          smallint NOT NULL,
       dayctg               smallint NOT NULL,
       dstdn                char(25) NOT NULL,
       PRIMARY KEY (nodeid, dn, basic_id, switch_time, dayctg),
       FOREIGN KEY (nodeid, dn, basic_id)
                             REFERENCES subscriber
);



CREATE TABLE tt_action (
       nodeid               integer NOT NULL,
       tt_id                smallint NOT NULL,
       tt_action_num        smallint NOT NULL,
       in_call_action       smallint,
       in_action_pause      integer,
       out_call_action      smallint,
       out_action_pause     integer,
       called_tt_id         smallint,
       PRIMARY KEY (nodeid, tt_id, tt_action_num)
);



CREATE TABLE dbc_config (
       nodeid               integer NOT NULL,
       dbcs_state           smallint DEFAULT 0 NOT NULL,
       db_adt_cfg           smallint DEFAULT 1 NOT NULL,
       hb_flag              smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE dsp_ip_feature (
       nodeid               integer NOT NULL,
       dsp_ip_feature_id    smallint NOT NULL,
       jitter_buffer        smallint DEFAULT 0 NOT NULL,
       min_jitter_delay     smallint DEFAULT 10 NOT NULL,
       max_jitter_delay     smallint DEFAULT 60 NOT NULL,
       nom_audio_jt_delay   smallint DEFAULT 20 NOT NULL,
       nom_data_jt_delay    smallint DEFAULT 60 NOT NULL,
       oob_dtmf_mode        smallint DEFAULT 1 NOT NULL,
       dtmf_relay_mode      smallint DEFAULT 0 NOT NULL,
       expr_time            smallint DEFAULT 1000 NOT NULL,
       pulse_dur            smallint DEFAULT 70 NOT NULL,
       pause_dur            smallint DEFAULT 120 NOT NULL,
       level_att            smallint DEFAULT 0 NOT NULL,
       rtp_payload_type     smallint DEFAULT 101 NOT NULL,
       rx_dig_gain          smallint DEFAULT 0 NOT NULL,
       tx_dig_gain          smallint DEFAULT 0 NOT NULL,
       dsp_ip_param1        smallint DEFAULT 0 NOT NULL,
       dsp_ip_param2        smallint DEFAULT 0 NOT NULL,
       dsp_ip_param3        smallint DEFAULT 0 NOT NULL,
       dsp_ip_param4        smallint DEFAULT 0 NOT NULL,
       dsp_ip_param5        smallint DEFAULT 0 NOT NULL,
       agc_profileid        smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, dsp_ip_feature_id)
);



CREATE TABLE tdm_rtp_profile (
       nodeid               integer NOT NULL,
       tdm_rtp_id           smallint NOT NULL,
       audio_codec_set      smallint,
       fax_codec_set        smallint,
       data_codec_set       smallint,
       video_codec_set      smallint,
       dsp_ip_feature_id    smallint NOT NULL,
       echo_canc            smallint DEFAULT 1 NOT NULL,
       rtp_reserve1         smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, tdm_rtp_id),
       FOREIGN KEY (nodeid, dsp_ip_feature_id)
                             REFERENCES dsp_ip_feature
);



CREATE TABLE asaccess_data (
       nodeid               integer NOT NULL,
       access_variant       smallint NOT NULL,
       astrc                smallint NOT NULL,
       rlstype              smallint NOT NULL,
       infotrcpb            smallint NOT NULL,
       infotrrate           smallint NOT NULL,
       tele_id              smallint NOT NULL,
       cgpninclude          smallint NOT NULL,
       ntrofaddr            smallint NOT NULL,
       incomplete           smallint NOT NULL,
       nrplan               smallint NOT NULL,
       typeofnr             smallint NOT NULL,
       presentind           smallint NOT NULL,
       screenind            smallint NOT NULL,
       dn                   integer NOT NULL,
       proginclude          smallint NOT NULL,
       progloc              smallint NOT NULL,
       progdscr             smallint NOT NULL,
       tmpstnt1             smallint NOT NULL,
       tmpstnt3             smallint NOT NULL,
       tmpstntr             smallint NOT NULL,
       tmpstntt             smallint NOT NULL,
       tmwdigit             smallint NOT NULL,
       tmwanswer            smallint NOT NULL,
       tmwdtmf              smallint NOT NULL,
       tmblock              smallint NOT NULL,
       tmrecovery           smallint NOT NULL,
       tmringing            smallint NOT NULL,
       tmrering             smallint NOT NULL,
       tmwfdigit            smallint DEFAULT 15 NOT NULL,
       tmwchannel           smallint DEFAULT 5 NOT NULL,
       tmhowlerdur          smallint DEFAULT 120 NOT NULL,
       timer_pstn_t4        smallint NOT NULL,
       pstn_call_prio       smallint NOT NULL,
       as_clip_variant      smallint NOT NULL,
       aon_variant          smallint NOT NULL,
       fsk_variant          smallint NOT NULL,
       fsk_transdata_mod    smallint NOT NULL,
       fsk_transdata_met    smallint NOT NULL,
       fsk_alert_signal     smallint NOT NULL,
       alert_signal_dur     smallint NOT NULL,
       t2_afterfsk_trans    smallint NOT NULL,
       t3_pre_fsk_trans     smallint NOT NULL,
       t4_pre_fsk_trans     smallint NOT NULL,
       t5_pre_fsk_trans     smallint NOT NULL,
       t6_afterfsk_trans    smallint NOT NULL,
       duration_type        smallint DEFAULT 0 NOT NULL,
       hflash_action        smallint DEFAULT 0 NOT NULL,
       tdm_rtp_id           smallint DEFAULT 0 NOT NULL,
       access_param1        smallint DEFAULT 0,
       access_param2        smallint DEFAULT 0,
       access_param3        smallint DEFAULT 0,
       digitmap_id          tinyint DEFAULT 1 NOT NULL,
       rbt_gen_side         tinyint DEFAULT 0 NOT NULL,
       as_orig_call_flow_typ tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, access_variant),
       FOREIGN KEY (nodeid, tdm_rtp_id)
                             REFERENCES tdm_rtp_profile
);



CREATE TABLE signal_trans (
       nodeid               integer NOT NULL,
       access_variant       smallint NOT NULL,
       signalphase          smallint NOT NULL,
       translvalue0         smallint NOT NULL,
       translvalue1         smallint NOT NULL,
       translvalue2         smallint NOT NULL,
       translvalue3         smallint NOT NULL,
       translvalue4         smallint NOT NULL,
       translvalue5         smallint NOT NULL,
       translvalue6         smallint NOT NULL,
       translvalue7         smallint NOT NULL,
       translvalue8         smallint NOT NULL,
       translvalue9         smallint NOT NULL,
       translvalue10        smallint NOT NULL,
       translvalue11        smallint NOT NULL,
       translvalue12        smallint NOT NULL,
       translvalue13        smallint NOT NULL,
       translvalue14        smallint NOT NULL,
       translvalue15        smallint NOT NULL,
       translvalue16        smallint NOT NULL,
       translvalue17        smallint NOT NULL,
       translvalue18        smallint NOT NULL,
       translvalue19        smallint NOT NULL,
       translvalue20        smallint NOT NULL,
       translvalue21        smallint NOT NULL,
       translvalue22        smallint NOT NULL,
       translvalue23        smallint NOT NULL,
       translvalue24        smallint NOT NULL,
       PRIMARY KEY (nodeid, access_variant, signalphase),
       FOREIGN KEY (nodeid, access_variant)
                             REFERENCES asaccess_data
);



CREATE TABLE sync (
       nodeid               integer NOT NULL,
       sprior               smallint NOT NULL,
       type                 smallint NOT NULL,
       id                   smallint NOT NULL,
       clock                smallint NOT NULL,
       active               smallint NOT NULL,
       suit                 smallint NOT NULL,
       PRIMARY KEY (nodeid, sprior)
);



CREATE UNIQUE INDEX i_syncid ON sync
(
	nodeid                ASC,
	type                  ASC,
	id                    ASC
);



CREATE TABLE inc_digit_timers (
       nodeid               integer NOT NULL,
       inc_digit_tmvar      smallint NOT NULL,
       tm_dgt1              smallint NOT NULL,
       tm_pfx_cmpl          smallint NOT NULL,
       tm_req_dgt           smallint NOT NULL,
       tm_to_end            smallint NOT NULL,
       tm_after_eod         smallint NOT NULL,
       PRIMARY KEY (nodeid, inc_digit_tmvar)
);



CREATE TABLE cint_param (
       nodeid               integer NOT NULL,
       cint_variant         smallint NOT NULL,
       cint_allowed         smallint NOT NULL,
       cint_imm             smallint NOT NULL,
       cint_crel_action     smallint NOT NULL,
       cint_brel_action     smallint NOT NULL,
       cint_rering_type     smallint NOT NULL,
       ntfval_ringon        smallint NOT NULL,
       ntfval_busy          smallint NOT NULL,
       ntfval_active        smallint NOT NULL,
       ntfval_rering        smallint NOT NULL,
       cint_tm_delay        smallint NOT NULL,
       subsctg1             smallint,
       subsctg2             smallint,
       subsctg3             smallint,
       direct_intrusion     smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cint_variant)
);



CREATE TABLE trunk_group (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       opermode             smallint NOT NULL,
       prio_op_mode         smallint NOT NULL,
       casconnvariant       smallint NOT NULL,
       ss7_dstid            smallint NOT NULL,
       regsigtype           smallint NOT NULL,
       regsigvariant        smallint NOT NULL,
       linesigtype          smallint NOT NULL,
       linesigvariant       smallint NOT NULL,
       aon_variant          smallint NOT NULL,
       huntmode             smallint NOT NULL,
       inc_ident_ind        smallint NOT NULL,
       oosi                 smallint NOT NULL,
       tm_iocnresp          smallint NOT NULL,
       conrestctg           smallint NOT NULL,
       cgp_numtype          smallint NOT NULL,
       dicon_group          smallint DEFAULT 0 NOT NULL,
       outcnp_numtype       smallint NOT NULL,
       org_charge_code      smallint NOT NULL,
       cbac_barrclass       smallint,
       icb_ctg              smallint NOT NULL,
       crg_class            smallint DEFAULT 0 NOT NULL,
       aoc_auth             smallint NOT NULL,
       sndlinetype          smallint NOT NULL,
       ete_allowed          smallint NOT NULL,
       a_release_type       smallint NOT NULL,
       display_type         smallint NOT NULL,
       inband_ind_type      smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       trunk_group_dn       integer,
       remote_area_code     char(6),
       cgpn_lac_length      smallint NOT NULL,
       cint_variant         smallint,
       incom_ring_type      smallint DEFAULT 195 NOT NULL,
       camp_invmode         smallint DEFAULT 0 NOT NULL,
       inc_digit_tmvar      smallint NOT NULL,
       reanswer_ind         smallint NOT NULL,
       subsctg              smallint NOT NULL,
       ann_variant          smallint NOT NULL,
       cgid                 smallint DEFAULT 0 NOT NULL,
       ecd_type             smallint DEFAULT 0 NOT NULL,
       list_nature          smallint DEFAULT 0 NOT NULL,
       send_cac             smallint DEFAULT 0 NOT NULL,
       own_cac_el_in        smallint DEFAULT 0 NOT NULL,
       routing_group        smallint DEFAULT 0 NOT NULL,
       prop_delay           smallint DEFAULT 0 NOT NULL,
       scrn_cg_trnk         smallint DEFAULT 99 NOT NULL,
       back_connect         smallint NOT NULL,
       b_busy_disc          smallint NOT NULL,
       cis_cint_mode        smallint NOT NULL,
       send_complete_cgpn   smallint DEFAULT 0 NOT NULL,
       ute_auth             smallint DEFAULT 0 NOT NULL,
       ute_trunk_limit      smallint DEFAULT 0 NOT NULL,
       bwdth_grpid          smallint DEFAULT 0 NOT NULL,
       bwdth_reduct_fact    smallint DEFAULT 100 NOT NULL,
       trunk_ndc_id         smallint DEFAULT 0 NOT NULL,
       cause_convid         smallint DEFAULT 0 NOT NULL,
       alarm_variant        smallint DEFAULT 0 NOT NULL,
       subsctg_use          smallint DEFAULT 0 NOT NULL,
       redirection_mode     smallint DEFAULT 0 NOT NULL,
       np_redirection       smallint DEFAULT 0 NOT NULL,
       max_video_br_conn    integer DEFAULT '-1' NOT NULL,
       max_high_br_conn     integer DEFAULT '-1' NOT NULL,
       br_options           smallint DEFAULT 0 NOT NULL,
       trnkgrp_param1       smallint DEFAULT 0 NOT NULL,
       trnkgrp_param2       smallint DEFAULT 0 NOT NULL,
       trnkgrp_param3       smallint DEFAULT 0 NOT NULL,
       trnkgrp_param4       smallint DEFAULT 0 NOT NULL,
       trans_char           char(6),
       cid                  smallint DEFAULT 0 NOT NULL,
       iacama               smallint DEFAULT 0 NOT NULL,
       own_ims_core         smallint DEFAULT 0 NOT NULL,
       num_adapt            tinyint DEFAULT 0 NOT NULL,
       tm_unreachable       tinyint DEFAULT 0 NOT NULL,
       trans_lbr_pack_per   smallint DEFAULT 0 NOT NULL,
       ggrphc_area_id       smallint DEFAULT 0 NOT NULL,
       priorcall_resbusy    smallint DEFAULT 0 NOT NULL,
       ndc_usage_routing    tinyint DEFAULT 0 NOT NULL,
       trans_codec_set_id   tinyint DEFAULT 0 NOT NULL,
       tdm_hair_pinning     tinyint DEFAULT 0 NOT NULL,
       send_ieps_ctg        tinyint DEFAULT 0 NOT NULL,
       internat_dicon       smallint DEFAULT 0 NOT NULL,
       allow_cnf_creation   tinyint DEFAULT 0 NOT NULL,
       tdm_voice_bw         smallint DEFAULT 0 NOT NULL,
       nplan_id             smallint DEFAULT 0 NOT NULL,
       tm_trans_iocnresp    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid),
       FOREIGN KEY (nodeid, cint_variant)
                             REFERENCES cint_param,
       FOREIGN KEY (nodeid, inc_digit_tmvar)
                             REFERENCES inc_digit_timers,
       FOREIGN KEY (nodeid, ann_variant)
                             REFERENCES ann_variants
);



CREATE TABLE li_trunk_group (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid),
       FOREIGN KEY (nodeid, trnkgrpid)
                             REFERENCES trunk_group
);



CREATE TABLE ne_hostname (
       nodeid               integer NOT NULL,
       hostname             char(30) NOT NULL,
       hostname1            char(30),
       hostname2            char(30),
       geosys_unit_id       tinyint NOT NULL,
       PRIMARY KEY (nodeid, geosys_unit_id)
);



CREATE TABLE syslog_client (
       nodeid               integer NOT NULL,
       log_srv_ip           char(15) NOT NULL,
       log_srv_udp_port     integer DEFAULT 514 NOT NULL,
       syslog_state         smallint NOT NULL,
       syslog_severity      smallint NOT NULL,
       PRIMARY KEY (nodeid, log_srv_ip)
);



CREATE TABLE os_user_group (
       nodeid               integer NOT NULL,
       os_user_group_id     smallint DEFAULT 1000 NOT NULL,
       os_group_name        char(24) NOT NULL,
       PRIMARY KEY (nodeid, os_user_group_id)
);



CREATE TABLE ne_user (
       nodeid               integer NOT NULL,
       username             char(24) NOT NULL,
       user_password        char(32),
       calling_station_id   char(39),
       PRIMARY KEY (nodeid, username)
);



CREATE TABLE rlt_user_group (
       nodeid               integer NOT NULL,
       username             char(24) NOT NULL,
       os_user_group_id     smallint DEFAULT 1000 NOT NULL,
       PRIMARY KEY (nodeid, username, os_user_group_id),
       FOREIGN KEY (nodeid, username)
                             REFERENCES ne_user,
       FOREIGN KEY (nodeid, os_user_group_id)
                             REFERENCES os_user_group
);



CREATE TABLE speech_recording (
       nodeid               integer NOT NULL,
       dn                   integer DEFAULT 1 NOT NULL,
       ci                   smallint DEFAULT 1 NOT NULL,
       outg_modulenr        smallint DEFAULT 0 NOT NULL,
       outg_portnr          smallint DEFAULT 1 NOT NULL,
       outg_trnkgrpid       smallint DEFAULT 1 NOT NULL,
       incm_modulenr        smallint DEFAULT 0 NOT NULL,
       incm_portnr          smallint DEFAULT 1 NOT NULL,
       incm_trnkgrpid       smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



CREATE TABLE callback_number (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       call_back_dstdn      char(17) NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



CREATE TABLE pdconf_list_data (
       nodeid               integer NOT NULL,
       pdcnf_listid         smallint NOT NULL,
       pdcnf_wait_start     smallint DEFAULT 30 NOT NULL,
       pdcnf_wait_redial    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, pdcnf_listid)
);



CREATE TABLE pdconf_participant (
       nodeid               integer NOT NULL,
       pdcnf_listid         smallint NOT NULL,
       pdcnf_part_dn        char(25) NOT NULL,
       pdcnf_iniciator      tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, pdcnf_listid, pdcnf_part_dn),
       FOREIGN KEY (nodeid, pdcnf_listid)
                             REFERENCES pdconf_list_data
);



CREATE TABLE filter (
       nodeid               integer NOT NULL,
       filter_id            smallint NOT NULL,
       filter_name          char(20) NOT NULL,
       PRIMARY KEY (nodeid, filter_id)
);



CREATE UNIQUE INDEX AK1_filter ON filter
(
	nodeid                ASC,
	filter_name           ASC
);



CREATE TABLE basic_filter (
       nodeid               integer NOT NULL,
       filter_id            smallint NOT NULL,
       basic_filt_order     smallint NOT NULL,
       basic_filt_action    smallint NOT NULL,
       src_mac_addr         char(17),
       dst_mac_addr         char(17),
       ll_prot              integer,
       src_ip_addr          char(15),
       src_ip_mask          char(15),
       dst_ip_addr          char(15),
       dst_ip_mask          char(15),
       ip_prot              smallint,
       src_porthigh         integer,
       src_portlow          integer,
       dst_porthigh         integer,
       dst_portlow          integer,
       icmp_type            smallint,
       tos                  smallint,
       precedense           smallint,
       PRIMARY KEY (nodeid, filter_id, basic_filt_order),
       FOREIGN KEY (nodeid, filter_id)
                             REFERENCES filter
);



CREATE TABLE srv_activation (
       nodeid               integer NOT NULL,
       ndc_id               smallint DEFAULT 1 NOT NULL,
       srvact_code          char(15) NOT NULL,
       service_id           smallint NOT NULL,
       service_mode         smallint NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, srvact_code)
);



CREATE TABLE v5ua_intf_profile (
       nodeid               integer NOT NULL,
       v5ua_intf_prf_id     smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       iid_type             smallint DEFAULT 0 NOT NULL,
       iid_status           smallint DEFAULT 1 NOT NULL,
       v5ua_hb              smallint DEFAULT 0 NOT NULL,
       prot_ver             smallint DEFAULT 1 NOT NULL,
       tm_ack               smallint DEFAULT 2000 NOT NULL,
       nr_try               smallint DEFAULT 3 NOT NULL,
       tm_hb                smallint DEFAULT 1000 NOT NULL,
       context              smallint DEFAULT 0 NOT NULL,
       chunk_lifetime       smallint DEFAULT 0 NOT NULL,
       delivery             smallint DEFAULT 0 NOT NULL,
       bundle               smallint DEFAULT 0 NOT NULL,
       tm_assocest          smallint DEFAULT 2 NOT NULL,
       tm_as_status         smallint DEFAULT 0 NOT NULL,
       tm_asp_status        smallint DEFAULT 0 NOT NULL,
       tm_protectest        smallint DEFAULT 12 NOT NULL,
       tm_gnif_lifetime     smallint DEFAULT 5 NOT NULL,
       tm_failover          smallint DEFAULT 3 NOT NULL,
       asp_id_send          smallint DEFAULT 1 NOT NULL,
       mt_tei_queryreq      smallint DEFAULT 8 NOT NULL,
       PRIMARY KEY (nodeid, v5ua_intf_prf_id)
);



CREATE INDEX IE1_v5ua_intf_profile ON v5ua_intf_profile
(
	profile_name          ASC
);



CREATE TABLE v5ua_appl_server (
       nodeid               integer NOT NULL,
       as_id                smallint NOT NULL,
       v5ua_side            smallint DEFAULT 2 NOT NULL,
       traffic_mode         smallint DEFAULT 1 NOT NULL,
       tm_recov             smallint DEFAULT 3 NOT NULL,
       PRIMARY KEY (nodeid, as_id)
);



CREATE TABLE v5ua_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       as_id                smallint NOT NULL,
       asp_id               integer NOT NULL,
       init_state           smallint DEFAULT 2 NOT NULL,
       v5ua_assoc_repeat    smallint DEFAULT '-1' NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       v5ua_intf_prf_id     smallint NOT NULL,
       v5ua_name            char(30),
       log_stat_group_id    smallint DEFAULT 0 NOT NULL,
       link_identifier      tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id),
       FOREIGN KEY (nodeid, as_id)
                             REFERENCES v5ua_appl_server,
       FOREIGN KEY (nodeid, v5ua_intf_prf_id)
                             REFERENCES v5ua_intf_profile
);



CREATE INDEX IE1_v5ua_interface ON v5ua_interface
(
	as_id                 ASC
);



CREATE INDEX IE2_v5ua_interface ON v5ua_interface
(
	v5ua_intf_prf_id      ASC
);



CREATE TABLE conn_restr (
       nodeid               integer NOT NULL,
       orig_conrestctg      smallint NOT NULL,
       term_conrestctg      smallint NOT NULL,
       PRIMARY KEY (nodeid, orig_conrestctg, term_conrestctg)
);



CREATE TABLE dp_trnkgrp (
       nodeid               integer NOT NULL,
       dptrnkgrp_list_id    smallint DEFAULT 1 NOT NULL,
       trnkgrpid            smallint DEFAULT 1 NOT NULL,
       dptrnkgrp_mode       smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dptrnkgrp_list_id, trnkgrpid)
);



CREATE TABLE subs_nr_alias_conv (
       nodeid               integer NOT NULL,
       dstdn                char(25) NOT NULL,
       subs_alias           char(50) NOT NULL,
       user_domain_name     char(50) NOT NULL,
       alias_type           smallint NOT NULL,
       PRIMARY KEY (nodeid, dstdn)
);



CREATE TABLE dp_pfx_list (
       nodeid               integer NOT NULL,
       dppfx_list_id        smallint DEFAULT 1 NOT NULL,
       dppfx_type           smallint DEFAULT 4 NOT NULL,
       dppfx                char(20) NOT NULL,
       dppfx_mode           smallint DEFAULT 0 NOT NULL,
       dppfx_length         smallint DEFAULT 0 NOT NULL,
       dppfx_len_mode       smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dppfx_list_id, dppfx_type, dppfx)
);



CREATE TABLE dp_group (
       nodeid               integer NOT NULL,
       dpgroup_list_id      smallint DEFAULT 1 NOT NULL,
       dpgroup_type         smallint DEFAULT 20 NOT NULL,
       dpgroup_val          integer DEFAULT 0 NOT NULL,
       dpgroup_mode         smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dpgroup_list_id, dpgroup_type, dpgroup_val)
);



CREATE TABLE snmp_trap_config (
       nodeid               integer NOT NULL,
       trap_dest_ip_addr    char(15) NOT NULL,
       PRIMARY KEY (nodeid, trap_dest_ip_addr)
);



CREATE TABLE dp_capability_set (
       nodeid               integer NOT NULL,
       dpcpb_set0           smallint DEFAULT 0 NOT NULL,
       dpcpb_set1           smallint DEFAULT 0 NOT NULL,
       dpcpb_set2           smallint DEFAULT 0 NOT NULL,
       dpcpb_set3           smallint DEFAULT 0 NOT NULL,
       dpcpb_setpropriet    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dpcpb_set0)
);



CREATE TABLE disk_test (
       nodeid               integer NOT NULL,
       disk_id              smallint NOT NULL,
       device_name          char(50),
       min_temp             smallint DEFAULT 0 NOT NULL,
       max_temp             smallint DEFAULT 70 NOT NULL,
       min_spare_blocks     smallint DEFAULT 25 NOT NULL,
       temp_shutdown        tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, disk_id)
);



CREATE TABLE snmp_client (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       get_community        char(30) NOT NULL,
       set_community        char(30) NOT NULL,
       trap_community       char(30) NOT NULL,
       spec_trap_portnr     smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE congestion_alarms (
       nodeid               integer NOT NULL,
       alarm_variant        smallint NOT NULL,
       warning_report       smallint DEFAULT '-1' NOT NULL,
       warning_remove       smallint NOT NULL,
       crit_alarm_report    smallint DEFAULT '-1' NOT NULL,
       crit_alarm_remove    smallint NOT NULL,
       unsucc_call_setup    tinyint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, alarm_variant)
);



CREATE TABLE stbus (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ci                   smallint NOT NULL,
       stbus_id             smallint NOT NULL,
       stbus_ci             smallint NOT NULL,
       ad_out_stbus_id      smallint NOT NULL,
       ad_out_stbus_ci      smallint NOT NULL,
       ad_convert_type      smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, ci)
);



CREATE TABLE tsf_tt_group (
       nodeid               integer NOT NULL,
       tsf_tt_group_id      smallint NOT NULL,
       tt_desc              char(20) NOT NULL,
       PRIMARY KEY (nodeid, tsf_tt_group_id)
);



CREATE TABLE tsf_time_table (
       nodeid               integer NOT NULL,
       tsf_tt_id            smallint NOT NULL,
       tt_type              smallint NOT NULL,
       tt_period            smallint,
       b_date               date,
       b_time               time,
       e_date               date,
       e_time               time,
       t_constraints        smallint,
       d_constraints        char(64),
       m_constraints        char(64),
       tsf_tt_group_id      smallint NOT NULL,
       PRIMARY KEY (nodeid, tsf_tt_id),
       FOREIGN KEY (nodeid, tsf_tt_group_id)
                             REFERENCES tsf_tt_group
);



CREATE TABLE currdayctg (
       nodeid               integer NOT NULL,
       valid_date           smallint NOT NULL,
       time_group           smallint NOT NULL,
       dayctg               smallint NOT NULL,
       PRIMARY KEY (nodeid, time_group)
);



CREATE TABLE appl_server_common (
       nodeid               integer NOT NULL,
       dstctg               smallint NOT NULL,
       dstid                smallint NOT NULL,
       nrreqdgt             smallint NOT NULL,
       vas_pfx_len          smallint DEFAULT 0 NOT NULL,
       tm_wait_srvr_resp    smallint DEFAULT 0 NOT NULL,
       vas_reserve1         smallint DEFAULT 0 NOT NULL,
       vas_reserve2         smallint DEFAULT 0 NOT NULL,
       vas_reserve3         smallint DEFAULT 0 NOT NULL,
       cdpn_complete        smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dstctg, dstid)
);



CREATE TABLE week_calendar (
       nodeid               integer NOT NULL,
       time_group           smallint NOT NULL,
       week_day             smallint NOT NULL,
       wdayctg              smallint NOT NULL,
       PRIMARY KEY (nodeid, time_group, week_day)
);



CREATE TABLE inter_carr_traff (
       nodeid               integer NOT NULL,
       cid                  smallint NOT NULL,
       cid_overplus         integer DEFAULT 0 NOT NULL,
       cid_inc_traffic      integer DEFAULT 0 NOT NULL,
       cid_out_traffic      integer DEFAULT 0 NOT NULL,
       cid_traffic_diff     integer DEFAULT 0 NOT NULL,
       cid_dyndistprio      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cid)
);



CREATE TABLE dp_criteria_list (
       nodeid               integer NOT NULL,
       dpnr                 smallint DEFAULT 0 NOT NULL,
       dpcrit_trig          smallint DEFAULT 0 NOT NULL,
       dpcrit_classofsrv    smallint DEFAULT 0 NOT NULL,
       dpcrit_trnkgrp       smallint DEFAULT 0 NOT NULL,
       dpcrit_dgtstr        smallint DEFAULT 0 NOT NULL,
       dpcrit_featurecode   smallint DEFAULT 0 NOT NULL,
       dpcrit_pfx           smallint DEFAULT 0 NOT NULL,
       dpcrit_accesscode    smallint DEFAULT 0 NOT NULL,
       dpcrit_abbd          smallint DEFAULT 0 NOT NULL,
       dpcrit_cgpn          smallint DEFAULT 0 NOT NULL,
       dpcrit_cdpn          smallint DEFAULT 0 NOT NULL,
       dpcrit_natureofadd   smallint DEFAULT 0 NOT NULL,
       dpcrit_bearercpap    smallint DEFAULT 0 NOT NULL,
       dpcrit_featureact    smallint DEFAULT 0 NOT NULL,
       dpcrit_facinfo       smallint DEFAULT 0 NOT NULL,
       dpcrit_cause         smallint DEFAULT 0 NOT NULL,
       dpcrit_usi_srv_ind   smallint DEFAULT 0 NOT NULL,
       dpcrit_subsctg       tinyint DEFAULT 0 NOT NULL,
       dpcrit_rgpnfirst     tinyint DEFAULT 0 NOT NULL,
       dpcrit_rgpnlast      tinyint DEFAULT 0 NOT NULL,
       dpcrit_cgps          tinyint DEFAULT 0 NOT NULL,
       dpcrit_cdps          tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dpnr)
);



CREATE TABLE signal_note (
       nodeid               integer NOT NULL,
       indval               smallint NOT NULL,
       onoffind             smallint NOT NULL,
       inband_ind_id1       smallint,
       inband_ind_id2       smallint,
       inband_ind_id3       smallint,
       inband_ind_id4       smallint,
       inband_ind_id5       smallint,
       ringid1              smallint,
       ringid2              smallint,
       ringid3              smallint,
       isdn_message1        char(35),
       isdn_message2        char(35),
       isdn_message3        char(35),
       isdn_message4        char(35),
       isdn_message5        char(35),
       PRIMARY KEY (nodeid, indval)
);



CREATE TABLE virts_feature_set (
       nodeid               integer NOT NULL,
       virts_feat_set_id    smallint NOT NULL,
       virts_feat_set_nm    char(20),
       virts_alert_sig      smallint DEFAULT 1 NOT NULL,
       virts_alert_dur      smallint DEFAULT 120 NOT NULL,
       virts_alertibitype   smallint DEFAULT 1 NOT NULL,
       virts_alertibiind    smallint,
       virts_conn_sig       smallint DEFAULT 0 NOT NULL,
       virts_conn_dur       smallint DEFAULT 0 NOT NULL,
       virts_connibitype    smallint DEFAULT 0 NOT NULL,
       virts_connibiind     smallint,
       virts_csta_ctrl      smallint DEFAULT 0 NOT NULL,
       virts_auto_cf        smallint DEFAULT 0 NOT NULL,
       virts_1party_conp    smallint DEFAULT 0 NOT NULL,
       virts_2party_clip    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, virts_feat_set_id),
       FOREIGN KEY (nodeid, virts_alertibiind)
                             REFERENCES signal_note
);



CREATE TABLE mn_cdr_group (
       nodeid               integer NOT NULL,
       cdr_group_id         smallint NOT NULL,
       cdr_group_name       char(32) NOT NULL,
       PRIMARY KEY (nodeid, cdr_group_id)
);



CREATE UNIQUE INDEX AK1_mn_cdr_group ON mn_cdr_group
(
	nodeid                ASC,
	cdr_group_name        ASC
);



CREATE TABLE ims_ne_config (
       nodeid               integer NOT NULL,
       ims_ne_type          smallint NOT NULL,
       ims_ne_useownip      smallint DEFAULT 0 NOT NULL,
       ims_ne_port          integer DEFAULT 5060 NOT NULL,
       ims_ne_uri           char(64),
       ims_ne_transport     smallint DEFAULT 1 NOT NULL,
       stat_group_id        smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ims_ne_type)
);



CREATE TABLE diameter_attr (
       nodeid               integer NOT NULL,
       d_attr_id            smallint NOT NULL,
       d_avp_code           smallint NOT NULL,
       d_attr_incl          smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, d_attr_id, d_avp_code)
);



CREATE TABLE isup_param (
       nodeid               integer NOT NULL,
       isup_variant         smallint NOT NULL,
       isup_reanswer        smallint NOT NULL,
       isup_clearback       smallint NOT NULL,
       isup_mcid            smallint NOT NULL,
       send_rng             smallint NOT NULL,
       inr_inf_state        smallint NOT NULL,
       send_cnlidreq        smallint NOT NULL,
       crg_state            smallint NOT NULL,
       cdpn_complete        smallint NOT NULL,
       send_acm_on_busy     smallint NOT NULL,
       start_isup_timer6    smallint NOT NULL,
       echo_ctrl_variant    smallint NOT NULL,
       hold_ton_gen         smallint NOT NULL,
       time_out_interact    smallint NOT NULL,
       ccl_eop              smallint NOT NULL,
       ctx_bgid_ip          smallint NOT NULL,
       subs_name_ip         smallint NOT NULL,
       sccp_route_ind       smallint NOT NULL,
       cont_chk_ind         smallint NOT NULL,
       satellite_ind        smallint NOT NULL,
       isup_compatibility   smallint NOT NULL,
       hop_counter          smallint NOT NULL,
       protocol_version     smallint NOT NULL,
       np_addr_method       smallint DEFAULT 0 NOT NULL,
       ccbs_ccnr_possible   smallint DEFAULT 0 NOT NULL,
       send_fac             smallint DEFAULT 1 NOT NULL,
       causenr_t9expired    smallint DEFAULT 2 NOT NULL,
       nat_internat_call    smallint DEFAULT 0 NOT NULL,
       max_cdpn_length      smallint NOT NULL,
       contchk_stop_iam     smallint DEFAULT 1 NOT NULL,
       send_spc             smallint DEFAULT 0 NOT NULL,
       dgn_isup_msgpar      smallint DEFAULT 1 NOT NULL,
       send_obci            smallint DEFAULT 0 NOT NULL,
       send_cgpn            smallint DEFAULT 0 NOT NULL,
       bwci_chgind          smallint DEFAULT 0 NOT NULL,
       dgn_cond             smallint DEFAULT 0 NOT NULL,
       dgn_callrejcond      smallint DEFAULT 0 NOT NULL,
       dgn_cdpn             smallint DEFAULT 0 NOT NULL,
       dgn_dss1iei          smallint DEFAULT 0 NOT NULL,
       cgpc_unkn_trans      smallint DEFAULT 0 NOT NULL,
       replace_cgpc         smallint DEFAULT 0 NOT NULL,
       ntrofaddr_typeofnr   smallint DEFAULT 0 NOT NULL,
       tdm_rtp_id           smallint DEFAULT 0 NOT NULL,
       send_redirect_cnt    smallint DEFAULT 0 NOT NULL,
       send_redirect_cpb    smallint DEFAULT 0 NOT NULL,
       send_rel_rnpn        smallint DEFAULT 0 NOT NULL,
       send_npfwdinfo       smallint DEFAULT 0 NOT NULL,
       isup_reserve1        smallint DEFAULT 0 NOT NULL,
       isup_reserve2        smallint DEFAULT 0 NOT NULL,
       isup_reserve3        smallint DEFAULT 0 NOT NULL,
       isup_reserve4        smallint DEFAULT 0 NOT NULL,
       isup_reserve5        smallint DEFAULT 0 NOT NULL,
       isup_reserve6        smallint DEFAULT 0 NOT NULL,
       set_cdpn_inn         smallint DEFAULT 0 NOT NULL,
       send_mlpp_prec       smallint DEFAULT 0 NOT NULL,
       send_globalcallref   tinyint DEFAULT 0 NOT NULL,
       send_cdinn           tinyint DEFAULT 0 NOT NULL,
       send_origiscpc       tinyint DEFAULT 0 NOT NULL,
       simple_sgm           tinyint DEFAULT 0 NOT NULL,
       send_cnpn            tinyint DEFAULT 0 NOT NULL,
       send_origcdpn        tinyint DEFAULT 0 NOT NULL,
       send_rgpn            tinyint DEFAULT 0 NOT NULL,
       send_div_rnpn        tinyint DEFAULT 0 NOT NULL,
       send_ctnr            tinyint DEFAULT 0 NOT NULL,
       send_genpn           tinyint DEFAULT 0 NOT NULL,
       send_addcnpn         tinyint DEFAULT 0 NOT NULL,
       send_addcgpn         tinyint DEFAULT 0 NOT NULL,
       send_addorigcdpn     tinyint DEFAULT 0 NOT NULL,
       send_addrgpn         tinyint DEFAULT 0 NOT NULL,
       send_addrnpn         tinyint DEFAULT 0 NOT NULL,
       point_code           smallint DEFAULT '-1' NOT NULL,
       send_locnr           tinyint DEFAULT 0 NOT NULL,
       acc_variant          tinyint DEFAULT 0 NOT NULL,
       send_iepscallinfo    tinyint DEFAULT 0 NOT NULL,
       cgpc_isup_transit    tinyint DEFAULT 0 NOT NULL,
       send_srvact          tinyint DEFAULT 0 NOT NULL,
       srvact_cpu           tinyint DEFAULT 0 NOT NULL,
       srvact_publicclip    tinyint DEFAULT 0 NOT NULL,
       srvact_cint          tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, isup_variant),
       FOREIGN KEY (nodeid, tdm_rtp_id)
                             REFERENCES tdm_rtp_profile
);



CREATE TABLE test_telephone (
       nodeid               integer NOT NULL,
       tt_id                smallint NOT NULL,
       stbus_id             smallint NOT NULL,
       stbus_ci             smallint NOT NULL,
       tt_delay             integer NOT NULL,
       call_dur_h           integer NOT NULL,
       call_dur_l           integer NOT NULL,
       short_pause_h        integer NOT NULL,
       short_pause_l        integer NOT NULL,
       long_pause_h         integer NOT NULL,
       long_pause_l         integer NOT NULL,
       num_out_calls        smallint NOT NULL,
       num_succ_dials       smallint NOT NULL,
       num_inc_calls        smallint NOT NULL,
       num_acc_calls        smallint NOT NULL,
       PRIMARY KEY (nodeid, tt_id)
);



CREATE TABLE par_val_isup (
       nodeid               integer NOT NULL,
       autonumber_pk        smallint NOT NULL,
       isup_par_name        smallint NOT NULL,
       octet_num            smallint NOT NULL,
       byte_mask            smallint NOT NULL,
       byte_val             smallint NOT NULL,
       msg_type             smallint NOT NULL,
       alg_num              smallint NOT NULL,
       isup_par_reserve1    smallint DEFAULT 0 NOT NULL,
       isup_par_reserve2    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, autonumber_pk)
);



CREATE TABLE suppl_tariff (
       nodeid               integer NOT NULL,
       suppl_id             smallint NOT NULL,
       suppl_action         smallint NOT NULL,
       dst_charge_code      smallint NOT NULL,
       PRIMARY KEY (nodeid, suppl_id, suppl_action)
);



CREATE TABLE arp (
       nodeid               integer NOT NULL,
       ip_addr              char(15) NOT NULL,
       mac_addr             char(17) NOT NULL,
       arp_proxy            smallint NOT NULL,
       PRIMARY KEY (nodeid, ip_addr)
);



CREATE TABLE out_digit_timers (
       nodeid               integer NOT NULL,
       out_digit_tmvar      smallint NOT NULL,
       tm_dgt1              smallint NOT NULL,
       tm_pfx_cmpl          smallint NOT NULL,
       tm_req_dgt           smallint NOT NULL,
       tm_to_end            smallint NOT NULL,
       tm_after_eod         smallint NOT NULL,
       tm_after_eod2        smallint DEFAULT 0 NOT NULL,
       add_cas_dial_tm      char(36),
       PRIMARY KEY (nodeid, out_digit_tmvar)
);



CREATE TABLE route (
       nodeid               integer NOT NULL,
       routeid              smallint NOT NULL,
       identpnt             smallint NOT NULL,
       ident_request        smallint NOT NULL,
       trnkgrpid            smallint NOT NULL,
       out_digit_tmvar      smallint NOT NULL,
       cid                  smallint NOT NULL,
       proc_wait_tone       smallint DEFAULT 0 NOT NULL,
       carr_data_send       smallint DEFAULT 0 NOT NULL,
       enbloc_ind           smallint DEFAULT 0 NOT NULL,
       rerouting_control    smallint NOT NULL,
       rerouting_cause      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, routeid),
       FOREIGN KEY (nodeid, trnkgrpid)
                             REFERENCES trunk_group,
       FOREIGN KEY (nodeid, out_digit_tmvar)
                             REFERENCES out_digit_timers
);



CREATE TABLE stat_route_choice (
       nodeid               integer NOT NULL,
       routeptr             smallint NOT NULL,
       routeid              smallint NOT NULL,
       traffic_share        smallint NOT NULL,
       routeprior           smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       routing_param1       smallint DEFAULT 0 NOT NULL,
       cid                  smallint DEFAULT 0 NOT NULL,
       sub_routeptr         smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, routeptr, routeid),
       FOREIGN KEY (nodeid, routeid)
                             REFERENCES route
);



CREATE TABLE nc_pfx_vru (
       nodeid               integer NOT NULL,
       cgid                 smallint NOT NULL,
       nc_pfx_rec_vru       char(10),
       nc_pfx_read_vru      char(10),
       PRIMARY KEY (nodeid, cgid)
);



CREATE TABLE screening_list (
       nodeid               integer NOT NULL,
       asic_list_id         integer NOT NULL,
       asic_item_id         smallint NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       dstdn                char(25),
       cgpn_length          smallint DEFAULT 0 NOT NULL,
       length_mode          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, asic_list_id, asic_item_id)
);



CREATE TABLE ss7_pc_disp_format (
       nodeid               integer NOT NULL,
       ss7_pc_format_id     tinyint NOT NULL,
       ss7_pc_format        char(30) NOT NULL,
       ss7_pc_format_name   char(50) NOT NULL,
       PRIMARY KEY (nodeid, ss7_pc_format_id)
);



CREATE TABLE ss7_own_pc (
       nodeid               integer NOT NULL,
       ss7_own_pc_id        smallint NOT NULL,
       ntwrkind             smallint DEFAULT 2 NOT NULL,
       point_code           smallint NOT NULL,
       fnct_stp             smallint DEFAULT 0 NOT NULL,
       fnct_isup            smallint DEFAULT 1 NOT NULL,
       fnct_sccp            smallint DEFAULT 1 NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       ss7_pc_format_id     tinyint NOT NULL,
       PRIMARY KEY (nodeid, ss7_own_pc_id),
       FOREIGN KEY (nodeid, ss7_pc_format_id)
                             REFERENCES ss7_pc_disp_format
);



CREATE TABLE ss7_destination (
       nodeid               integer NOT NULL,
       ss7_dstid            smallint NOT NULL,
       ntwrkind             smallint DEFAULT 2 NOT NULL,
       point_code           smallint NOT NULL,
       point_type           smallint DEFAULT 0 NOT NULL,
       ss7_linksetid1       smallint NOT NULL,
       ss7_linksetid2       smallint NOT NULL,
       ss7_linksetid3       smallint NOT NULL,
       ss7_linksetid4       smallint DEFAULT 0 NOT NULL,
       sls_bit              smallint NOT NULL,
       tm_isup_pause        smallint NOT NULL,
       sendgrs              smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       send_ucic            smallint DEFAULT 1 NOT NULL,
       sigtrace_req         smallint NOT NULL,
       ss7_dst_param1       smallint NOT NULL,
       ss7_own_pc_id        smallint DEFAULT 1 NOT NULL,
       fnct_virtual         smallint DEFAULT 0 NOT NULL,
       act_exception        smallint DEFAULT 0 NOT NULL,
       send_cgb             smallint DEFAULT 0 NOT NULL,
       ss7_pc_format_id     tinyint NOT NULL,
       ss7_dst_equip        tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, ss7_dstid),
       FOREIGN KEY (nodeid, ss7_own_pc_id)
                             REFERENCES ss7_own_pc,
       FOREIGN KEY (nodeid, ss7_pc_format_id)
                             REFERENCES ss7_pc_disp_format
);



CREATE TABLE ss7_link_set (
       nodeid               integer NOT NULL,
       ss7_linksetid        smallint NOT NULL,
       ss7_dstid            smallint,
       linkset_type         smallint DEFAULT 0 NOT NULL,
       direct_linkset       tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ss7_linksetid),
       FOREIGN KEY (nodeid, ss7_dstid)
                             REFERENCES ss7_destination
);



CREATE TABLE ss7_link (
       nodeid               integer NOT NULL,
       ss7_linkid           smallint NOT NULL,
       ss7_linksetid        smallint NOT NULL,
       sys_intf_id          integer,
       portnr               smallint DEFAULT 0 NOT NULL,
       ci                   smallint DEFAULT 0 NOT NULL,
       cda_id               smallint DEFAULT 0 NOT NULL,
       errcormeth           smallint DEFAULT 0 NOT NULL,
       slc                  smallint NOT NULL,
       link_status          integer DEFAULT 0 NOT NULL,
       nosuerr              integer DEFAULT 0 NOT NULL,
       msuocttx             integer DEFAULT 0 NOT NULL,
       msuoctrx             integer DEFAULT 0 NOT NULL,
       msudisccng           integer DEFAULT 0 NOT NULL,
       add_hdlc_flags       smallint DEFAULT 0 NOT NULL,
       stat_group_id        smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       d_bit_sf             smallint DEFAULT 0 NOT NULL,
       ocm_threshold        integer DEFAULT 40 NOT NULL,
       PRIMARY KEY (nodeid, ss7_linkid),
       FOREIGN KEY (nodeid, ss7_linksetid)
                             REFERENCES ss7_link_set
);



CREATE TABLE csta_client (
       nodeid               integer NOT NULL,
       csta_client_id       smallint NOT NULL,
       tcp_address          char(15) NOT NULL,
       csta_options         smallint NOT NULL,
       private_data_usage   smallint DEFAULT 1 NOT NULL,
       report_alarm         tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, csta_client_id)
);



CREATE TABLE ctx_loc_dial (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       ctx_loc_code         char(5) NOT NULL,
       pub_pbx_prefix       char(12) NOT NULL,
       PRIMARY KEY (nodeid, bgid, ctx_loc_code)
);



CREATE TABLE ims_proxy_cscf (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       port_uc              integer DEFAULT 0 NOT NULL,
       port_us              integer DEFAULT 0 NOT NULL,
       spi_uc               integer DEFAULT 0 NOT NULL,
       spi_us               integer DEFAULT 0 NOT NULL,
       spi_pc               integer DEFAULT 0 NOT NULL,
       spi_ps               integer DEFAULT 0 NOT NULL,
       port_pc              integer DEFAULT 0 NOT NULL,
       port_ps              integer DEFAULT 0 NOT NULL,
       ipsec_alg            tinyint DEFAULT 0 NOT NULL,
       ipsec_encryptalg     tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr)
);



CREATE TABLE agcf_global (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       cookie_method        smallint DEFAULT 0 NOT NULL,
       agcf_dflt_expires    integer DEFAULT 600000 NOT NULL,
       agcf_tm_frst_rgstr   smallint DEFAULT 150 NOT NULL,
       agcf_tm_next_rgstr   smallint DEFAULT 50 NOT NULL,
       agcf_tm_fail_rgstr   smallint DEFAULT 10 NOT NULL,
       agcf_pswd_dflt       char(32),
       cnf_user             char(64),
       cnf_host             char(64),
       max_nr_of_agcf_reg   integer DEFAULT 100000 NOT NULL,
       impi_add_domain      tinyint DEFAULT 1 NOT NULL,
       s3pty_user           char(64) DEFAULT '' NOT NULL,
       s3pty_host           char(64) DEFAULT '' NOT NULL,
       search_unreg_sts     tinyint DEFAULT 1 NOT NULL,
       search_unreg_cycle   integer DEFAULT 43200 NOT NULL,
       search_unreg_tm      smallint DEFAULT 500 NOT NULL,
       reg_per_sec_tm       smallint DEFAULT 0 NOT NULL,
       sys_startup_reg      tinyint DEFAULT 1 NOT NULL,
       agcf_param1          integer DEFAULT 0 NOT NULL,
       agcf_param2          integer DEFAULT 0 NOT NULL,
       check_rgstr_subs     tinyint DEFAULT 1 NOT NULL,
       scscf_assgn_type     tinyint DEFAULT 1 NOT NULL,
       mon_nr_of_pings      tinyint DEFAULT 1 NOT NULL,
       pani_access_type     tinyint DEFAULT 17 NOT NULL,
       hot_user_code        char(64) DEFAULT 'nodial' NOT NULL,
       hotd_tm              tinyint DEFAULT 5 NOT NULL,
       tm_check_rgstr_sts   smallint DEFAULT 300 NOT NULL,
       standalone_mode      tinyint DEFAULT 0 NOT NULL,
       cnf_procedure        tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE agcf_access (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       agcf_impu_alias      char(64),
       add_ndc              smallint NOT NULL,
       profile_type         smallint DEFAULT 1 NOT NULL,
       stat_group_id        smallint NOT NULL,
       display_ring_type    smallint NOT NULL,
       inband_ind_type      smallint NOT NULL,
       org_charge_code      smallint NOT NULL,
       agcf_impi_alias      char(64),
       agcf_pswd            char(32),
       add_cntr_code        smallint DEFAULT 0 NOT NULL,
       uri_type             tinyint DEFAULT 1 NOT NULL,
       numtype              smallint DEFAULT 0 NOT NULL,
       impu_embed_teluri    tinyint DEFAULT 0 NOT NULL,
       impi_useimpualias    tinyint DEFAULT 1 NOT NULL,
       agcf_cw_sts          tinyint DEFAULT 1 NOT NULL,
       subs_startup_reg     tinyint DEFAULT 1 NOT NULL,
       port_sts_enq         tinyint DEFAULT 1 NOT NULL,
       hot_sts              tinyint DEFAULT 0 NOT NULL,
       standalone_sts       tinyint DEFAULT 0 NOT NULL,
       group_reg_alias      varchar(64) DEFAULT '' NOT NULL,
       group_reg_holder     tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr)
);



CREATE INDEX IE1_agcf_access ON agcf_access
(
	nodeid                ASC,
	agcf_impu_alias       ASC
);



CREATE INDEX IE2_agcf_access ON agcf_access
(
	nodeid                ASC,
	group_reg_alias       ASC
);



"CREATE TRIGGER IT_NE_TRG_agcf_access_AD ON agcf_access
AFTER DELETE
REFERENCING OLD nodeid AS OLD_nodeid,
REFERENCING OLD modulenr AS OLD_modulenr,
REFERENCING OLD portnr AS OLD_portnr
BEGIN
EXEC SQL PREPARE AGCF_AD
DELETE FROM agcf_registration
WHERE nodeid = ? AND modulenr = ? AND portnr = ?;
EXEC SQL EXECUTE AGCF_AD USING (OLD_nodeid,OLD_modulenr,OLD_portnr);
EXEC SQL CLOSE AGCF_AD;
EXEC SQL DROP AGCF_AD;
END";



"CREATE TRIGGER IT_NE_TRG_agcf_access_AI ON agcf_access
AFTER INSERT
REFERENCING NEW nodeid AS NEW_nodeid,
REFERENCING NEW modulenr AS NEW_modulenr,
REFERENCING NEW portnr AS NEW_portnr
BEGIN
EXEC SQL PREPARE AGCF_AI
INSERT INTO agcf_registration (nodeid, modulenr, portnr) values (?, ?, ?);
EXEC SQL EXECUTE AGCF_AI USING (NEW_nodeid, NEW_modulenr, NEW_portnr);
EXEC SQL CLOSE AGCF_AI;
EXEC SQL DROP AGCF_AI;
END";




CREATE TABLE mn_nuc (
       nodeid               integer NOT NULL,
       nuc_id               smallint NOT NULL,
       nuc_name             char(32) NOT NULL,
       PRIMARY KEY (nodeid, nuc_id)
);



CREATE UNIQUE INDEX AK1_mn_nuc ON mn_nuc
(
	nodeid                ASC,
	nuc_name              ASC
);



CREATE TABLE cm_pm_alarm (
       nodeid               integer NOT NULL,
       alarm_code           integer NOT NULL,
       alarm_group          smallint NOT NULL,
       cm_alarm_event       smallint NOT NULL,
       cm_alarm_type        smallint NOT NULL,
       cm_alarm_code        smallint NOT NULL,
       PRIMARY KEY (nodeid, alarm_code, alarm_group)
);



CREATE TABLE init_linesig (
       nodeid               integer NOT NULL,
       linesigtype          smallint NOT NULL,
       linesigvariant       smallint NOT NULL,
       initopermode         smallint NOT NULL,
       variant_desc         char(50) NOT NULL,
       transm_free_st       smallint NOT NULL,
       vf_ch_shift          smallint NOT NULL,
       rec_free_st          smallint NOT NULL,
       nr_tp_st             smallint NOT NULL,
       tp_mask              smallint NOT NULL,
       tp_st1               smallint NOT NULL,
       tp_st2               smallint NOT NULL,
       tp_st3               smallint NOT NULL,
       tp_st4               smallint NOT NULL,
       cas_bit_mask         smallint NOT NULL,
       cas_filt_interval    smallint NOT NULL,
       add_eund_filt_dur    smallint NOT NULL,
       vf_transm_free_st    smallint NOT NULL,
       param1               smallint NOT NULL,
       param2               smallint NOT NULL,
       param3               smallint DEFAULT 0 NOT NULL,
       param4               smallint DEFAULT 0 NOT NULL,
       param5               smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, linesigtype, linesigvariant, initopermode)
);



CREATE TABLE mtpl2_timer (
       nodeid               integer NOT NULL,
       timer_number         smallint NOT NULL,
       lower_bound          smallint NOT NULL,
       upper_bound          smallint NOT NULL,
       tmvalue              smallint NOT NULL,
       PRIMARY KEY (nodeid, timer_number)
);



CREATE TABLE indication_prio (
       nodeid               integer NOT NULL,
       indval               smallint NOT NULL,
       indval_priority      smallint NOT NULL,
       PRIMARY KEY (nodeid, indval)
);



CREATE TABLE ctx_member (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       ctx_intercom         integer NOT NULL,
       cgid                 smallint NOT NULL,
       dstdn                char(25) NOT NULL,
       chsite               smallint NOT NULL,
       PRIMARY KEY (nodeid, bgid, ctx_intercom)
);



CREATE UNIQUE INDEX AK1_ctx_member ON ctx_member
(
	nodeid                ASC,
	dstdn                 ASC
);



CREATE TABLE casmux_param (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       scan_pause           smallint NOT NULL,
       conn_refresh_time    smallint NOT NULL,
       casmux_mode          smallint NOT NULL,
       add_mode_par         smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE dss1_l3_data (
       nodeid               integer NOT NULL,
       dss1_l3_variant      smallint NOT NULL,
       l3ntm301             smallint NOT NULL,
       l3ntm302             smallint NOT NULL,
       l3ntm303             smallint NOT NULL,
       l3ntm304             smallint NOT NULL,
       l3ntm305             smallint NOT NULL,
       l3ntm306             smallint NOT NULL,
       l3ntm308             smallint NOT NULL,
       l3ntm309             smallint NOT NULL,
       l3ntm310             smallint NOT NULL,
       l3ntm312             smallint NOT NULL,
       l3ntm316             smallint NOT NULL,
       l3ntm317             smallint NOT NULL,
       l3utm302             smallint NOT NULL,
       l3utm303             smallint NOT NULL,
       l3utm304             smallint NOT NULL,
       l3utm305             smallint NOT NULL,
       l3utm308             smallint NOT NULL,
       l3utm309             smallint NOT NULL,
       l3utm310             smallint NOT NULL,
       l3utm313             smallint NOT NULL,
       l3utm316             smallint NOT NULL,
       l3utm317             smallint NOT NULL,
       PRIMARY KEY (nodeid, dss1_l3_variant)
);



CREATE TABLE level2_data (
       nodeid               integer NOT NULL,
       level2_variant       smallint NOT NULL,
       l2tm200              smallint NOT NULL,
       l2tm201              smallint NOT NULL,
       l2tm202              smallint NOT NULL,
       l2tm203              smallint NOT NULL,
       l2maxret200          smallint NOT NULL,
       l2maxret202          smallint NOT NULL,
       l2_tm2framesdelay    smallint DEFAULT 0 NOT NULL,
       l2_winsize           smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, level2_variant)
);



CREATE TABLE dss1_d_channel (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       dss1_port_type       smallint NOT NULL,
       level2_variant       smallint NOT NULL,
       dss1_l3_variant      smallint NOT NULL,
       portctg              smallint NOT NULL,
       dss1_layers          smallint NOT NULL,
       dss1_side            smallint NOT NULL,
       log_com_ch_id        integer,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr),
       FOREIGN KEY (nodeid, level2_variant)
                             REFERENCES level2_data,
       FOREIGN KEY (nodeid, dss1_l3_variant)
                             REFERENCES dss1_l3_data
);



CREATE TABLE log_term (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       tei                  smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, tei),
       FOREIGN KEY (nodeid, modulenr, portnr)
                             REFERENCES dss1_d_channel
);



CREATE TABLE rec_subs_cd_conv (
       nodeid               integer NOT NULL,
       dicon_group          smallint NOT NULL,
       numtype              smallint NOT NULL,
       cdpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, dicon_group, numtype, cdpn_prefix)
);



CREATE TABLE sigtrace_sdl (
       nodeid               integer NOT NULL,
       sdl_trcid            smallint NOT NULL,
       sdl_trctype          smallint NOT NULL,
       sdl_name             char(50) NOT NULL,
       sdl_pid              integer,
       sdl_state            smallint,
       sigtrace_req         smallint,
       PRIMARY KEY (nodeid, sdl_trcid)
);



CREATE TABLE common_carr_data (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       wrong_cac_resptyp    smallint NOT NULL,
       nat_cac_pfx          char(6),
       inter_cac_pfx        char(6),
       nat_pfx_dicon        char(25),
       inter_pfx_dicon      char(25),
       outg_nat_pfx_dicon   char(25),
       outg_int_pfx_dicon   char(25),
       own_cid              smallint NOT NULL,
       multicarrier         smallint NOT NULL,
       outg_dstid           smallint,
       open_numeration      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE late_feature (
       nodeid               integer NOT NULL,
       lf_index1            smallint NOT NULL,
       lf_index2            smallint NOT NULL,
       lf_data1             integer,
       lf_data2             integer,
       lf_data3             char(25),
       PRIMARY KEY (nodeid, lf_index1, lf_index2)
);



CREATE TABLE li_params (
       nodeid               integer NOT NULL,
       li_enabled           smallint DEFAULT 0 NOT NULL,
       li_mod_ip_addr       char(15) NOT NULL,
       li_mod_ip_port       integer NOT NULL,
       li_reconn_timeout    integer NOT NULL,
       li_send_timeout      integer NOT NULL,
       li_wait_timeout      integer NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE h248_nonstd_prf (
       nodeid               integer NOT NULL,
       h248_ns_prf_id       smallint NOT NULL,
       h248_prf_name        char(20) NOT NULL,
       h248_prf_data        integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, h248_ns_prf_id)
);



CREATE UNIQUE INDEX AK1_h248_nonstd_prf ON h248_nonstd_prf
(
	nodeid                ASC,
	h248_prf_name         ASC
);



CREATE TABLE h248_intf_profile (
       nodeid               integer NOT NULL,
       h248_intf_prf_id     smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       intf_pfx             char(10),
       acc_pfx              char(10),
       ch_pfx               char(10),
       max1num_retrans      smallint NOT NULL,
       init_retrans_delay   smallint NOT NULL,
       max_retrans_delay    smallint NOT NULL,
       tmax_retrans_dur     integer NOT NULL,
       max_transact_dur     integer NOT NULL,
       ip_precedence        smallint NOT NULL,
       mg_provis_resp_tm    smallint DEFAULT 80 NOT NULL,
       mgc_provis_resp_tm   smallint DEFAULT 32767 NOT NULL,
       mgorig_pend_limit    smallint DEFAULT 11 NOT NULL,
       mgcorig_pend_limit   smallint DEFAULT 11 NOT NULL,
       intf_present         smallint DEFAULT 1 NOT NULL,
       acc_present          smallint DEFAULT 1 NOT NULL,
       ch_present           smallint DEFAULT 1 NOT NULL,
       h248trans_protocol   smallint DEFAULT 0 NOT NULL,
       add_eph_term_type    smallint DEFAULT 1 NOT NULL,
       analog_port_pfx      char(10) DEFAULT NULL,
       bra_port_pfx         char(10) DEFAULT NULL,
       e1_port_pfx          char(10) DEFAULT NULL,
       phy_board_pfx        char(10) DEFAULT NULL,
       phy_board_data       integer DEFAULT 0 NOT NULL,
       eph_term_pfx         char(10) DEFAULT NULL,
       h248_std_prf_opt     integer DEFAULT 0 NOT NULL,
       h248_intf_fmt        integer DEFAULT 0 NOT NULL,
       h248_slot_fmt        integer DEFAULT 0 NOT NULL,
       h248_phyboard_fmt    integer DEFAULT 0 NOT NULL,
       h248_acc_fmt         integer DEFAULT 0 NOT NULL,
       h248_ch_fmt          integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, h248_intf_prf_id)
);



CREATE UNIQUE INDEX AK1_h248_intf_profile ON h248_intf_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE h248_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       h248_domain_name     char(50) NOT NULL,
       h248_side            smallint DEFAULT 0 NOT NULL,
       h248_intf_prf_id     smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       h248_intf_options    smallint DEFAULT 5 NOT NULL,
       h248_ns_prf_id       smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id),
       FOREIGN KEY (nodeid, h248_intf_prf_id)
                             REFERENCES h248_intf_profile,
       FOREIGN KEY (nodeid, h248_ns_prf_id)
                             REFERENCES h248_nonstd_prf
);



CREATE UNIQUE INDEX AK1_h248_interface ON h248_interface
(
	nodeid                ASC,
	h248_domain_name      ASC,
	h248_side             ASC
);



CREATE TABLE mgcp_intf_profile (
       nodeid               integer NOT NULL,
       mgcp_intf_prf_id     smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       subs_type_pfx        char(10),
       intf_pfx             char(10),
       acc_pfx              char(10),
       ch_pfx               char(10),
       max1num_retrans      smallint NOT NULL,
       init_retrans_delay   smallint NOT NULL,
       max_retrans_delay    smallint NOT NULL,
       tmax_retrans_dur     integer NOT NULL,
       max_transact_dur     integer NOT NULL,
       init_dp_delay        smallint NOT NULL,
       max_dp_delay         smallint NOT NULL,
       ip_precedence        smallint NOT NULL,
       intf_present         smallint DEFAULT 1 NOT NULL,
       acc_present          smallint DEFAULT 1 NOT NULL,
       ch_present           smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, mgcp_intf_prf_id)
);



CREATE UNIQUE INDEX AK1_mgcp_intf_profile ON mgcp_intf_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE mgcp_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       mgcp_domain_name     char(50) NOT NULL,
       mgcp_side            smallint NOT NULL,
       mgcp_intf_active     smallint NOT NULL,
       mgcp_intf_prf_id     smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id),
       FOREIGN KEY (nodeid, mgcp_intf_prf_id)
                             REFERENCES mgcp_intf_profile
);



CREATE UNIQUE INDEX AK1_mgcp_interface ON mgcp_interface
(
	nodeid                ASC,
	mgcp_domain_name      ASC,
	mgcp_side             ASC
);



CREATE TABLE rec_subs_cn_conv (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       numtype              smallint NOT NULL,
       cnpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, numtype, cnpn_prefix)
);



CREATE TABLE prefix_signaling (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       casopermode          smallint NOT NULL,
       sig_prefix           char(15) NOT NULL,
       regsigtype           smallint NOT NULL,
       regsigvariant        smallint NOT NULL,
       reg_sig_bkw1         smallint NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid, casopermode, sig_prefix),
       FOREIGN KEY (nodeid, trnkgrpid)
                             REFERENCES trunk_group
);



CREATE TABLE ctx_group (
       nodeid               integer NOT NULL,
       cgid                 smallint NOT NULL,
       bgid                 integer NOT NULL,
       cplxgid              smallint NOT NULL,
       business_ctx_pnac    char(5),
       ctx_pnac             char(5),
       ctx_pint             char(5),
       indval1              smallint NOT NULL,
       indval2              smallint NOT NULL,
       ctx_group_type       smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       ctx_grp_dial_auth    smallint NOT NULL,
       ctx_grp_dn           integer,
       imm_send_cdr_auth    smallint DEFAULT 0 NOT NULL,
       tm_ctxnoansw         smallint DEFAULT 40 NOT NULL,
       cpus_mode            smallint DEFAULT 2 NOT NULL,
       ann_variant          smallint NOT NULL,
       ctx_inter_length     tinyint DEFAULT 0 NOT NULL,
       ctx_universal_dialing tinyint DEFAULT 0 NOT NULL,
       ctx_pub_clip         tinyint DEFAULT 0 NOT NULL,
       linkage_cw           tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cgid),
       FOREIGN KEY (nodeid, ann_variant)
                             REFERENCES ann_variants
);



CREATE TABLE atrunk_param (
       nodeid               integer NOT NULL,
       init_variant         smallint NOT NULL,
       relinlevel           smallint NOT NULL,
       reloutlevel          smallint NOT NULL,
       wire_potential       smallint NOT NULL,
       atr_signaling        smallint NOT NULL,
       PRIMARY KEY (nodeid, init_variant)
);



CREATE TABLE mtpsltc_timer (
       nodeid               integer NOT NULL,
       timer_number         smallint NOT NULL,
       lower_bound          smallint NOT NULL,
       upper_bound          smallint NOT NULL,
       tmvalue              smallint NOT NULL,
       PRIMARY KEY (nodeid, timer_number)
);



CREATE TABLE tsf_data_group (
       nodeid               integer NOT NULL,
       tsf_data_group_id    smallint NOT NULL,
       cum_data_desc        char(20) NOT NULL,
       PRIMARY KEY (nodeid, tsf_data_group_id)
);



CREATE TABLE tsf_connection (
       nodeid               integer NOT NULL,
       tsf_connection_id    smallint NOT NULL,
       tsf_data_group_id    smallint NOT NULL,
       tsf_tt_group_id      smallint NOT NULL,
       tsf_activity         smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, tsf_connection_id),
       FOREIGN KEY (nodeid, tsf_data_group_id)
                             REFERENCES tsf_data_group,
       FOREIGN KEY (nodeid, tsf_tt_group_id)
                             REFERENCES tsf_tt_group
);



CREATE TABLE cas_conn_param (
       nodeid               integer NOT NULL,
       casconnvariant       smallint NOT NULL,
       casopermode          smallint NOT NULL,
       connparvalue1        integer NOT NULL,
       connparvalue2        integer NOT NULL,
       connparvalue3        integer NOT NULL,
       connparvalue4        integer NOT NULL,
       connparvalue5        integer NOT NULL,
       connparvalue6        integer NOT NULL,
       connparvalue7        integer NOT NULL,
       connparvalue8        integer NOT NULL,
       connparvalue9        integer NOT NULL,
       connparvalue10       integer NOT NULL,
       connparvalue11       integer DEFAULT 0 NOT NULL,
       connparvalue12       integer DEFAULT 0 NOT NULL,
       connparvalue13       integer DEFAULT 0 NOT NULL,
       connparvalue14       integer DEFAULT 0 NOT NULL,
       connparvalue15       integer DEFAULT 0 NOT NULL,
       connparvalue16       integer DEFAULT 0 NOT NULL,
       connparvalue17       integer DEFAULT 0 NOT NULL,
       connparvalue18       integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, casconnvariant, casopermode)
);



CREATE TABLE dn_range (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       dn_range_prefix      char(10) NOT NULL,
       dn_range_subsnr      char(15) NOT NULL,
       first_pbx_digit      smallint NOT NULL,
       pbx_numeration       smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, dn_range_prefix)
);



CREATE TABLE cas_reg_param (
       nodeid               integer NOT NULL,
       regsigtype           smallint NOT NULL,
       regsigvariant        smallint NOT NULL,
       casopermode          smallint NOT NULL,
       cas_attenuation      integer NOT NULL,
       wait_su              integer NOT NULL,
       delay_before_end     integer NOT NULL,
       pulse_length         integer NOT NULL,
       pulse_long           integer NOT NULL,
       pulse_secure         integer NOT NULL,
       pause_length         integer NOT NULL,
       pause_long           integer NOT NULL,
       pause_secure         integer NOT NULL,
       RegSigParValue1      integer NOT NULL,
       RegSigParValue2      integer NOT NULL,
       RegSigParValue3      integer NOT NULL,
       RegSigParValue4      integer NOT NULL,
       RegSigParValue5      integer NOT NULL,
       RegSigParValue6      integer NOT NULL,
       RegSigParValue7      integer NOT NULL,
       RegSigParValue8      integer NOT NULL,
       RegSigParValue9      integer NOT NULL,
       RegSigParValue10     integer NOT NULL,
       RegSigParValue11     integer NOT NULL,
       RegSigParValue12     integer DEFAULT 0 NOT NULL,
       RegSigParValue13     integer DEFAULT 0 NOT NULL,
       RegSigParValue14     integer DEFAULT 0 NOT NULL,
       RegSigParValue15     integer DEFAULT 0 NOT NULL,
       regsigparvalue16     integer DEFAULT 0 NOT NULL,
       regsigparvalue17     integer DEFAULT 0 NOT NULL,
       regsigparvalue18     integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, regsigtype, regsigvariant, casopermode)
);



CREATE TABLE sci_steer (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       suppl_id             smallint NOT NULL,
       sci_type             smallint NOT NULL,
       suppl_abbr           char(10) NOT NULL,
       sci_partype1         smallint NOT NULL,
       sci_partype2         smallint NOT NULL,
       sci_partype3         smallint NOT NULL,
       sci_partype4         smallint NOT NULL,
       sci_partype5         smallint NOT NULL,
       sci_partype6         smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dstid)
);



CREATE TABLE sci_steer_def_data (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       keyword              char(4),
       dstdn                char(25),
       sci_time             char(4),
       sci_barrclass        char(3),
       sci_invoc_nr         char(2),
       sci_msg_id           char(2),
       sci_date_sl          char(6),
       sci_date_en          char(6),
       PRIMARY KEY (nodeid, dstid),
       FOREIGN KEY (nodeid, dstid)
                             REFERENCES sci_steer
);



CREATE TABLE national_to_subctg (
       nodeid               integer NOT NULL,
       national_subsctg     smallint NOT NULL,
       subsctg_trtype       smallint NOT NULL,
       subsctg              smallint NOT NULL,
       PRIMARY KEY (nodeid, national_subsctg, subsctg_trtype)
);



CREATE TABLE squid_ne_port (
       nodeid               integer NOT NULL,
       squid_ne_port_nr     integer DEFAULT 3128 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE local_mgcp_access (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       acc_ip_addr          char(15) NOT NULL,
       mgcp_domain_name     char(50) NOT NULL,
       mgcp_intf_prf_id     smallint NOT NULL,
       mgcp_intf_active     smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr),
       FOREIGN KEY (nodeid, mgcp_intf_prf_id)
                             REFERENCES mgcp_intf_profile
);



CREATE TABLE prepaid_option (
       nodeid               integer NOT NULL,
       prepaid_param1       integer NOT NULL,
       prepaid_param2       integer NOT NULL,
       prepaid_param3       integer NOT NULL,
       prepaid_param4       integer NOT NULL,
       PRIMARY KEY (nodeid, prepaid_param1)
);



CREATE TABLE dayctgrelation (
       nodeid               integer NOT NULL,
       time_group           smallint NOT NULL,
       wdayctg              smallint NOT NULL,
       hdayctg              smallint NOT NULL,
       dayctg               smallint NOT NULL,
       PRIMARY KEY (nodeid, time_group, wdayctg, hdayctg)
);



CREATE TABLE ecm_link (
       nodeid               integer NOT NULL,
       sub_nodeid           smallint NOT NULL,
       ecm_link_id          smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       PRIMARY KEY (nodeid, sub_nodeid, ecm_link_id)
);



CREATE UNIQUE INDEX i_ecm_link ON ecm_link
(
	nodeid                ASC,
	modulenr              ASC,
	portnr                ASC
);



CREATE TABLE detect_point (
       nodeid               integer NOT NULL,
       dpnr                 smallint DEFAULT 0 NOT NULL,
       outsrv_name          smallint DEFAULT 0 NOT NULL,
       dptype               smallint DEFAULT 0 NOT NULL,
       seqnr                smallint DEFAULT 1 NOT NULL,
       dparming             smallint DEFAULT 0 NOT NULL,
       dpcriteria_id        smallint DEFAULT 0 NOT NULL,
       dpproperty_id        smallint DEFAULT 0 NOT NULL,
       dpsrvgroup           smallint DEFAULT 0 NOT NULL,
       dpsrvgroupseqnr      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dpnr, outsrv_name, dptype, seqnr)
);



CREATE INDEX IE1_detect_point ON detect_point
(
	nodeid                ASC,
	dpsrvgroup            ASC,
	dpsrvgroupseqnr       ASC
);



CREATE TABLE ecm_subnode (
       nodeid               integer NOT NULL,
       sub_nodeid           smallint NOT NULL,
       tcp_address1         char(15) NOT NULL,
       tcp_address2         char(15),
       sub_ecm_protocol     smallint NOT NULL,
       ecm_pswd             char(6) NOT NULL,
       ecm_client           smallint NOT NULL,
       ecm_tcp_port         smallint DEFAULT 13000,
       PRIMARY KEY (nodeid, sub_nodeid)
);



CREATE TABLE quasi_inter_call (
       nodeid               integer NOT NULL,
       orig_cgid            smallint NOT NULL,
       term_cgid            smallint NOT NULL,
       quasi_inter_pfx      char(3),
       dst_charge_code      smallint NOT NULL,
       call_ctg             smallint NOT NULL,
       PRIMARY KEY (nodeid, orig_cgid, term_cgid)
);



CREATE TABLE add_dial_tone (
       nodeid               integer NOT NULL,
       routeid              smallint NOT NULL,
       dial_tone_prefix     char(25) NOT NULL,
       incm_trnkgrpid       smallint NOT NULL,
       dial_indval          smallint NOT NULL,
       PRIMARY KEY (nodeid, routeid, dial_tone_prefix, incm_trnkgrpid)
);



CREATE TABLE monitor_orders (
       nodeid               integer NOT NULL,
       monitoring_nr        char(25) NOT NULL,
       monitored_nr         char(25) NOT NULL,
       spy_tele_id          smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       monitored_present    char(25) NOT NULL,
       ming_term_type       smallint DEFAULT 0 NOT NULL,
       monitoring_loc       smallint DEFAULT 0 NOT NULL,
       monitored_loc        smallint DEFAULT 0 NOT NULL,
       monitoring_bgid      integer DEFAULT 0 NOT NULL,
       monitored_bgid       integer DEFAULT 0 NOT NULL,
       monitoring_permis    smallint DEFAULT 0 NOT NULL,
       monitored_permis     smallint DEFAULT 0 NOT NULL,
       protocol             smallint DEFAULT 0 NOT NULL,
       monitoring_state     smallint DEFAULT 0 NOT NULL,
       slsd_debug           smallint DEFAULT 0 NOT NULL,
       monitoring_module    smallint NOT NULL,
       monitoring_port      smallint NOT NULL,
       PRIMARY KEY (nodeid, monitoring_nr, monitored_nr, spy_tele_id)
);



CREATE INDEX IE1_monitor_orders ON monitor_orders
(
	nodeid                ASC,
	monitored_nr          ASC,
	spy_tele_id           ASC
);



CREATE TABLE sccp_gtt (
       nodeid               integer NOT NULL,
       gtt_type             smallint NOT NULL,
       gtt_num_plan         smallint NOT NULL,
       gtt_num_type         smallint NOT NULL,
       gtt_number_mask      char(25) NOT NULL,
       pri_ntwrkind         smallint NOT NULL,
       pri_opc              smallint NOT NULL,
       pri_dpc              smallint NOT NULL,
       pri_ssn              smallint NOT NULL,
       sec_ntwrkind         smallint NOT NULL,
       sec_opc              smallint NOT NULL,
       sec_dpc              smallint NOT NULL,
       sec_ssn              smallint NOT NULL,
       new_gt               smallint NOT NULL,
       new_gtt_type         smallint NOT NULL,
       new_gtt_num_plan     smallint NOT NULL,
       new_gtt_num_type     smallint NOT NULL,
       dicon                char(25),
       sccp_new_routeon     smallint DEFAULT '-1' NOT NULL,
       sccp_loadshare       tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, gtt_type, gtt_num_plan, gtt_num_type, gtt_number_mask)
);



CREATE TABLE trunk_test_param (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       sac_ringtone_dur     smallint NOT NULL,
       sac_freq_dur         smallint NOT NULL,
       sac_delay_time       smallint NOT NULL,
       noise_dur            smallint NOT NULL,
       release_time         smallint NOT NULL,
       ott_mf_receiver      smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       nexttestdelay        smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE signal_dyn_attr (
       nodeid               integer NOT NULL,
       linesigtype          smallint NOT NULL,
       linesigvariant       smallint NOT NULL,
       line_sig_id          smallint NOT NULL,
       in_present           smallint NOT NULL,
       out_present          smallint NOT NULL,
       state                smallint NOT NULL,
       next_state           smallint NOT NULL,
       priority             smallint NOT NULL,
       signal_type          smallint NOT NULL,
       shape                smallint NOT NULL,
       test                 smallint NOT NULL,
       min1                 smallint NOT NULL,
       mid1                 smallint NOT NULL,
       max1                 smallint NOT NULL,
       min2                 smallint NOT NULL,
       mid2                 smallint NOT NULL,
       max2                 smallint NOT NULL,
       min3                 smallint NOT NULL,
       mid3                 smallint NOT NULL,
       max3                 smallint NOT NULL,
       minl                 smallint NOT NULL,
       midl                 smallint NOT NULL,
       maxl                 smallint NOT NULL,
       PRIMARY KEY (nodeid, linesigtype, linesigvariant, line_sig_id)
);



CREATE TABLE sent_trnk_cn_conv (
       nodeid               integer NOT NULL,
       dicon_group          smallint NOT NULL,
       ndc_id               smallint NOT NULL,
       numtype              smallint NOT NULL,
       cnpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, dicon_group, ndc_id, numtype, cnpn_prefix)
);



CREATE TABLE dp_criteria (
       nodeid               integer NOT NULL,
       dpcriteria_id        smallint DEFAULT 1 NOT NULL,
       dpcriteria_base      smallint DEFAULT 0 NOT NULL,
       dpcriteria_trigger   smallint DEFAULT 0 NOT NULL,
       dpgroup_list_id      smallint DEFAULT 1 NOT NULL,
       dptrnkgrp_list_id    smallint DEFAULT 0 NOT NULL,
       dpcriteria_cause     smallint NOT NULL,
       dpcgpn_list_id       smallint DEFAULT 0 NOT NULL,
       dpcdpn_list_id       smallint DEFAULT 0 NOT NULL,
       dpdgtstr_list_id     smallint DEFAULT 0 NOT NULL,
       dpfeatcode_list_id   smallint DEFAULT 0 NOT NULL,
       dpacccode_list_id    smallint DEFAULT 0 NOT NULL,
       dppfx_list_id        smallint DEFAULT 0 NOT NULL,
       dprgpn_list_id       smallint DEFAULT 0 NOT NULL,
       dprgpnlast_list_id   smallint DEFAULT 0 NOT NULL,
       dpcgps_list_id       smallint DEFAULT 0 NOT NULL,
       dpcdps_list_id       smallint DEFAULT 0 NOT NULL,
       dpsubsctg_list_id    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dpcriteria_id)
);



CREATE TABLE iw_data (
       nodeid               integer NOT NULL,
       orig_regsigtype      smallint NOT NULL,
       orig_linesigtype     smallint NOT NULL,
       term_regsigtype      smallint NOT NULL,
       term_linesigtype     smallint NOT NULL,
       back_connect         smallint NOT NULL,
       ring_tone            smallint NOT NULL,
       eosf_holdback        smallint NOT NULL,
       PRIMARY KEY (nodeid, orig_regsigtype, orig_linesigtype, term_regsigtype, term_linesigtype)
);



CREATE TABLE tariff (
       nodeid               integer NOT NULL,
       tariff_id            smallint NOT NULL,
       time_group           smallint NOT NULL,
       first_period_type    smallint NOT NULL,
       switch_over_type     smallint NOT NULL,
       PRIMARY KEY (nodeid, tariff_id)
);



CREATE TABLE tariff_param (
       nodeid               integer NOT NULL,
       tariff_id            smallint NOT NULL,
       tariff_rate          smallint NOT NULL,
       sequence_step        smallint NOT NULL,
       subtariff_duration   integer NOT NULL,
       crg_period           integer NOT NULL,
       crg_units            integer NOT NULL,
       sequence_end_type    smallint NOT NULL,
       PRIMARY KEY (nodeid, tariff_id, tariff_rate, sequence_step),
       FOREIGN KEY (nodeid, tariff_id)
                             REFERENCES tariff
);



CREATE TABLE local_ndc (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       cntr_code            char(4) NOT NULL,
       ndc                  char(6),
       add_ndc              smallint NOT NULL,
       add_cntr_code        smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ndc_id)
);



CREATE TABLE abbd_dstn (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       abbrnr               char(5) NOT NULL,
       dstctg               smallint NOT NULL,
       dstid                smallint NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, abbrnr),
       FOREIGN KEY (nodeid, ndc_id)
                             REFERENCES local_ndc
);



CREATE TABLE filter_grp_member (
       nodeid               integer NOT NULL,
       intf_id              smallint NOT NULL,
       sub_type             smallint NOT NULL,
       filter_direction     smallint NOT NULL,
       member_order         smallint NOT NULL,
       filter_id            smallint NOT NULL,
       PRIMARY KEY (nodeid, intf_id, sub_type, filter_direction, member_order),
       FOREIGN KEY (nodeid, filter_id)
                             REFERENCES filter
);



CREATE TABLE m2ua_profile (
       nodeid               integer NOT NULL,
       m2ua_prf_id          smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       m2ua_version         smallint DEFAULT 1 NOT NULL,
       tm_tr                smallint DEFAULT 2000 NOT NULL,
       tm_hb                smallint DEFAULT 1000 NOT NULL,
       tm_ack               smallint DEFAULT 2000 NOT NULL,
       tm_establish         smallint DEFAULT '-1' NOT NULL,
       m2ua_hb              smallint DEFAULT 0 NOT NULL,
       bundle               smallint DEFAULT 0 NOT NULL,
       associate_repeat     smallint DEFAULT '-1' NOT NULL,
       streams_per_link     smallint DEFAULT 1 NOT NULL,
       correlation_id       smallint DEFAULT 0 NOT NULL,
       m2ua_register_mode   smallint DEFAULT 2 NOT NULL,
       stream_for_asptm     smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, m2ua_prf_id)
);



CREATE UNIQUE INDEX AK1_m2ua_profile ON m2ua_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE m2ua_appl_server (
       nodeid               integer NOT NULL,
       m2ua_as_id           smallint NOT NULL,
       m2ua_side            smallint NOT NULL,
       m2ua_type            smallint NOT NULL,
       traffic_mode         smallint DEFAULT 1 NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       m2ua_prf_id          smallint NOT NULL,
       PRIMARY KEY (nodeid, m2ua_as_id),
       FOREIGN KEY (nodeid, m2ua_prf_id)
                             REFERENCES m2ua_profile
);



CREATE TABLE m2ua_as_assoc (
       nodeid               integer NOT NULL,
       m2ua_as_assoc_id     smallint NOT NULL,
       m2ua_as_id           smallint NOT NULL,
       sys_intf_id          integer NOT NULL,
       m2ua_traffic_prio    smallint DEFAULT 1 NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       log_stat_group_id    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, m2ua_as_assoc_id),
       FOREIGN KEY (nodeid, m2ua_as_id)
                             REFERENCES m2ua_appl_server
);



CREATE TABLE appl_server_dstid (
       nodeid               integer NOT NULL,
       outsrv_name          smallint DEFAULT 0 NOT NULL,
       dstctg               smallint DEFAULT 0 NOT NULL,
       dstid                smallint DEFAULT 0 NOT NULL,
       new_dstctg           smallint DEFAULT 0 NOT NULL,
       new_dstid            smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, outsrv_name, dstctg, dstid)
);



CREATE TABLE feature_out_srv (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       outsrv_name          smallint DEFAULT 0 NOT NULL,
       outsrv_property      integer DEFAULT 0 NOT NULL,
       dstid                smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dn, basic_id, outsrv_name)
);



CREATE TABLE m2ua_link (
       nodeid               integer NOT NULL,
       ss7_linkid           smallint NOT NULL,
       sdti                 integer DEFAULT 0 NOT NULL,
       sdli                 integer DEFAULT 0 NOT NULL,
       m2ua_as_id           smallint NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       m2ua_link_equip      smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, ss7_linkid),
       FOREIGN KEY (nodeid, m2ua_as_id)
                             REFERENCES m2ua_appl_server
);



CREATE TABLE m2ua_iid (
       nodeid               integer NOT NULL,
       m2ua_iid_id          smallint NOT NULL,
       ss7_linkid           smallint NOT NULL,
       sys_intf_id          integer NOT NULL,
       iid                  integer DEFAULT '-1' NOT NULL,
       iid_text             char(31) DEFAULT NULL,
       PRIMARY KEY (nodeid, m2ua_iid_id),
       FOREIGN KEY (nodeid, ss7_linkid)
                             REFERENCES m2ua_link
);



CREATE UNIQUE INDEX AK1_m2ua_iid ON m2ua_iid
(
	nodeid                ASC,
	ss7_linkid            ASC,
	sys_intf_id           ASC
);



CREATE TABLE b_trnkgrp_list (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       cgpn_length          smallint DEFAULT 0 NOT NULL,
       length_mode          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid, cgpn_prefix)
);



CREATE TABLE mwi_data (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       nrofmessages         smallint NOT NULL,
       mwi_invmode          smallint NOT NULL,
       message_id           smallint NOT NULL,
       PRIMARY KEY (nodeid, dn, basic_id)
);



CREATE TABLE fltind (
       nodeid               integer NOT NULL,
       mod_id               smallint NOT NULL,
       obiden               smallint NOT NULL,
       obtype               smallint NOT NULL,
       errcod               integer NOT NULL,
       PRIMARY KEY (nodeid, mod_id, obiden, errcod)
);



CREATE TABLE carrier (
       nodeid               integer NOT NULL,
       cid                  smallint NOT NULL,
       carr_type            smallint NOT NULL,
       carr_name            char(20) NOT NULL,
       cac_arr              char(6),
       PRIMARY KEY (nodeid, cid)
);



CREATE TABLE coco_net_addr (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       net_addr_priority    smallint NOT NULL,
       dst_ip_addr          char(15),
       dst_ip_addr_mode     smallint DEFAULT 0 NOT NULL,
       coco_side            tinyint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, net_addr_priority, coco_side)
);



CREATE INDEX IE1_coco_net_addr ON coco_net_addr
(
	nodeid                ASC,
	dst_ip_addr           ASC
);



CREATE TABLE csta_trunk (
       nodeid               integer NOT NULL,
       trunkid              integer NOT NULL,
       csta_monitor         smallint NOT NULL,
       PRIMARY KEY (nodeid, trunkid)
);



CREATE TABLE orig_cb_switch (
       nodeid               integer NOT NULL,
       barrpfx              char(20) NOT NULL,
       barrclass            smallint NOT NULL,
       switch_time          smallint NOT NULL,
       dayctg               smallint NOT NULL,
       switch_type          smallint NOT NULL,
       PRIMARY KEY (nodeid, barrpfx, barrclass, switch_time, dayctg)
);



CREATE TABLE sent_subs_cng_conv (
       nodeid               integer NOT NULL,
       dicon_group          smallint NOT NULL,
       numtype              smallint NOT NULL,
       cgcn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, dicon_group, numtype, cgcn_prefix)
);



CREATE TABLE vxml_script (
       nodeid               integer NOT NULL,
       vxml_id              integer NOT NULL,
       url_part             char(200) NOT NULL,
       vxml_variant         smallint DEFAULT 1 NOT NULL,
       tariff_dir           smallint DEFAULT 0 NOT NULL,
       transfer_cgpn        smallint DEFAULT 3 NOT NULL,
       dtmf_req             smallint DEFAULT 0 NOT NULL,
       vxml_qos             smallint DEFAULT 0 NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       simult_script_call   smallint NOT NULL,
       vxml_msg_type        smallint DEFAULT 1 NOT NULL,
       sync_delay_start     smallint DEFAULT 0 NOT NULL,
       transfer_viaproxy    smallint DEFAULT 0 NOT NULL,
       vxml_logon_auth      smallint DEFAULT 0 NOT NULL,
       vxml_fax_mod_dtct    smallint DEFAULT 0 NOT NULL,
       alert_sig_to_cg      smallint DEFAULT 1 NOT NULL,
       answer_sig_to_cg     smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, vxml_id)
);



CREATE TABLE isup_timer (
       nodeid               integer NOT NULL,
       timer_number         smallint NOT NULL,
       lower_bound          smallint NOT NULL,
       upper_bound          smallint NOT NULL,
       tmvalue              smallint NOT NULL,
       PRIMARY KEY (nodeid, timer_number)
);



CREATE TABLE abbd_time (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       abbrnr               char(5) NOT NULL,
       switch_time          smallint NOT NULL,
       dayctg               smallint NOT NULL,
       fullnr               char(25) NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, abbrnr, switch_time, dayctg),
       FOREIGN KEY (nodeid, ndc_id)
                             REFERENCES local_ndc
);



CREATE TABLE b_orig_alias_list (
       nodeid               integer NOT NULL,
       subs_alias           char(50) NOT NULL,
       user_domain_name     char(50) NOT NULL,
       barrclass            smallint NOT NULL,
       PRIMARY KEY (nodeid, subs_alias, user_domain_name, barrclass)
);



CREATE TABLE w_orig_alias_list (
       nodeid               integer NOT NULL,
       subs_alias           char(50) NOT NULL,
       user_domain_name     char(50) NOT NULL,
       barrclass            smallint NOT NULL,
       PRIMARY KEY (nodeid, subs_alias, user_domain_name, barrclass)
);



CREATE TABLE orig_cb_allowpfx (
       nodeid               integer NOT NULL,
       barrpfx              char(20) NOT NULL,
       barrclass            smallint NOT NULL,
       PRIMARY KEY (nodeid, barrpfx, barrclass)
);



CREATE TABLE trunk (
       nodeid               integer NOT NULL,
       trunkid              integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ci                   smallint NOT NULL,
       trnkgrpid            smallint NOT NULL,
       cic                  smallint NOT NULL,
       trunk_equp           smallint NOT NULL,
       trunk_oosi_spd       smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       stat_group_id        smallint DEFAULT 0 NOT NULL,
       trunk_param1         smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, trunkid),
       FOREIGN KEY (nodeid, trnkgrpid)
                             REFERENCES trunk_group
);



CREATE INDEX i_trunkch ON trunk
(
	nodeid                ASC,
	modulenr              ASC,
	portnr                ASC,
	ci                    ASC
);



CREATE TABLE trunk_dicon (
       nodeid               integer NOT NULL,
       trunkid              integer NOT NULL,
       dicon                char(25) NOT NULL,
       PRIMARY KEY (nodeid, trunkid),
       FOREIGN KEY (nodeid, trunkid)
                             REFERENCES trunk
);



CREATE TABLE ddi_features (
       nodeid               integer NOT NULL,
       ddi_id               smallint NOT NULL,
       nrreqdgt             smallint NOT NULL,
       ddi_send_point       smallint NOT NULL,
       numtype              smallint NOT NULL,
       nrplan               smallint NOT NULL,
       default_pbx_dn       char(25),
       proc_send_ind        smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ddi_id)
);



CREATE TABLE proc_condition (
       nodeid               integer NOT NULL,
       proc_name            smallint NOT NULL,
       proc_state           smallint NOT NULL,
       state_cond           smallint NOT NULL,
       PRIMARY KEY (nodeid, proc_name, proc_state)
);



CREATE TABLE slsd_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       nslsd_auth           smallint DEFAULT 0 NOT NULL,
       nslsd_crossctx       smallint DEFAULT 2 NOT NULL,
       nslsd_allowdirect    smallint DEFAULT 1 NOT NULL,
       nslsd_checkdirect    smallint DEFAULT 1 NOT NULL,
       nslsd_grpnr          char(15),
       nslsd_maxtranzit     smallint DEFAULT 3 NOT NULL,
       nslsd_blockedtm      smallint DEFAULT 5 NOT NULL,
       nslsd_dicon          smallint DEFAULT 1 NOT NULL,
       nslsd_joinmsg        smallint DEFAULT 0 NOT NULL,
       slsd_debug           smallint DEFAULT 0 NOT NULL,
       slsd_sleep_time      smallint DEFAULT 5 NOT NULL,
       slsd_msg_number      smallint DEFAULT 5 NOT NULL,
       nslsd_string1        char(15),
       nslsd_string2        char(15),
       nslsd_int1           integer,
       nslsd_int2           integer,
       sip_pub_mode         tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE rec_trnk_cn_conv (
       nodeid               integer NOT NULL,
       routeid              smallint NOT NULL,
       numtype              smallint NOT NULL,
       cnpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, routeid, numtype, cnpn_prefix)
);



CREATE TABLE ann_bcst_analog (
       nodeid               integer NOT NULL,
       ann_id               smallint NOT NULL,
       ann_variant          smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ci                   smallint NOT NULL,
       PRIMARY KEY (nodeid, ann_id, ann_variant)
);



CREATE TABLE h323_feature (
       nodeid               integer NOT NULL,
       h323_feature_id      smallint NOT NULL,
       call_start_var       smallint NOT NULL,
       tm_status_enq        smallint NOT NULL,
       admission_mode       smallint NOT NULL,
       h245tunneling        smallint DEFAULT 0 NOT NULL,
       reg_mode             smallint DEFAULT 0 NOT NULL,
       tm_noresp            smallint DEFAULT 3 NOT NULL,
       timetolive           integer DEFAULT 0 NOT NULL,
       h245_rerouting       smallint DEFAULT 1 NOT NULL,
       h323_tone_profile    integer DEFAULT 26 NOT NULL,
       location_mode        smallint DEFAULT 0 NOT NULL,
       tdm_rtp_id           smallint NOT NULL,
       h245_bidirect        smallint DEFAULT 0 NOT NULL,
       h323_param1          smallint,
       h323_param2          smallint,
       h323_param3          smallint,
       h323_param4          smallint,
       h323_param5          smallint,
       h323_param6          smallint,
       PRIMARY KEY (nodeid, h323_feature_id),
       FOREIGN KEY (nodeid, tdm_rtp_id)
                             REFERENCES tdm_rtp_profile
);



CREATE TABLE h323_access (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       portnr               smallint NOT NULL,
       acc_ip_addr          char(15),
       acc_eth_addr         char(17),
       acc_sec_ip_addr      char(15),
       acc_sec_eth_addr     char(17),
       acc_eth_ident_mode   smallint NOT NULL,
       h323_feature_id      smallint NOT NULL,
       h323_pin             integer,
       mad_id               smallint DEFAULT 0 NOT NULL,
       sigtrace_req         smallint NOT NULL,
       acc_param            smallint,
       acc_param2           smallint,
       PRIMARY KEY (nodeid, sys_intf_id, portnr),
       FOREIGN KEY (nodeid, h323_feature_id)
                             REFERENCES h323_feature
);



CREATE INDEX IE1_h323_access ON h323_access
(
	nodeid                ASC,
	acc_ip_addr           ASC
);



CREATE TABLE pstn_messages (
       nodeid               integer NOT NULL,
       pstn_msg_variant     smallint NOT NULL,
       msg_type_num         smallint NOT NULL,
       mt_ie_direction      smallint NOT NULL,
       pn_ie_direction      smallint NOT NULL,
       li_ie_direction      smallint NOT NULL,
       st_ie_direction      smallint NOT NULL,
       ass_ie_direction     smallint NOT NULL,
       sr_ie_direction      smallint NOT NULL,
       sn_ie_direction      smallint NOT NULL,
       cr_ie_direction      smallint NOT NULL,
       ps_ie_direction      smallint NOT NULL,
       ss_ie_direction      smallint NOT NULL,
       ds_ie_direction      smallint NOT NULL,
       rt_ie_direction      smallint NOT NULL,
       eaa_ie_direction     smallint NOT NULL,
       daa_ie_direction     smallint NOT NULL,
       ca_ie_direction      smallint NOT NULL,
       ru_ie_direction      smallint NOT NULL,
       PRIMARY KEY (nodeid, pstn_msg_variant, msg_type_num)
);



CREATE TABLE cm_feature (
       nodeid               integer NOT NULL,
       cm_feature_id        smallint NOT NULL,
       cm_feature_int       integer NOT NULL,
       cm_feature_char      char(25),
       PRIMARY KEY (nodeid, cm_feature_id)
);



CREATE TABLE mtpl3_timer (
       nodeid               integer NOT NULL,
       timer_number         smallint NOT NULL,
       lower_bound          integer NOT NULL,
       upper_bound          integer NOT NULL,
       tmvalue              integer NOT NULL,
       PRIMARY KEY (nodeid, timer_number)
);



CREATE TABLE ims_route (
       nodeid               integer NOT NULL,
       ims_routeid          smallint NOT NULL,
       ims_cscf_uri         char(200),
       ims_cscf_addr        char(15),
       ims_cscf_port        integer DEFAULT 5060 NOT NULL,
       ims_seqnr            smallint DEFAULT 1 NOT NULL,
       ims_cscf_trnsprt     tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ims_routeid)
);



CREATE SEQUENCE seq_ims_routeid;



CREATE TABLE ims_shared_impu (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ims_emr_reg          tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dn, modulenr, portnr)
);



CREATE TABLE m2pa_profile (
       nodeid               integer NOT NULL,
       m2pa_prf_id          smallint DEFAULT 1 NOT NULL,
       profile_name         char(50) NOT NULL,
       m2pa_version         smallint DEFAULT 1 NOT NULL,
       max_sif_len          smallint DEFAULT 272 NOT NULL,
       tm_proving_int       smallint DEFAULT 50 NOT NULL,
       proving_sif_len      smallint DEFAULT 16 NOT NULL,
       tm_add_alignment     smallint DEFAULT 0 NOT NULL,
       tm_add_sipo          smallint DEFAULT 0 NOT NULL,
       tm_add_sios          smallint DEFAULT 0 NOT NULL,
       cong_onset           smallint DEFAULT 50 NOT NULL,
       cong_abate           smallint DEFAULT 20 NOT NULL,
       cong_discard         smallint DEFAULT 128 NOT NULL,
       tm_t1                integer DEFAULT 45000 NOT NULL,
       tm_t2                integer DEFAULT 30000 NOT NULL,
       tm_t3                integer DEFAULT 1200 NOT NULL,
       tm_t4e               integer DEFAULT 100 NOT NULL,
       tm_t4n               integer DEFAULT 8200 NOT NULL,
       tm_t5                integer DEFAULT 5500 NOT NULL,
       tm_t6                integer DEFAULT 1500 NOT NULL,
       tm_t7                integer DEFAULT 1500 NOT NULL,
       bundle               smallint DEFAULT 0 NOT NULL,
       associate_repeat     smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, m2pa_prf_id)
);



CREATE UNIQUE INDEX AK1_m2pa_profile ON m2pa_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE m2pa_link (
       nodeid               integer NOT NULL,
       ss7_linkid           smallint NOT NULL,
       m2pa_prf_id          smallint DEFAULT 1 NOT NULL,
       m2pa_type            smallint NOT NULL,
       sys_intf_id1         integer,
       sys_intf_id2         integer,
       sys_intf_id3         integer,
       sys_intf_id4         integer,
       PRIMARY KEY (nodeid, ss7_linkid),
       FOREIGN KEY (nodeid, m2pa_prf_id)
                             REFERENCES m2pa_profile
);



CREATE TABLE csta_dstdn (
       nodeid               integer NOT NULL,
       dstdn                char(25) NOT NULL,
       csta_monitor         smallint NOT NULL,
       PRIMARY KEY (nodeid, dstdn)
);



CREATE TABLE ntp_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       primary_server       char(80) NOT NULL,
       secondary_server     char(80),
       primary_timeout      smallint NOT NULL,
       secondary_timeout    smallint,
       period               integer NOT NULL,
       tz_offset            smallint DEFAULT 60 NOT NULL,
       tz_name              char(40) NOT NULL,
       dst_offset           smallint DEFAULT 60 NOT NULL,
       dst_start_mon        smallint DEFAULT 3 NOT NULL,
       dst_start_week       smallint DEFAULT 4 NOT NULL,
       dst_start_wday       smallint DEFAULT 0 NOT NULL,
       dst_start_hour       smallint DEFAULT 2 NOT NULL,
       dst_start_min        smallint DEFAULT 0 NOT NULL,
       dst_end_mon          smallint DEFAULT 10 NOT NULL,
       dst_end_week         smallint DEFAULT 4 NOT NULL,
       dst_end_wday         smallint DEFAULT 0 NOT NULL,
       dst_end_hour         smallint DEFAULT 2 NOT NULL,
       dst_end_min          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE chsite_relation (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       org_chsite           smallint NOT NULL,
       dst_chsite           smallint NOT NULL,
       dst_charge_code      smallint NOT NULL,
       PRIMARY KEY (nodeid, bgid, org_chsite, dst_chsite)
);



CREATE TABLE access_lpar (
       nodeid               integer NOT NULL,
       dummy_pk             smallint DEFAULT 0 NOT NULL,
       lpar_alr_on          integer DEFAULT 0 NOT NULL,
       lpar_alr_off         integer DEFAULT 0 NOT NULL,
       lpar_cnt             integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE subctg_to_national (
       nodeid               integer NOT NULL,
       subsctg              smallint NOT NULL,
       subsctg_trtype       smallint NOT NULL,
       national_subsctg     smallint NOT NULL,
       PRIMARY KEY (nodeid, subsctg, subsctg_trtype)
);



CREATE TABLE nc_vru (
       nodeid               integer NOT NULL,
       vru_box              char(25) NOT NULL,
       in_use               smallint NOT NULL,
       PRIMARY KEY (nodeid, vru_box)
);



CREATE TABLE inband_indication (
       nodeid               integer NOT NULL,
       inband_ind_id        smallint NOT NULL,
       ann_id               smallint NOT NULL,
       toneid               smallint NOT NULL,
       PRIMARY KEY (nodeid, inband_ind_id)
);



CREATE TABLE eth_interface (
       nodeid               integer NOT NULL,
       eth_intf_id          smallint NOT NULL,
       eth_intf_name        char(40) NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       portnr2              smallint NOT NULL,
       oosi                 smallint NOT NULL,
       admin_state          smallint NOT NULL,
       log_stat_group_id    smallint NOT NULL,
       interface_type       smallint NOT NULL,
       PRIMARY KEY (nodeid, eth_intf_id)
);



CREATE TABLE ip_device (
       nodeid               integer NOT NULL,
       eth_intf_id          smallint NOT NULL,
       ip_addr              char(15) NOT NULL,
       ip_mask              char(15) NOT NULL,
       ip_function          smallint NOT NULL,
       metric               smallint,
       PRIMARY KEY (nodeid, eth_intf_id, ip_addr),
       FOREIGN KEY (nodeid, eth_intf_id)
                             REFERENCES eth_interface
);



CREATE TABLE scscf_cpb_sets (
       nodeid               integer NOT NULL,
       cpb_set_id           integer NOT NULL,
       cpb_set_name         char(32) NOT NULL,
       mand_cpb0            integer DEFAULT 0 NOT NULL,
       mand_cpb1            integer DEFAULT 0 NOT NULL,
       mand_cpb2            integer DEFAULT 0 NOT NULL,
       mand_cpb3            integer DEFAULT 0 NOT NULL,
       mand_cpb4            integer DEFAULT 0 NOT NULL,
       opt_cpb0             integer DEFAULT 0 NOT NULL,
       opt_cpb1             integer DEFAULT 0 NOT NULL,
       opt_cpb2             integer DEFAULT 0 NOT NULL,
       opt_cpb3             integer DEFAULT 0 NOT NULL,
       opt_cpb4             integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cpb_set_id)
);



CREATE UNIQUE INDEX AK1_scscf_cpb_sets ON scscf_cpb_sets
(
	nodeid                ASC,
	cpb_set_name          ASC
);



CREATE TABLE ims_net (
       nodeid               integer NOT NULL,
       ims_ip_addr          char(15) NOT NULL,
       ims_ip_port          integer DEFAULT 5060 NOT NULL,
       ims_uri              char(200) NOT NULL,
       ims_dns_type         smallint DEFAULT 0 NOT NULL,
       ims_ip_transport     smallint DEFAULT 1 NOT NULL,
       d_attr_id            smallint DEFAULT 1 NOT NULL,
       tm_retransmit        smallint DEFAULT 1500 NOT NULL,
       stat_group_id        smallint DEFAULT 0 NOT NULL,
       ims_rmt_device_id    smallint NOT NULL,
       cpb_set_id           integer DEFAULT 0 NOT NULL,
       realm_domain         varchar(64) DEFAULT NULL,
       PRIMARY KEY (nodeid, ims_ip_addr, ims_ip_port, ims_uri, ims_dns_type),
       FOREIGN KEY (nodeid, cpb_set_id)
                             REFERENCES scscf_cpb_sets
);



CREATE UNIQUE INDEX AK1_ims_net ON ims_net
(
	nodeid                ASC,
	ims_rmt_device_id     ASC
);



CREATE TABLE cm_rtp_sess_no_tg (
       nodeid               integer NOT NULL,
       cm_extern_port       smallint NOT NULL,
       cm_extern_channel    smallint NOT NULL,
       cm_tdm_rtp_id        smallint NOT NULL,
       cm_loc_rtp_ip_addr   char(15) NOT NULL,
       cm_loc_rtp_port      smallint NOT NULL,
       cm_rem_rtp_ip_addr   char(15) NOT NULL,
       cm_rem_rtp_port      integer NOT NULL,
       cm_ms_modulenr       smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cm_extern_port, cm_extern_channel)
);



CREATE TABLE inap_srv (
       nodeid               integer NOT NULL,
       outsrv_name          smallint DEFAULT 0 NOT NULL,
       inap_srv_key         integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, outsrv_name)
);



CREATE TABLE vot_data (
       nodeid               integer NOT NULL,
       vot_id               smallint NOT NULL,
       vot_pfx              char(5) NOT NULL,
       vot_act              smallint NOT NULL,
       counter_reset        smallint NOT NULL,
       redirect_act         smallint NOT NULL,
       vot_mode             smallint NOT NULL,
       count_allcalls       integer NOT NULL,
       vot_seqnr            smallint NOT NULL,
       redirection_dstdn    char(25),
       lower_tariff_dir     smallint NOT NULL,
       higher_tariff_dir    smallint NOT NULL,
       info_act             smallint NOT NULL,
       timer_tone           smallint NOT NULL,
       timer_userdisc       smallint NOT NULL,
       org_charge_code      smallint NOT NULL,
       timer_refresh        smallint,
       PRIMARY KEY (nodeid, vot_id)
);



CREATE TABLE vot_number (
       nodeid               integer NOT NULL,
       vot_id               smallint NOT NULL,
       vot_nr               char(3) NOT NULL,
       count_votcalls       integer NOT NULL,
       PRIMARY KEY (nodeid, vot_id, vot_nr),
       FOREIGN KEY (nodeid, vot_id)
                             REFERENCES vot_data
);



CREATE TABLE sigtrace_actions (
       nodeid               integer NOT NULL,
       action               smallint NOT NULL,
       unitid               char(64),
       PRIMARY KEY (nodeid, action)
);



CREATE TABLE remote_inter_call (
       nodeid               integer NOT NULL,
       orig_cgid            smallint NOT NULL,
       term_cgid            smallint NOT NULL,
       dst_charge_code      smallint NOT NULL,
       PRIMARY KEY (nodeid, orig_cgid, term_cgid)
);



CREATE TABLE tariff_direction (
       nodeid               integer NOT NULL,
       tariff_dir           smallint NOT NULL,
       tariff_id            smallint NOT NULL,
       charge_proctype      smallint NOT NULL,
       charge_rectype       smallint NOT NULL,
       charge_band_number   smallint,
       lcm_treshold         smallint DEFAULT 0 NOT NULL,
       crg_status           tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, tariff_dir),
       FOREIGN KEY (nodeid, tariff_id)
                             REFERENCES tariff
);



CREATE TABLE charge_transform (
       nodeid               integer NOT NULL,
       org_charge_code      smallint NOT NULL,
       dst_charge_code      smallint NOT NULL,
       tariff_dir           smallint NOT NULL,
       PRIMARY KEY (nodeid, org_charge_code, dst_charge_code),
       FOREIGN KEY (nodeid, tariff_dir)
                             REFERENCES tariff_direction
);



CREATE TABLE subs_dn_sn_conv (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       ndc_id               smallint NOT NULL,
       subs_nr              char(15) NOT NULL,
       reg_position         tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dn),
       FOREIGN KEY (nodeid, ndc_id)
                             REFERENCES local_ndc
);



CREATE UNIQUE INDEX AK1_subs_dn_sn_conv ON subs_dn_sn_conv
(
	nodeid                ASC,
	subs_nr               ASC,
	ndc_id                ASC
);



CREATE TABLE dns_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       domain_name          char(80),
       primary_server       char(80),
       secondary_server     char(80),
       dns_max_queries      integer DEFAULT 1024 NOT NULL,
       dns_cache_size       integer DEFAULT 2048 NOT NULL,
       dns_cache_ttl_max    integer DEFAULT 3600 NOT NULL,
       tertiary_server      char(80),
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE scrn_cg_trnk_list (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       cgpn_length          smallint DEFAULT 0 NOT NULL,
       length_mode          smallint DEFAULT 0 NOT NULL,
       subsctg              smallint DEFAULT 0 NOT NULL,
       routing_group        smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid, cgpn_prefix)
);



CREATE TABLE ss7_translation (
       nodeid               integer NOT NULL,
       ss7_dstid            smallint NOT NULL,
       cic_min              smallint NOT NULL,
       cic_max              smallint NOT NULL,
       orig_ss7_dstid       smallint NOT NULL,
       term_ss7_dstid       smallint NOT NULL,
       PRIMARY KEY (nodeid, ss7_dstid, cic_min)
);



CREATE TABLE ecm_prefix (
       nodeid               integer NOT NULL,
       ecm_node_pfx         char(20) NOT NULL,
       ecm_id               smallint NOT NULL,
       ecm_pfx_len          smallint NOT NULL,
       PRIMARY KEY (nodeid, ecm_node_pfx)
);



CREATE TABLE statistics_group (
       nodeid               integer NOT NULL,
       stat_group_id        smallint NOT NULL,
       stat_group_type      smallint NOT NULL,
       measurement_status   smallint NOT NULL,
       msrmnt_name          char(20) NOT NULL,
       msrmnt_start_date    integer,
       msrmnt_end_date      integer,
       week_day_list        char(13),
       msrmnt_start_time    smallint,
       msrmnt_end_time      smallint,
       measurement_type     smallint NOT NULL,
       PRIMARY KEY (nodeid, stat_group_id)
);



CREATE TABLE mn_access (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       access_name          char(45) NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id)
);



CREATE UNIQUE INDEX i_an_access ON mn_access
(
	nodeid                ASC,
	access_name           ASC
);



CREATE TABLE mn_abbd (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       abbrnr               char(5) NOT NULL,
       cgid                 smallint NOT NULL,
       abbrnr_name          char(32) NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, abbrnr, cgid)
);



CREATE UNIQUE INDEX AK1_mn_abbd ON mn_abbd
(
	nodeid                ASC,
	ndc_id                ASC,
	cgid                  ASC,
	abbrnr_name           ASC
);



CREATE TABLE vxml_cdpn (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       vxml_id              integer NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



CREATE TABLE vxml_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       vxml_active          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE sent_trnk_cg_conv (
       nodeid               integer NOT NULL,
       routeid              smallint NOT NULL,
       ndc_id               smallint NOT NULL,
       numtype              smallint NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, routeid, ndc_id, numtype, cgpn_prefix)
);



CREATE TABLE disk_usage (
       nodeid               integer NOT NULL,
       file_system_id       smallint NOT NULL,
       file_system_name     char(50) NOT NULL,
       disk_size            integer NOT NULL,
       free_space_low       smallint DEFAULT 10 NOT NULL,
       free_space_low_min   smallint DEFAULT 1 NOT NULL,
       free_space_low_max   smallint DEFAULT 50 NOT NULL,
       free_space_crit      smallint DEFAULT 5 NOT NULL,
       free_space_mincrit   smallint DEFAULT 1 NOT NULL,
       free_space_maxcrit   smallint DEFAULT 20 NOT NULL,
       free_space_current   smallint NOT NULL,
       PRIMARY KEY (nodeid, file_system_id)
);



CREATE UNIQUE INDEX AK1_disk_usage ON disk_usage
(
	nodeid                ASC,
	file_system_name      ASC
);



CREATE TABLE error_filter (
       nodeid               integer NOT NULL,
       errfilt_id           integer NOT NULL,
       errmask              char(10) NOT NULL,
       obj_mask             char(80) NOT NULL,
       PRIMARY KEY (nodeid, errfilt_id)
);



CREATE TABLE tariff_prefix (
       nodeid               integer NOT NULL,
       ndc_id               smallint DEFAULT 0 NOT NULL,
       dstpfx               char(20) NOT NULL,
       bgid                 integer DEFAULT 1 NOT NULL,
       cid                  smallint NOT NULL,
       dst_charge_code      smallint NOT NULL,
       stat_group_id        smallint DEFAULT 0 NOT NULL,
       nplan_id             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dstpfx, bgid, cid, ndc_id, nplan_id)
);



CREATE TABLE v51_switch (
       nodeid               integer NOT NULL,
       v5_interface_index   smallint NOT NULL,
       v5_access_type       smallint NOT NULL,
       v5_access_id         smallint NOT NULL,
       v5_access_ci         smallint NOT NULL,
       v51_time_slot        smallint NOT NULL,
       PRIMARY KEY (nodeid, v5_interface_index, v5_access_type, v5_access_id, v5_access_ci)
);



CREATE TABLE tone (
       nodeid               integer NOT NULL,
       toneid               smallint NOT NULL,
       tone_ctg             smallint NOT NULL,
       cn_treat             smallint NOT NULL,
       periods              smallint NOT NULL,
       tsrctype             smallint NOT NULL,
       tsrcid               smallint NOT NULL,
       PRIMARY KEY (nodeid, toneid)
);



CREATE TABLE tone_phase (
       nodeid               integer NOT NULL,
       toneid               smallint NOT NULL,
       phaseid              smallint NOT NULL,
       phaselen             smallint NOT NULL,
       intrptblty           smallint NOT NULL,
       tone_sigid           smallint NOT NULL,
       PRIMARY KEY (nodeid, toneid, phaseid),
       FOREIGN KEY (nodeid, toneid)
                             REFERENCES tone
);



CREATE TABLE global_timer (
       nodeid               integer NOT NULL,
       tmhotd               smallint NOT NULL,
       tmbusy               smallint NOT NULL,
       tmnotresp            smallint NOT NULL,
       tmcwcamp             smallint NOT NULL,
       tmnonstdrsp          smallint NOT NULL,
       ccbs_sdurtm          smallint NOT NULL,
       ccbs_dbigtm          smallint NOT NULL,
       ccbs_rcltm           smallint NOT NULL,
       tmtp                 smallint NOT NULL,
       tmringc              smallint NOT NULL,
       tmoutgext            smallint NOT NULL,
       mcid_timeout         smallint NOT NULL,
       ct_rel_tm            smallint NOT NULL,
       ct_rel_crgunits      smallint NOT NULL,
       tmdischold           smallint NOT NULL,
       extrem_call_dur      smallint DEFAULT 480 NOT NULL,
       tm_votcountref       smallint DEFAULT 15 NOT NULL,
       bthwrls_timer        integer,
       tm_inforespmcid      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE sip_feature_domain (
       nodeid               integer NOT NULL,
       sip_feature_id       smallint NOT NULL,
       sip_feature_name     char(32) NOT NULL,
       PRIMARY KEY (nodeid, sip_feature_id)
);



CREATE UNIQUE INDEX AK1_sip_feature_domain ON sip_feature_domain
(
	nodeid                ASC,
	sip_feature_name      ASC
);



CREATE TABLE closed_user_group (
       nodeid               integer NOT NULL,
       cug_index            smallint NOT NULL,
       network_identity     char(4) NOT NULL,
       group_code           integer NOT NULL,
       cug_abbrnr_len       smallint NOT NULL,
       PRIMARY KEY (nodeid, cug_index)
);



CREATE TABLE cug_member (
       nodeid               integer NOT NULL,
       cug_index            smallint NOT NULL,
       dstdn                char(25) NOT NULL,
       basic_id             smallint NOT NULL,
       cug_abbrnr           char(5),
       cug_barring          smallint NOT NULL,
       PRIMARY KEY (nodeid, cug_index, dstdn, basic_id),
       FOREIGN KEY (nodeid, cug_index)
                             REFERENCES closed_user_group
);



CREATE TABLE scrn_cg_trnk_dflt (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       scrn_cgpn            char(15) NOT NULL,
       scrn_cg_numtype      smallint NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid),
       FOREIGN KEY (nodeid, trnkgrpid)
                             REFERENCES trunk_group
);



CREATE TABLE prefix (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       dstpfx               char(20) NOT NULL,
       bgid                 integer DEFAULT 1 NOT NULL,
       cgid                 smallint DEFAULT 0 NOT NULL,
       dstctg               smallint NOT NULL,
       dstid                smallint NOT NULL,
       stat_group_id        smallint DEFAULT 0 NOT NULL,
       nplan_id             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, dstpfx, bgid, nplan_id),
       FOREIGN KEY (nodeid, ndc_id)
                             REFERENCES local_ndc
);



CREATE TABLE prepaid_db_server (
       nodeid               integer NOT NULL,
       server_ip_addr       char(15) NOT NULL,
       username             char(24) NOT NULL,
       password             char(32) NOT NULL,
       tm_establish_conn    smallint NOT NULL,
       tm_db_noresp         smallint NOT NULL,
       tm_clear_conn        smallint NOT NULL,
       PRIMARY KEY (nodeid, server_ip_addr)
);



CREATE TABLE access_channel (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       incoming_opmode      integer NOT NULL,
       outgoing_opmode      integer NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr)
);



CREATE TABLE test_prog_error (
       nodeid               integer NOT NULL,
       errcod               integer NOT NULL,
       tescod               smallint NOT NULL,
       PRIMARY KEY (nodeid, errcod, tescod)
);



CREATE TABLE csta_client_domain (
       nodeid               integer NOT NULL,
       csta_client_id       smallint NOT NULL,
       csta_client_name     char(32) NOT NULL,
       PRIMARY KEY (nodeid, csta_client_id)
);



CREATE UNIQUE INDEX AK1_csta_client_domain ON csta_client_domain
(
	nodeid                ASC,
	csta_client_name      ASC
);



CREATE TABLE suppl_dstdn (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       suppl_id             smallint NOT NULL,
       dstdn                char(25) NOT NULL,
       subaddress           char(40),
       user_domain_name     char(50) DEFAULT NULL,
       PRIMARY KEY (nodeid, dn, basic_id, suppl_id),
       FOREIGN KEY (nodeid, dn, basic_id)
                             REFERENCES subscriber
);



CREATE TABLE h323_gatekeeper (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       gk_sec_ip_addr       char(15),
       gk_param             smallint,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE redundance_acc (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       rdnd_huntmode        smallint NOT NULL,
       modulenr1            smallint NOT NULL,
       portnr1              smallint NOT NULL,
       modulenr2            smallint NOT NULL,
       portnr2              smallint NOT NULL,
       modulenr3            smallint NOT NULL,
       portnr3              smallint NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



CREATE TABLE dp_group_domain (
       nodeid               integer NOT NULL,
       list_id              smallint NOT NULL,
       list_type            smallint NOT NULL,
       list_mode            smallint NOT NULL,
       list_name            char(32) NOT NULL,
       PRIMARY KEY (nodeid, list_id)
);



CREATE UNIQUE INDEX AK1_dp_group_domain ON dp_group_domain
(
	nodeid                ASC,
	list_name             ASC
);



CREATE TABLE dp_party_nr_domain (
       nodeid               integer NOT NULL,
       list_id              smallint NOT NULL,
       list_type            smallint NOT NULL,
       list_mode            smallint NOT NULL,
       list_name            char(32) NOT NULL,
       PRIMARY KEY (nodeid, list_id)
);



CREATE UNIQUE INDEX AK1_dp_party_nr_domain ON dp_party_nr_domain
(
	nodeid                ASC,
	list_name             ASC
);



CREATE TABLE city_connect (
       nodeid               integer NOT NULL,
       ndc_id               smallint DEFAULT 1 NOT NULL,
       dialled_dstdn        char(25) NOT NULL,
       dstdn                char(25) NOT NULL,
       stat_group_id        smallint NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, dialled_dstdn)
);



CREATE TABLE local_h248_access (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       acc_ip_addr          char(15) NOT NULL,
       h248_domain_name     char(50) NOT NULL,
       h248_intf_prf_id     smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr),
       FOREIGN KEY (nodeid, h248_intf_prf_id)
                             REFERENCES h248_intf_profile
);



CREATE TABLE abbds (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       abbrnr               char(5) NOT NULL,
       fullnr               char(25) NOT NULL,
       PRIMARY KEY (nodeid, dn, abbrnr)
);



CREATE TABLE tariff_switch (
       nodeid               integer NOT NULL,
       time_group           smallint NOT NULL,
       dayctg               smallint NOT NULL,
       switch_time          smallint NOT NULL,
       tariff_rate          smallint NOT NULL,
       PRIMARY KEY (nodeid, time_group, dayctg, switch_time)
);



CREATE TABLE inap_param (
       nodeid               integer NOT NULL,
       srvr_id              smallint DEFAULT 1 NOT NULL,
       appl_cntx_name       smallint DEFAULT 0 NOT NULL,
       dpc_id               smallint DEFAULT 0 NOT NULL,
       ssn_dst              smallint DEFAULT 0 NOT NULL,
       ssn_orig             smallint DEFAULT 0 NOT NULL,
       qlty_of_srv          smallint DEFAULT 3 NOT NULL,
       tcap_term            smallint DEFAULT 1 NOT NULL,
       inap_tm_long         smallint DEFAULT 60 NOT NULL,
       inap_tm_short        smallint DEFAULT 5 NOT NULL,
       inap_tm_medium       smallint DEFAULT 30 NOT NULL,
       inap_cpb_set         smallint DEFAULT 1 NOT NULL,
       inap_add_fld_usg     smallint DEFAULT 0 NOT NULL,
       inap_add_fld         char(50),
       inap_param1          smallint DEFAULT 0 NOT NULL,
       inap_param2          char(25),
       inap_tm_scrty        smallint DEFAULT 600 NOT NULL,
       dest_addr_mode       tinyint DEFAULT 1 NOT NULL,
       dest_addr_rtng_ind   tinyint DEFAULT 0 NOT NULL,
       dest_addr_gt_ind     tinyint DEFAULT 4 NOT NULL,
       dest_addr_ssn_ind    tinyint DEFAULT 1 NOT NULL,
       dest_addr_pc_ind     tinyint DEFAULT 0 NOT NULL,
       dest_addr_gtai       char(25),
       dest_addr_nai        smallint DEFAULT 4 NOT NULL,
       dest_addr_tt         smallint DEFAULT 0 NOT NULL,
       dest_addr_np         tinyint DEFAULT 1 NOT NULL,
       dest_addr_es         tinyint DEFAULT 0 NOT NULL,
       orig_addr_mode       tinyint DEFAULT 1 NOT NULL,
       orig_addr_rtng_ind   tinyint DEFAULT 1 NOT NULL,
       orig_addr_gt_ind     tinyint DEFAULT 0 NOT NULL,
       orig_addr_ssn_ind    tinyint DEFAULT 1 NOT NULL,
       orig_addr_pc_ind     tinyint DEFAULT 3 NOT NULL,
       orig_addr_opc_id     smallint DEFAULT 0 NOT NULL,
       orig_addr_gtai       char(25),
       orig_addr_nai        smallint DEFAULT 0 NOT NULL,
       orig_addr_tt         smallint DEFAULT 0 NOT NULL,
       orig_addr_np         tinyint DEFAULT 0 NOT NULL,
       orig_addr_es         tinyint DEFAULT 0 NOT NULL,
       inap_tm_ssf1         smallint DEFAULT 10 NOT NULL,
       inap_tm_ssf2         smallint DEFAULT 10 NOT NULL,
       inap_tm_ssf3         smallint DEFAULT 10 NOT NULL,
       PRIMARY KEY (nodeid, srvr_id)
);



CREATE TABLE dp_party_nr (
       nodeid               integer NOT NULL,
       dppartynr_list_id    smallint DEFAULT 1 NOT NULL,
       dppartynr_type       smallint DEFAULT 9 NOT NULL,
       dppartynr_pfx        char(20) NOT NULL,
       dppartynr_mode       smallint DEFAULT 0 NOT NULL,
       dppartynr_length     smallint DEFAULT 0 NOT NULL,
       dppartynr_len_mode   smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dppartynr_list_id, dppartynr_type, dppartynr_pfx)
);



CREATE TABLE h323feature_domain (
       nodeid               integer NOT NULL,
       h323_feature_id      smallint NOT NULL,
       h323_feature_name    char(32) NOT NULL,
       PRIMARY KEY (nodeid, h323_feature_id)
);



CREATE UNIQUE INDEX AK1_h323feature_domain ON h323feature_domain
(
	nodeid                ASC,
	h323_feature_name     ASC
);



CREATE TABLE tcap_dialog_prtn (
       nodeid               integer NOT NULL,
       appl_cntx_name       smallint DEFAULT 1 NOT NULL,
       tcap_dialog_type     smallint DEFAULT 96 NOT NULL,
       tcap_obj_idnt_fld    char(50),
       tcap_dialogue_fld    char(50),
       tcap_rslt_fld        char(50),
       tcap_obj_idnt_fld_dot_comment WVARCHAR(70) DEFAULT '' NOT NULL,
       tcap_obj_idnt_fld_comment WVARCHAR(132) DEFAULT '' NOT NULL,
       tcap_dialogue_fld_comment WVARCHAR(132) DEFAULT '' NOT NULL,
       tcap_rslt_fld_comment WVARCHAR(132) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid, appl_cntx_name, tcap_dialog_type)
);



CREATE TABLE dp_pfx_list_domain (
       nodeid               integer NOT NULL,
       list_id              smallint NOT NULL,
       list_type            smallint NOT NULL,
       list_mode            smallint NOT NULL,
       list_name            char(32) NOT NULL,
       PRIMARY KEY (nodeid, list_id)
);



CREATE UNIQUE INDEX AK1_dp_pfx_list_domain ON dp_pfx_list_domain
(
	nodeid                ASC,
	list_name             ASC
);



CREATE TABLE feature_subscriber (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       subsctg              smallint NOT NULL,
       cfu_auth             smallint NOT NULL,
       cfb_auth             smallint NOT NULL,
       cfnr_auth            smallint NOT NULL,
       cbsc_auth            smallint NOT NULL,
       hoti_auth            smallint NOT NULL,
       hotd_auth            smallint NOT NULL,
       dnd_auth             smallint NOT NULL,
       dndo_auth            smallint NOT NULL,
       dndo_invmode         smallint NOT NULL,
       camp_auth            smallint NOT NULL,
       camp_invmode         smallint NOT NULL,
       campp_auth           smallint NOT NULL,
       cint_auth            smallint NOT NULL,
       cint_invmode         smallint NOT NULL,
       cintp_auth           smallint NOT NULL,
       clip_auth            smallint NOT NULL,
       clip_cliro           smallint NOT NULL,
       clir_auth            smallint NOT NULL,
       colp_auth            smallint NOT NULL,
       colp_colro           smallint NOT NULL,
       colr_auth            smallint NOT NULL,
       s3pty_auth           smallint NOT NULL,
       conf_auth            smallint NOT NULL,
       cw_auth              smallint NOT NULL,
       ct_auth              smallint DEFAULT 0 NOT NULL,
       cbac_barrclass       smallint,
       ccbs_auth            smallint NOT NULL,
       acs_auth             smallint NOT NULL,
       uus_auth             smallint NOT NULL,
       cfut_auth            smallint NOT NULL,
       cpu_auth             smallint NOT NULL,
       fwuui_auth           smallint NOT NULL,
       abds_category        smallint NOT NULL,
       aoc_auth             smallint NOT NULL,
       icb_ctg              smallint NOT NULL,
       cd_auth              smallint NOT NULL,
       sub_auth             smallint NOT NULL,
       mcid_auth            smallint NOT NULL,
       cfxd1_auth           smallint NOT NULL,
       cfxd2_auth           smallint NOT NULL,
       cfxd3_auth           smallint NOT NULL,
       cfxd4_auth           smallint NOT NULL,
       inband_ind_type      smallint NOT NULL,
       display_ring_type    smallint NOT NULL,
       ddi_auth             smallint NOT NULL,
       present_subsnr       char(15),
       present_ctx_subsnr   char(15),
       dn_range_auth        smallint NOT NULL,
       rmtuser_auth         smallint DEFAULT 0 NOT NULL,
       cn_auth              smallint DEFAULT 0 NOT NULL,
       ann_variant          smallint NOT NULL,
       orig_ctx_rstr        smallint DEFAULT 0 NOT NULL,
       term_ctx_rstr        smallint DEFAULT 0 NOT NULL,
       ctx_attendant        smallint DEFAULT 0 NOT NULL,
       cfx_param            smallint DEFAULT 0 NOT NULL,
       nc_auth              smallint DEFAULT 0 NOT NULL,
       ncbs_auth            smallint DEFAULT 0 NOT NULL,
       cac_dial_auth        smallint DEFAULT 0 NOT NULL,
       carr_presel_auth     smallint DEFAULT 0 NOT NULL,
       peoc_auth            smallint DEFAULT 0 NOT NULL,
       hold_auth            smallint DEFAULT 1 NOT NULL,
       tw_auth              smallint DEFAULT 0 NOT NULL,
       mwi_auth             smallint DEFAULT 0 NOT NULL,
       opc_auth             smallint DEFAULT 0 NOT NULL,
       ar_auth              smallint DEFAULT 0 NOT NULL,
       acr_auth             smallint DEFAULT 0 NOT NULL,
       fcr_auth             smallint DEFAULT 0 NOT NULL,
       send_subsctg         smallint DEFAULT 0 NOT NULL,
       dicon_group          smallint DEFAULT 0 NOT NULL,
       ute_auth             smallint DEFAULT 0 NOT NULL,
       ann_conn_auth        smallint DEFAULT 0 NOT NULL,
       sr_auth              smallint DEFAULT 0 NOT NULL,
       sr_type              smallint DEFAULT 0 NOT NULL,
       cfnrc_auth           smallint DEFAULT 0 NOT NULL,
       subs_status          smallint DEFAULT 0 NOT NULL,
       vxml_auth            smallint DEFAULT 0 NOT NULL,
       mmc_auth             smallint DEFAULT 0 NOT NULL,
       ann_ctxsubs_auth     smallint DEFAULT 0 NOT NULL,
       srv_auth1            smallint DEFAULT 0 NOT NULL,
       srv_auth2            smallint DEFAULT 0 NOT NULL,
       srv_auth3            smallint DEFAULT 0 NOT NULL,
       virts_auth           smallint NOT NULL,
       cat_auth_act         smallint DEFAULT 0 NOT NULL,
       licence_type         smallint DEFAULT 0 NOT NULL,
       acc_feature_id       smallint DEFAULT 0 NOT NULL,
       pdcnf_auth           tinyint DEFAULT 0 NOT NULL,
       def_prec_level       smallint DEFAULT 9 NOT NULL,
       max_prec_level       smallint DEFAULT 9 NOT NULL,
       acc_res_nonpreempt   smallint DEFAULT 0 NOT NULL,
       mlpp_id              smallint DEFAULT 0 NOT NULL,
       rcc_auth             tinyint DEFAULT 0 NOT NULL,
       present_numtype      tinyint DEFAULT 4 NOT NULL,
       intercom_auth        tinyint DEFAULT 0 NOT NULL,
       suppl_sts_auth       tinyint DEFAULT 0 NOT NULL,
       uicct_auth           tinyint DEFAULT 0 NOT NULL,
       uiccp_auth           tinyint DEFAULT 0 NOT NULL,
       former_ngn_set_id    smallint DEFAULT '-1' NOT NULL,
       rem_sts_auth         tinyint DEFAULT 0 NOT NULL,
       otc_auth             tinyint DEFAULT 0 NOT NULL,
       dndgm_auth           tinyint DEFAULT 0 NOT NULL,
       preempt_mode         tinyint DEFAULT 0 NOT NULL,
       tap_auth             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dn, basic_id),
       FOREIGN KEY (nodeid, dn, basic_id)
                             REFERENCES subscriber,
       FOREIGN KEY (nodeid, ann_variant)
                             REFERENCES ann_variants
);



CREATE TABLE radius_acct_attr (
       nodeid               integer NOT NULL,
       r_acct_id            smallint DEFAULT 1 NOT NULL,
       r_user_name_incl     smallint DEFAULT 0,
       r_nas_ip_addr_incl   smallint DEFAULT 1 NOT NULL,
       r_cd_station_id      smallint DEFAULT 1,
       r_cg_station_id      smallint DEFAULT 1,
       r_acct_sess_time     smallint DEFAULT 0,
       r_acct_term_cause    smallint DEFAULT 0,
       r_call_type          smallint DEFAULT 0,
       r_sess_term_cause    smallint DEFAULT 0,
       r_cd_ip              smallint DEFAULT 0,
       r_cg_ip              smallint DEFAULT 0,
       r_event_timestamp    smallint DEFAULT 0,
       r_crg_units          smallint DEFAULT 0,
       r_param1             smallint DEFAULT 0,
       r_param2             smallint DEFAULT 0,
       r_param3             smallint DEFAULT 0,
       r_acct_in_octets     smallint DEFAULT 0,
       r_acct_out_octets    smallint DEFAULT 0,
       r_acct_in_pckts      smallint DEFAULT 0,
       r_acct_out_pckts     smallint DEFAULT 0,
       r_coder_type_rate    smallint DEFAULT 0,
       PRIMARY KEY (nodeid, r_acct_id)
);



CREATE TABLE radius_access_attr (
       nodeid               integer NOT NULL,
       r_acc_id             smallint DEFAULT 1 NOT NULL,
       r_user_name_incl     smallint DEFAULT 0,
       r_user_pswd_incl     smallint DEFAULT 1 NOT NULL,
       r_nas_ip_addr_incl   smallint DEFAULT 1 NOT NULL,
       r_cd_station_id      smallint DEFAULT 1,
       r_cg_station_id      smallint DEFAULT 1,
       r_call_type          smallint DEFAULT 0,
       r_cd_ip              smallint DEFAULT 0,
       r_cg_ip              smallint DEFAULT 0,
       r_param1             smallint DEFAULT 0,
       r_param2             smallint DEFAULT 0,
       r_param3             smallint DEFAULT 0,
       PRIMARY KEY (nodeid, r_acc_id)
);



CREATE TABLE radius_srvr (
       nodeid               integer NOT NULL,
       r_srvr_id            smallint DEFAULT 1 NOT NULL,
       r_call_type_sig      smallint NOT NULL,
       r_user_type          smallint NOT NULL,
       r_srvr_prio          smallint DEFAULT 1 NOT NULL,
       r_shared_secret      char(48) NOT NULL,
       r_srvr_ip_addr       char(15) NOT NULL,
       r_acc_srvr_ip_port   integer DEFAULT 1812 NOT NULL,
       r_acct_ip_port       integer DEFAULT 1813 NOT NULL,
       r_ip_ver             smallint DEFAULT 0 NOT NULL,
       r_acc_id             smallint DEFAULT 1 NOT NULL,
       r_acct_id            smallint DEFAULT 1 NOT NULL,
       r_tm_resp            smallint DEFAULT 3000 NOT NULL,
       r_req_repeat         smallint DEFAULT 3 NOT NULL,
       r_param1             smallint DEFAULT 0,
       r_dflt_pswd          char(48) NOT NULL,
       PRIMARY KEY (nodeid, r_srvr_id, r_call_type_sig, r_user_type, r_srvr_prio),
       FOREIGN KEY (nodeid, r_acc_id)
                             REFERENCES radius_access_attr,
       FOREIGN KEY (nodeid, r_acct_id)
                             REFERENCES radius_acct_attr
);



CREATE TABLE dp_trnkgrp_domain (
       nodeid               integer NOT NULL,
       list_id              smallint NOT NULL,
       list_type            smallint NOT NULL,
       list_mode            smallint NOT NULL,
       list_name            char(32) NOT NULL,
       PRIMARY KEY (nodeid, list_id)
);



CREATE UNIQUE INDEX AK1_dp_trnkgrp_domain ON dp_trnkgrp_domain
(
	nodeid                ASC,
	list_name             ASC
);



CREATE TABLE w_trnkgrp_list (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       cgpn_length          smallint DEFAULT 0 NOT NULL,
       length_mode          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid, cgpn_prefix)
);



CREATE TABLE rec_trnk_cg_conv (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       numtype              smallint NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid, numtype, cgpn_prefix)
);



CREATE TABLE vxml_module (
       nodeid               integer NOT NULL,
       vxml_id              integer NOT NULL,
       modulenr             smallint NOT NULL,
       PRIMARY KEY (nodeid, vxml_id, modulenr)
);



CREATE TABLE mad_msn_domain (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       mad_name             char(32) NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr)
);



CREATE UNIQUE INDEX AK1_mad_msn_domain ON mad_msn_domain
(
	nodeid                ASC,
	mad_name              ASC
);



CREATE TABLE mmc_domain (
       nodeid               integer NOT NULL,
       mmc_dn               integer NOT NULL,
       mmc_name             char(32) NOT NULL,
       PRIMARY KEY (nodeid, mmc_dn)
);



CREATE UNIQUE INDEX AK1_mmc_domain ON mmc_domain
(
	nodeid                ASC,
	mmc_name              ASC
);



CREATE TABLE sip_cpc_variant (
       nodeid               integer NOT NULL,
       sip_cpc_var          smallint NOT NULL,
       sip_cpc_name         char(20),
       sip_cpc_var_name     char(30) NOT NULL,
       PRIMARY KEY (nodeid, sip_cpc_var)
);



CREATE UNIQUE INDEX AK1_sip_cpc_variant ON sip_cpc_variant
(
	nodeid                ASC,
	sip_cpc_var_name      ASC
);



CREATE TABLE sip_cpc (
       nodeid               integer NOT NULL,
       sip_cpc_var          smallint NOT NULL,
       sip_cpc_string       char(50) NOT NULL,
       sip_cpc_num          smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, sip_cpc_var, sip_cpc_string),
       FOREIGN KEY (nodeid, sip_cpc_var)
                             REFERENCES sip_cpc_variant
);



CREATE UNIQUE INDEX AK1_sip_cpc ON sip_cpc
(
	nodeid                ASC,
	sip_cpc_var           ASC,
	sip_cpc_num           ASC
);



CREATE TABLE mn_access_group (
       nodeid               integer NOT NULL,
       access_group_id      smallint NOT NULL,
       access_group_name    char(32) NOT NULL,
       PRIMARY KEY (nodeid, access_group_id)
);



CREATE UNIQUE INDEX AK1_mn_access_group ON mn_access_group
(
	nodeid                ASC,
	access_group_name     ASC
);



CREATE TABLE inap_param_domain (
       nodeid               integer NOT NULL,
       srvr_id              smallint NOT NULL,
       server_name          char(32) NOT NULL,
       PRIMARY KEY (nodeid, srvr_id)
);



CREATE UNIQUE INDEX AK1_inap_param_domain ON inap_param_domain
(
	nodeid                ASC,
	server_name           ASC
);



CREATE TABLE secret_subscriber (
       nodeid               integer NOT NULL,
       extra_dn             char(20) NOT NULL,
       secret_dn            integer NOT NULL,
       dstctg               smallint NOT NULL,
       dstid                smallint NOT NULL,
       PRIMARY KEY (nodeid, extra_dn)
);



CREATE TABLE destination_int (
       nodeid               integer NOT NULL,
       dstctg               smallint NOT NULL,
       dstid                smallint NOT NULL,
       numtype              smallint NOT NULL,
       nrreqdgt             smallint NOT NULL,
       tm_wait_answer       smallint NOT NULL,
       dicon                char(25),
       PRIMARY KEY (nodeid, dstid, dstctg)
);



CREATE TABLE test_program (
       nodeid               integer NOT NULL,
       tescod               smallint NOT NULL,
       tesnam               char(30) NOT NULL,
       runmod               integer NOT NULL,
       testim               integer NOT NULL,
       mintime              integer NOT NULL,
       maxtime              integer NOT NULL,
       tessta               smallint NOT NULL,
       runpri               smallint NOT NULL,
       PRIMARY KEY (nodeid, tescod)
);



CREATE TABLE mf_tone (
       nodeid               integer NOT NULL,
       mftoneid             smallint NOT NULL,
       mf_frequency1        smallint NOT NULL,
       mf_frequency2        smallint NOT NULL,
       PRIMARY KEY (nodeid, mftoneid)
);



CREATE TABLE pin_subscriber (
       nodeid               integer NOT NULL,
       pin                  integer NOT NULL,
       cgpn                 char(15) NOT NULL,
       service_id           smallint NOT NULL,
       dn                   integer NOT NULL,
       rr_req_mode          smallint NOT NULL,
       cb_mode              smallint NOT NULL,
       rem_srv_act_code     char(25),
       rem_srvact_prpty     smallint DEFAULT 0 NOT NULL,
       rem_pswdkey          char(9),
       rem_authent_mode     smallint DEFAULT 0 NOT NULL,
       pin_subs_param1      smallint,
       pin_subs_param2      integer,
       PRIMARY KEY (nodeid, pin, cgpn, service_id)
);



CREATE TABLE ecm_netnode (
       nodeid               integer NOT NULL,
       ecm_id               smallint NOT NULL,
       sub_nodeid           smallint NOT NULL,
       PRIMARY KEY (nodeid, ecm_id)
);



CREATE TABLE ims_global (
       nodeid               integer NOT NULL,
       ims_ownnetworkid     char(64),
       ims_cscf_type        smallint DEFAULT 0 NOT NULL,
       ims_diam_variant     smallint DEFAULT 1 NOT NULL,
       ims_nr_of_acc        integer DEFAULT 1000 NOT NULL,
       ims_nr_of_impu       smallint DEFAULT 3 NOT NULL,
       ims_homedomain       char(64),
       ims_auth_alg         smallint DEFAULT 0 NOT NULL,
       ims_ipsec            smallint DEFAULT 0 NOT NULL,
       ims_param1           integer DEFAULT 0 NOT NULL,
       ims_param2           integer DEFAULT 0 NOT NULL,
       pcscf_subscription   smallint DEFAULT 1 NOT NULL,
       ims_min_expires      smallint DEFAULT 0 NOT NULL,
       ims_max_expires      integer DEFAULT 0 NOT NULL,
       sip_feature_id       smallint DEFAULT 5 NOT NULL,
       ims_saporttype       smallint DEFAULT 0 NOT NULL,
       ims_as_mode          integer DEFAULT 0 NOT NULL,
       ims_3gpprls          tinyint DEFAULT 8 NOT NULL,
       ims_ndc_id           smallint DEFAULT 1 NOT NULL,
       tariff_dir           smallint DEFAULT 0 NOT NULL,
       typesc               smallint DEFAULT 9 NOT NULL,
       ims_magcf            tinyint DEFAULT 0 NOT NULL,
       siptoteluri          tinyint DEFAULT 1 NOT NULL,
       ims_bsts             char(32) DEFAULT '' NOT NULL,
       ims_asts             char(32) DEFAULT '' NOT NULL,
       ims_tm_valid         integer DEFAULT 0 NOT NULL,
       replica_synch        tinyint DEFAULT 1 NOT NULL,
       impi_add_domain      tinyint DEFAULT 1 NOT NULL,
       store_srv_prf        tinyint DEFAULT 1 NOT NULL,
       sh_activation        tinyint DEFAULT 0 NOT NULL,
       ims_chrg_mode        tinyint DEFAULT 0 NOT NULL,
       alarm_sts            tinyint DEFAULT 0 NOT NULL,
       ims_ssts             char(32) DEFAULT '' NOT NULL,
       handle_uri_num       tinyint DEFAULT 1 NOT NULL,
       user_properties      smallint DEFAULT 2 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE asic_steer (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       suppl_id             smallint NOT NULL,
       activity_status      smallint NOT NULL,
       asic_list_mode       smallint NOT NULL,
       asic_list_adm        smallint NOT NULL,
       asic_list_size       smallint NOT NULL,
       asic_list_id         integer NOT NULL,
       tm_list_act          tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dn, suppl_id)
);



CREATE TABLE subs_presentation (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       subscriber_name      WCHAR(25),
       char_set             smallint NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



CREATE TABLE test_tone (
       nodeid               integer NOT NULL,
       test_tone_id         smallint NOT NULL,
       frequency1           smallint NOT NULL,
       level1               smallint NOT NULL,
       frequency2           smallint NOT NULL,
       level2               smallint NOT NULL,
       PRIMARY KEY (nodeid, test_tone_id)
);



CREATE TABLE ott_request (
       nodeid               integer NOT NULL,
       ott_request_id       smallint NOT NULL,
       trunk_group_id       smallint,
       trunk_id             integer,
       ott_repeat           smallint,
       dstdn                char(25) NOT NULL,
       ott_state            smallint NOT NULL,
       PRIMARY KEY (nodeid, ott_request_id)
);



CREATE TABLE ip_route (
       nodeid               integer NOT NULL,
       dest_ip_addr         char(15) NOT NULL,
       gw_ip_addr           char(15) NOT NULL,
       subnet_mask          char(15) NOT NULL,
       route_metric         smallint,
       pmtu                 smallint,
       route_dsc            varchar(256) DEFAULT NULL,
       PRIMARY KEY (nodeid, dest_ip_addr, subnet_mask)
);



CREATE TABLE test_error (
       nodeid               integer NOT NULL,
       errcod               integer NOT NULL,
       errpri               smallint NOT NULL,
       errtype              smallint NOT NULL,
       measure              smallint NOT NULL,
       measure_act          smallint NOT NULL,
       prob_cause           integer NOT NULL,
       measure_lib          char(20),
       measure_func         char(20),
       PRIMARY KEY (nodeid, errcod)
);



CREATE TABLE error_priority (
       nodeid               integer NOT NULL,
       errpri_id            integer NOT NULL,
       errcod               integer NOT NULL,
       errpri               smallint NOT NULL,
       obj_mask             char(80) NOT NULL,
       PRIMARY KEY (nodeid, errpri_id),
       FOREIGN KEY (nodeid, errcod)
                             REFERENCES test_error
);



CREATE TABLE eth_tag_rule (
       nodeid               integer NOT NULL,
       eth_intf_id          smallint NOT NULL,
       vlan_id              smallint DEFAULT 0 NOT NULL,
       acc_untag_frms       smallint DEFAULT 0 NOT NULL,
       snd_tag_frms         smallint DEFAULT 0 NOT NULL,
       ins_prior            smallint DEFAULT 0 NOT NULL,
       prior_value          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, eth_intf_id)
);



CREATE TABLE mn_sys_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_intf_name        char(32) NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id)
);



CREATE UNIQUE INDEX i_an_sys_interfa ON mn_sys_interface
(
	nodeid                ASC,
	sys_intf_name         ASC
);



CREATE TABLE mn_trunk_group (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       trnkgrp_name         char(32) NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid)
);



CREATE UNIQUE INDEX AK1_mn_trunk_group ON mn_trunk_group
(
	nodeid                ASC,
	trnkgrp_name          ASC
);



CREATE TABLE outg_domain_name (
       nodeid               integer NOT NULL,
       user_domain_name     char(50) NOT NULL,
       dstid                smallint DEFAULT 0 NOT NULL,
       tariff_dir           smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, user_domain_name)
);



CREATE TABLE ne_hosts (
       nodeid               integer NOT NULL,
       host_srv_ip_addr     char(15) NOT NULL,
       ip_domain_name       char(80) NOT NULL,
       ip_host_name         char(20) NOT NULL,
       PRIMARY KEY (nodeid, host_srv_ip_addr)
);



CREATE TABLE codec (
       nodeid               integer NOT NULL,
       codec_id             smallint NOT NULL,
       codec_name           smallint NOT NULL,
       codec_desc           char(30) NOT NULL,
       packet_time          smallint NOT NULL,
       rtp_payload_type     smallint NOT NULL,
       silence_suppr        smallint NOT NULL,
       change_allow         smallint NOT NULL,
       dsp_lavishness       smallint NOT NULL,
       prps_audio           smallint NOT NULL,
       prps_fax             smallint NOT NULL,
       prps_data            smallint NOT NULL,
       prps_video           smallint NOT NULL,
       video_qcif           smallint DEFAULT 1 NOT NULL,
       video_cif            smallint DEFAULT 0 NOT NULL,
       video_max_bit_rate   smallint DEFAULT 3840 NOT NULL,
       video_spat_trade     smallint DEFAULT 0 NOT NULL,
       video_still_img      smallint DEFAULT 0 NOT NULL,
       video_bad_mbs        smallint DEFAULT 0 NOT NULL,
       t38_fill_bit_rem     smallint DEFAULT 0 NOT NULL,
       t38_transcod_jbig    smallint DEFAULT 0 NOT NULL,
       t38_transcod_mmr     smallint DEFAULT 0 NOT NULL,
       t38_version          smallint DEFAULT 0 NOT NULL,
       t38_rate_mng         smallint DEFAULT 1 NOT NULL,
       t38_max_buffer       smallint DEFAULT 800 NOT NULL,
       t38_max_datagram     smallint DEFAULT 30 NOT NULL,
       t38_udp_ec           smallint DEFAULT 1 NOT NULL,
       codec_param1         smallint DEFAULT NULL,
       codec_param2         smallint DEFAULT NULL,
       codec_param3         smallint DEFAULT NULL,
       codec_param4         smallint DEFAULT NULL,
       codec_param5         smallint DEFAULT NULL,
       t38_max_bit_rate     integer DEFAULT 0 NOT NULL,
       codec_param6         smallint DEFAULT NULL,
       codec_param7         smallint DEFAULT NULL,
       codec_param8         smallint DEFAULT NULL,
       codec_param9         smallint DEFAULT NULL,
       codec_param10        smallint DEFAULT NULL,
       codec_param11        smallint DEFAULT NULL,
       codec_param12        smallint DEFAULT NULL,
       ss_threshold         smallint DEFAULT '-40' NOT NULL,
       PRIMARY KEY (nodeid, codec_id)
);



CREATE TABLE codec_set (
       nodeid               integer NOT NULL,
       codec_feature_id     smallint NOT NULL,
       codec_set_desc       char(30) NOT NULL,
       change_allow         smallint NOT NULL,
       set_prps_audio       smallint NOT NULL,
       set_prps_fax         smallint NOT NULL,
       set_prps_data        smallint NOT NULL,
       set_prps_video       smallint NOT NULL,
       prio1_codecid        smallint NOT NULL,
       prio2_codecid        smallint,
       prio3_codecid        smallint,
       prio4_codecid        smallint,
       prio5_codecid        smallint,
       prio6_codecid        smallint,
       prio7_codecid        smallint,
       prio8_codecid        smallint,
       prio9_codecid        smallint,
       prio10_codecid       smallint,
       PRIMARY KEY (nodeid, codec_feature_id)
);



CREATE TABLE dsp_tone_level (
       nodeid               integer NOT NULL,
       mf_level             smallint NOT NULL,
       mf_level_const       smallint NOT NULL,
       PRIMARY KEY (nodeid, mf_level)
);



CREATE TABLE reg_tone_signal (
       nodeid               integer NOT NULL,
       regsigtype           smallint NOT NULL,
       regsigvariant        smallint NOT NULL,
       regtoneid            smallint NOT NULL,
       frw_mftoneid         smallint NOT NULL,
       reg_sig_frw1         smallint NOT NULL,
       reg_sig_frw2         smallint NOT NULL,
       reg_sig_frw3         smallint NOT NULL,
       bkw_mftoneid         smallint NOT NULL,
       reg_sig_bkw1         smallint NOT NULL,
       reg_sig_bkw2         smallint NOT NULL,
       reg_sig_bkw3         smallint NOT NULL,
       PRIMARY KEY (nodeid, regsigtype, regsigvariant, regtoneid)
);



CREATE TABLE ctx_grp_dial (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       ctx_grp_code         char(5) NOT NULL,
       pub_grp_prefix       char(15) NOT NULL,
       PRIMARY KEY (nodeid, bgid, ctx_grp_code)
);



CREATE TABLE appl_server_domain (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       appl_srv_name        char(32) NOT NULL,
       PRIMARY KEY (nodeid, dstid)
);



CREATE UNIQUE INDEX AK1_appl_server_domain ON appl_server_domain
(
	nodeid                ASC,
	appl_srv_name         ASC
);



CREATE TABLE qsig_l3_data (
       nodeid               integer NOT NULL,
       qsig_l3_variant      smallint NOT NULL,
       qsigtm301            smallint NOT NULL,
       qsigtm302            smallint NOT NULL,
       qsigtm303            smallint NOT NULL,
       qsigtm304            smallint NOT NULL,
       qsigtm305            smallint NOT NULL,
       qsigtm308            smallint NOT NULL,
       qsigtm309            smallint NOT NULL,
       qsigtm310            smallint NOT NULL,
       qsigtm313            smallint NOT NULL,
       qsigtm314            smallint NOT NULL,
       qsigtm316            smallint NOT NULL,
       qsigtm322            smallint NOT NULL,
       qsigchsel            smallint NOT NULL,
       PRIMARY KEY (nodeid, qsig_l3_variant)
);



CREATE TABLE qsig_d_channel (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       qsig_port_type       smallint NOT NULL,
       level2_variant       smallint NOT NULL,
       qsig_l3_variant      smallint NOT NULL,
       qsig_side            smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr),
       FOREIGN KEY (nodeid, level2_variant)
                             REFERENCES level2_data,
       FOREIGN KEY (nodeid, qsig_l3_variant)
                             REFERENCES qsig_l3_data
);



CREATE TABLE asaccess_domain (
       nodeid               integer NOT NULL,
       access_variant       smallint NOT NULL,
       access_var_name      char(32) NOT NULL,
       PRIMARY KEY (nodeid, access_variant)
);



CREATE UNIQUE INDEX AK1_asaccess_domain ON asaccess_domain
(
	nodeid                ASC,
	access_var_name       ASC
);



CREATE TABLE suppl_default (
       nodeid               integer NOT NULL,
       suppl_id_default     smallint NOT NULL,
       suppl_default_var    smallint NOT NULL,
       cgid                 smallint NOT NULL,
       suppl_dflt_param     smallint NOT NULL,
       dstdn                char(25) NOT NULL,
       PRIMARY KEY (nodeid, suppl_id_default, suppl_default_var, cgid)
);



CREATE TABLE long_calls_mon (
       nodeid               integer NOT NULL,
       call_index           integer NOT NULL,
       rcg_pid              integer NOT NULL,
       area_code            char(6) NOT NULL,
       cgpn                 char(15) NOT NULL,
       cdpn                 char(25) NOT NULL,
       start_date           integer NOT NULL,
       start_time           smallint NOT NULL,
       last_rec_date        integer NOT NULL,
       last_rec_time        smallint NOT NULL,
       duration             integer NOT NULL,
       tele_id              smallint NOT NULL,
       infotrcpb            smallint NOT NULL,
       cac                  char(6) NOT NULL,
       incm_trnkgrpid       smallint,
       incm_trunkid         integer,
       incm_modulenr        smallint,
       incm_portnr          smallint,
       incm_channel         smallint,
       outg_trnkgrpid       smallint,
       outg_trunkid         integer,
       outg_modulenr        smallint,
       outg_portnr          smallint,
       outg_channel         smallint,
       tariff_dir           smallint NOT NULL,
       PRIMARY KEY (nodeid, call_index)
);



CREATE TABLE module (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       module_type          smallint NOT NULL,
       coco_type            smallint NOT NULL,
       module_users_type    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, modulenr)
);



CREATE TABLE ms_feature (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       tdm_rtp_id           smallint NOT NULL,
       ms_weight            integer DEFAULT 1000 NOT NULL,
       ms_codec_set_id      smallint DEFAULT 0 NOT NULL,
       max_cnf_ptcp         smallint DEFAULT 160,
       PRIMARY KEY (nodeid, modulenr),
       FOREIGN KEY (nodeid, modulenr)
                             REFERENCES module,
       FOREIGN KEY (nodeid, tdm_rtp_id)
                             REFERENCES tdm_rtp_profile
);



CREATE TABLE request_exe (
       nodeid               integer NOT NULL,
       rexecid              smallint NOT NULL,
       rexetype             smallint NOT NULL,
       rexepar1             integer NOT NULL,
       rexepar2             integer NOT NULL,
       rexepar3             integer NOT NULL,
       rexepar4             integer NOT NULL,
       rexepar5             integer NOT NULL,
       PRIMARY KEY (nodeid, rexecid)
);



CREATE TABLE open_num (
       nodeid               integer NOT NULL,
       in_dstid             smallint NOT NULL,
       numtype              smallint NOT NULL,
       trnkgrpid            smallint NOT NULL,
       short_nr_length      smallint NOT NULL,
       long_nr_length       smallint NOT NULL,
       tm_after_shortnr     smallint NOT NULL,
       out_dstctg_short     smallint NOT NULL,
       out_dstid_short      smallint NOT NULL,
       out_dstctg_long      smallint NOT NULL,
       out_dstid_long       smallint NOT NULL,
       cac_length           smallint DEFAULT 0 NOT NULL,
       lac_length           smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, in_dstid, numtype, trnkgrpid)
);



CREATE TABLE dp_property (
       nodeid               integer NOT NULL,
       dpproperty_id        smallint DEFAULT 0 NOT NULL,
       dpind_id             smallint DEFAULT 0 NOT NULL,
       dp_releasecall       smallint DEFAULT 0 NOT NULL,
       dpproperty_cause     smallint DEFAULT 0 NOT NULL,
       dp_srvr_dstid        smallint DEFAULT 0 NOT NULL,
       dpproperty_indreq    char(4),
       dp_tariff_dir        smallint DEFAULT '-1' NOT NULL,
       dpproperty_rsrv1     smallint DEFAULT 0 NOT NULL,
       dpproperty_rsrv2     smallint DEFAULT 0 NOT NULL,
       dp_2nd_call_mode     tinyint DEFAULT 0 NOT NULL,
       cnpn_treatment       smallint DEFAULT 0 NOT NULL,
       crg_property         integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dpproperty_id)
);



CREATE TABLE ind_service (
       nodeid               integer NOT NULL,
       ind_id               smallint DEFAULT 0 NOT NULL,
       indval               smallint DEFAULT 0 NOT NULL,
       ann_variant          smallint DEFAULT 0 NOT NULL,
       ann_variant_mode     smallint DEFAULT 0 NOT NULL,
       ind_mode             smallint DEFAULT 0 NOT NULL,
       ind_duration         smallint DEFAULT 0 NOT NULL,
       ind_side             smallint DEFAULT 0 NOT NULL,
       add_srv_notice       char(25),
       PRIMARY KEY (nodeid, ind_id)
);



CREATE TABLE ad_convert (
       nodeid               integer NOT NULL,
       ad_convert_type      smallint NOT NULL,
       ad_instate           smallint NOT NULL,
       ad_outstate          smallint NOT NULL,
       ad_led_indication    smallint NOT NULL,
       ad_led_control       smallint NOT NULL,
       ad_channel_offset    smallint NOT NULL,
       PRIMARY KEY (nodeid, ad_convert_type, ad_instate)
);



CREATE TABLE pstndl_param (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       tm_tc2a              smallint NOT NULL,
       tm_tc3               smallint NOT NULL,
       portcorrection       integer NOT NULL,
       pstn_diag_mode       smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr)
);



CREATE TABLE time_bonus (
       nodeid               integer NOT NULL,
       amount_charge_unit   smallint NOT NULL,
       validity_extension   smallint NOT NULL,
       PRIMARY KEY (nodeid, amount_charge_unit)
);



CREATE TABLE prepaid_coupon (
       nodeid               integer NOT NULL,
       cin1                 integer NOT NULL,
       cin2                 integer NOT NULL,
       coupon_serial_nr     integer NOT NULL,
       coupon_status        smallint NOT NULL,
       amount_charge_unit   smallint NOT NULL,
       date_of_validity     smallint NOT NULL,
       PRIMARY KEY (nodeid, cin1, cin2),
       FOREIGN KEY (nodeid, amount_charge_unit)
                             REFERENCES time_bonus
);



CREATE TABLE nailed_up_con (
       nodeid               integer NOT NULL,
       nuc_id               smallint NOT NULL,
       nuc_prps             smallint DEFAULT 0 NOT NULL,
       nuc_member1_type     smallint NOT NULL,
       nuc_member2_type     smallint NOT NULL,
       required_status      smallint DEFAULT 1 NOT NULL,
       nuc_param1           integer,
       nuc_param2           integer,
       nuc_ctrl_appl_type   tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, nuc_id)
);



CREATE TABLE nuc_tdm_data (
       nodeid               integer NOT NULL,
       nuc_id               smallint NOT NULL,
       nuc_side             smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ci                   smallint NOT NULL,
       nuc_tdm_param1       smallint,
       nuc_tdm_param2       smallint,
       PRIMARY KEY (nodeid, nuc_id, nuc_side),
       FOREIGN KEY (nodeid, nuc_id)
                             REFERENCES nailed_up_con
);



CREATE TABLE sctp_profile (
       nodeid               integer NOT NULL,
       sctp_prf_id          smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       sctp_hb              smallint DEFAULT 1 NOT NULL,
       checksum_algorithm   smallint DEFAULT 1 NOT NULL,
       rto_initial          integer NOT NULL,
       rto_min              integer NOT NULL,
       rto_max              integer NOT NULL,
       rto_alpha            smallint NOT NULL,
       rto_beta             smallint NOT NULL,
       valid_cookie_life    integer DEFAULT 6000 NOT NULL,
       max_assoc_retrans    smallint NOT NULL,
       max_path_retrans     smallint NOT NULL,
       max_init_retrans     smallint NOT NULL,
       tm_sctp_hb           integer DEFAULT 3000 NOT NULL,
       max_burst            smallint NOT NULL,
       sack_period          smallint NOT NULL,
       sack_frequency       smallint NOT NULL,
       ipv4_addr_scoping    smallint DEFAULT 1 NOT NULL,
       add_ip               smallint DEFAULT 1 NOT NULL,
       cong_proc            smallint DEFAULT 0 NOT NULL,
       path_mtu             integer DEFAULT 1500 NOT NULL,
       PRIMARY KEY (nodeid, sctp_prf_id)
);



CREATE UNIQUE INDEX AK1_sctp_profile ON sctp_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE sctp_association (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sctp_inst_id         smallint NOT NULL,
       in_streams           smallint DEFAULT 95 NOT NULL,
       out_streams          smallint DEFAULT 95 NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       sctp_prf_id          smallint NOT NULL,
       assoc_equip          smallint DEFAULT 1 NOT NULL,
       log_stat_group_id    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id),
       FOREIGN KEY (nodeid, sctp_prf_id)
                             REFERENCES sctp_profile
);



CREATE TABLE dst_ip_address (
       nodeid               integer NOT NULL,
       dst_ip_addr_id       smallint NOT NULL,
       sys_intf_id          integer NOT NULL,
       dst_ip_addr          char(15) NOT NULL,
       dst_ip_port          integer NOT NULL,
       addr_prio            smallint NOT NULL,
       ip_ver               smallint NOT NULL,
       PRIMARY KEY (nodeid, dst_ip_addr_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES sctp_association
);



CREATE UNIQUE INDEX AK1_dst_ip_address ON dst_ip_address
(
	nodeid                ASC,
	sys_intf_id           ASC,
	dst_ip_addr           ASC
);



CREATE UNIQUE INDEX AK2_dst_ip_address ON dst_ip_address
(
	nodeid                ASC,
	sys_intf_id           ASC,
	addr_prio             ASC
);



CREATE TABLE cm_objtyperestr (
       nodeid               integer NOT NULL,
       autonumber_pk        smallint NOT NULL,
       cm_objtype           smallint NOT NULL,
       cm_ctgpfx            smallint NOT NULL,
       cm_minlen            smallint NOT NULL,
       cm_maxlen            smallint NOT NULL,
       PRIMARY KEY (nodeid, autonumber_pk)
);



CREATE TABLE rsup_message (
       nodeid               integer NOT NULL,
       cgid                 smallint NOT NULL,
       rsup_code            integer NOT NULL,
       rsup_code_descr      char(60) NOT NULL,
       PRIMARY KEY (nodeid, cgid, rsup_code)
);



CREATE TABLE call_gen_param (
       nodeid               integer NOT NULL,
       call_gen_param_id    smallint NOT NULL,
       start_date           integer NOT NULL,
       start_time           smallint NOT NULL,
       restart_period       integer NOT NULL,
       end_date             integer NOT NULL,
       end_time             smallint NOT NULL,
       reset_traffic_data   smallint NOT NULL,
       write_traffic_data   smallint NOT NULL,
       action_pause_unit    smallint NOT NULL,
       num_gen_starts       smallint NOT NULL,
       last_start_date      integer NOT NULL,
       last_start_time      smallint NOT NULL,
       PRIMARY KEY (nodeid, call_gen_param_id)
);



CREATE TABLE ioc_category (
       nodeid               integer NOT NULL,
       ctgioc               smallint NOT NULL,
       cgid                 smallint DEFAULT 0 NOT NULL,
       dstdn                char(25),
       suc_indval           smallint NOT NULL,
       unsuc_indval         smallint NOT NULL,
       ioc_frwd_tone        smallint NOT NULL,
       PRIMARY KEY (nodeid, ctgioc, cgid)
);



CREATE TABLE dpl_mode (
       nodeid               integer NOT NULL,
       autonumber_pk        smallint NOT NULL,
       dpl_ip_addr          char(15) NOT NULL,
       PRIMARY KEY (nodeid, autonumber_pk)
);



CREATE TABLE incom_call_barr (
       nodeid               integer NOT NULL,
       orig_icb_ctg         smallint NOT NULL,
       term_icb_ctg         smallint NOT NULL,
       PRIMARY KEY (nodeid, orig_icb_ctg, term_icb_ctg)
);



CREATE TABLE route_crit_switch (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       dayctg               smallint NOT NULL,
       switch_time          smallint NOT NULL,
       crivalue             smallint NOT NULL,
       PRIMARY KEY (nodeid, dstid, dayctg, switch_time)
);



CREATE TABLE otc_pgs (
       nodeid               integer NOT NULL,
       otc_pgsdn            integer NOT NULL,
       pgs_name             char(50) NOT NULL,
       otc_pgs_type         tinyint DEFAULT 0 NOT NULL,
       tm_delay_dial_tone   smallint DEFAULT 1000 NOT NULL,
       PRIMARY KEY (nodeid, otc_pgsdn)
);



CREATE UNIQUE INDEX AK1_otc_pgs ON otc_pgs
(
	nodeid                ASC,
	pgs_name              ASC
);



CREATE TABLE resource_load (
       nodeid               integer NOT NULL,
       resource_type        smallint NOT NULL,
       all_event_limit      integer NOT NULL,
       link_event_limit     integer NOT NULL,
       port_event_limit     integer NOT NULL,
       PRIMARY KEY (nodeid, resource_type)
);



CREATE TABLE eth_profile (
       nodeid               integer NOT NULL,
       eth_profile_id       smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       bandwidth            smallint NOT NULL,
       mtu                  integer NOT NULL,
       eth_mode             smallint NOT NULL,
       PRIMARY KEY (nodeid, eth_profile_id)
);



CREATE UNIQUE INDEX i_eth_pname ON eth_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE ext_user_barrclass (
       nodeid               integer NOT NULL,
       cbact_list_id        smallint NOT NULL,
       trnkgrpid            smallint NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       barrclass            smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (trnkgrpid, cgpn_prefix, nodeid, cbact_list_id)
);



CREATE TABLE room_superv_mn (
       nodeid               integer NOT NULL,
       rsup_pin             integer NOT NULL,
       rsup_pin_descr       char(25) NOT NULL,
       PRIMARY KEY (nodeid, rsup_pin)
);



CREATE TABLE mn_business_group (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       group_name           WCHAR(32) NOT NULL,
       PRIMARY KEY (nodeid, bgid)
);



CREATE UNIQUE INDEX AK1_mn_business_group ON mn_business_group
(
	nodeid                ASC,
	group_name            ASC
);



CREATE TABLE mn_centrex_group (
       nodeid               integer NOT NULL,
       cgid                 smallint NOT NULL,
       group_name           WCHAR(32) NOT NULL,
       PRIMARY KEY (nodeid, cgid)
);



CREATE UNIQUE INDEX AK1_mn_centrex_group ON mn_centrex_group
(
	nodeid                ASC,
	group_name            ASC
);



CREATE TABLE mn_cug (
       nodeid               integer NOT NULL,
       cug_index            smallint NOT NULL,
       cug_name             char(32) NOT NULL,
       PRIMARY KEY (nodeid, cug_index)
);



CREATE UNIQUE INDEX AK1_mn_cug ON mn_cug
(
	nodeid                ASC,
	cug_name              ASC
);



CREATE TABLE mn_ddi (
       nodeid               integer NOT NULL,
       ddi_id               smallint NOT NULL,
       ddi_name             char(32) NOT NULL,
       PRIMARY KEY (nodeid, ddi_id)
);



CREATE UNIQUE INDEX AK1_mn_ddi ON mn_ddi
(
	nodeid                ASC,
	ddi_name              ASC
);



CREATE TABLE mn_dsp_ip_feature (
       nodeid               integer NOT NULL,
       dsp_ip_feature_id    smallint NOT NULL,
       dsp_ip_name          char(32) NOT NULL,
       PRIMARY KEY (nodeid, dsp_ip_feature_id)
);



CREATE UNIQUE INDEX AK1_mn_dsp_ip_feature ON mn_dsp_ip_feature
(
	nodeid                ASC,
	dsp_ip_name           ASC
);



CREATE TABLE decl_msg_isup (
       nodeid               integer NOT NULL,
       autonumber_pk        smallint NOT NULL,
       msg_type             smallint NOT NULL,
       isup_par_name        smallint NOT NULL,
       isup_par_type        smallint NOT NULL,
       min_par_length       smallint NOT NULL,
       max_par_length       smallint NOT NULL,
       min_par_set          smallint NOT NULL,
       isup_par_reserve1    smallint DEFAULT 0 NOT NULL,
       isup_par_reserve2    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, autonumber_pk)
);



CREATE TABLE mn_mad (
       nodeid               integer NOT NULL,
       mad_id               smallint NOT NULL,
       mad_name             char(32) NOT NULL,
       PRIMARY KEY (nodeid, mad_id)
);



CREATE UNIQUE INDEX AK1_mn_mad ON mn_mad
(
	nodeid                ASC,
	mad_name              ASC
);



CREATE TABLE mn_nr_portability (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       move_status          smallint NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



CREATE TABLE mn_orig_cb (
       nodeid               integer NOT NULL,
       barrclass            smallint NOT NULL,
       barrclass_name       WCHAR(32) NOT NULL,
       list_mode            smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, barrclass)
);



CREATE UNIQUE INDEX AK1_mn_orig_cb ON mn_orig_cb
(
	nodeid                ASC,
	barrclass_name        ASC
);



CREATE TABLE mn_rmt_subscriber (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       access_to_service    smallint NOT NULL,
       thirdparty_service   smallint NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



CREATE TABLE mn_routing_group (
       nodeid               integer NOT NULL,
       routing_group        smallint NOT NULL,
       routing_grp_name     char(32) NOT NULL,
       PRIMARY KEY (nodeid, routing_group)
);



CREATE UNIQUE INDEX AK1_mn_routing_group ON mn_routing_group
(
	nodeid                ASC,
	routing_grp_name      ASC
);



CREATE TABLE mn_rtp_profile (
       nodeid               integer NOT NULL,
       rtp_id               smallint NOT NULL,
       rtp_name             char(32) NOT NULL,
       PRIMARY KEY (nodeid, rtp_id)
);



CREATE UNIQUE INDEX AK1_mn_rtp_profile ON mn_rtp_profile
(
	nodeid                ASC,
	rtp_name              ASC
);



CREATE TABLE mn_subs_conv (
       nodeid               integer NOT NULL,
       dicon_group          smallint NOT NULL,
       dicon_group_name     char(32) NOT NULL,
       PRIMARY KEY (nodeid, dicon_group)
);



CREATE UNIQUE INDEX AK1_mn_subs_conv ON mn_subs_conv
(
	nodeid                ASC,
	dicon_group_name      ASC
);



CREATE TABLE mn_subscr_group (
       nodeid               integer NOT NULL,
       group_id             integer NOT NULL,
       group_name           WCHAR(32) NOT NULL,
       subscr_group_type    tinyint DEFAULT 0 NOT NULL,
       bgid                 integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, group_id)
);



CREATE TABLE mn_suppl_default (
       nodeid               integer NOT NULL,
       cgid                 smallint NOT NULL,
       suppl_default_var    smallint NOT NULL,
       suppl_dflt_varname   char(32) NOT NULL,
       PRIMARY KEY (nodeid, cgid, suppl_default_var)
);



CREATE UNIQUE INDEX AK1_mn_suppl_default ON mn_suppl_default
(
	nodeid                ASC,
	cgid                  ASC,
	suppl_dflt_varname    ASC
);



CREATE TABLE room_supervision (
       nodeid               integer NOT NULL,
       rsup_pin             integer NOT NULL,
       PRIMARY KEY (nodeid, rsup_pin)
);



CREATE TABLE abbd (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       cgid                 smallint DEFAULT 0 NOT NULL,
       abbrnr               char(5) NOT NULL,
       fullnr               char(25) NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, cgid, abbrnr),
       FOREIGN KEY (nodeid, ndc_id)
                             REFERENCES local_ndc
);



CREATE TABLE network_node_domain (
       nodeid               integer NOT NULL,
       network_nodeid       integer NOT NULL,
       network_node_name    WVARCHAR(30) NOT NULL,
       PRIMARY KEY (nodeid, network_nodeid)
);



CREATE UNIQUE INDEX AK1_network_node_domain ON network_node_domain
(
	nodeid                ASC,
	network_node_name     ASC
);



CREATE TABLE access (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       sigtype              smallint NOT NULL,
       default_dn           integer NOT NULL,
       msn_auth             smallint NOT NULL,
       dtmf                 smallint NOT NULL,
       typesc               smallint NOT NULL,
       tp_auth              smallint NOT NULL,
       access_variant       smallint NOT NULL,
       local_blocking       smallint NOT NULL,
       access_type          smallint NOT NULL,
       oosi                 smallint NOT NULL,
       access_equipped      smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       access_reserve1      smallint DEFAULT 0 NOT NULL,
       access_reserve2      smallint DEFAULT 0 NOT NULL,
       access_reserve3      smallint DEFAULT 0 NOT NULL,
       access_reserve4      smallint DEFAULT 0 NOT NULL,
       allow_forced_cgpn    smallint DEFAULT 0 NOT NULL,
       mapping_type         smallint DEFAULT 0 NOT NULL,
       group_reg_type       tinyint DEFAULT 0 NOT NULL,
       secondary_nodeid     integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr),
       FOREIGN KEY (nodeid, secondary_nodeid)
                             REFERENCES network_node_domain
);



CREATE DENSE SEQUENCE seq_access_portnr;



CREATE TABLE access_grp_member (
       nodeid               integer NOT NULL,
       access_group_id      smallint NOT NULL,
       seqnr                smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ch_seizure_mode      smallint NOT NULL,
       PRIMARY KEY (nodeid, access_group_id, seqnr),
       FOREIGN KEY (nodeid, modulenr, portnr)
                             REFERENCES access
);



CREATE TABLE nc_msg_param (
       nodeid               integer NOT NULL,
       msg_id               smallint NOT NULL,
       nc_priority          smallint NOT NULL,
       repeat_nr            smallint NOT NULL,
       repeat_period        smallint NOT NULL,
       tm_exec_limit        smallint NOT NULL,
       nc_ring_indval       smallint NOT NULL,
       nc_ring_indval_dur   smallint NOT NULL,
       nc_ans_indval        smallint NOT NULL,
       nc_ans_indval_dur    smallint NOT NULL,
       recording            smallint NOT NULL,
       suppl_id             smallint NOT NULL,
       PRIMARY KEY (nodeid, msg_id)
);



CREATE TABLE nc_orders (
       nodeid               integer NOT NULL,
       act_dn               integer NOT NULL,
       invoc_dstdn          char(25) NOT NULL,
       invoc_date           integer NOT NULL,
       invoc_time           smallint NOT NULL,
       msg_id               smallint NOT NULL,
       nc_mode              smallint NOT NULL,
       nc_priority          smallint NOT NULL,
       repeat_nr            smallint NOT NULL,
       invoc_nr             smallint NOT NULL,
       act_date             integer NOT NULL,
       act_time             smallint NOT NULL,
       vru_box              char(25),
       in_use               smallint NOT NULL,
       group_id             integer NOT NULL,
       last_used            char(25),
       PRIMARY KEY (nodeid, act_dn, invoc_dstdn, invoc_date, invoc_time, msg_id, nc_mode, group_id),
       FOREIGN KEY (nodeid, msg_id)
                             REFERENCES nc_msg_param
);



CREATE TABLE h323_remote_side (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       rs_ip_addr           char(15),
       rs_eth_addr          char(17),
       rs_sec_ip_addr       char(15),
       rs_sec_eth_addr      char(17),
       rs_eth_ident_mode    smallint NOT NULL,
       h323_feature_id      smallint NOT NULL,
       h323_pin             integer,
       sig_tunneling        smallint DEFAULT 0 NOT NULL,
       sigtrace_req         smallint NOT NULL,
       rs_param             smallint,
       PRIMARY KEY (nodeid, trnkgrpid),
       FOREIGN KEY (nodeid, h323_feature_id)
                             REFERENCES h323_feature
);



CREATE INDEX IE2_h323_remote_side ON h323_remote_side
(
	nodeid                ASC,
	rs_ip_addr            ASC
);



CREATE TABLE manipulation (
       nodeid               integer NOT NULL,
       manipcod             char(20) NOT NULL,
       manipid              smallint NOT NULL,
       PRIMARY KEY (nodeid, manipcod)
);



CREATE TABLE global_prep_data (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       prepaid_type         smallint NOT NULL,
       cryption_length      smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE dsp_attenuation (
       nodeid               integer NOT NULL,
       attenuation          smallint NOT NULL,
       attenuation_const    smallint NOT NULL,
       PRIMARY KEY (nodeid, attenuation)
);



CREATE TABLE group_member (
       nodeid               integer NOT NULL,
       group_id             integer NOT NULL,
       seqnr                smallint NOT NULL,
       member_dn            char(25) NOT NULL,
       grp_member_dscr      WCHAR(32),
       user_domain_name     char(50) DEFAULT NULL,
       PRIMARY KEY (nodeid, group_id, seqnr)
);



CREATE TABLE tcap_param (
       nodeid               integer NOT NULL,
       tcap_param_id        smallint NOT NULL,
       tcap_tm_reject       smallint NOT NULL,
       min_tcap_tm_invoc    smallint NOT NULL,
       max_tcap_tm_invoc    smallint NOT NULL,
       max_tcap_dialog      smallint NOT NULL,
       max_tcap_oper        smallint NOT NULL,
       PRIMARY KEY (nodeid, tcap_param_id)
);



CREATE TABLE rec_trnk_rg_conv (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       num_sort             smallint NOT NULL,
       numtype              smallint NOT NULL,
       rgpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid, num_sort, numtype, rgpn_prefix)
);



CREATE TABLE in_calling_conv (
       nodeid               integer NOT NULL,
       cgp_numtype          smallint NOT NULL,
       dicon                char(25),
       newcgp_numtype       smallint NOT NULL,
       PRIMARY KEY (nodeid, cgp_numtype)
);



CREATE TABLE mn_local_ndc (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       ndc_name             char(32) NOT NULL,
       ndc_display          char(6) DEFAULT NULL,
       PRIMARY KEY (nodeid, ndc_id)
);



CREATE UNIQUE INDEX AK1_mn_local_ndc ON mn_local_ndc
(
	nodeid                ASC,
	ndc_name              ASC
);



CREATE TABLE dss1_qsig_param (
       nodeid               integer NOT NULL,
       dss1_qsig_variant    smallint NOT NULL,
       pi_mode              smallint DEFAULT 0 NOT NULL,
       proc_pi1             smallint DEFAULT 0 NOT NULL,
       charge               smallint NOT NULL,
       dndo                 smallint DEFAULT 0 NOT NULL,
       ccbs_ccnr_auth       smallint DEFAULT 1 NOT NULL,
       sc_mode              smallint DEFAULT 0 NOT NULL,
       fac_mode             smallint DEFAULT 0 NOT NULL,
       sr_mode              smallint DEFAULT 0 NOT NULL,
       tmdischold           smallint DEFAULT 0 NOT NULL,
       tdm_rtp_id           smallint DEFAULT 0 NOT NULL,
       ci_mode              smallint DEFAULT 0 NOT NULL,
       ni_mode              smallint DEFAULT 0 NOT NULL,
       dss1_qsig_reserve1   smallint,
       dss1_qsig_reserve2   smallint,
       dss1_qsig_reserve3   smallint,
       connack_mode         smallint DEFAULT 0 NOT NULL,
       alerting_tone        smallint DEFAULT 0 NOT NULL,
       screen_indicator     tinyint DEFAULT 0 NOT NULL,
       dss1_qsig_netw       tinyint DEFAULT 0 NOT NULL,
       cgpn_mode            tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dss1_qsig_variant),
       FOREIGN KEY (nodeid, tdm_rtp_id)
                             REFERENCES tdm_rtp_profile
);



CREATE TABLE sctp_instance (
       nodeid               integer NOT NULL,
       sctp_inst_id         smallint NOT NULL,
       sctp_type            smallint DEFAULT 2 NOT NULL,
       max_in_streams       smallint DEFAULT 95 NOT NULL,
       max_out_streams      smallint DEFAULT 95 NOT NULL,
       sctp_prf_id          smallint NOT NULL,
       PRIMARY KEY (nodeid, sctp_inst_id),
       FOREIGN KEY (nodeid, sctp_prf_id)
                             REFERENCES sctp_profile
);



CREATE TABLE local_ip_address (
       nodeid               integer NOT NULL,
       local_ip_addr_id     smallint NOT NULL,
       sctp_inst_id         smallint NOT NULL,
       local_ip_addr        char(15) NOT NULL,
       local_ip_port        integer NOT NULL,
       ip_ver               smallint NOT NULL,
       PRIMARY KEY (nodeid, local_ip_addr_id),
       FOREIGN KEY (nodeid, sctp_inst_id)
                             REFERENCES sctp_instance
);



CREATE UNIQUE INDEX AK2_local_ip_address ON local_ip_address
(
	nodeid                ASC,
	sctp_inst_id          ASC,
	local_ip_port         ASC
);



CREATE TABLE alert_info (
       nodeid               integer NOT NULL,
       alert_info_id        smallint NOT NULL,
       alert_info_content   varchar(132) NOT NULL,
       alert_info_parameter varchar(64) NOT NULL,
       terminal_type        varchar(32) NOT NULL,
       PRIMARY KEY (nodeid, alert_info_id)
);



CREATE TABLE subscr_group (
       nodeid               integer NOT NULL,
       group_id             integer NOT NULL,
       basic_id             smallint NOT NULL,
       suppl_id             smallint NOT NULL,
       property1            integer NOT NULL,
       property2            integer NOT NULL,
       property3            integer NOT NULL,
       last_used            char(25),
       dstdn                char(25),
       redirection_dstdn    char(25),
       mode_seizure         tinyint DEFAULT 0 NOT NULL,
       tm_memorycall        smallint DEFAULT 0 NOT NULL,
       alert_info_id        smallint DEFAULT 0 NOT NULL,
       group_label          WVARCHAR(15) DEFAULT NULL,
       PRIMARY KEY (nodeid, group_id, basic_id, suppl_id),
       FOREIGN KEY (nodeid, basic_id)
                             REFERENCES basic_service,
       FOREIGN KEY (nodeid, alert_info_id)
                             REFERENCES alert_info
);



CREATE TABLE prepaid_subs_set (
       nodeid               integer NOT NULL,
       prepaid_set_id       smallint NOT NULL,
       prepaid_set_name     char(15) NOT NULL,
       welcome_msg_mode     smallint NOT NULL,
       language_mode        smallint NOT NULL,
       cb_mode              smallint NOT NULL,
       recharge_auth        smallint NOT NULL,
       lock_auth            smallint NOT NULL,
       rr_req_mode          smallint NOT NULL,
       max_call_att         smallint NOT NULL,
       max_recharge_att     smallint NOT NULL,
       simult_calls_auth    smallint NOT NULL,
       low_balance_warn     smallint NOT NULL,
       near_expiry_warn     smallint NOT NULL,
       neg_acc_balance      smallint NOT NULL,
       max_acc_balance      integer NOT NULL,
       suspension_dur       smallint NOT NULL,
       min_call_dur         smallint NOT NULL,
       low_balance_value1   smallint NOT NULL,
       low_balance_value2   smallint NOT NULL,
       cnpn_display_mode    smallint NOT NULL,
       prepaid_subs_type    smallint NOT NULL,
       avail_dur_msg_auth   smallint NOT NULL,
       acc_bal_msg_auth     smallint NOT NULL,
       org_charge_code      smallint NOT NULL,
       validity_time        smallint NOT NULL,
       aut_reload_mode      tinyint DEFAULT 0 NOT NULL,
       aut_reload_amount    integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, prepaid_set_id)
);



CREATE TABLE prepaid_subscriber (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       account_status       smallint NOT NULL,
       account_balance      integer NOT NULL,
       date_of_last_used    smallint NOT NULL,
       date_of_expiry       smallint NOT NULL,
       language_code        smallint NOT NULL,
       unsuc_recharge_att   smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       prepaid_set_id       smallint NOT NULL,
       no_active_calls      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dn),
       FOREIGN KEY (nodeid, prepaid_set_id)
                             REFERENCES prepaid_subs_set
);



CREATE TABLE prepaid_identity (
       nodeid               integer NOT NULL,
       prepaid_pin1         integer NOT NULL,
       prepaid_pin2         integer NOT NULL,
       account_id           char(15) NOT NULL,
       dn                   integer NOT NULL,
       PRIMARY KEY (nodeid, prepaid_pin1, prepaid_pin2, account_id),
       FOREIGN KEY (nodeid, dn)
                             REFERENCES prepaid_subscriber
);



CREATE TABLE global_tariff_data (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       maxcrgunits          integer NOT NULL,
       max_crgrec_period    smallint NOT NULL,
       pmob_u_treshold      integer NOT NULL,
       pmob_tm_treshold     smallint NOT NULL,
       cdr_for_meters       smallint NOT NULL,
       ama_duration_type    smallint NOT NULL,
       crg_unit_price       integer NOT NULL,
       currency_id          char(10),
       currency_multipl     smallint NOT NULL,
       tmaocd               smallint NOT NULL,
       tmreanswer           smallint NOT NULL,
       chargeatct           smallint NOT NULL,
       dur_msg_treshold     smallint NOT NULL,
       tmpmeter_expterm     smallint DEFAULT 720 NOT NULL,
       chk_tmp_met_period   smallint DEFAULT 60 NOT NULL,
       exp_accounts_mng     smallint DEFAULT 1 NOT NULL,
       chargeintmask        smallint NOT NULL,
       cbno2tardir_mode     smallint DEFAULT 0 NOT NULL,
       cbno_acc_mode        smallint DEFAULT 0 NOT NULL,
       mult_cbno_acc_mode   smallint DEFAULT 0 NOT NULL,
       conv_cbno_acc_mode   smallint DEFAULT 0 NOT NULL,
       comm_call_id_act     smallint DEFAULT 0 NOT NULL,
       cdr_file_period      integer DEFAULT 300 NOT NULL,
       pre_ans_dur_act      smallint DEFAULT 0 NOT NULL,
       rec_att_units_mode   smallint DEFAULT 0 NOT NULL,
       local_ip_in_cdr      smallint DEFAULT 0 NOT NULL,
       remote_ip_in_cdr     smallint DEFAULT 1 NOT NULL,
       ctrl_cnt_cdr_act     smallint DEFAULT 0 NOT NULL,
       newdestnr_in_cdr     smallint DEFAULT 0 NOT NULL,
       np_crgdestnr         smallint DEFAULT 0 NOT NULL,
       app_reserved1        integer NOT NULL,
       app_reserved2        integer NOT NULL,
       olacct_period        smallint DEFAULT 1800 NOT NULL,
       olacct_exp_action    smallint DEFAULT 1 NOT NULL,
       start_msg_act        smallint DEFAULT 0 NOT NULL,
       stationid_rectype    smallint DEFAULT 0 NOT NULL,
       qos_cdr_act          smallint DEFAULT 0 NOT NULL,
       pps_def_tardir       smallint DEFAULT '-1' NOT NULL,
       pps_olacctperiod     smallint DEFAULT 60 NOT NULL,
       ctxdata_rectype      smallint DEFAULT 0 NOT NULL,
       cdr_cgpn_mode        smallint DEFAULT 0 NOT NULL,
       clean_cdpn_incdr     smallint DEFAULT 0 NOT NULL,
       cdcp_supervision     tinyint DEFAULT 1 NOT NULL,
       trunkgrp_recmode     tinyint DEFAULT 0 NOT NULL,
       thirdpn_recmode      tinyint DEFAULT 0 NOT NULL,
       cdpn_recmode         tinyint DEFAULT 0 NOT NULL,
       rdpn_recmode         tinyint DEFAULT 0 NOT NULL,
       sent_cdpn_rec        tinyint DEFAULT 0 NOT NULL,
       node_info_rec        tinyint DEFAULT 0 NOT NULL,
       iacama_mode          tinyint DEFAULT 1 NOT NULL,
       online_cdr_mode      tinyint DEFAULT 0 NOT NULL,
       globcallref_act      tinyint DEFAULT 0 NOT NULL,
       loc_cdpn_with_lac    tinyint DEFAULT 0 NOT NULL,
       mlpp_in_cdr_act      tinyint DEFAULT 0 NOT NULL,
       vas_crg_destnr       tinyint DEFAULT 0 NOT NULL,
       cust_data_in_cdr     tinyint DEFAULT 0 NOT NULL,
       receiv_cdpn_cdr      tinyint DEFAULT 0 NOT NULL,
       call_type_in_cdr     tinyint DEFAULT 0 NOT NULL,
       in_srvdata_incdr     tinyint DEFAULT 0 NOT NULL,
       subs_iacama          tinyint DEFAULT 0 NOT NULL,
       cdr_callrelside      tinyint DEFAULT 0 NOT NULL,
       cdr_freeformdata     tinyint DEFAULT 0 NOT NULL,
       cdr_receivedcgpn     tinyint DEFAULT 0 NOT NULL,
       fph_cdpn_nronly      tinyint DEFAULT 0 NOT NULL,
       rempps_ctx_cdpn      tinyint DEFAULT 0 NOT NULL,
       gcr_txt_format       tinyint DEFAULT 0 NOT NULL,
       rempps_noresp_act    tinyint DEFAULT 0 NOT NULL,
       dur_in_txtcdr        tinyint DEFAULT 0 NOT NULL,
       cpu_crg              integer DEFAULT 0 NOT NULL,
       termroam_tardir      smallint DEFAULT '-1' NOT NULL,
       fmc_crg              integer DEFAULT 0 NOT NULL,
       uri_in_cdr           tinyint DEFAULT 1 NOT NULL,
       trnkrdcall_tardir    smallint DEFAULT '-1' NOT NULL,
       acct_fail_req        tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE asio_param (
       nodeid               integer NOT NULL,
       asio_variant         smallint NOT NULL,
       timer_pstn_t1        smallint NOT NULL,
       timer_pstn_t2        smallint NOT NULL,
       timer_pstn_t3        smallint NOT NULL,
       timer_pstn_tr        smallint NOT NULL,
       timer_pstn_tt        smallint NOT NULL,
       noise_filter         smallint NOT NULL,
       pstn_call_prio       smallint NOT NULL,
       pstn_diag_mode       smallint NOT NULL,
       PRIMARY KEY (nodeid, asio_variant)
);



CREATE TABLE televoting (
       nodeid               integer NOT NULL,
       vot_id               smallint NOT NULL,
       vot_name             char(60) NOT NULL,
       PRIMARY KEY (nodeid, vot_id)
);



CREATE TABLE televoting_item (
       nodeid               integer NOT NULL,
       vot_id               smallint NOT NULL,
       vot_nr               char(3) NOT NULL,
       vot_nr_name          char(60) NOT NULL,
       PRIMARY KEY (nodeid, vot_id, vot_nr),
       FOREIGN KEY (nodeid, vot_id)
                             REFERENCES televoting
);



CREATE TABLE tsf_settings (
       nodeid               integer NOT NULL,
       tsf_settings_id      smallint NOT NULL,
       ftp_settings         char(32),
       PRIMARY KEY (nodeid, tsf_settings_id)
);



CREATE TABLE tsf_queue (
       nodeid               integer NOT NULL,
       tsf_queue_id         smallint NOT NULL,
       queue_prio           smallint,
       PRIMARY KEY (nodeid, tsf_queue_id)
);



CREATE TABLE tsf_destination (
       nodeid               integer NOT NULL,
       tsf_dst_id           smallint NOT NULL,
       ftp_hostname         char(32) NOT NULL,
       ftp_user             char(32) NOT NULL,
       password             char(32) NOT NULL,
       dst_dir_name         char(64) NOT NULL,
       tmp_dir_name         char(64),
       PRIMARY KEY (nodeid, tsf_dst_id)
);



CREATE TABLE tsf_dyn_library (
       nodeid               integer NOT NULL,
       tsf_dyn_lib_id       smallint NOT NULL,
       dll_name             char(64) NOT NULL,
       dll_desc             char(30),
       dll_arg1             char(32),
       dll_arg2             char(32),
       dll_arg3             char(32),
       dll_arg4             char(32),
       dll_arg5             char(32),
       dll_arg6             char(32),
       dll_arg7             char(32),
       dll_arg8             char(32),
       dll_arg9             char(32),
       dll_arg10            char(32) DEFAULT NULL,
       dll_arg11            char(32) DEFAULT NULL,
       dll_arg12            char(32) DEFAULT NULL,
       dll_arg13            char(32) DEFAULT NULL,
       dll_arg14            char(32) DEFAULT NULL,
       dll_arg15            char(32) DEFAULT NULL,
       PRIMARY KEY (nodeid, tsf_dyn_lib_id)
);



CREATE TABLE tsf_mediation (
       nodeid               integer NOT NULL,
       tsf_mediation_id     smallint NOT NULL,
       mediation_desc       char(30),
       tsf_dyn_lib_id       smallint NOT NULL,
       PRIMARY KEY (nodeid, tsf_mediation_id),
       FOREIGN KEY (nodeid, tsf_dyn_lib_id)
                             REFERENCES tsf_dyn_library
);



CREATE TABLE tsf_data (
       nodeid               integer NOT NULL,
       tsf_id               smallint NOT NULL,
       src_file_name        char(32) NOT NULL,
       src_dir_name         char(64) NOT NULL,
       dst_dir_name         char(64) NOT NULL,
       name_schema          char(64),
       ne_side              smallint,
       tsf_dyn_lib_id       smallint,
       tsf_mediation_id     smallint,
       tsf_queue_id         smallint,
       tsf_settings_id      smallint,
       tsf_dst_id           smallint,
       tsf_data_group_id    smallint NOT NULL,
       PRIMARY KEY (nodeid, tsf_id),
       FOREIGN KEY (nodeid, tsf_dyn_lib_id)
                             REFERENCES tsf_dyn_library,
       FOREIGN KEY (nodeid, tsf_mediation_id)
                             REFERENCES tsf_mediation,
       FOREIGN KEY (nodeid, tsf_dst_id)
                             REFERENCES tsf_destination,
       FOREIGN KEY (nodeid, tsf_queue_id)
                             REFERENCES tsf_queue,
       FOREIGN KEY (nodeid, tsf_settings_id)
                             REFERENCES tsf_settings,
       FOREIGN KEY (nodeid, tsf_data_group_id)
                             REFERENCES tsf_data_group
);



CREATE TABLE rec_subs_cg_conv (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       numtype              smallint NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, numtype, cgpn_prefix)
);



CREATE TABLE user_domain_list (
       nodeid               integer NOT NULL,
       user_domain_name     char(50) NOT NULL,
       user_domain_type     smallint NOT NULL,
       user_domain_descr    char(50) NOT NULL,
       PRIMARY KEY (nodeid, user_domain_name, user_domain_type)
);



CREATE TABLE sip_isup_iw (
       nodeid               integer NOT NULL,
       sip_isup_iw_var      smallint NOT NULL,
       iw_var_name          char(30) NOT NULL,
       fci                  integer DEFAULT 96 NOT NULL,
       bci                  integer DEFAULT 9238 NOT NULL,
       iw_param1            integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sip_isup_iw_var)
);



CREATE UNIQUE INDEX AK1_sip_isup_iw ON sip_isup_iw
(
	nodeid                ASC,
	iw_var_name           ASC
);



CREATE TABLE sipresp_cause (
       nodeid               integer NOT NULL,
       resp_cause_var       tinyint NOT NULL,
       resp_cause_name      varchar(50) NOT NULL,
       resp_cause_basic     tinyint DEFAULT 1 NOT NULL,
       resp_allow_change    tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, resp_cause_var)
);



CREATE UNIQUE INDEX AK1_sipresp_cause ON sipresp_cause
(
	nodeid                ASC,
	resp_cause_name       ASC
);



CREATE TABLE cause_sipresp (
       nodeid               integer NOT NULL,
       cause_resp_var       tinyint NOT NULL,
       cause_resp_name      varchar(50) NOT NULL,
       cause_resp_basic     tinyint DEFAULT 1 NOT NULL,
       sip_resp_pref        tinyint DEFAULT 1 NOT NULL,
       cause_allow_change   tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cause_resp_var)
);



CREATE UNIQUE INDEX AK1_cause_sipresp ON cause_sipresp
(
	nodeid                ASC,
	cause_resp_name       ASC
);



CREATE TABLE sip_feature (
       nodeid               integer NOT NULL,
       sip_feature_id       smallint NOT NULL,
       sip_port             integer DEFAULT 5060 NOT NULL,
       transport_protocol   smallint DEFAULT 1 NOT NULL,
       own_ip_addr          char(15) NOT NULL,
       requri_mode          smallint DEFAULT 0 NOT NULL,
       extension_100rel     smallint DEFAULT 2 NOT NULL,
       tm_rtt               smallint DEFAULT 500 NOT NULL,
       tm_max_rpt_intrvl    smallint DEFAULT 4 NOT NULL,
       tm_max_rtt           smallint DEFAULT 5 NOT NULL,
       tm_wait_rpt_resp     smallint DEFAULT 32 NOT NULL,
       mpl_waitfrstresp     smallint DEFAULT 64 NOT NULL,
       mpl_waitfnlresp      smallint DEFAULT 64 NOT NULL,
       mpl_waitack          smallint DEFAULT 64 NOT NULL,
       mpl_waitrptinreq     smallint DEFAULT 64 NOT NULL,
       msg_tm_expires       smallint DEFAULT 3600 NOT NULL,
       msg_max_forwards     smallint DEFAULT 70 NOT NULL,
       msg_organization     char(30),
       msg_subject          char(40),
       msg_sw_desc          char(30),
       audio_codec_set      smallint,
       data_codec_set       smallint,
       fax_codec_set        smallint,
       video_codec_set      smallint,
       dsp_ip_feature_id    smallint NOT NULL,
       ss_threshold         smallint DEFAULT '-40' NOT NULL,
       rtcp_report          smallint DEFAULT 0 NOT NULL,
       rem_side_check       smallint DEFAULT 1 NOT NULL,
       session_expires      smallint DEFAULT 1800 NOT NULL,
       min_se               smallint DEFAULT 90 NOT NULL,
       echo_canc            smallint DEFAULT 1 NOT NULL,
       dialing_mode         smallint DEFAULT 0 NOT NULL,
       ovrlp_iw_tm_out      smallint DEFAULT 4 NOT NULL,
       ovrlp_iw_tm_inc      smallint DEFAULT 100 NOT NULL,
       sdp_exchange         smallint DEFAULT 0 NOT NULL,
       sip_param1           smallint,
       sip_param2           smallint,
       sip_param3           smallint,
       sip_param4           char(30),
       sip_param5           char(30),
       trusted_network      smallint DEFAULT 0 NOT NULL,
       simult_dtmf_relay    smallint DEFAULT 0 NOT NULL,
       sdp_to_hold          smallint DEFAULT 7 NOT NULL,
       hold_to_sdp          smallint DEFAULT 2 NOT NULL,
       tm_ringing           smallint DEFAULT 120 NOT NULL,
       sip_rstr_audio_chk   smallint DEFAULT 0 NOT NULL,
       tm_not_reachable     smallint DEFAULT 5 NOT NULL,
       tm_ovrlp_wdgt        smallint DEFAULT 15 NOT NULL,
       g729_add_attr        smallint DEFAULT 0 NOT NULL,
       sip_isup_iw_var      smallint DEFAULT 0 NOT NULL,
       iw_cause_var         smallint DEFAULT '-2' NOT NULL,
       sip_cpc_var          smallint DEFAULT 0 NOT NULL,
       local_sip_cnv_var    smallint DEFAULT 0 NOT NULL,
       sip_local_cnv_var    smallint DEFAULT 0 NOT NULL,
       compact_msg          smallint DEFAULT 0 NOT NULL,
       pubnet_acc_pfxtype   smallint DEFAULT 0 NOT NULL,
       pubnet_acc_pfx       char(5),
       xml_multiprt_body    smallint DEFAULT 0 NOT NULL,
       ctx_nr_present       smallint DEFAULT 0 NOT NULL,
       dtmf_handling        smallint DEFAULT 0 NOT NULL,
       authent_non_regist   smallint DEFAULT 0 NOT NULL,
       pubnet_rec_pfxtype   tinyint DEFAULT 0 NOT NULL,
       cause_resp_var       tinyint DEFAULT 0 NOT NULL,
       resp_cause_var       tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sip_feature_id),
       FOREIGN KEY (nodeid, dsp_ip_feature_id)
                             REFERENCES dsp_ip_feature,
       FOREIGN KEY (nodeid, sip_isup_iw_var)
                             REFERENCES sip_isup_iw,
       FOREIGN KEY (nodeid, sip_cpc_var)
                             REFERENCES sip_cpc_variant,
       FOREIGN KEY (nodeid, resp_cause_var)
                             REFERENCES sipresp_cause,
       FOREIGN KEY (nodeid, cause_resp_var)
                             REFERENCES cause_sipresp
);



CREATE TABLE sip_remote_side (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       rs_ip_addr           char(15) NOT NULL,
       rs_eth_addr          char(17),
       rs_sec_ip_addr       char(15),
       rs_sec_eth_addr      char(17),
       rs_eth_ident_mode    smallint DEFAULT 0 NOT NULL,
       sip_feature_id       smallint NOT NULL,
       tunelling_mode       smallint DEFAULT 3 NOT NULL,
       mime_isup_version    char(20) DEFAULT 0 NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       trunk_mon_period     smallint DEFAULT 3 NOT NULL,
       rs_param             smallint DEFAULT 0,
       mad_id               smallint DEFAULT 0 NOT NULL,
       rs_ip_port           integer DEFAULT 5060 NOT NULL,
       rs_trnkgrp           char(10),
       own_trnkgrp          char(10),
       rs_tg_ident_mode     tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid),
       FOREIGN KEY (nodeid, sip_feature_id)
                             REFERENCES sip_feature
);



CREATE TABLE radius_srvr_name (
       nodeid               integer NOT NULL,
       r_srvr_id            smallint NOT NULL,
       r_srvr_name          char(30) NOT NULL,
       PRIMARY KEY (nodeid, r_srvr_id)
);



CREATE UNIQUE INDEX AK1_radius_srvr_name ON radius_srvr_name
(
	nodeid                ASC,
	r_srvr_name           ASC
);



CREATE TABLE ctx_suppl_tariff (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       suppl_id             smallint NOT NULL,
       suppl_action         smallint NOT NULL,
       dst_charge_code      smallint NOT NULL,
       chsite               smallint NOT NULL,
       PRIMARY KEY (nodeid, bgid, suppl_id, suppl_action)
);



CREATE TABLE ne_srv_security (
       nodeid               integer NOT NULL,
       srv_acc_ip_addr      char(15) NOT NULL,
       srv_scrt_name        smallint NOT NULL,
       scrt_rule_action     smallint NOT NULL,
       PRIMARY KEY (nodeid, srv_acc_ip_addr, srv_scrt_name)
);



CREATE TABLE aoc_auth_conv (
       nodeid               integer NOT NULL,
       aoc_feature          smallint NOT NULL,
       aoc_protocol         smallint NOT NULL,
       aoc_auth             smallint NOT NULL,
       PRIMARY KEY (nodeid, aoc_auth)
);



CREATE UNIQUE INDEX i_aoc_auth_conv ON aoc_auth_conv
(
	nodeid                ASC,
	aoc_feature           ASC,
	aoc_protocol          ASC
);



CREATE TABLE cm_suppl (
       nodeid               integer NOT NULL,
       cm_suppl_id          smallint NOT NULL,
       cm_msgcode           smallint NOT NULL,
       cm_suppl_code        char(8) NOT NULL,
       PRIMARY KEY (nodeid, cm_suppl_id)
);



CREATE TABLE nuc_ip_data (
       nodeid               integer NOT NULL,
       nuc_id               smallint NOT NULL,
       nuc_side             smallint NOT NULL,
       tdm_rtp_id           smallint NOT NULL,
       rtp_stream_dir       smallint DEFAULT 1 NOT NULL,
       max_fax_mode_dur     smallint DEFAULT 0 NOT NULL,
       data_mode_dur        smallint DEFAULT 0 NOT NULL,
       loc_rtp_ip_addr      char(15) NOT NULL,
       loc_rtp_port         integer NOT NULL,
       rem_rtp_ip_addr      char(15) NOT NULL,
       rem_rtp_port         integer NOT NULL,
       nuc_ip_param1        integer,
       nuc_ip_param2        integer,
       net_fail_alert       smallint DEFAULT 1 NOT NULL,
       qu_alert             smallint DEFAULT 1 NOT NULL,
       recurrent_cn_audit   smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, nuc_id, nuc_side, tdm_rtp_id),
       FOREIGN KEY (nodeid, nuc_id)
                             REFERENCES nailed_up_con,
       FOREIGN KEY (nodeid, tdm_rtp_id)
                             REFERENCES tdm_rtp_profile
);



CREATE TABLE cm_hi (
       nodeid               integer NOT NULL,
       cm_hi_type           smallint NOT NULL,
       cm_link_number       smallint NOT NULL,
       cm_mc_ip_addr        char(15) NOT NULL,
       cm_conn_type         smallint DEFAULT 1 NOT NULL,
       cm_echo_ip_addr      char(15),
       cm_mc_port           integer NOT NULL,
       cm_x25_ps            smallint NOT NULL,
       PRIMARY KEY (nodeid, cm_hi_type, cm_link_number, cm_mc_ip_addr)
);



CREATE UNIQUE INDEX AK1_cm_hi ON cm_hi
(
	nodeid                ASC,
	cm_mc_ip_addr         ASC,
	cm_mc_port            ASC
);



CREATE TABLE m3ua_profile (
       nodeid               integer NOT NULL,
       m3ua_prf_id          smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       m3ua_version         smallint DEFAULT 1 NOT NULL,
       tm_tr                smallint DEFAULT 3000 NOT NULL,
       tm_hb                smallint DEFAULT 1000 NOT NULL,
       tm_ack               smallint DEFAULT 2000 NOT NULL,
       tm_paud              smallint DEFAULT 5000 NOT NULL,
       m3ua_hb              smallint DEFAULT 0 NOT NULL,
       sp_lsh_method        smallint DEFAULT 1 NOT NULL,
       stream_lsh_method    smallint DEFAULT 1 NOT NULL,
       fail_over_buff       integer DEFAULT 65535 NOT NULL,
       bundle               smallint DEFAULT 0 NOT NULL,
       associate_repeat     smallint DEFAULT '-1' NOT NULL,
       ipsp_model           smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, m3ua_prf_id)
);



CREATE UNIQUE INDEX AK1_m3ua_profile ON m3ua_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE m3ua_appl_server (
       nodeid               integer NOT NULL,
       m3ua_as_id           smallint NOT NULL,
       m3ua_side            smallint DEFAULT 1 NOT NULL,
       m3ua_type            smallint DEFAULT 1 NOT NULL,
       dpc_ss7_dstid        smallint DEFAULT '-1' NOT NULL,
       traffic_mode         smallint DEFAULT 1 NOT NULL,
       sg_traffic_mode      smallint DEFAULT 1 NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       m3ua_prf_id          smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, m3ua_as_id),
       FOREIGN KEY (nodeid, m3ua_prf_id)
                             REFERENCES m3ua_profile
);



CREATE TABLE m3ua_routing_key (
       nodeid               integer NOT NULL,
       m3ua_rk_id           smallint NOT NULL,
       ntwrk_appear         smallint DEFAULT 0 NOT NULL,
       ntwrkind             smallint DEFAULT 2 NOT NULL,
       dpc_ss7_dstid        smallint DEFAULT '-1' NOT NULL,
       opc_ss7_dstid        smallint DEFAULT '-1' NOT NULL,
       service_ind          smallint DEFAULT 5 NOT NULL,
       m3ua_as_id           smallint NOT NULL,
       PRIMARY KEY (nodeid, m3ua_rk_id),
       FOREIGN KEY (nodeid, m3ua_as_id)
                             REFERENCES m3ua_appl_server
);



CREATE TABLE node (
       nodeid               integer NOT NULL,
       node_name            char(30) NOT NULL,
       node_type            smallint NOT NULL,
       v5_node_type         smallint NOT NULL,
       keylen               smallint NOT NULL,
       cf_discon_alert      smallint NOT NULL,
       cd_present_ind       smallint NOT NULL,
       max_nr_cf            smallint NOT NULL,
       netnameomt           char(20) NOT NULL,
       ccbs_oqlen           smallint NOT NULL,
       ccbs_tqlen           smallint NOT NULL,
       dtmf_rec             smallint NOT NULL,
       r1mf_rec             smallint NOT NULL,
       r2mf_rec             smallint NOT NULL,
       ptmf_rec             smallint NOT NULL,
       sndmf_rec            smallint NOT NULL,
       aonr_rec             smallint NOT NULL,
       congacc              smallint NOT NULL,
       congdisc             smallint NOT NULL,
       congon               smallint NOT NULL,
       congoff              smallint NOT NULL,
       conrestctg           smallint NOT NULL,
       ss7_type             smallint NOT NULL,
       max_nrnuc            smallint NOT NULL,
       rexecid              smallint NOT NULL,
       inter_prefix         char(6),
       pfx_area_code        char(2),
       cgpn_presentind      smallint NOT NULL,
       mckpacktype          smallint NOT NULL,
       last_dial_code       char(1) NOT NULL,
       qsig_max_transit     smallint NOT NULL,
       rsup_pin_length      smallint NOT NULL,
       rsup_msg_length      smallint NOT NULL,
       tmprioritycall       smallint NOT NULL,
       cm_auth              smallint NOT NULL,
       csta_tcp_port        integer NOT NULL,
       restart_mtp          smallint DEFAULT 1 NOT NULL,
       nc_maxnr_exing       smallint DEFAULT 1 NOT NULL,
       nc_tm_create_next    smallint DEFAULT 500 NOT NULL,
       ap_alrpri            smallint DEFAULT 3 NOT NULL,
       max_nr_ss7           smallint DEFAULT 4 NOT NULL,
       max_nr_hdlc          smallint DEFAULT 17 NOT NULL,
       max_nr_cas           smallint DEFAULT 11 NOT NULL,
       dsystem_state        smallint DEFAULT 2 NOT NULL,
       sup_node_rn          char(25),
       ecm_tcp_port         smallint DEFAULT 13001 NOT NULL,
       up_ecm_protocol      smallint DEFAULT 1 NOT NULL,
       cug_standard         smallint DEFAULT 0 NOT NULL,
       interurban_cintp     smallint DEFAULT 0 NOT NULL,
       dsp_res_dupl         smallint DEFAULT 0 NOT NULL,
       spec_appl_data       smallint DEFAULT 0 NOT NULL,
       sec_bat_voltage      smallint DEFAULT 32 NOT NULL,
       ring_signal          smallint DEFAULT 25 NOT NULL,
       cpus_mode            smallint DEFAULT 0 NOT NULL,
       priority_call_ind    smallint DEFAULT 0 NOT NULL,
       cdpn_nrplan_trans    smallint DEFAULT 0 NOT NULL,
       max_rack_size        smallint DEFAULT 20 NOT NULL,
       ons_auth_property    smallint DEFAULT 101 NOT NULL,
       max_nr_rdrctcall     smallint DEFAULT 31 NOT NULL,
       cfx_present_auth     smallint DEFAULT 0 NOT NULL,
       h248text_encodtype   smallint DEFAULT 1 NOT NULL,
       h248_version         smallint DEFAULT 1 NOT NULL,
       pbx_prefix           char(3),
       pofl                 smallint DEFAULT NULL,
       nat_regul_auth       smallint DEFAULT NULL,
       nat_network_id       smallint DEFAULT NULL,
       network_id           bigint DEFAULT NULL,
       cbact_list_id        smallint DEFAULT 0 NOT NULL,
       prefered_unit_id     tinyint DEFAULT 1 NOT NULL,
       geo_mode             tinyint DEFAULT 0 NOT NULL,
       geoswtch_timeout     tinyint DEFAULT 5 NOT NULL,
       max_mon_user         integer DEFAULT 1000 NOT NULL,
       ss7_migrate_phase    tinyint DEFAULT 0 NOT NULL,
       sctp_impl_type       tinyint DEFAULT 0 NOT NULL,
       cbact_call_rej       tinyint DEFAULT 0 NOT NULL,
       sldr_mode            tinyint DEFAULT 0 NOT NULL,
       li_prefix_act        tinyint DEFAULT 0 NOT NULL,
       pref_eth_port_id     smallint DEFAULT 0 NOT NULL,
       fmc_crosspath        tinyint DEFAULT 0 NOT NULL,
       fmc_mobile_acc       tinyint DEFAULT 0 NOT NULL,
       fmc_universal_dialing tinyint DEFAULT 0 NOT NULL,
       gruu_mode            tinyint DEFAULT 0 NOT NULL,
       cf_ann_req           tinyint DEFAULT 0 NOT NULL,
       sn_display_mode      tinyint DEFAULT 0 NOT NULL,
       extended_numbering   tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE phy_log_stat_group (
       nodeid               integer NOT NULL,
       stat_group_id        smallint NOT NULL,
       log_stat_group_id    smallint NOT NULL,
       PRIMARY KEY (nodeid, stat_group_id, log_stat_group_id)
);



CREATE TABLE trunk_cdpn (
       nodeid               integer NOT NULL,
       trunkid              integer NOT NULL,
       cdp_numtype          smallint NOT NULL,
       cdnr                 char(25) NOT NULL,
       newcdp_numtype       smallint NOT NULL,
       PRIMARY KEY (nodeid, trunkid, cdp_numtype),
       FOREIGN KEY (nodeid, trunkid)
                             REFERENCES trunk
);



CREATE TABLE start_execution (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       sigtrace_state       smallint NOT NULL,
       call_gap_state       smallint NOT NULL,
       seizure_cnt_time     smallint DEFAULT 107 NOT NULL,
       seizure_cnt_period   smallint DEFAULT 0 NOT NULL,
       crcg_state           tinyint DEFAULT 0 NOT NULL,
       crcb_state           tinyint DEFAULT 0 NOT NULL,
       crr_state            tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE global_stst_data (
       nodeid               integer NOT NULL,
       traffic_scan         smallint NOT NULL,
       statistics_period    smallint DEFAULT 15 NOT NULL,
       subs_ststcdr_act     smallint DEFAULT 0 NOT NULL,
       trnkgrp_ststcdr      smallint DEFAULT 0 NOT NULL,
       ioc_origstst_act     smallint DEFAULT 0 NOT NULL,
       stst_reserve1        integer DEFAULT 0 NOT NULL,
       stst_reserve2        integer DEFAULT 0 NOT NULL,
       stst_reserve3        integer DEFAULT 0 NOT NULL,
       tgrec_act            tinyint DEFAULT 0 NOT NULL,
       tgrec_tgrecmode      tinyint DEFAULT 0 NOT NULL,
       tgrec_tgdatareq      tinyint DEFAULT 3 NOT NULL,
       tgrec_nodemode       tinyint DEFAULT 1 NOT NULL,
       names_in_hist_file   tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE indebt_sub_mn (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       ctgioc               smallint NOT NULL,
       feature_set_id       smallint,
       PRIMARY KEY (nodeid, dn, basic_id),
       FOREIGN KEY (nodeid, dn, basic_id)
                             REFERENCES subscriber
);



CREATE TABLE announcement_var (
       nodeid               integer NOT NULL,
       ann_id               smallint NOT NULL,
       ann_variant          smallint NOT NULL,
       ann_type             smallint DEFAULT 1 NOT NULL,
       ann_virt_cgpn        integer,
       ann_cdpn             char(20),
       vxml_id              integer NOT NULL,
       PRIMARY KEY (nodeid, ann_id, ann_variant)
);



CREATE TABLE prototype_subscr (
       nodeid               integer NOT NULL,
       prototype_id         smallint NOT NULL,
       add_subscriber       smallint DEFAULT 0 NOT NULL,
       basic_id             smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       pswdkey              char(4) NOT NULL,
       cfu_act              smallint NOT NULL,
       cfb_act              smallint NOT NULL,
       cfnr_act             smallint NOT NULL,
       cbsc_act             smallint NOT NULL,
       cbsc_barrclass       smallint NOT NULL,
       hoti_act             smallint NOT NULL,
       hotd_act             smallint NOT NULL,
       dnd_act              smallint NOT NULL,
       campp_act            smallint NOT NULL,
       cw_act               smallint NOT NULL,
       lh_group_id          integer NOT NULL,
       lh_act               smallint NOT NULL,
       ctgioc               smallint NOT NULL,
       cfut_act             smallint NOT NULL,
       cpup_act             smallint NOT NULL,
       cpug_group_id        integer,
       org_charge_code      smallint NOT NULL,
       crg_class            smallint DEFAULT 0 NOT NULL,
       cug_auth             smallint NOT NULL,
       pcug                 smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       access_group_id      smallint NOT NULL,
       feature_set_id       smallint NOT NULL,
       cgid                 smallint DEFAULT 0 NOT NULL,
       ctx_intercom         integer,
       cfxd_act             smallint DEFAULT 0 NOT NULL,
       cid1                 smallint NOT NULL,
       cid2                 smallint NOT NULL,
       routing_group        smallint DEFAULT 0 NOT NULL,
       prng_group_id        integer NOT NULL,
       prng_act             smallint NOT NULL,
       tw_act               smallint DEFAULT 0 NOT NULL,
       mwi_act              smallint DEFAULT 0 NOT NULL,
       ar_act               smallint DEFAULT 0 NOT NULL,
       acr_act              smallint DEFAULT 0 NOT NULL,
       fcr_act              smallint DEFAULT 0 NOT NULL,
       clir_act             smallint DEFAULT 0 NOT NULL,
       ute_act              smallint DEFAULT 0 NOT NULL,
       sr_act               smallint DEFAULT 0 NOT NULL,
       cfnrc_act            smallint DEFAULT 0 NOT NULL,
       outsrv_id            smallint DEFAULT 0 NOT NULL,
       ann_ring             smallint DEFAULT 0 NOT NULL,
       ann_hold             smallint DEFAULT 0 NOT NULL,
       ann_param1           integer,
       srv_act1             smallint DEFAULT 0 NOT NULL,
       srv_act2             smallint DEFAULT 0 NOT NULL,
       srv_act3             smallint DEFAULT 0 NOT NULL,
       ims_user_prfid       integer DEFAULT 0 NOT NULL,
       reg_status           smallint,
       implicit_grp         integer,
       notify_grp           integer DEFAULT 0 NOT NULL,
       barring_ind          smallint,
       rcc_act              tinyint DEFAULT 0 NOT NULL,
       bsns_user_group_id   integer DEFAULT 0 NOT NULL,
       suppl_sts_act        tinyint DEFAULT 0 NOT NULL,
       uicct_act            tinyint DEFAULT 0 NOT NULL,
       uiccpp_act           tinyint DEFAULT 0 NOT NULL,
       ggrphc_area_id       smallint DEFAULT 0 NOT NULL,
       cat_act              smallint DEFAULT 0 NOT NULL,
       cat_auth             integer DEFAULT 0 NOT NULL,
       fa_group_id          integer DEFAULT 0 NOT NULL,
       fa_act               tinyint DEFAULT 0 NOT NULL,
       subsl_type           smallint DEFAULT '-1' NOT NULL,
       cbex_barrclass       smallint DEFAULT 0 NOT NULL,
       dndgm_act            tinyint DEFAULT 0 NOT NULL,
       subscr_type          smallint DEFAULT '-1' NOT NULL,
       present_subsnr       char(15) DEFAULT NULL,
       present_numtype      tinyint DEFAULT 4 NOT NULL,
       present_ctx_subsnr   char(15) DEFAULT NULL,
       tap_act              tinyint DEFAULT 0 NOT NULL,
       nplan_id             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, prototype_id)
);



CREATE TABLE rmt_common_data (
       nodeid               integer NOT NULL,
       service_mode         smallint NOT NULL,
       def_language_code    smallint NOT NULL,
       authent_mode         smallint NOT NULL,
       eos_mode             smallint NOT NULL,
       pin_length           smallint NOT NULL,
       max_pin_attempts     smallint NOT NULL,
       pin_encrypt          smallint NOT NULL,
       break_code           char(3) NOT NULL,
       eos_code             char(3) NOT NULL,
       rr_code              char(1) NOT NULL,
       cb_request_mode      smallint NOT NULL,
       cfx_allowed          smallint NOT NULL,
       tmwdtmf              smallint DEFAULT 3 NOT NULL,
       tmwdigit             smallint NOT NULL,
       tmwdialing           smallint NOT NULL,
       tmscandtmf           smallint DEFAULT 200 NOT NULL,
       tmdelaydtmf          smallint DEFAULT 0 NOT NULL,
       tmautoreleasedtmf    smallint DEFAULT 0 NOT NULL,
       tmwalert             smallint NOT NULL,
       tmignoredtmf         smallint NOT NULL,
       tmwcbreq             smallint NOT NULL,
       prototype_id         smallint NOT NULL,
       custcarecall         smallint NOT NULL,
       cgpn_display_mode    smallint DEFAULT 0 NOT NULL,
       signal_flow          smallint DEFAULT 0 NOT NULL,
       inband_ind_type      smallint DEFAULT 1 NOT NULL,
       rmt_common_param1    smallint DEFAULT 0 NOT NULL,
       rmt_common_param2    smallint DEFAULT 0 NOT NULL,
       rmt_common_param3    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, service_mode),
       FOREIGN KEY (nodeid, prototype_id)
                             REFERENCES prototype_subscr
);



CREATE TABLE v5_interface_var (
       nodeid               integer NOT NULL,
       v5_interface_index   smallint NOT NULL,
       v5_variant_id        smallint NOT NULL,
       v5_regular_var       smallint NOT NULL,
       PRIMARY KEY (nodeid, v5_interface_index, v5_variant_id)
);



CREATE TABLE v5_link (
       nodeid               integer NOT NULL,
       v5_interface_index   smallint NOT NULL,
       v5_variant_id        smallint NOT NULL,
       portnr               smallint NOT NULL,
       v5_link_id           smallint NOT NULL,
       v5ua_sys_intf_id     integer,
       PRIMARY KEY (nodeid, v5_interface_index, v5_variant_id, portnr, v5_link_id),
       FOREIGN KEY (nodeid, v5_interface_index, v5_variant_id)
                             REFERENCES v5_interface_var
);



CREATE TABLE physical_com_ch (
       nodeid               integer NOT NULL,
       v5_interface_index   smallint NOT NULL,
       v5_variant_id        smallint NOT NULL,
       portnr               smallint NOT NULL,
       v5_com_time_slot     smallint NOT NULL,
       cda_id               smallint NOT NULL,
       phys_com_ch_type     smallint NOT NULL,
       v5_link_id           smallint NOT NULL,
       PRIMARY KEY (nodeid, v5_interface_index, v5_variant_id, portnr, v5_com_time_slot, v5_link_id),
       FOREIGN KEY (nodeid, v5_interface_index, v5_variant_id, portnr, v5_link_id)
                             REFERENCES v5_link
);



CREATE TABLE logical_com_ch (
       nodeid               integer NOT NULL,
       v5_interface_index   smallint NOT NULL,
       v5_variant_id        smallint NOT NULL,
       log_com_ch_id        integer NOT NULL,
       log_com_ch_type      smallint NOT NULL,
       portnr               smallint NOT NULL,
       v5_com_time_slot     smallint NOT NULL,
       v5_link_id           smallint DEFAULT 256 NOT NULL,
       PRIMARY KEY (nodeid, v5_interface_index, v5_variant_id, log_com_ch_id),
       FOREIGN KEY (nodeid, v5_interface_index, v5_variant_id, portnr, v5_com_time_slot, v5_link_id)
                             REFERENCES physical_com_ch
);



CREATE TABLE orig_call_barring (
       nodeid               integer NOT NULL,
       barrpfx              char(20) NOT NULL,
       barrclass            smallint NOT NULL,
       PRIMARY KEY (nodeid, barrpfx, barrclass)
);



CREATE TABLE cbno2tardir_trans (
       nodeid               integer NOT NULL,
       charge_band_number   smallint NOT NULL,
       tariff_dir           smallint NOT NULL,
       PRIMARY KEY (nodeid, charge_band_number)
);



CREATE TABLE mmc_data (
       nodeid               integer NOT NULL,
       mmc_dn               integer NOT NULL,
       mmc_owner_dn         char(25),
       mmc_max_user         smallint NOT NULL,
       wait_start           smallint NOT NULL,
       time_to_end          smallint NOT NULL,
       start_time           smallint NOT NULL,
       start_date           integer NOT NULL,
       end_time             smallint NOT NULL,
       end_date             integer NOT NULL,
       PRIMARY KEY (nodeid, mmc_dn)
);



CREATE TABLE cm_port (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       cm_link_number       smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr)
);



CREATE TABLE alarm (
       nodeid               integer NOT NULL,
       alrpri               smallint NOT NULL,
       alrcnt               smallint NOT NULL,
       PRIMARY KEY (nodeid, alrpri)
);



CREATE TABLE trunk_monitoring (
       nodeid               integer NOT NULL,
       monitoring_dn        integer NOT NULL,
       trunkid              integer NOT NULL,
       ming_term_type       smallint DEFAULT 0 NOT NULL,
       monitored_present    char(25) NOT NULL,
       PRIMARY KEY (nodeid, monitoring_dn, trunkid),
       FOREIGN KEY (nodeid, trunkid)
                             REFERENCES trunk
);



CREATE TABLE incom_carr_data (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       cac_dial_auth        smallint NOT NULL,
       cid1                 smallint NOT NULL,
       cid2                 smallint NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid),
       FOREIGN KEY (nodeid, trnkgrpid)
                             REFERENCES trunk_group
);



CREATE TABLE iua_intf_profile (
       nodeid               integer NOT NULL,
       iua_intf_prf_id      smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       iid_type             smallint DEFAULT 0 NOT NULL,
       iua_access_stat      smallint DEFAULT 1 NOT NULL,
       iua_hb               smallint DEFAULT 0 NOT NULL,
       prot_ver             smallint DEFAULT 1 NOT NULL,
       tm_up_init           smallint NOT NULL,
       tm_up                smallint NOT NULL,
       nr_up_try            smallint NOT NULL,
       tm_down_init         smallint NOT NULL,
       tm_down              smallint NOT NULL,
       nr_down_try          smallint NOT NULL,
       tm_hb                smallint NOT NULL,
       context              smallint NOT NULL,
       chunk_lifetime       smallint DEFAULT 0 NOT NULL,
       delivery             smallint DEFAULT 0 NOT NULL,
       bundle               smallint DEFAULT 0 NOT NULL,
       tm_assocest          smallint DEFAULT 2 NOT NULL,
       tm_as_status         smallint DEFAULT 10 NOT NULL,
       tm_asp_status        smallint DEFAULT 10 NOT NULL,
       tm_resend            smallint DEFAULT 2000 NOT NULL,
       asp_resend           smallint DEFAULT 3 NOT NULL,
       tm_protectest        smallint DEFAULT 10 NOT NULL,
       tm_gnif_lifetime     smallint DEFAULT 7 NOT NULL,
       tm_failover          smallint DEFAULT 3 NOT NULL,
       asp_id_send          smallint DEFAULT 1 NOT NULL,
       mt_tei_queryreq      smallint DEFAULT 8 NOT NULL,
       PRIMARY KEY (nodeid, iua_intf_prf_id)
);



CREATE UNIQUE INDEX AK1_iua_intf_profile ON iua_intf_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE iua_appl_server (
       nodeid               integer NOT NULL,
       as_id                smallint NOT NULL,
       iua_side             smallint DEFAULT 2 NOT NULL,
       as_state             smallint DEFAULT 2 NOT NULL,
       traffic_mode         smallint DEFAULT 0 NOT NULL,
       tm_recov             smallint NOT NULL,
       tm_activate          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, as_id)
);



CREATE TABLE iua_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       as_id                smallint NOT NULL,
       asp_id               integer NOT NULL,
       init_state           smallint DEFAULT 2 NOT NULL,
       iua_assoc_repeat     smallint DEFAULT '-1' NOT NULL,
       sigtrace_req         smallint NOT NULL,
       iua_intf_prf_id      smallint NOT NULL,
       log_stat_group_id    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id),
       FOREIGN KEY (nodeid, iua_intf_prf_id)
                             REFERENCES iua_intf_profile,
       FOREIGN KEY (nodeid, as_id)
                             REFERENCES iua_appl_server
);



CREATE TABLE iua_access (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       iua_access_id        integer NOT NULL,
       iua_access_text_id   char(32) NOT NULL,
       access_equipped      smallint NOT NULL,
       access_block         smallint NOT NULL,
       access_state         smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES iua_interface
);



CREATE UNIQUE INDEX AK1_iua_access ON iua_access
(
	nodeid                ASC,
	sys_intf_id           ASC,
	iua_access_id         ASC
);



CREATE UNIQUE INDEX AK2_iua_access ON iua_access
(
	nodeid                ASC,
	sys_intf_id           ASC,
	iua_access_text_id    ASC
);



CREATE TABLE axm_cg_params (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       scen_id              smallint NOT NULL,
       scen_freq            smallint NOT NULL,
       num_act_rows         smallint NOT NULL,
       low_call_dur         smallint NOT NULL,
       high_call_dur        smallint NOT NULL,
       call_dur1            smallint NOT NULL,
       call_dur2            smallint NOT NULL,
       low_inter_d_pause    smallint NOT NULL,
       high_inter_d_pause   smallint NOT NULL,
       inter_d_pause1       smallint NOT NULL,
       inter_d_pause2       smallint NOT NULL,
       low_ring_dur         smallint NOT NULL,
       high_ring_dur        smallint NOT NULL,
       ring_dur1            smallint NOT NULL,
       ring_dur2            smallint NOT NULL,
       low_answ_dur         smallint NOT NULL,
       high_answ_dur        smallint NOT NULL,
       answ_dur1            smallint NOT NULL,
       answ_dur2            smallint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, scen_id)
);



CREATE TABLE axm_cg_results (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       scen_id              smallint NOT NULL,
       start_date           integer NOT NULL,
       start_time           smallint NOT NULL,
       lcon_date            integer NOT NULL,
       lcon_time            smallint NOT NULL,
       lsuc_date            integer NOT NULL,
       lsuc_time            smallint NOT NULL,
       no_out_calls         integer NOT NULL,
       no_succ_dials        integer NOT NULL,
       no_inc_calls         integer NOT NULL,
       no_acc_calls         integer NOT NULL,
       genstate             char(31) NOT NULL,
       PRIMARY KEY (nodeid, modulenr, scen_id),
       FOREIGN KEY (nodeid, modulenr, scen_id)
                             REFERENCES axm_cg_params
);



CREATE TABLE incom_prefix (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       length_dial_num      smallint NOT NULL,
       seizure_type         smallint NOT NULL,
       inprefix             char(15) NOT NULL,
       cdp_numtype          smallint DEFAULT '-1' NOT NULL,
       dicon                char(25) NOT NULL,
       new_seizure_type     smallint NOT NULL,
       newcdp_numtype       smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, length_dial_num, trnkgrpid, inprefix, seizure_type, cdp_numtype),
       FOREIGN KEY (nodeid, trnkgrpid)
                             REFERENCES trunk_group
);



CREATE TABLE ctg_profile (
       nodeid               integer NOT NULL,
       subsctg              smallint NOT NULL,
       substype             smallint NOT NULL,
       call_prio            smallint NOT NULL,
       cbac_barrclass       smallint,
       ctg_cint_auth        smallint NOT NULL,
       crg_type             smallint NOT NULL,
       crg_pulse            smallint NOT NULL,
       fastbill_auth        smallint NOT NULL,
       ctg_ct_auth          smallint NOT NULL,
       cintp_auth           smallint NOT NULL,
       ctg_reserve          smallint NOT NULL,
       PRIMARY KEY (nodeid, subsctg)
);



CREATE TABLE mn_ss7_destination (
       nodeid               integer NOT NULL,
       ss7_dstid            smallint NOT NULL,
       ss7_dst_name         char(32) NOT NULL,
       PRIMARY KEY (nodeid, ss7_dstid)
);



CREATE TABLE ecm_channel (
       nodeid               integer NOT NULL,
       sub_nodeid           smallint NOT NULL,
       ecm_link_id          smallint NOT NULL,
       ci                   smallint NOT NULL,
       PRIMARY KEY (nodeid, sub_nodeid, ecm_link_id, ci)
);



CREATE TABLE channel_tariff (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ci                   smallint NOT NULL,
       charged_number       integer NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, ci)
);



CREATE TABLE vot_orders (
       nodeid               integer NOT NULL,
       vot_id               smallint NOT NULL,
       vot_item_id          smallint NOT NULL,
       start_date           integer,
       start_time           smallint,
       end_date             integer,
       end_time             smallint,
       PRIMARY KEY (nodeid, vot_id, vot_item_id),
       FOREIGN KEY (nodeid, vot_id)
                             REFERENCES vot_data
);



CREATE TABLE asm_interface (
       nodeid               integer NOT NULL,
       portnr               smallint NOT NULL,
       axm_modulenr         smallint NOT NULL,
       tmcctrlto2           integer NOT NULL,
       portcorrection       integer NOT NULL,
       axm_meter_pulse      smallint DEFAULT 2 NOT NULL,
       axm_periphery        smallint DEFAULT 15 NOT NULL,
       axm_ltu              smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, portnr)
);



CREATE TABLE call_gap (
       nodeid               integer NOT NULL,
       dstpfx               char(20) NOT NULL,
       call_gap_interval    integer DEFAULT 500 NOT NULL,
       PRIMARY KEY (nodeid, dstpfx)
);



CREATE TABLE reg_sig_level (
       nodeid               integer NOT NULL,
       regsigtype           smallint NOT NULL,
       first_mf_level       smallint NOT NULL,
       scnd_mf_level        smallint NOT NULL,
       PRIMARY KEY (nodeid, regsigtype)
);



CREATE TABLE mn_route (
       nodeid               integer NOT NULL,
       routeid              smallint NOT NULL,
       route_name           char(32) NOT NULL,
       PRIMARY KEY (nodeid, routeid)
);



CREATE UNIQUE INDEX AK1_mn_route ON mn_route
(
	nodeid                ASC,
	route_name            ASC
);



CREATE TABLE cda (
       nodeid               integer NOT NULL,
       cda_id               smallint NOT NULL,
       cdaequp              smallint NOT NULL,
       oosi                 smallint NOT NULL,
       PRIMARY KEY (nodeid, cda_id)
);



CREATE TABLE axm_cg_scenario (
       nodeid               integer NOT NULL,
       scen_id              smallint NOT NULL,
       str_id               smallint NOT NULL,
       cg_port              smallint NOT NULL,
       cg_mode              smallint NOT NULL,
       cd_port              smallint NOT NULL,
       cd_mode              smallint NOT NULL,
       dial_num             char(24),
       PRIMARY KEY (nodeid, scen_id, str_id)
);



CREATE TABLE destination_out (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       outgoing_dsttype     smallint NOT NULL,
       critype1             smallint NOT NULL,
       critype2             smallint NOT NULL,
       tm_wait_answer       smallint NOT NULL,
       carrier_req          smallint NOT NULL,
       critype3             smallint DEFAULT 0 NOT NULL,
       critype4             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dstid)
);



CREATE TABLE path (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       cid                  smallint NOT NULL,
       time_crivalue        smallint NOT NULL,
       critype1             smallint NOT NULL,
       crivalue1            smallint NOT NULL,
       critype2             smallint NOT NULL,
       crivalue2            smallint NOT NULL,
       routeptr             smallint DEFAULT '-1' NOT NULL,
       critype3             smallint DEFAULT 0 NOT NULL,
       crivalue3            smallint DEFAULT 0 NOT NULL,
       critype4             smallint DEFAULT 0 NOT NULL,
       crivalue4            smallint DEFAULT 0 NOT NULL,
       cr_grp_id            smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dstid, cid, time_crivalue, critype1, crivalue1, critype2, crivalue2),
       FOREIGN KEY (nodeid, dstid)
                             REFERENCES destination_out
);



CREATE TABLE current_tariff (
       nodeid               integer NOT NULL,
       tariff_id            smallint NOT NULL,
       tariff_rate          smallint NOT NULL,
       exp_date             smallint NOT NULL,
       exp_time             smallint NOT NULL,
       PRIMARY KEY (nodeid, tariff_id),
       FOREIGN KEY (nodeid, tariff_id)
                             REFERENCES tariff
);



CREATE TABLE ioc_cause (
       nodeid               integer NOT NULL,
       causenr              smallint NOT NULL,
       ctgioc               smallint NOT NULL,
       PRIMARY KEY (nodeid, causenr)
);



CREATE TABLE mn_scr_list (
       nodeid               integer NOT NULL,
       scr_list_id          integer NOT NULL,
       scr_list_name        WCHAR(32) NOT NULL,
       suppl_id             smallint NOT NULL,
       PRIMARY KEY (nodeid, scr_list_id)
);



CREATE UNIQUE INDEX AK1_mn_scr_list ON mn_scr_list
(
	nodeid                ASC,
	scr_list_name         ASC,
	suppl_id              ASC
);



CREATE TABLE mn_scr_list_item (
       nodeid               integer NOT NULL,
       scr_list_id          integer NOT NULL,
       cgpn_prefix          char(20) NOT NULL,
       dstdn                char(25),
       cgpn_length          smallint DEFAULT 0 NOT NULL,
       length_mode          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, scr_list_id, cgpn_prefix),
       FOREIGN KEY (nodeid, scr_list_id)
                             REFERENCES mn_scr_list
);



CREATE TABLE subsctg_to_carrier (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       national_subsctg     smallint NOT NULL,
       cid                  smallint DEFAULT 0 NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid, national_subsctg)
);



CREATE TABLE suppl_sts (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       suppl_id             smallint NOT NULL,
       dstdn                char(25),
       PRIMARY KEY (nodeid, dn, suppl_id)
);



CREATE TABLE protocol_qos (
       nodeid               integer NOT NULL,
       protocol_type        tinyint NOT NULL,
       dscp                 tinyint DEFAULT 26 NOT NULL,
       PRIMARY KEY (nodeid, protocol_type)
);



CREATE TABLE cm_pfx_cdpn_dicon (
       nodeid               integer NOT NULL,
       cm_cdpn_pfx          char(20) NOT NULL,
       numtype              smallint NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, cm_cdpn_pfx, numtype)
);



CREATE TABLE mn_pdconf_data (
       nodeid               integer NOT NULL,
       pdcnf_listid         smallint NOT NULL,
       pdcnf_name           char(32) NOT NULL,
       PRIMARY KEY (nodeid, pdcnf_listid)
);



CREATE UNIQUE INDEX AK1_mn_pdconf_data ON mn_pdconf_data
(
	nodeid                ASC,
	pdcnf_name            ASC
);



CREATE TABLE mn_mlpp_data (
       nodeid               integer NOT NULL,
       mlpp_common_id       smallint NOT NULL,
       mlpp_common_name     char(32) NOT NULL,
       PRIMARY KEY (nodeid, mlpp_common_id)
);



CREATE UNIQUE INDEX AK1_mn_mlpp_data ON mn_mlpp_data
(
	nodeid                ASC,
	mlpp_common_name      ASC
);



CREATE TABLE ss7ap_plmn (
       nodeid               integer NOT NULL,
       nr_type              tinyint NOT NULL,
       nr_mask              varchar(25) NOT NULL,
       plmn_id              smallint NOT NULL,
       PRIMARY KEY (nodeid, nr_type, nr_mask)
);



CREATE TABLE holiday_calendar (
       nodeid               integer NOT NULL,
       time_group           smallint NOT NULL,
       hdate                integer NOT NULL,
       hdayctg              smallint NOT NULL,
       PRIMARY KEY (nodeid, time_group, hdate)
);



CREATE TABLE subs_dn_alias_conv (
       nodeid               integer NOT NULL,
       subs_alias           char(50) NOT NULL,
       user_domain_name     char(50) NOT NULL,
       alias_type           smallint NOT NULL,
       dn                   integer NOT NULL,
       reg_position         tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, subs_alias, user_domain_name)
);



CREATE INDEX IE1_subs_dn_alias_conv ON subs_dn_alias_conv
(
	nodeid                ASC,
	dn                    ASC
);



CREATE TABLE board (
       nodeid               integer NOT NULL,
       boardnr              smallint NOT NULL,
       parent_boardnr       smallint,
       board_pos            smallint NOT NULL,
       board_type           smallint NOT NULL,
       board_equip          smallint NOT NULL,
       board_oosi           smallint NOT NULL,
       req_board_id         char(12) NOT NULL,
       act_board_id         char(12),
       board_serialnr       char(14),
       board_dsc            char(32),
       board_profile_type   smallint,
       board_profile_id     smallint,
       s_node               tinyint DEFAULT 0 NOT NULL,
       geosys_unit_id       tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, boardnr)
);



CREATE TABLE port (
       nodeid               integer NOT NULL,
       portnr               smallint NOT NULL,
       port_id              smallint NOT NULL,
       boardnr              smallint NOT NULL,
       port_equip           smallint NOT NULL,
       port_oosi            smallint NOT NULL,
       sigtrace_req         smallint DEFAULT 0 NOT NULL,
       port_mlb             smallint NOT NULL,
       log_stat_group_id    smallint NOT NULL,
       port_profile_type    smallint NOT NULL,
       port_profile_id      smallint NOT NULL,
       port_sys_name        char(32) NOT NULL,
       PRIMARY KEY (nodeid, portnr),
       FOREIGN KEY (nodeid, boardnr)
                             REFERENCES board
);



CREATE TABLE m3ua_asp (
       nodeid               integer NOT NULL,
       m3ua_asp_id          smallint NOT NULL,
       dpc_ss7_dstid        smallint DEFAULT '-1' NOT NULL,
       m3ua_register_mode   smallint DEFAULT 2 NOT NULL,
       PRIMARY KEY (nodeid, m3ua_asp_id)
);



CREATE TABLE m3ua_as_assoc (
       nodeid               integer NOT NULL,
       m3ua_as_assoc_id     smallint NOT NULL,
       m3ua_as_id           smallint NOT NULL,
       m3ua_asp_id          smallint NOT NULL,
       sys_intf_id          integer NOT NULL,
       m3ua_traffic_prio    smallint DEFAULT 1 NOT NULL,
       sg_traffic_prio      smallint DEFAULT 1 NOT NULL,
       m3ua_rc              smallint DEFAULT '-1' NOT NULL,
       sigtrace_req         smallint NOT NULL,
       log_stat_group_id    smallint DEFAULT 0 NOT NULL,
       ss7_linksetid        smallint,
       PRIMARY KEY (nodeid, m3ua_as_assoc_id),
       FOREIGN KEY (nodeid, m3ua_as_id)
                             REFERENCES m3ua_appl_server,
       FOREIGN KEY (nodeid, m3ua_asp_id)
                             REFERENCES m3ua_asp,
       FOREIGN KEY (nodeid, ss7_linksetid)
                             REFERENCES ss7_link_set
);



CREATE TABLE cause_conv (
       nodeid               integer NOT NULL,
       cause_eventid        smallint NOT NULL,
       cause_convid         smallint NOT NULL,
       causenr              smallint NOT NULL,
       new_causenr          smallint NOT NULL,
       cause_reserve        smallint NOT NULL,
       PRIMARY KEY (nodeid, cause_eventid, cause_convid)
);



CREATE TABLE instruction_data (
       nodeid               integer NOT NULL,
       access_variant       smallint NOT NULL,
       instruction0         smallint NOT NULL,
       ntfval0              smallint NOT NULL,
       timerid0             smallint NOT NULL,
       instruction1         smallint NOT NULL,
       ntfval1              smallint NOT NULL,
       timerid1             smallint NOT NULL,
       instruction2         smallint NOT NULL,
       ntfval2              smallint NOT NULL,
       timerid2             smallint NOT NULL,
       instruction3         smallint NOT NULL,
       ntfval3              smallint NOT NULL,
       timerid3             smallint NOT NULL,
       instruction4         smallint NOT NULL,
       ntfval4              smallint NOT NULL,
       timerid4             smallint NOT NULL,
       instruction5         smallint NOT NULL,
       ntfval5              smallint NOT NULL,
       timerid5             smallint NOT NULL,
       instruction6         smallint NOT NULL,
       ntfval6              smallint NOT NULL,
       timerid6             smallint NOT NULL,
       instruction7         smallint NOT NULL,
       ntfval7              smallint NOT NULL,
       timerid7             smallint NOT NULL,
       instruction8         smallint NOT NULL,
       ntfval8              smallint NOT NULL,
       timerid8             smallint NOT NULL,
       instruction9         smallint NOT NULL,
       ntfval9              smallint NOT NULL,
       timerid9             smallint NOT NULL,
       instruction10        smallint NOT NULL,
       ntfval10             smallint NOT NULL,
       timerid10            smallint NOT NULL,
       instruction11        smallint NOT NULL,
       ntfval11             smallint NOT NULL,
       timerid11            smallint NOT NULL,
       instruction12        smallint NOT NULL,
       ntfval12             smallint NOT NULL,
       timerid12            smallint NOT NULL,
       instruction13        smallint NOT NULL,
       ntfval13             smallint NOT NULL,
       timerid13            smallint NOT NULL,
       instruction14        smallint NOT NULL,
       ntfval14             smallint NOT NULL,
       timerid14            smallint NOT NULL,
       instruction15        smallint NOT NULL,
       ntfval15             smallint NOT NULL,
       timerid15            smallint NOT NULL,
       PRIMARY KEY (nodeid, access_variant),
       FOREIGN KEY (nodeid, access_variant)
                             REFERENCES asaccess_data
);



CREATE TABLE cf_rerouting (
       nodeid               integer NOT NULL,
       trnkgrpid            smallint NOT NULL,
       dstid                smallint NOT NULL,
       dicon                char(25),
       PRIMARY KEY (nodeid, trnkgrpid, dstid),
       FOREIGN KEY (nodeid, trnkgrpid)
                             REFERENCES trunk_group,
       FOREIGN KEY (nodeid, dstid)
                             REFERENCES destination_out
);



CREATE TABLE prefix_chsite (
       nodeid               integer NOT NULL,
       dstpfx               char(20) NOT NULL,
       bgid                 integer NOT NULL,
       dst_chsite           smallint NOT NULL,
       PRIMARY KEY (nodeid, dstpfx, bgid)
);



CREATE TABLE mn_route_pointer (
       nodeid               integer NOT NULL,
       routeptr             smallint NOT NULL,
       routeptr_name        char(32) NOT NULL,
       PRIMARY KEY (nodeid, routeptr)
);



CREATE UNIQUE INDEX AK1_mn_route_pointer ON mn_route_pointer
(
	nodeid                ASC,
	routeptr_name         ASC
);



CREATE TABLE sent_trnk_rg_conv (
       nodeid               integer NOT NULL,
       routeid              smallint NOT NULL,
       num_sort             smallint NOT NULL,
       numtype              smallint NOT NULL,
       rgpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, routeid, num_sort, numtype, rgpn_prefix)
);



CREATE TABLE out_called_conv (
       nodeid               integer NOT NULL,
       routeid              smallint NOT NULL,
       cdp_numtype          smallint NOT NULL,
       ndc_id               smallint DEFAULT 0 NOT NULL,
       dicon                char(25),
       newcdp_numtype       smallint NOT NULL,
       nrreqdgt             smallint NOT NULL,
       eodind               smallint,
       eodind2              smallint,
       PRIMARY KEY (nodeid, routeid, cdp_numtype, ndc_id),
       FOREIGN KEY (nodeid, routeid)
                             REFERENCES route
);



CREATE TABLE mn_ggrphc_area (
       nodeid               integer NOT NULL,
       ggrphc_area_id       smallint NOT NULL,
       ggrphc_area_name     char(30) NOT NULL,
       PRIMARY KEY (nodeid, ggrphc_area_id)
);



CREATE TABLE ggrphc_dpndt_srv (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       ggrphc_area_id       smallint NOT NULL,
       ggrphc_dpndt_nr      char(64) NOT NULL,
       dstdn                char(25),
       ims_uri              char(200),
       dstid                smallint DEFAULT 0 NOT NULL,
       srv_usage            tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, ggrphc_area_id, ggrphc_dpndt_nr)
);



CREATE TABLE srv_nr_to_urn_conv (
       nodeid               integer NOT NULL,
       srv_nr               char(64) NOT NULL,
       urn_type             smallint DEFAULT 0 NOT NULL,
       urn_sub_type         smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, srv_nr)
);



CREATE TABLE ping_test (
       nodeid               integer NOT NULL,
       rtt_min_threshold    integer DEFAULT 200000 NOT NULL,
       rtt_max_threshold    integer DEFAULT 300000 NOT NULL,
       test_period          smallint DEFAULT 15 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE sip2local_header (
       nodeid               integer NOT NULL,
       sip_local_cnv_var    smallint NOT NULL,
       sip_header           tinyint NOT NULL,
       local_header         tinyint NOT NULL,
       add_dcs_index        tinyint DEFAULT 0 NOT NULL,
       add_decision1        tinyint DEFAULT 0 NOT NULL,
       add_decision2        tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sip_local_cnv_var, sip_header, local_header)
);



CREATE TABLE local2sip_header (
       nodeid               integer NOT NULL,
       local_sip_cnv_var    smallint NOT NULL,
       local_header         tinyint NOT NULL,
       sip_header           tinyint NOT NULL,
       add_dcs_index        tinyint DEFAULT 0 NOT NULL,
       add_decision1        tinyint DEFAULT 0 NOT NULL,
       add_decision2        tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, local_sip_cnv_var, local_header, sip_header)
);



CREATE TABLE ldap_client (
       nodeid               integer NOT NULL,
       ldap_srvr_id         tinyint NOT NULL,
       ldap_host_name       char(50),
       ldap_ip_addr         char(15),
       ldap_tcp_port        integer DEFAULT 389 NOT NULL,
       ldap_version         tinyint DEFAULT 3 NOT NULL,
       ldap_base_dn         char(50) NOT NULL,
       ldap_username        char(50) NOT NULL,
       ldap_pswd            char(16) NOT NULL,
       PRIMARY KEY (nodeid, ldap_srvr_id)
);



CREATE TABLE prefix_exception (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       dstpfx               char(20) NOT NULL,
       cid                  smallint NOT NULL,
       bgid                 integer NOT NULL,
       cgid                 smallint DEFAULT 0 NOT NULL,
       dstctg               smallint DEFAULT 1 NOT NULL,
       dstid                smallint DEFAULT 0 NOT NULL,
       dst_charge_code      smallint DEFAULT '-2' NOT NULL,
       stat_group_id        smallint DEFAULT 0 NOT NULL,
       nplan_id             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, dstpfx, cid, bgid, nplan_id)
);



CREATE TABLE commdb_sync_status (
       nodeid               integer NOT NULL,
       sync_status          tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE sip_transaction (
       nodeid               integer NOT NULL,
       ims_max_nr           integer DEFAULT 0 NOT NULL,
       alr_report_val       smallint DEFAULT 90 NOT NULL,
       alr_remove_val       smallint DEFAULT 75 NOT NULL,
       alr_avg_time         smallint DEFAULT 10 NOT NULL,
       resp_ims_max_nr      char(32) DEFAULT '' NOT NULL,
       ims_tm_valid         integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE customer_data (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       customer_id          char(12) NOT NULL,
       PRIMARY KEY (nodeid, dn)
);



CREATE TABLE inap_cpb (
       nodeid               integer NOT NULL,
       srvr_id              smallint NOT NULL,
       appl_cntx_name       smallint NOT NULL,
       idp_msg              tinyint DEFAULT 1 NOT NULL,
       idp_cgpc             tinyint DEFAULT 1 NOT NULL,
       idp_rgpn             tinyint DEFAULT 1 NOT NULL,
       idp_rninf            tinyint DEFAULT 1 NOT NULL,
       idp_add_cdpn         tinyint DEFAULT 1 NOT NULL,
       idp_add_cgpn         tinyint DEFAULT 1 NOT NULL,
       idp_add_rgpn         tinyint DEFAULT 1 NOT NULL,
       con_msg              tinyint DEFAULT 1 NOT NULL,
       con_cut_paste        tinyint DEFAULT 1 NOT NULL,
       con_cgpn             tinyint DEFAULT 1 NOT NULL,
       con_rgpn             tinyint DEFAULT 1 NOT NULL,
       con_rninf            tinyint DEFAULT 1 NOT NULL,
       con_add_cdpn         tinyint DEFAULT 1 NOT NULL,
       con_add_cgpn         tinyint DEFAULT 1 NOT NULL,
       con_add_rgpn         tinyint DEFAULT 1 NOT NULL,
       erbcsm_msg           tinyint DEFAULT 1 NOT NULL,
       erbcsm_ev_spec_inf   tinyint DEFAULT 1 NOT NULL,
       erbcsm_legid         tinyint DEFAULT 1 NOT NULL,
       erbcsm_misccallinf   tinyint DEFAULT 1 NOT NULL,
       rrbcsme_msg          tinyint DEFAULT 1 NOT NULL,
       col_msg              tinyint DEFAULT 1 NOT NULL,
       cont_msg             tinyint DEFAULT 1 NOT NULL,
       cont_warg_msg        tinyint DEFAULT 1 NOT NULL,
       rlsc_msg             tinyint DEFAULT 1 NOT NULL,
       ctr_msg              tinyint DEFAULT 1 NOT NULL,
       play_ann_msg         tinyint DEFAULT 1 NOT NULL,
       dfc_msg              tinyint DEFAULT 1 NOT NULL,
       fci_msg              tinyint DEFAULT 1 NOT NULL,
       fci_bcc              tinyint DEFAULT 1 NOT NULL,
       idp_origcdpid        tinyint DEFAULT 1 NOT NULL,
       con_origcdpid        tinyint DEFAULT 1 NOT NULL,
       cncl_msg             tinyint DEFAULT 1 NOT NULL,
       srr_msg              tinyint DEFAULT 1 NOT NULL,
       idp_cgps             tinyint DEFAULT 1 NOT NULL,
       idp_locpn            tinyint DEFAULT 1 NOT NULL,
       idp_bc               tinyint DEFAULT 1 NOT NULL,
       idp_extfld           tinyint DEFAULT 0 NOT NULL,
       con_cgpc             tinyint DEFAULT 1 NOT NULL,
       con_routelist        tinyint DEFAULT 0 NOT NULL,
       con_extfld           tinyint DEFAULT 0 NOT NULL,
       ach_msg              tinyint DEFAULT 2 NOT NULL,
       ach_acharg           tinyint DEFAULT 0 NOT NULL,
       acr_msg              tinyint DEFAULT 2 NOT NULL,
       acr_callresult       tinyint DEFAULT 0 NOT NULL,
       at_msg               tinyint DEFAULT 2 NOT NULL,
       rt_msg               tinyint DEFAULT 2 NOT NULL,
       erbcsm_extfld        tinyint DEFAULT 0 NOT NULL,
       col_extfld           tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, srvr_id, appl_cntx_name)
);



CREATE TABLE appl_server_ann (
       nodeid               integer NOT NULL,
       regsigtype           smallint NOT NULL,
       srvr_id              smallint NOT NULL,
       appl_srvr_ann_id     integer NOT NULL,
       vxml_id              integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, regsigtype, srvr_id, appl_srvr_ann_id)
);



CREATE TABLE cm_pfx_dicon (
       nodeid               integer NOT NULL,
       cm_pfx_grp           smallint NOT NULL,
       cm_trnkgrpid         smallint NOT NULL,
       numtype              smallint NOT NULL,
       cm_pfx               char(20) NOT NULL,
       new_numtype          smallint DEFAULT 0 NOT NULL,
       dicon                char(25) NOT NULL,
       PRIMARY KEY (nodeid, cm_pfx_grp, cm_trnkgrpid, numtype, cm_pfx)
);



CREATE TABLE mn_ext_user_barrcs (
       nodeid               integer NOT NULL,
       cbact_list_id        smallint NOT NULL,
       cbact_list_name      char(32) NOT NULL,
       PRIMARY KEY (nodeid, cbact_list_id)
);



CREATE UNIQUE INDEX AK1_mn_ext_user_barrcs ON mn_ext_user_barrcs
(
	nodeid                ASC,
	cbact_list_name       ASC
);



CREATE TABLE appl_server (
       nodeid               integer NOT NULL,
       dstid                smallint DEFAULT 0 NOT NULL,
       outsrv_name          smallint DEFAULT 0 NOT NULL,
       regsigtype           smallint DEFAULT 33 NOT NULL,
       srvr_id              smallint DEFAULT 1 NOT NULL,
       add_srvr_id          smallint DEFAULT 0 NOT NULL,
       tm_wait_prot_resp    smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dstid)
);



CREATE TABLE rec_vas_conv (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       num_sort             smallint NOT NULL,
       numtype              smallint NOT NULL,
       rec_prefix           char(25) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, dstid, num_sort, numtype, rec_prefix),
       FOREIGN KEY (nodeid, dstid)
                             REFERENCES appl_server
);



CREATE TABLE mn_map_plmn (
       nodeid               integer NOT NULL,
       plmn_id              smallint NOT NULL,
       plmn_name            WVARCHAR(32) NOT NULL,
       PRIMARY KEY (nodeid, plmn_id)
);



CREATE UNIQUE INDEX AK1_mn_map_plmn ON mn_map_plmn
(
	nodeid                ASC,
	plmn_name             ASC
);



CREATE TABLE sent_vas_conv (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       num_sort             smallint NOT NULL,
       ndc_id               smallint NOT NULL,
       numtype              smallint NOT NULL,
       sent_prefix          char(25) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, dstid, num_sort, ndc_id, numtype, sent_prefix),
       FOREIGN KEY (nodeid, dstid)
                             REFERENCES appl_server
);



CREATE TABLE cm_subs_dicon (
       nodeid               integer NOT NULL,
       cm_mc_pfx            char(18) NOT NULL,
       cm_sn_pfx            char(18) NOT NULL,
       PRIMARY KEY (nodeid, cm_mc_pfx)
);



CREATE UNIQUE INDEX AK1_cm_subs_dicon ON cm_subs_dicon
(
	nodeid                ASC,
	cm_sn_pfx             ASC
);



CREATE TABLE ims_emr_global (
       nodeid               integer NOT NULL,
       emr_allowed          tinyint DEFAULT 1 NOT NULL,
       emr_non_rgstr_subs   tinyint DEFAULT 1 NOT NULL,
       emr_rgstr_req        tinyint DEFAULT 1 NOT NULL,
       emr_anonymous        tinyint DEFAULT 1 NOT NULL,
       emr_privacy          tinyint DEFAULT 1 NOT NULL,
       emr_session_rfr      smallint DEFAULT 0 NOT NULL,
       emr_rgstr_exp        integer DEFAULT 1800 NOT NULL,
       emr_callback_auth    tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE ims_chrg_fnct (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ims_chrg_fnct_id     smallint NOT NULL,
       ims_chrg_type        tinyint NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, ims_chrg_fnct_id)
);



CREATE TABLE ctx_pbl_prsnt_sn (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       cgid                 smallint DEFAULT 0 NOT NULL,
       present_subsnr       char(15) NOT NULL,
       present_numtype      tinyint DEFAULT 4 NOT NULL,
       PRIMARY KEY (nodeid, bgid, cgid, present_subsnr)
);



CREATE TABLE mnscr2scr_lst_conv (
       nodeid               integer NOT NULL,
       mnscr_2_scr_dn       integer NOT NULL,
       scr_list_id          integer NOT NULL,
       suppl_id             smallint NOT NULL,
       asic_list_id         integer NOT NULL,
       PRIMARY KEY (nodeid, mnscr_2_scr_dn, scr_list_id, suppl_id)
);



CREATE TABLE mn_scp_screening_list (
       nodeid               integer NOT NULL,
       scp_list_id          integer NOT NULL,
       scp_list_name        WVARCHAR(32) NOT NULL,
       PRIMARY KEY (nodeid, scp_list_id)
);



CREATE UNIQUE INDEX AK1_mn_scp_screening_list ON mn_scp_screening_list
(
	nodeid                ASC,
	scp_list_name         ASC
);



CREATE TABLE sent_subs_cd_conv (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       numtype              smallint NOT NULL,
       cdpn_prefix          char(20) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, numtype, cdpn_prefix)
);



CREATE TABLE protocol_attr_ann (
       nodeid               integer NOT NULL,
       regsigtype           smallint NOT NULL,
       srvr_id              smallint NOT NULL,
       prot_attr_code       integer NOT NULL,
       attr_txt_val         char(132) NOT NULL,
       attr_int_val         integer NOT NULL,
       vxml_id              integer DEFAULT 0 NOT NULL,
       ann_cdpn             char(20) DEFAULT '' NOT NULL,
       toneid               smallint DEFAULT 0 NOT NULL,
       add_txtval2urlpfx    tinyint DEFAULT 0 NOT NULL,
       url_pfx              char(132) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid, regsigtype, srvr_id, prot_attr_code, attr_txt_val, attr_int_val)
);



CREATE TABLE mn_destination_out (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       dst_name             char(32) NOT NULL,
       PRIMARY KEY (nodeid, dstid)
);



CREATE UNIQUE INDEX AK1_mn_destination_out ON mn_destination_out
(
	nodeid                ASC,
	dst_name              ASC
);



CREATE TABLE mad (
       nodeid               integer NOT NULL,
       mad_id               smallint NOT NULL,
       mad_ip_addr          char(15),
       mad_sec_ip_addr      char(15),
       mad_eth_addr         char(17),
       mad_sec_eth_addr     char(17),
       mad_pin              integer,
       expires              integer DEFAULT 0 NOT NULL,
       mad_param1           smallint,
       mad_type             smallint DEFAULT 0 NOT NULL,
       mad_key              char(32) DEFAULT NULL,
       mad_ip_port          integer DEFAULT 5060 NOT NULL,
       mad_ip_transport     tinyint DEFAULT 1 NOT NULL,
       sip_ca_ip_addr       char(15) DEFAULT NULL,
       sip_ca_ip_port       integer DEFAULT NULL,
       sip_ca_ip_trnsprt    char(10) DEFAULT NULL,
       sip_ca_domain_name   char(64) DEFAULT NULL,
       sip_ca_proxy         char(64) DEFAULT NULL,
       PRIMARY KEY (nodeid, mad_id)
);



CREATE INDEX IE1_mad ON mad
(
	nodeid                ASC,
	mad_ip_addr           ASC
);



CREATE TABLE mad_multiple_ip (
       nodeid               integer NOT NULL,
       mad_ip_addr          char(15) NOT NULL,
       mad_id               smallint NOT NULL,
       PRIMARY KEY (nodeid, mad_ip_addr),
       FOREIGN KEY (nodeid, mad_id)
                             REFERENCES mad
);



CREATE TABLE mn_ss7_link_set (
       nodeid               integer NOT NULL,
       ss7_linksetid        smallint NOT NULL,
       ss7_linkset_name     char(32) NOT NULL,
       PRIMARY KEY (nodeid, ss7_linksetid)
);



CREATE TABLE mn_ss7_own_pc (
       nodeid               integer NOT NULL,
       ss7_own_pc_id        smallint NOT NULL,
       ss7_own_pc_name      char(32) NOT NULL,
       PRIMARY KEY (nodeid, ss7_own_pc_id)
);



CREATE TABLE v5_interface (
       nodeid               integer NOT NULL,
       v5_interface_index   smallint NOT NULL,
       v5_id                integer NOT NULL,
       v5_type              smallint NOT NULL,
       port_alignment       smallint NOT NULL,
       active_v5_var_id     smallint NOT NULL,
       v5_link_id_req       smallint DEFAULT 1 NOT NULL,
       v5_sigtrace_req      smallint DEFAULT 0 NOT NULL,
       v5ua_sys_intf_id     integer NOT NULL,
       v52_version          integer DEFAULT 0 NOT NULL,
       v5ua_sys_intf_id2    integer,
       v52_comment          char(132),
       coco_intf_id         integer DEFAULT 0 NOT NULL,
       coco_intf_id_rdnd    integer,
       PRIMARY KEY (nodeid, v5_interface_index)
);



CREATE TABLE ss7_migration (
       nodeid               integer NOT NULL,
       ss7_dstid            smallint NOT NULL,
       cic_min              smallint DEFAULT 1 NOT NULL,
       cic_max              smallint DEFAULT 4095 NOT NULL,
       direct_routing       tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ss7_dstid, cic_min)
);



CREATE TABLE mn_ss7_link (
       nodeid               integer NOT NULL,
       ss7_linkid           smallint NOT NULL,
       ss7_link_name        char(32) NOT NULL,
       PRIMARY KEY (nodeid, ss7_linkid)
);



CREATE TABLE sccp_gtt_main (
       nodeid               integer NOT NULL,
       gtt_id               smallint NOT NULL,
       gtt_type             smallint NOT NULL,
       gtt_num_plan         smallint DEFAULT 1 NOT NULL,
       gtt_num_type         smallint NOT NULL,
       gtt_number_mask      char(25) NOT NULL,
       pri_opc              smallint NOT NULL,
       pri_ssn              smallint NOT NULL,
       new_gt               smallint DEFAULT 0 NOT NULL,
       new_gtt_type         smallint NOT NULL,
       new_gtt_num_plan     smallint DEFAULT 1 NOT NULL,
       new_gtt_num_type     smallint NOT NULL,
       dicon                char(25),
       sccp_new_routeon     smallint DEFAULT '-1' NOT NULL,
       sccp_loadshare       tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, gtt_id)
);



CREATE UNIQUE INDEX AK1_sccp_gtt_main ON sccp_gtt_main
(
	nodeid                ASC,
	gtt_type              ASC,
	gtt_num_plan          ASC,
	gtt_num_type          ASC,
	gtt_number_mask       ASC
);



CREATE TABLE sccp_gtt_dest (
       nodeid               integer NOT NULL,
       gtt_id               smallint NOT NULL,
       pri_dpc              smallint NOT NULL,
       gtt_dpc_priority     tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, gtt_id, pri_dpc),
       FOREIGN KEY (nodeid, gtt_id)
                             REFERENCES sccp_gtt_main
);



CREATE TABLE mn_user_vas (
       nodeid               integer NOT NULL,
       mn_outsrv_name       smallint NOT NULL,
       mn_outsrv_descr      char(32) NOT NULL,
       mn_comm_regsigtype   smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, mn_outsrv_name)
);



CREATE UNIQUE INDEX AK1_mn_user_vas ON mn_user_vas
(
	nodeid                ASC,
	mn_outsrv_descr       ASC
);



CREATE TABLE mn_tcap_dialog_prtn (
       nodeid               integer NOT NULL,
       appl_cntx_name       smallint NOT NULL,
       appl_cntx_name_comment WVARCHAR(32) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid, appl_cntx_name)
);



CREATE UNIQUE INDEX AK1_mn_tcap_dialog_prtn ON mn_tcap_dialog_prtn
(
	nodeid                ASC,
	appl_cntx_name_comment  ASC
);



CREATE TABLE sip_hdr_cnv_desc (
       nodeid               integer NOT NULL,
       cnv_type             smallint NOT NULL,
       sip_cnv_var          smallint NOT NULL,
       change_allow         smallint DEFAULT 0 NOT NULL,
       desc_of_variant      char(50) NOT NULL,
       PRIMARY KEY (nodeid, cnv_type, sip_cnv_var)
);



CREATE TABLE inap_profile (
       nodeid               integer NOT NULL,
       inap_profile_id      smallint NOT NULL,
       inap_profile_name    varchar(32) DEFAULT 'INAP Default' NOT NULL,
       inap_ssn             smallint DEFAULT 12 NOT NULL,
       qlty_of_srv          smallint DEFAULT 3 NOT NULL,
       tcap_term            smallint DEFAULT 1 NOT NULL,
       inap_tm_short        smallint DEFAULT 5 NOT NULL,
       inap_tm_medium       smallint DEFAULT 30 NOT NULL,
       inap_tm_long         smallint DEFAULT 60 NOT NULL,
       inap_tm_scrty        smallint DEFAULT 600 NOT NULL,
       inap_at              smallint DEFAULT 0 NOT NULL,
       inap_tm_at           smallint DEFAULT 60 NOT NULL,
       inap_tm_ssf1         smallint DEFAULT 10 NOT NULL,
       inap_tm_ssf2         smallint DEFAULT 10 NOT NULL,
       inap_tm_ssf3         smallint DEFAULT 10 NOT NULL,
       inap_tm_scf_ssf1     smallint DEFAULT 5 NOT NULL,
       inap_tm_scf_ssf2     smallint DEFAULT 5 NOT NULL,
       inap_tm_scf_ssf3     smallint DEFAULT 5 NOT NULL,
       inap_tm_scf_rt       smallint DEFAULT 10 NOT NULL,
       PRIMARY KEY (nodeid, inap_profile_id)
);



CREATE TABLE inap_scp_param (
       nodeid               integer NOT NULL,
       scp_param_id         smallint NOT NULL,
       scp_param_name       varchar(32) DEFAULT 'INAP SCP Default' NOT NULL,
       con_msg              tinyint DEFAULT 1 NOT NULL,
       con_cut_paste        tinyint DEFAULT 1 NOT NULL,
       cont_msg             tinyint DEFAULT 1 NOT NULL,
       rlsc_msg             tinyint DEFAULT 1 NOT NULL,
       erbcsm_msg           tinyint DEFAULT 1 NOT NULL,
       erbcsm_ev_spec_inf   tinyint DEFAULT 1 NOT NULL,
       erbcsm_misccallinf   tinyint DEFAULT 1 NOT NULL,
       rrbcsme_msg          tinyint DEFAULT 1 NOT NULL,
       col_msg              tinyint DEFAULT 1 NOT NULL,
       fci_msg              tinyint DEFAULT 1 NOT NULL,
       cncl_msg             tinyint DEFAULT 1 NOT NULL,
       ctr_msg              tinyint DEFAULT 1 NOT NULL,
       dfc_msg              tinyint DEFAULT 1 NOT NULL,
       play_ann_msg         tinyint DEFAULT 1 NOT NULL,
       srr_msg              tinyint DEFAULT 1 NOT NULL,
       rt_msg               tinyint DEFAULT 1 NOT NULL,
       inap_invoke_grp      tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, scp_param_id)
);



CREATE TABLE ss7ap_orig_addr (
       nodeid               integer NOT NULL,
       ss7ap_orig_id        smallint NOT NULL,
       orig_entity_name     varchar(32) NOT NULL,
       orig_node_type       tinyint DEFAULT 0 NOT NULL,
       orig_addr_rtng_ind   tinyint DEFAULT 0 NOT NULL,
       orig_addr_gt_ind     tinyint DEFAULT 0 NOT NULL,
       orig_addr_ssn_ind    tinyint DEFAULT 1 NOT NULL,
       ssn_orig             smallint DEFAULT 0 NOT NULL,
       orig_addr_pc_ind     tinyint DEFAULT 3 NOT NULL,
       orig_addr_opc_id     smallint DEFAULT 0 NOT NULL,
       orig_addr_gtai       char(25) DEFAULT NULL,
       orig_addr_nai        smallint DEFAULT 2 NOT NULL,
       orig_addr_tt         smallint DEFAULT 0 NOT NULL,
       orig_addr_np         tinyint DEFAULT 1 NOT NULL,
       orig_addr_es         tinyint DEFAULT 0 NOT NULL,
       orig_addr_type       tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, ss7ap_orig_id)
);



CREATE UNIQUE INDEX AK1_ss7ap_orig_addr ON ss7ap_orig_addr
(
	nodeid                ASC,
	orig_entity_name      ASC
);



CREATE TABLE ss7ap_dest_addr (
       nodeid               integer NOT NULL,
       ss7ap_dest_id        smallint NOT NULL,
       dest_entity_name     varchar(32) NOT NULL,
       dest_addr_rtng_ind   tinyint DEFAULT 0 NOT NULL,
       dest_addr_gt_ind     tinyint DEFAULT 4 NOT NULL,
       dest_addr_ssn_ind    tinyint DEFAULT 1 NOT NULL,
       ssn_dst              smallint DEFAULT 0 NOT NULL,
       dest_addr_pc_ind     tinyint DEFAULT 0 NOT NULL,
       dpc_id               smallint DEFAULT 0 NOT NULL,
       dest_addr_gtai       char(25) DEFAULT NULL,
       dest_addr_nai        smallint DEFAULT 4 NOT NULL,
       dest_addr_tt         smallint DEFAULT 0 NOT NULL,
       dest_addr_np         tinyint DEFAULT 1 NOT NULL,
       dest_addr_es         tinyint DEFAULT 0 NOT NULL,
       dest_addr_type       tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, ss7ap_dest_id)
);



CREATE UNIQUE INDEX AK1_ss7ap_dest_addr ON ss7ap_dest_addr
(
	nodeid                ASC,
	dest_entity_name      ASC
);



CREATE TABLE inap_scp_service (
       nodeid               integer NOT NULL,
       ssp_id               smallint NOT NULL,
       inap_srv_key         integer NOT NULL,
       inap_service_name    varchar(32) DEFAULT 'INAP Default' NOT NULL,
       appl_cntx_name       smallint NOT NULL,
       ss7ap_dest_id        smallint,
       ss7ap_orig_id        smallint,
       inap_profile_id      smallint NOT NULL,
       scp_param_id         smallint NOT NULL,
       PRIMARY KEY (nodeid, ssp_id, inap_srv_key),
       FOREIGN KEY (nodeid, inap_profile_id)
                             REFERENCES inap_profile,
       FOREIGN KEY (nodeid, scp_param_id)
                             REFERENCES inap_scp_param,
       FOREIGN KEY (nodeid, ss7ap_orig_id)
                             REFERENCES ss7ap_orig_addr,
       FOREIGN KEY (nodeid, ss7ap_dest_id)
                             REFERENCES ss7ap_dest_addr
);



CREATE TABLE mn_mand_cpb_name (
       nodeid               integer NOT NULL,
       mand_cpb_id          integer NOT NULL,
       mand_cpb_name        char(16) NOT NULL,
       PRIMARY KEY (nodeid, mand_cpb_id)
);



CREATE UNIQUE INDEX AK1_mn_mand_cpb_name ON mn_mand_cpb_name
(
	nodeid                ASC,
	mand_cpb_name         ASC
);



CREATE TABLE sip_access (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       acc_ip_addr          char(15),
       acc_eth_addr         char(17),
       acc_sec_ip_addr      char(15),
       acc_sec_eth_addr     char(17),
       acc_eth_ident_mode   smallint NOT NULL,
       sip_feature_id       smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       access_mon_period    smallint DEFAULT 0 NOT NULL,
       mad_id               smallint DEFAULT 0 NOT NULL,
       sip_subs_alias       char(64),
       sip_alias_type       smallint,
       reg_mode             smallint DEFAULT 0 NOT NULL,
       sip_key              char(32),
       expires              integer DEFAULT 0 NOT NULL,
       sip_display          smallint DEFAULT 3 NOT NULL,
       local_tone           smallint DEFAULT 26 NOT NULL,
       sip_authent_mode     smallint DEFAULT 0 NOT NULL,
       sip_acc_param1       smallint DEFAULT 0 NOT NULL,
       sip_acc_param2       integer,
       sip_acc_param3       char(35),
       acc_ip_port          integer DEFAULT 5060 NOT NULL,
       subscribe_expires    integer DEFAULT 0 NOT NULL,
       sip_domain_name      char(64),
       ims_routeid          smallint DEFAULT 0 NOT NULL,
       md5_nonce            char(64),
       acc_ip_transport     tinyint DEFAULT 0 NOT NULL,
       pri_ccf_id           smallint,
       sec_ccf_id           smallint,
       ims_alarm_sts        tinyint DEFAULT 0 NOT NULL,
       pbx_ident_mode       tinyint DEFAULT 0 NOT NULL,
       ims_emr_reg          tinyint DEFAULT 0 NOT NULL,
       p_gruu               char(64) DEFAULT '' NOT NULL,
       refer_notify         smallint DEFAULT 200 NOT NULL,
       refer_handling       tinyint DEFAULT 0 NOT NULL,
       ims_reg_entity       tinyint DEFAULT 0 NOT NULL,
       sip_acc_alrind       tinyint DEFAULT 0 NOT NULL,
       acc_cntct            char(200) DEFAULT '' NOT NULL,
       integrity_protected  tinyint DEFAULT 0 NOT NULL,
       rem_auth_req         tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr),
       FOREIGN KEY (nodeid, sip_feature_id)
                             REFERENCES sip_feature,
       FOREIGN KEY (nodeid, modulenr, portnr)
                             REFERENCES access
);



CREATE INDEX IE1_sip_access ON sip_access
(
	nodeid                ASC,
	mad_id                ASC
);



CREATE INDEX IE2_sip_access ON sip_access
(
	nodeid                ASC,
	acc_ip_addr           ASC,
	acc_ip_port           ASC
);



CREATE INDEX IE3_sip_access ON sip_access
(
	nodeid                ASC,
	sip_subs_alias        ASC
);



CREATE INDEX IE4_sip_access ON sip_access
(
	nodeid                ASC,
	p_gruu                ASC
);



CREATE TABLE srvcc_user (
       nodeid               integer NOT NULL,
       cmsisdn              char(32) NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       stn_sr               char(32),
       atcf_mgmt_uri        char(64),
       atcf_term_uri        char(64),
       PRIMARY KEY (nodeid, cmsisdn),
       FOREIGN KEY (nodeid, modulenr, portnr)
                             REFERENCES sip_access
);



CREATE TABLE loc_user_barrclass (
       nodeid               integer NOT NULL,
       cbact_list_id        smallint NOT NULL,
       dn                   integer NOT NULL,
       barrclass            smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, cbact_list_id, dn)
);



CREATE TABLE ims_dstid_to_uri (
       nodeid               integer NOT NULL,
       dstid                smallint NOT NULL,
       ims_dst_uri          char(64) NOT NULL,
       PRIMARY KEY (nodeid, dstid)
);



CREATE TABLE dndgm_time (
       nodeid               integer NOT NULL,
       dn                   integer NOT NULL,
       basic_id             smallint NOT NULL,
       switch_time          smallint NOT NULL,
       dayctg               smallint NOT NULL,
       switch_type          smallint NOT NULL,
       PRIMARY KEY (nodeid, dn, basic_id, switch_time, dayctg)
);



CREATE TABLE dp_subsctg (
       nodeid               integer NOT NULL,
       dpsubsctg_list_id    smallint NOT NULL,
       subsctg              smallint NOT NULL,
       dpsubsctg_mode       tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dpsubsctg_list_id, subsctg)
);



CREATE TABLE li_prefix_list (
       nodeid               integer NOT NULL,
       li_prefix            char(20) NOT NULL,
       PRIMARY KEY (nodeid, li_prefix)
);



CREATE TABLE cr_feature (
       nodeid               integer NOT NULL,
       cr_grp_id            smallint NOT NULL,
       cr_grp_name          char(30) NOT NULL,
       crcg_interval        integer DEFAULT 500 NOT NULL,
       crcb_percent         tinyint DEFAULT 0 NOT NULL,
       crr_max_conn         tinyint DEFAULT 30 NOT NULL,
       PRIMARY KEY (nodeid, cr_grp_id)
);



CREATE UNIQUE INDEX AK1_cr_feature ON cr_feature
(
	nodeid                ASC,
	cr_grp_name           ASC
);



CREATE TABLE auto_cong_ctrl (
       nodeid               integer NOT NULL,
       acc_variant          tinyint NOT NULL,
       acc_variant_name     char(32) NOT NULL,
       cl1_drt_reduct       tinyint DEFAULT 0 NOT NULL,
       cl1_art_reduct       tinyint DEFAULT 0 NOT NULL,
       cl1_prior_reduct     tinyint DEFAULT 0 NOT NULL,
       cl2_drt_reduct       tinyint DEFAULT 0 NOT NULL,
       cl2_art_reduct       tinyint DEFAULT 0 NOT NULL,
       cl2_prior_reduct     tinyint DEFAULT 0 NOT NULL,
       traff_reduct_ctrl    tinyint DEFAULT 0 NOT NULL,
       alarm_report         tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, acc_variant)
);



CREATE UNIQUE INDEX AK1_auto_cong_ctrl ON auto_cong_ctrl
(
	nodeid                ASC,
	acc_variant_name      ASC
);



CREATE TABLE common_srv_setting (
       nodeid               integer NOT NULL,
       net_cpu              tinyint DEFAULT 1 NOT NULL,
       net_uiccp            tinyint DEFAULT 1 NOT NULL,
       mdu_net_uiccp        tinyint DEFAULT 1 NOT NULL,
       max_nr_cpu           tinyint DEFAULT 3 NOT NULL,
       gt_addr_msc          varchar(16) DEFAULT '' NOT NULL,
       linkage_cw           tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE sipresp_cause_spec (
       nodeid               integer NOT NULL,
       resp_cause_var       tinyint NOT NULL,
       resp_id              smallint NOT NULL,
       causenr              smallint NOT NULL,
       PRIMARY KEY (nodeid, resp_cause_var, resp_id)
);



CREATE TABLE cong_detect (
       nodeid               integer NOT NULL,
       cong_detect_act      tinyint DEFAULT 1 NOT NULL,
       cl1_cpu_load         tinyint DEFAULT 90 NOT NULL,
       cl2_cpu_load         tinyint DEFAULT 95 NOT NULL,
       cl1_mem_load         tinyint DEFAULT 90 NOT NULL,
       cl2_mem_load         tinyint DEFAULT 95 NOT NULL,
       alarm_report         tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE map_ati (
       nodeid               integer NOT NULL,
       map_cpb_set_id       smallint NOT NULL,
       reqinfo_locinfo      tinyint DEFAULT 1 NOT NULL,
       reqinfo_subsstate    tinyint DEFAULT 0 NOT NULL,
       reqinfo_extcont      tinyint DEFAULT 0 NOT NULL,
       reqinfo_extcontid    tinyint DEFAULT 0 NOT NULL,
       reqinfo_currloc      tinyint DEFAULT 0 NOT NULL,
       reqinfo_reqdom       tinyint DEFAULT 0 NOT NULL,
       reqinfo_reqdomtyp    tinyint DEFAULT 0 NOT NULL,
       reqinfo_imei         tinyint DEFAULT 0 NOT NULL,
       reqinfo_msclassmk    tinyint DEFAULT 0 NOT NULL,
       reqinfo_mnpreqinfo   tinyint DEFAULT 0 NOT NULL,
       reqinfo_tadsdata     tinyint DEFAULT 0 NOT NULL,
       reqinfo_reqnod       tinyint DEFAULT 0 NOT NULL,
       reqinfo_reqnodid     tinyint DEFAULT 0 NOT NULL,
       reqinfo_srvnodid     tinyint DEFAULT 0 NOT NULL,
       extcont              tinyint DEFAULT 0 NOT NULL,
       extcontid            tinyint NOT NULL,
       PRIMARY KEY (nodeid, map_cpb_set_id)
);



CREATE TABLE map_appl_cntx (
       nodeid               integer NOT NULL,
       map_op_code          smallint NOT NULL,
       appl_cntx_ver        smallint NOT NULL,
       plmn_id              smallint NOT NULL,
       map_cpb_set_id       smallint DEFAULT 0 NOT NULL,
       appl_cntx_name       smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, map_op_code, appl_cntx_ver, plmn_id),
       FOREIGN KEY (nodeid, map_cpb_set_id)
                             REFERENCES map_ati
);



CREATE TABLE dns_config_voip (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       domain_name          char(80),
       primary_server       char(80),
       secondary_server     char(80),
       dns_max_queries      integer DEFAULT 1024 NOT NULL,
       dns_cache_size       integer DEFAULT 2048 NOT NULL,
       dns_cache_ttl_max    integer DEFAULT 3600 NOT NULL,
       tertiary_server      char(80),
       srvr_fail_time       integer DEFAULT 300 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE ioc_loop_list (
       nodeid               integer NOT NULL,
       ioc_loop_list_id     smallint NOT NULL,
       ioc_loop_party       tinyint NOT NULL,
       ioc_loop_partynr     varchar(25) NOT NULL,
       PRIMARY KEY (nodeid, ioc_loop_list_id)
);



CREATE TABLE trunk_subscriber (
       nodeid               integer NOT NULL,
       acc_modulenr         smallint NOT NULL,
       acc_portnr           smallint NOT NULL,
       trunk_modulenr       smallint NOT NULL,
       trunk_portnr         smallint NOT NULL,
       trunk_ci             smallint NOT NULL,
       trunkid              integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, acc_modulenr, acc_portnr),
       FOREIGN KEY (nodeid, acc_modulenr, acc_portnr)
                             REFERENCES access
);



CREATE UNIQUE INDEX AK1_trunk_subscriber ON trunk_subscriber
(
	nodeid                ASC,
	trunk_modulenr        ASC,
	trunk_portnr          ASC,
	trunk_ci              ASC
);



CREATE TABLE ms_codec_set (
       nodeid               integer NOT NULL,
       ms_codec_set_id      smallint NOT NULL,
       ms_codec_set_desc    char(40) NOT NULL,
       codec_id1            smallint DEFAULT NULL,
       codec_id2            smallint DEFAULT NULL,
       codec_id3            smallint DEFAULT NULL,
       codec_id4            smallint DEFAULT NULL,
       codec_id5            smallint DEFAULT NULL,
       codec_id6            smallint DEFAULT NULL,
       codec_id7            smallint DEFAULT NULL,
       codec_id8            smallint DEFAULT NULL,
       codec_id9            smallint DEFAULT NULL,
       codec_id10           smallint DEFAULT NULL,
       codec_id11           smallint DEFAULT NULL,
       codec_id12           smallint DEFAULT NULL,
       codec_id13           smallint DEFAULT NULL,
       codec_id14           smallint DEFAULT NULL,
       codec_id15           smallint DEFAULT NULL,
       codec_id16           smallint DEFAULT NULL,
       codec_id17           smallint DEFAULT NULL,
       codec_id18           smallint DEFAULT NULL,
       codec_id19           smallint DEFAULT NULL,
       codec_id20           smallint DEFAULT NULL,
       codec_id21           smallint DEFAULT NULL,
       codec_id22           smallint DEFAULT NULL,
       codec_id23           smallint DEFAULT NULL,
       codec_id24           smallint DEFAULT NULL,
       codec_id25           smallint DEFAULT NULL,
       codec_id26           smallint DEFAULT NULL,
       codec_id27           smallint DEFAULT NULL,
       codec_id28           smallint DEFAULT NULL,
       codec_id29           smallint DEFAULT NULL,
       codec_id30           smallint DEFAULT NULL,
       codec_id31           smallint DEFAULT NULL,
       codec_id32           smallint DEFAULT NULL,
       codec_id33           smallint DEFAULT NULL,
       codec_id34           smallint DEFAULT NULL,
       codec_id35           smallint DEFAULT NULL,
       codec_id36           smallint DEFAULT NULL,
       codec_id37           smallint DEFAULT NULL,
       codec_id38           smallint DEFAULT NULL,
       codec_id39           smallint DEFAULT NULL,
       codec_id40           smallint DEFAULT NULL,
       codec_id41           smallint DEFAULT NULL,
       codec_id42           smallint DEFAULT NULL,
       codec_id43           smallint DEFAULT NULL,
       codec_id44           smallint DEFAULT NULL,
       codec_id45           smallint DEFAULT NULL,
       codec_id46           smallint DEFAULT NULL,
       codec_id47           smallint DEFAULT NULL,
       codec_id48           smallint DEFAULT NULL,
       codec_id49           smallint DEFAULT NULL,
       codec_id50           smallint DEFAULT NULL,
       change_allow         smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, ms_codec_set_id)
);



CREATE UNIQUE INDEX AK1_ms_codec_set ON ms_codec_set
(
	nodeid                ASC,
	ms_codec_set_desc     ASC
);



CREATE TABLE tap_device (
       nodeid               integer NOT NULL,
       tap_device_id        smallint NOT NULL,
       tap_device_name      varchar(50) NOT NULL,
       tap_device_nr        varchar(25) NOT NULL,
       tap_presentation_type tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, tap_device_id)
);



CREATE UNIQUE INDEX AK1_tap_device ON tap_device
(
	nodeid                ASC,
	tap_device_name       ASC
);



CREATE TABLE dp_ctg_domain (
       nodeid               integer NOT NULL,
       list_id              smallint NOT NULL,
       list_type            smallint NOT NULL,
       list_mode            smallint NOT NULL,
       list_name            char(32) NOT NULL,
       PRIMARY KEY (nodeid, list_id)
);



CREATE UNIQUE INDEX AK1_dp_ctg_domain ON dp_ctg_domain
(
	nodeid                ASC,
	list_name             ASC
);



CREATE TABLE scp_user (
       nodeid               integer NOT NULL,
       scp_user_nr          varchar(20) NOT NULL,
       bgid                 integer DEFAULT 1 NOT NULL,
       scp_user_intercom    varchar(20),
       vas_ndc_id           smallint NOT NULL,
       scp_user_id          integer DEFAULT 1 NOT NULL,
       cgid                 smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, scp_user_nr)
);



CREATE INDEX IE1_scp_user ON scp_user
(
	nodeid                ASC,
	bgid                  ASC,
	scp_user_intercom     ASC
);



CREATE TABLE tele_suppl (
       nodeid               integer NOT NULL,
       tele_id              smallint NOT NULL,
       suppl_id             smallint NOT NULL,
       PRIMARY KEY (nodeid, tele_id, suppl_id)
);



CREATE TABLE vm_system (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       max_vb_count         smallint NOT NULL,
       max_files            smallint NOT NULL,
       vmm_file_dir         char(40) NOT NULL,
       dir_max_file         smallint NOT NULL,
       vmm_archive          char(40) NOT NULL,
       vmm_max_age          smallint NOT NULL,
       tmnotresp            smallint NOT NULL,
       repeat_nr            smallint NOT NULL,
       tm_vmta              smallint NOT NULL,
       tm_vmdm              smallint NOT NULL,
       tm_vmta_b1           smallint NOT NULL,
       tm_vmdm_b1           smallint NOT NULL,
       tm_vmda_idle         smallint NOT NULL,
       vmta_selfcheck       integer NOT NULL,
       tm_vmta_selfcheck    integer NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE prefix_cascade (
       nodeid               integer NOT NULL,
       ndc_id               smallint NOT NULL,
       dstctg               smallint NOT NULL,
       cid                  smallint NOT NULL,
       dstpfx               char(20) NOT NULL,
       dstid                smallint NOT NULL,
       dst_charge_code      smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       nplan_id             smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ndc_id, dstctg, cid, dstpfx, nplan_id)
);



CREATE TABLE cm_mc_dicon (
       nodeid               integer NOT NULL,
       cm_mc_pfxctg         tinyint NOT NULL,
       cm_mc_pfx            char(18) NOT NULL,
       cm_sn_pfxctg         tinyint DEFAULT 1 NOT NULL,
       cm_sn_pfx            char(18) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid, cm_mc_pfxctg, cm_mc_pfx)
);



CREATE TABLE cause_sipresp_spec (
       nodeid               integer NOT NULL,
       cause_resp_var       tinyint NOT NULL,
       causenr              smallint NOT NULL,
       resp_id              smallint NOT NULL,
       PRIMARY KEY (nodeid, cause_resp_var, causenr)
);



CREATE TABLE ip_trunk_session (
       nodeid               integer NOT NULL,
       max_ip_trunk_sess    integer DEFAULT 0 NOT NULL,
       alr_report_val       smallint DEFAULT 90 NOT NULL,
       alr_remove_val       smallint DEFAULT 75 NOT NULL,
       resp_ip_trunk_sess   char(32) DEFAULT '' NOT NULL,
       ip_trunk_tm_valid    integer DEFAULT 0 NOT NULL,
       max_fmc_sess         integer DEFAULT 0 NOT NULL,
       resp_fmc_sess        varchar(32) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE list_time (
       nodeid               integer NOT NULL,
       asic_list_id         integer NOT NULL,
       switch_time          smallint NOT NULL,
       dayctg               smallint NOT NULL,
       switch_type          smallint NOT NULL,
       PRIMARY KEY (nodeid, asic_list_id, switch_time, dayctg)
);



CREATE TABLE notify_table (
       nodeid               integer NOT NULL,
       table_name           varchar(255) NOT NULL,
       PRIMARY KEY (nodeid, table_name)
);



CREATE TABLE ims_sifc_set (
       nodeid               integer NOT NULL,
       sifc_set_id          integer NOT NULL,
       sifc_set_name        varchar(16),
       sifc_set_xml         varchar(15000) NOT NULL,
       PRIMARY KEY (nodeid, sifc_set_id)
);



CREATE TABLE ims_monitoring (
       nodeid               integer NOT NULL,
       ims_monitoring_id    smallint NOT NULL,
       ims_uri              char(200),
       ims_ip_addr          char(15) DEFAULT NULL,
       ims_ip_port          integer DEFAULT 0 NOT NULL,
       ims_routeid          smallint DEFAULT 0 NOT NULL,
       ims_mon_period       smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ims_monitoring_id)
);



CREATE UNIQUE INDEX AK1_ims_monitoring ON ims_monitoring
(
	nodeid                ASC,
	ims_uri               ASC,
	ims_ip_addr           ASC,
	ims_ip_port           ASC
);



CREATE TABLE otc_duty_group (
       nodeid               integer NOT NULL,
       otc_duty_groupnr     char(3) NOT NULL,
       otc_dutynr           char(3) NOT NULL,
       PRIMARY KEY (nodeid, otc_duty_groupnr, otc_dutynr)
);



CREATE TABLE digitmap_profile (
       nodeid               integer NOT NULL,
       digitmap_id          tinyint NOT NULL,
       digitmap_name        char(32) NOT NULL,
       digitmap_string      char(132) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid, digitmap_id)
);



CREATE UNIQUE INDEX AK1_digitmap_profile ON digitmap_profile
(
	nodeid                ASC,
	digitmap_name         ASC
);



CREATE TABLE cm_pbx_range (
       nodeid               integer NOT NULL,
       cm_ctgpfx            smallint NOT NULL,
       cm_pfx_begin         char(18) NOT NULL,
       cm_pfx_end           char(18) DEFAULT '' NOT NULL,
       cm_trnkgrpid         smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, cm_ctgpfx, cm_pfx_begin)
);



CREATE TABLE scp_screening_list (
       nodeid               integer NOT NULL,
       scp_list_id          integer NOT NULL,
       scp_pfx              varchar(20) NOT NULL,
       PRIMARY KEY (nodeid, scp_list_id, scp_pfx)
);



CREATE TABLE sent_scp_conv (
       nodeid               integer NOT NULL,
       ssp_id               smallint NOT NULL,
       num_sort             smallint NOT NULL,
       ndc_id               smallint NOT NULL,
       numtype              smallint NOT NULL,
       sent_prefix          char(25) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, ssp_id, num_sort, ndc_id, numtype, sent_prefix)
);



CREATE TABLE sccp_conc_dest (
       nodeid               integer NOT NULL,
       sccp_conc_id         smallint NOT NULL,
       ssn_dst              smallint NOT NULL,
       ss7_dstid            smallint NOT NULL,
       sccp_wait_ssa        tinyint DEFAULT 1 NOT NULL,
       sccp_send_ssx        tinyint DEFAULT 1 NOT NULL,
       sccp_hop_counter     tinyint DEFAULT 10 NOT NULL,
       sccp_segmentation    tinyint DEFAULT 1 NOT NULL,
       max_seg_length       smallint DEFAULT 201 NOT NULL,
       PRIMARY KEY (nodeid, sccp_conc_id)
);



CREATE UNIQUE INDEX AK1_sccp_conc_dest ON sccp_conc_dest
(
	nodeid                ASC,
	ssn_dst               ASC,
	ss7_dstid             ASC
);



CREATE TABLE cm_disc_cause (
       nodeid               integer NOT NULL,
       disc_cause           integer NOT NULL,
       cm_opcode            smallint NOT NULL,
       cm_procneed          tinyint NOT NULL,
       PRIMARY KEY (nodeid, disc_cause)
);



CREATE TABLE agcf_dial_plan (
       nodeid               integer NOT NULL,
       dstpfx               char(20) NOT NULL,
       pfx_name             char(50),
       nrreqdgt             smallint NOT NULL,
       eodind               smallint,
       eodind2              smallint,
       out_digit_tmvar      smallint NOT NULL,
       digitmap_spc         tinyint DEFAULT 0 NOT NULL,
       tm_digitmap          smallint,
       cdpn_format_cmpl     tinyint DEFAULT 2 NOT NULL,
       PRIMARY KEY (nodeid, dstpfx)
);



CREATE TABLE e1_profile (
       nodeid               integer NOT NULL,
       e1_profile_id        smallint NOT NULL,
       profile_name         char(20) NOT NULL,
       sig_mode             smallint NOT NULL,
       hlb_delay            smallint NOT NULL,
       port_event_limit     integer DEFAULT 150 NOT NULL,
       PRIMARY KEY (nodeid, e1_profile_id)
);



CREATE UNIQUE INDEX i_e1_pname ON e1_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE scp_call_barring (
       nodeid               integer NOT NULL,
       service_id           smallint NOT NULL,
       list_mode            smallint DEFAULT 0 NOT NULL,
       scp_list_id          integer DEFAULT 0 NOT NULL,
       scp_call_barring_dscr WVARCHAR(32) DEFAULT 'SCP Call Barring Default' NOT NULL,
       tm_list_act          tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, service_id)
);



CREATE UNIQUE INDEX AK1_scp_call_barring ON scp_call_barring
(
	nodeid                ASC,
	scp_call_barring_dscr  ASC
);



CREATE TABLE mn_opt_cpb_name (
       nodeid               integer NOT NULL,
       opt_cpb_id           integer NOT NULL,
       opt_cpb_name         char(16) NOT NULL,
       PRIMARY KEY (nodeid, opt_cpb_id)
);



CREATE UNIQUE INDEX AK1_mn_opt_cpb_name ON mn_opt_cpb_name
(
	nodeid                ASC,
	opt_cpb_name          ASC
);



CREATE TABLE rec_scp_conv (
       nodeid               integer NOT NULL,
       ssp_id               smallint NOT NULL,
       num_sort             smallint NOT NULL,
       numtype              smallint NOT NULL,
       rec_prefix           char(25) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, ssp_id, num_sort, numtype, rec_prefix)
);



CREATE TABLE vas_ndc (
       nodeid               integer NOT NULL,
       vas_ndc_id           smallint NOT NULL,
       vas_ndc_name         WVARCHAR(32) NOT NULL,
       cntr_code            char(4) NOT NULL,
       ndc                  char(6),
       PRIMARY KEY (nodeid, vas_ndc_id)
);



CREATE UNIQUE INDEX AK1_vas_ndc ON vas_ndc
(
	nodeid                ASC,
	vas_ndc_name          ASC
);



CREATE TABLE otc_node (
       nodeid               integer NOT NULL,
       otc_nodeid           smallint NOT NULL,
       otc_node_name        char(50) NOT NULL,
       otc_node_type        tinyint DEFAULT 0 NOT NULL,
       ntf_reg_prefix       char(4),
       ntf_alt_prefix1      char(4),
       ntf_alt_prefix2      char(4),
       ntf_bypass_prefix    char(4),
       rem_prefix           char(10),
       PRIMARY KEY (nodeid, otc_nodeid)
);



CREATE UNIQUE INDEX AK1_otc_node ON otc_node
(
	nodeid                ASC,
	otc_node_name         ASC
);



CREATE TABLE otc_dspt_circ_profile (
       nodeid               integer NOT NULL,
       dspt_circ_prfl_id    smallint NOT NULL,
       dspt_circ_prf_name   varchar(50) NOT NULL,
       dspt_circ_alias      varchar(25),
       max_nr_of_conn       smallint DEFAULT 32 NOT NULL,
       radio_weight_type    tinyint DEFAULT 0 NOT NULL,
       radio_weight_min     integer DEFAULT 1 NOT NULL,
       radio_weight_max     integer DEFAULT 65535 NOT NULL,
       tm_radio_delay_min   smallint DEFAULT 80 NOT NULL,
       tm_radio_delay_max   smallint DEFAULT 2000 NOT NULL,
       tm_collect_req       smallint DEFAULT 50 NOT NULL,
       default_enbl         tinyint DEFAULT 0 NOT NULL,
       mmc_enbl             tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, dspt_circ_prfl_id)
);



CREATE UNIQUE INDEX AK1_otc_dspt_circ_profile ON otc_dspt_circ_profile
(
	nodeid                ASC,
	dspt_circ_prf_name    ASC
);



CREATE TABLE otc_dspt_circ (
       nodeid               integer NOT NULL,
       otc_dspt_circnr      char(2) NOT NULL,
       otc_dspt_circname    char(50) NOT NULL,
       otc_nodeid           smallint DEFAULT 0 NOT NULL,
       invrs_speech_path    tinyint DEFAULT 0 NOT NULL,
       mmc_enbl             tinyint DEFAULT 1 NOT NULL,
       dspt_circ_prfl_id    smallint DEFAULT 1 NOT NULL,
       video_grid_srv_ip_addr varchar(15) DEFAULT NULL,
       otc_reset_mmc_enbl   tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, otc_dspt_circnr),
       FOREIGN KEY (nodeid, otc_nodeid)
                             REFERENCES otc_node,
       FOREIGN KEY (nodeid, dspt_circ_prfl_id)
                             REFERENCES otc_dspt_circ_profile
);



CREATE UNIQUE INDEX AK1_otc_dspt_circ ON otc_dspt_circ
(
	nodeid                ASC,
	otc_dspt_circname     ASC
);



CREATE TABLE otc_dspt_profile (
       nodeid               integer NOT NULL,
       otc_dspt_profileid   smallint NOT NULL,
       otc_dspt_prfname     char(50) NOT NULL,
       perm_notif           tinyint DEFAULT 0 NOT NULL,
       otc_tm_call_ind      smallint DEFAULT 0 NOT NULL,
       otc_tm_grpcall_ind   smallint DEFAULT 5 NOT NULL,
       otc_tm_crccall_ind   smallint DEFAULT 5 NOT NULL,
       otc_tm_resp          smallint DEFAULT 10 NOT NULL,
       otc_tm_answ          smallint DEFAULT 120 NOT NULL,
       otc_tm_active        smallint DEFAULT 0 NOT NULL,
       otc_comm_type        tinyint DEFAULT 1 NOT NULL,
       talk_req             tinyint DEFAULT 2 NOT NULL,
       reject_abs_memb      tinyint DEFAULT 0 NOT NULL,
       default_enbl         tinyint DEFAULT 0 NOT NULL,
       tm_grp_inter_call    smallint DEFAULT 0 NOT NULL,
       tm_crcl_inter_call   smallint DEFAULT 200 NOT NULL,
       action_on_release    tinyint DEFAULT 0 NOT NULL,
       mmc_leader           tinyint DEFAULT 1 NOT NULL,
       speech_direction     tinyint DEFAULT 1 NOT NULL,
       comp_old_dspt        tinyint DEFAULT 0 NOT NULL,
       hd_audio             tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, otc_dspt_profileid)
);



CREATE UNIQUE INDEX AK1_otc_dspt_profile ON otc_dspt_profile
(
	nodeid                ASC,
	otc_dspt_prfname      ASC
);



CREATE TABLE otc_dspt (
       nodeid               integer NOT NULL,
       otc_dsptdn           integer NOT NULL,
       otc_dspt_circnr      char(2) NOT NULL,
       otc_dspt_name        char(50) NOT NULL,
       otc_system           tinyint DEFAULT 0 NOT NULL,
       otc_dspt_profileid   smallint DEFAULT 1 NOT NULL,
       tangent_enbl         tinyint DEFAULT 0 NOT NULL,
       tangent_priority     tinyint DEFAULT 0 NOT NULL,
       hold_possible        tinyint DEFAULT 0 NOT NULL,
       otc_video_enbl       tinyint DEFAULT 0 NOT NULL,
       fast_picture_update_cycle tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, otc_dsptdn, otc_dspt_circnr),
       FOREIGN KEY (nodeid, otc_dspt_circnr)
                             REFERENCES otc_dspt_circ,
       FOREIGN KEY (nodeid, otc_dspt_profileid)
                             REFERENCES otc_dspt_profile
);



CREATE UNIQUE INDEX AK1_otc_dspt ON otc_dspt
(
	nodeid                ASC,
	otc_dspt_circnr       ASC,
	otc_dspt_name         ASC
);



CREATE TABLE scp_user_service (
       nodeid               integer NOT NULL,
       scp_user_id          integer NOT NULL,
       outsrv_name          smallint NOT NULL,
       outsrv_dscr          WVARCHAR(32) NOT NULL,
       service_id           smallint NOT NULL,
       act_sts              tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, scp_user_id, outsrv_name)
);



CREATE UNIQUE INDEX AK1_scp_user_service ON scp_user_service
(
	nodeid                ASC,
	outsrv_dscr           ASC,
	service_id            ASC
);



CREATE TABLE scp_global (
       nodeid               integer NOT NULL,
       loop_trnk_dstid      smallint NOT NULL,
       cntr_code            char(4) NOT NULL,
       tm_msrnvalidity      smallint DEFAULT 10 NOT NULL,
       tm_msrncheckvalidity smallint DEFAULT 60 NOT NULL,
       project_spec_id      tinyint DEFAULT 0 NOT NULL,
       tm_loopvalidity      smallint DEFAULT 10 NOT NULL,
       tm_loopcheckvalidity smallint DEFAULT 60 NOT NULL,
       np_foreign_nr_mode   tinyint DEFAULT 0 NOT NULL,
       np_dflt_conv_id      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE otc_duty (
       nodeid               integer NOT NULL,
       otc_id               char(3) NOT NULL,
       otc_dspt_circnr      char(2) NOT NULL,
       otc_nodeid           smallint DEFAULT 1 NOT NULL,
       otc_duty_name        char(50) NOT NULL,
       otc_system           tinyint NOT NULL,
       otc_dutydn           char(25),
       otc_duty_profileid   smallint,
       otc_duty_altdn       char(25),
       alt_duty_profileid   smallint,
       tangent_enbl         tinyint DEFAULT 0 NOT NULL,
       tangent_priority     tinyint DEFAULT 0 NOT NULL,
       req_perm_listen      tinyint DEFAULT 0 NOT NULL,
       trunk_otc_id         char(3),
       ana_duty_profileid   smallint,
       hold_possible        tinyint DEFAULT 0 NOT NULL,
       otc_duty_remotedn    char(25) DEFAULT NULL,
       alt_account_enbl     tinyint DEFAULT 0 NOT NULL,
       otc_pedal_enbl       tinyint DEFAULT 0 NOT NULL,
       otc_pedal_dn         char(25) DEFAULT NULL,
       otc_video_enbl       tinyint DEFAULT 0 NOT NULL,
       surveillance_enbl    tinyint DEFAULT 0 NOT NULL,
       fast_picture_update_cycle tinyint DEFAULT 0 NOT NULL,
       def_prec_level       smallint DEFAULT 100 NOT NULL,
       mlpp_common_id       smallint DEFAULT 100 NOT NULL,
       PRIMARY KEY (nodeid, otc_id, otc_dspt_circnr),
       FOREIGN KEY (nodeid, otc_dspt_circnr)
                             REFERENCES otc_dspt_circ,
       FOREIGN KEY (nodeid, otc_nodeid)
                             REFERENCES otc_node
);



CREATE UNIQUE INDEX AK1_otc_duty ON otc_duty
(
	nodeid                ASC,
	otc_dspt_circnr       ASC,
	otc_duty_name         ASC
);



CREATE TABLE agcf_add_impu (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       agcf_impu_alias      char(64) NOT NULL,
       uri_type             tinyint NOT NULL,
       agcf_cw_sts          tinyint DEFAULT 1 NOT NULL,
       dial_tone_type       tinyint DEFAULT 1 NOT NULL,
       hot_sts              tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, agcf_impu_alias, uri_type)
);



CREATE TABLE scp_service_prio (
       nodeid               integer NOT NULL,
       bcsm_type            tinyint NOT NULL,
       outsrv_name          smallint NOT NULL,
       service_prio         tinyint DEFAULT 0 NOT NULL,
       service_key          integer DEFAULT 0 NOT NULL,
       service_side         tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, bcsm_type, outsrv_name, service_key)
);



CREATE TABLE vas_license (
       nodeid               integer NOT NULL,
       outsrv_name          smallint NOT NULL,
       max_vasreq_sec       integer DEFAULT 0 NOT NULL,
       alr_report_val       smallint DEFAULT 90 NOT NULL,
       alr_remove_val       smallint DEFAULT 75 NOT NULL,
       resp_vasreq_sec      varchar(32) DEFAULT '' NOT NULL,
       vaslicense_tmvalid   integer DEFAULT 0 NOT NULL,
       averaging_period     smallint DEFAULT 5 NOT NULL,
       PRIMARY KEY (nodeid, outsrv_name)
);



CREATE TABLE gain_control_profile (
       nodeid               integer NOT NULL,
       agc_profileid        smallint NOT NULL,
       agc_prf_name         char(30) NOT NULL,
       tdm_mode             tinyint DEFAULT 0 NOT NULL,
       tdm_tx_level         tinyint,
       tdm_rx_level         tinyint,
       tdm_anr              tinyint,
       ip_mode              tinyint DEFAULT 0 NOT NULL,
       ip_tx_level          tinyint,
       ip_rx_level          tinyint,
       ip_anr               tinyint,
       PRIMARY KEY (nodeid, agc_profileid)
);



CREATE UNIQUE INDEX AK1_gain_control_profile ON gain_control_profile
(
	nodeid                ASC,
	agc_prf_name          ASC
);



CREATE TABLE mn_ss7ap_plmn (
       nodeid               integer NOT NULL,
       plmn_id              smallint NOT NULL,
       plmn_name            WVARCHAR(32) NOT NULL,
       PRIMARY KEY (nodeid, plmn_id)
);



CREATE UNIQUE INDEX AK1_mn_ss7ap_plmn ON mn_ss7ap_plmn
(
	nodeid                ASC,
	plmn_name             ASC
);



CREATE TABLE map_profile (
       nodeid               integer NOT NULL,
       map_profile_id       smallint NOT NULL,
       map_profile_name     varchar(32) NOT NULL,
       qlty_of_srv          smallint DEFAULT 3 NOT NULL,
       tcap_term            smallint DEFAULT 1 NOT NULL,
       map_tm_short         tinyint DEFAULT 5 NOT NULL,
       map_tm_med           tinyint DEFAULT 15 NOT NULL,
       map_tm_medlong       tinyint DEFAULT 5 NOT NULL,
       map_tm_long          tinyint DEFAULT 30 NOT NULL,
       map_tm_scrty         smallint DEFAULT 600 NOT NULL,
       map_at               smallint DEFAULT 0 NOT NULL,
       map_tm_at            smallint DEFAULT 60 NOT NULL,
       map_tm_ssf1          smallint DEFAULT 10 NOT NULL,
       map_tm_ssf2          smallint DEFAULT 10 NOT NULL,
       map_tm_ssf3          smallint DEFAULT 10 NOT NULL,
       map_tm_scf_ssf1      smallint DEFAULT 5 NOT NULL,
       map_tm_scf_ssf2      smallint DEFAULT 5 NOT NULL,
       map_tm_scf_ssf3      smallint DEFAULT 5 NOT NULL,
       PRIMARY KEY (nodeid, map_profile_id)
);



CREATE UNIQUE INDEX AK1_map_profile ON map_profile
(
	nodeid                ASC,
	map_profile_name      ASC
);



CREATE TABLE map_ssp_service (
       nodeid               integer NOT NULL,
       map_ssp_service_id   smallint NOT NULL,
       map_service_name     varchar(32) DEFAULT 'MAP Default' NOT NULL,
       srvr_id              smallint NOT NULL,
       outsrv_name          smallint DEFAULT 0 NOT NULL,
       plmn_id              smallint NOT NULL,
       map_op_code          smallint DEFAULT 0 NOT NULL,
       map_cpb_set_id       smallint DEFAULT 0 NOT NULL,
       appl_cntx_name       smallint DEFAULT 0 NOT NULL,
       appl_cntx_ver        smallint NOT NULL,
       ss7ap_dest_id        smallint NOT NULL,
       ss7ap_orig_id        smallint NOT NULL,
       map_profile_id       smallint NOT NULL,
       PRIMARY KEY (nodeid, map_ssp_service_id),
       FOREIGN KEY (nodeid, map_profile_id)
                             REFERENCES map_profile,
       FOREIGN KEY (nodeid, map_cpb_set_id)
                             REFERENCES map_ati,
       FOREIGN KEY (nodeid, ss7ap_orig_id)
                             REFERENCES ss7ap_orig_addr,
       FOREIGN KEY (nodeid, ss7ap_dest_id)
                             REFERENCES ss7ap_dest_addr
);



CREATE UNIQUE INDEX AK1_map_ssp_service ON map_ssp_service
(
	nodeid                ASC,
	map_service_name      ASC
);



CREATE UNIQUE INDEX AK2_map_ssp_service ON map_ssp_service
(
	nodeid                ASC,
	srvr_id               ASC,
	outsrv_name           ASC,
	plmn_id               ASC
);



CREATE TABLE scp_spec_nr_list (
       nodeid               integer NOT NULL,
       scp_spec_nr          varchar(10) NOT NULL,
       scp_online_chrgnr    varchar(10),
       spec_nr_type         tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, scp_spec_nr)
);



CREATE TABLE mn_scp_business_group (
       nodeid               integer NOT NULL,
       bgid                 integer NOT NULL,
       group_name           WCHAR(32) NOT NULL,
       PRIMARY KEY (nodeid, bgid)
);



CREATE UNIQUE INDEX AK1_mn_scp_business_group ON mn_scp_business_group
(
	nodeid                ASC,
	group_name            ASC
);



CREATE TABLE scp_diversion (
       nodeid               integer NOT NULL,
       service_id           smallint NOT NULL,
       div_nr               varchar(25) NOT NULL,
       list_mode            smallint NOT NULL,
       scp_list_id          integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, service_id)
);



CREATE TABLE edp_service (
       nodeid               integer NOT NULL,
       outsrv_name          smallint NOT NULL,
       dpnr                 smallint NOT NULL,
       dpmonitor_mode       tinyint NOT NULL,
       dpleg_id             tinyint NOT NULL,
       dpspec_crit          tinyint NOT NULL,
       dpspec_crit_val      integer NOT NULL,
       PRIMARY KEY (nodeid, outsrv_name, dpnr, dpmonitor_mode, dpleg_id)
);



CREATE TABLE cap_profile (
       nodeid               integer NOT NULL,
       cap_profile_id       smallint NOT NULL,
       cap_profile_name     varchar(32) DEFAULT 'CAP Default' NOT NULL,
       qlty_of_srv          smallint DEFAULT 3 NOT NULL,
       tcap_term            smallint DEFAULT 1 NOT NULL,
       cap_tm_short         tinyint DEFAULT 5 NOT NULL,
       cap_tm_med           tinyint DEFAULT 30 NOT NULL,
       cap_tm_long          smallint DEFAULT 600 NOT NULL,
       tm_scrty             smallint DEFAULT 600 NOT NULL,
       ss7ap_at             smallint DEFAULT 0 NOT NULL,
       ss7ap_tm_at          smallint DEFAULT 60 NOT NULL,
       cap_tm_ssf1          smallint DEFAULT 10 NOT NULL,
       cap_tm_ssf2          smallint DEFAULT 10 NOT NULL,
       cap_tm_ssf3          smallint DEFAULT 10 NOT NULL,
       cap_tm_scf_ssf1      smallint DEFAULT 5 NOT NULL,
       cap_tm_scf_ssf2      smallint DEFAULT 5 NOT NULL,
       cap_tm_scf_ssf3      smallint DEFAULT 5 NOT NULL,
       cap_tm_scf_rt        smallint DEFAULT 10 NOT NULL,
       PRIMARY KEY (nodeid, cap_profile_id)
);



CREATE UNIQUE INDEX AK1_cap_profile ON cap_profile
(
	nodeid                ASC,
	cap_profile_name      ASC
);



CREATE TABLE cap_ssp_param (
       nodeid               integer NOT NULL,
       ssp_param_id         smallint NOT NULL,
       ssp_param_name       varchar(32) DEFAULT 'CAP SSP default' NOT NULL,
       camel_phase          tinyint DEFAULT 0 NOT NULL,
       cap_erb              tinyint DEFAULT 0 NOT NULL,
       cap_acr              tinyint DEFAULT 0 NOT NULL,
       cap_cirp             tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ssp_param_id)
);



CREATE UNIQUE INDEX AK1_cap_ssp_param ON cap_ssp_param
(
	nodeid                ASC,
	ssp_param_name        ASC
);



CREATE TABLE cap_ssp_service (
       nodeid               integer NOT NULL,
       srvr_id              smallint NOT NULL,
       outsrv_name          smallint NOT NULL,
       plmn_id              smallint NOT NULL,
       ss7ap_service_name   varchar(32) DEFAULT 'CAP Default' NOT NULL,
       ss7ap_srv_key        integer NOT NULL,
       appl_cntx_name       smallint NOT NULL,
       ss7ap_dest_id        smallint,
       ss7ap_orig_id        smallint,
       cap_profile_id       smallint DEFAULT 1 NOT NULL,
       ssp_param_id         smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, srvr_id, outsrv_name),
       FOREIGN KEY (nodeid, cap_profile_id)
                             REFERENCES cap_profile,
       FOREIGN KEY (nodeid, ss7ap_orig_id)
                             REFERENCES ss7ap_orig_addr,
       FOREIGN KEY (nodeid, ssp_param_id)
                             REFERENCES cap_ssp_param,
       FOREIGN KEY (nodeid, ss7ap_dest_id)
                             REFERENCES ss7ap_dest_addr
);



CREATE UNIQUE INDEX AK1_cap_ssp_service ON cap_ssp_service
(
	nodeid                ASC,
	ss7ap_service_name    ASC
);



CREATE TABLE ftal_line (
       nodeid               integer NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ftal_dn              varchar(20) NOT NULL,
       ftal_id              tinyint NOT NULL,
       ftal_type            tinyint DEFAULT 0 NOT NULL,
       ftal_name            varchar(30) NOT NULL,
       dn                   integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, modulenr, portnr, ftal_dn),
       FOREIGN KEY (nodeid, modulenr, portnr)
                             REFERENCES access
);



CREATE TABLE fwk_lb_user (
       nodeid               integer NOT NULL,
       fwk_lb_code          char(2) NOT NULL,
       fwk_fn_to_lb_user    varchar(25) DEFAULT NULL,
       fwk_fn_from_lb_user  varchar(25) DEFAULT NULL,
       fwk_lb_text          varchar(50) DEFAULT NULL,
       PRIMARY KEY (nodeid, fwk_lb_code)
);



CREATE TABLE fwk_uus_lb (
       nodeid               integer NOT NULL,
       fwk_fn_variant       tinyint DEFAULT 1 NOT NULL,
       fwk_text_present     tinyint DEFAULT 1 NOT NULL,
       fwk_lb_line_fn       varchar(25) DEFAULT NULL,
       fwk_send_lct         tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE scp_pool (
       nodeid               integer NOT NULL,
       ndc                  char(6) NOT NULL,
       min_nr               varchar(15) NOT NULL,
       nr_counter           integer DEFAULT 1 NOT NULL,
       nr_length            tinyint DEFAULT 0 NOT NULL,
       pool_type            tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ndc, min_nr)
);



CREATE TABLE map_plmn (
       nodeid               integer NOT NULL,
       nr_type              tinyint NOT NULL,
       nr_mask              varchar(25) NOT NULL,
       plmn_id              smallint NOT NULL,
       PRIMARY KEY (nodeid, nr_type, nr_mask)
);



CREATE TABLE cap_scp_param (
       nodeid               integer NOT NULL,
       scp_param_id         smallint NOT NULL,
       scp_param_name       varchar(32) DEFAULT 'CAP SCP default' NOT NULL,
       camel_phase          tinyint DEFAULT 0 NOT NULL,
       cap_con              tinyint DEFAULT 1 NOT NULL,
       cap_con_origcdpn     tinyint DEFAULT 1 NOT NULL,
       cap_con_crgnr        tinyint DEFAULT 1 NOT NULL,
       cap_can              tinyint DEFAULT 1 NOT NULL,
       cap_cue              tinyint DEFAULT 1 NOT NULL,
       cap_fci              tinyint DEFAULT 1 NOT NULL,
       cap_rrb              tinyint DEFAULT 1 NOT NULL,
       cap_rc               tinyint DEFAULT 1 NOT NULL,
       cap_rt               tinyint DEFAULT 1 NOT NULL,
       cap_invoke_grp       tinyint DEFAULT 0 NOT NULL,
       cap_con_gennr        tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, scp_param_id)
);



CREATE UNIQUE INDEX AK1_cap_scp_param ON cap_scp_param
(
	nodeid                ASC,
	scp_param_name        ASC
);



CREATE TABLE cap_scp_service (
       nodeid               integer NOT NULL,
       ssp_id               smallint NOT NULL,
       outsrv_name          smallint NOT NULL,
       plmn_id              smallint NOT NULL,
       ss7ap_service_name   varchar(32) DEFAULT 'CAP Default' NOT NULL,
       ss7ap_srv_key        integer NOT NULL,
       appl_cntx_name       smallint NOT NULL,
       ss7ap_dest_id        smallint,
       ss7ap_orig_id        smallint,
       cap_profile_id       smallint NOT NULL,
       scp_param_id         smallint NOT NULL,
       PRIMARY KEY (nodeid, ssp_id, ss7ap_srv_key),
       FOREIGN KEY (nodeid, cap_profile_id)
                             REFERENCES cap_profile,
       FOREIGN KEY (nodeid, ss7ap_orig_id)
                             REFERENCES ss7ap_orig_addr,
       FOREIGN KEY (nodeid, scp_param_id)
                             REFERENCES cap_scp_param,
       FOREIGN KEY (nodeid, ss7ap_dest_id)
                             REFERENCES ss7ap_dest_addr
);



CREATE UNIQUE INDEX AK1_cap_scp_service ON cap_scp_service
(
	nodeid                ASC,
	ss7ap_service_name    ASC
);



CREATE TABLE otc_trunk_profile (
       nodeid               integer NOT NULL,
       trunk_profile_id     smallint NOT NULL,
       otc_trnk_prf_name    char(50) NOT NULL,
       otc_crcl_allow       tinyint NOT NULL,
       ntf_tangent          tinyint DEFAULT 0 NOT NULL,
       present_on_dspt      tinyint DEFAULT 1 NOT NULL,
       dspt_disc_allow      tinyint DEFAULT 0 NOT NULL,
       otc_tm_resp          smallint DEFAULT 10 NOT NULL,
       otc_tm_answ          smallint DEFAULT 120 NOT NULL,
       otc_tm_active        smallint DEFAULT 0 NOT NULL,
       def_conn_state       tinyint DEFAULT 2 NOT NULL,
       otc_comm_type        tinyint DEFAULT 1 NOT NULL,
       talk_req             tinyint DEFAULT 2 NOT NULL,
       loop_back_allow      tinyint DEFAULT 0 NOT NULL,
       default_enbl         tinyint DEFAULT 1 NOT NULL,
       receiver_type        smallint DEFAULT 0 NOT NULL,
       dspt_calls_allow     tinyint DEFAULT 0 NOT NULL,
       otc_echo_control     tinyint DEFAULT 0 NOT NULL,
       tm_echo_control      smallint DEFAULT 0 NOT NULL,
       mmc_leader           tinyint DEFAULT 1 NOT NULL,
       speech_direction     tinyint DEFAULT 1 NOT NULL,
       radio_tangent_type   tinyint DEFAULT 0 NOT NULL,
       radio_disconnect_type tinyint DEFAULT 0 NOT NULL,
       otc_dspt_profileid   smallint DEFAULT '-2' NOT NULL,
       hd_audio             tinyint DEFAULT 0 NOT NULL,
       tm_rs_release        smallint DEFAULT 60 NOT NULL,
       tdm_rtp_id           smallint DEFAULT '-1' NOT NULL,
       PRIMARY KEY (nodeid, trunk_profile_id)
);



CREATE UNIQUE INDEX AK1_otc_trunk_profile ON otc_trunk_profile
(
	nodeid                ASC,
	otc_trnk_prf_name     ASC
);



CREATE TABLE otc_trunk (
       nodeid               integer NOT NULL,
       otc_trunkid          smallint NOT NULL,
       otc_dspt_circnr      char(2) NOT NULL,
       otc_nodeid           smallint DEFAULT 0 NOT NULL,
       trunk_name           char(50) NOT NULL,
       otc_id               char(3),
       otc_system           tinyint DEFAULT 0 NOT NULL,
       otc_trunkdn          char(25) NOT NULL,
       trunk_profile_id     smallint DEFAULT 1 NOT NULL,
       tangent_enbl         tinyint DEFAULT 0 NOT NULL,
       tangent_priority     tinyint DEFAULT 0 NOT NULL,
       req_perm_listen      tinyint DEFAULT 0 NOT NULL,
       otc_trunk_remotedn   varchar(25) DEFAULT NULL,
       otc_pedal_enbl       tinyint DEFAULT 0 NOT NULL,
       otc_pedal_dn         char(25) DEFAULT NULL,
       otc_intr_adapt_dn    varchar(25) DEFAULT NULL,
       PRIMARY KEY (nodeid, otc_trunkid, otc_dspt_circnr, otc_nodeid),
       FOREIGN KEY (nodeid, otc_dspt_circnr)
                             REFERENCES otc_dspt_circ,
       FOREIGN KEY (nodeid, otc_nodeid)
                             REFERENCES otc_node,
       FOREIGN KEY (nodeid, trunk_profile_id)
                             REFERENCES otc_trunk_profile
);



CREATE UNIQUE INDEX AK1_otc_trunk ON otc_trunk
(
	nodeid                ASC,
	otc_dspt_circnr       ASC,
	trunk_name            ASC
);



CREATE TABLE video_surveillance (
       nodeid               integer NOT NULL,
       surv_id              smallint NOT NULL,
       surv_suppl_id        smallint NOT NULL,
       surv_own_ip_addr     char(15),
       surv_own_port        integer,
       surv_rem_ip_addr     char(15),
       surv_rem_port        integer,
       PRIMARY KEY (nodeid, surv_id, surv_suppl_id)
);



CREATE TABLE otc_duty_profile (
       nodeid               integer NOT NULL,
       otc_duty_profileid   smallint NOT NULL,
       otc_duty_prfname     char(50) NOT NULL,
       otc_crcl_allow       tinyint DEFAULT 1 NOT NULL,
       ntf_tangent          tinyint DEFAULT 0 NOT NULL,
       present_on_dspt      tinyint DEFAULT 1 NOT NULL,
       dspt_disc_allow      tinyint DEFAULT 0 NOT NULL,
       otc_ring_ntfy        tinyint DEFAULT 0 NOT NULL,
       enbl_parall_call     tinyint DEFAULT 0 NOT NULL,
       otc_tm_resp          smallint DEFAULT 10 NOT NULL,
       otc_tm_answ          smallint DEFAULT 120 NOT NULL,
       otc_tm_active        smallint DEFAULT 0 NOT NULL,
       otc_comm_type        tinyint DEFAULT 1 NOT NULL,
       rering_type          tinyint DEFAULT 2 NOT NULL,
       talk_req             tinyint DEFAULT 2 NOT NULL,
       loop_back_allow      tinyint DEFAULT 0 NOT NULL,
       default_enbl         tinyint DEFAULT 0 NOT NULL,
       dspt_calls_allow     tinyint DEFAULT 0 NOT NULL,
       otc_echo_control     tinyint DEFAULT 0 NOT NULL,
       tm_echo_control      smallint DEFAULT 0 NOT NULL,
       mmc_leader           tinyint DEFAULT 0 NOT NULL,
       speech_direction     tinyint DEFAULT 1 NOT NULL,
       otc_dspt_profileid   smallint DEFAULT '-3' NOT NULL,
       hd_audio             tinyint DEFAULT 0 NOT NULL,
       perm_conn            tinyint DEFAULT 0 NOT NULL,
       perm_conn_retry_tm   smallint DEFAULT 60 NOT NULL,
       radio_base_station_mode tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, otc_duty_profileid)
);



CREATE UNIQUE INDEX AK1_otc_duty_profile ON otc_duty_profile
(
	nodeid                ASC,
	otc_duty_prfname      ASC
);



CREATE TABLE np_sent_scp_conv (
       nodeid               integer NOT NULL,
       conv_id              smallint NOT NULL,
       conv_name            varchar(32) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       next_conv_id         smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, conv_id)
);



CREATE TABLE lb_call_code (
       nodeid               integer NOT NULL,
       lb_morse_conv_var    tinyint NOT NULL,
       lb_nr_code           tinyint NOT NULL,
       lb_morse_code        char(8) NOT NULL,
       morse_purpose        tinyint NOT NULL,
       PRIMARY KEY (nodeid, lb_morse_conv_var, lb_nr_code)
);



CREATE TABLE np_rec_scp_conv (
       nodeid               integer NOT NULL,
       numtype              smallint NOT NULL,
       rec_prefix           char(25) NOT NULL,
       dicon                char(25) NOT NULL,
       new_numtype          smallint NOT NULL,
       PRIMARY KEY (nodeid, numtype, rec_prefix)
);



commit work;


