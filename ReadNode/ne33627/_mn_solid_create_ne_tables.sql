




set catalog SOLID_DB_CATALOG;
commit work;











CREATE TABLE atsk_port (
       nodeid               integer NOT NULL,
       sec_interface_id     smallint NOT NULL,
       v5_access_id         smallint NOT NULL,
       atsk_port_code       integer NOT NULL,
       PRIMARY KEY (nodeid, sec_interface_id, v5_access_id)
);



CREATE TABLE eth_interface (
       nodeid               integer NOT NULL,
       eth_intf_id          smallint NOT NULL,
       eth_intf_name        char(20) NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
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



CREATE TABLE dsp_attenuation (
       nodeid               integer NOT NULL,
       attenuation          smallint NOT NULL,
       attenuation_const    smallint NOT NULL,
       PRIMARY KEY (nodeid, attenuation)
);



CREATE TABLE h323_gateway (
       nodeid               integer NOT NULL,
       h323_gw_id           char(10) NOT NULL,
       PRIMARY KEY (nodeid, h323_gw_id)
);



CREATE TABLE node (
       nodeid               integer NOT NULL,
       node_name            char(30) NOT NULL,
       dtmf_rec             smallint NOT NULL,
       r2mf_rec             smallint NOT NULL,
       ptmf_rec             smallint NOT NULL,
       sndmf_rec            smallint NOT NULL,
       aonr_rec             smallint NOT NULL,
       congacc              smallint NOT NULL,
       congdisc             smallint NOT NULL,
       congon               smallint NOT NULL,
       congoff              smallint NOT NULL,
       ss7_type             smallint NOT NULL,
       max_nrnuc            smallint NOT NULL,
       rexecid              smallint NOT NULL,
       mckpacktype          smallint NOT NULL,
       chargeintmask        smallint NOT NULL,
       traffic_scan         smallint NOT NULL,
       sac_ringtone_dur     smallint NOT NULL,
       sac_freq_dur         smallint NOT NULL,
       sac_delay_time       smallint NOT NULL,
       sac_mf_receiver      smallint NOT NULL,
       restart_mtp          smallint NOT NULL,
       ap_alrpri            smallint DEFAULT 5 NOT NULL,
       max_nr_ss7           smallint DEFAULT 4 NOT NULL,
       max_nr_hdlc          smallint DEFAULT 17 NOT NULL,
       max_nr_cas           smallint DEFAULT 11 NOT NULL,
       sec_bat_voltage      smallint NOT NULL,
       univ_dsp_percent     smallint DEFAULT 33 NOT NULL,
       conf_dsp_percent     smallint DEFAULT 25 NOT NULL,
       statistics_period    smallint DEFAULT 15 NOT NULL,
       max_rack_size        smallint NOT NULL,
       nuc_max_faxmodedur   smallint DEFAULT 5 NOT NULL,
       nuc_datamodedur      smallint DEFAULT 480 NOT NULL,
       pcu_1_func           smallint DEFAULT 1 NOT NULL,
       pcu_2_func           smallint DEFAULT 1 NOT NULL,
       dsp_ch_mode          smallint DEFAULT 0 NOT NULL,
       voice_server_dtmf    smallint DEFAULT 0 NOT NULL,
       sorm_alarm_info      smallint DEFAULT 1 NOT NULL,
       r1mf_rec             smallint NOT NULL,
       h248text_encodtype   smallint DEFAULT 1 NOT NULL,
       h248_version         smallint DEFAULT 1 NOT NULL,
       faxmod_tone_relay    smallint DEFAULT 0 NOT NULL,
       faxmod_tone_txplt    smallint DEFAULT 101 NOT NULL,
       faxmod_tone_rxplt    smallint DEFAULT 101 NOT NULL,
       dsp_ext_jitt_buff    smallint DEFAULT 0 NOT NULL,
       dsp_ext_pack_per     smallint DEFAULT 0 NOT NULL,
       hair_pinning         tinyint DEFAULT 1 NOT NULL,
       proxy_rtcp           tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid)
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



CREATE TABLE dns_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       domain_name          char(80),
       primary_server       char(80),
       secondary_server     char(80),
       tertiary_server      char(80),
       PRIMARY KEY (nodeid, dummy_pk)
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



CREATE TABLE sys_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_intf_type        smallint NOT NULL,
       mn_intf_id           integer,
       huntmode             smallint NOT NULL,
       sys_intf_oosi        smallint NOT NULL,
       sys_intf_state       smallint NOT NULL,
       sys_intf_overload    smallint NOT NULL,
       sys_intf_mmbl        smallint NOT NULL,
       used_lm              tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id)
);



CREATE TABLE v5_access (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       v5_access_type       smallint NOT NULL,
       v5_access_id         smallint NOT NULL,
       log_com_ch_id        integer,
       access_equipped      smallint NOT NULL,
       access_block         smallint NOT NULL,
       access_state         smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id, v5_access_type, v5_access_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES sys_interface
);



CREATE TABLE dsp_generator (
       nodeid               integer NOT NULL,
       dspgenid             smallint NOT NULL,
       dspid                smallint NOT NULL,
       dsplinkid            smallint NOT NULL,
       dspchid              smallint NOT NULL,
       dsp_gen_type         smallint NOT NULL,
       PRIMARY KEY (nodeid, dspgenid)
);



CREATE TABLE tone_signal (
       nodeid               integer NOT NULL,
       tone_sigid           smallint NOT NULL,
       frequency1           smallint NOT NULL,
       level1               smallint NOT NULL,
       level1_db            smallint NOT NULL,
       frequency2           smallint NOT NULL,
       level2               smallint NOT NULL,
       level2_db            smallint NOT NULL,
       dspgenid             smallint NOT NULL,
       PRIMARY KEY (nodeid, tone_sigid),
       FOREIGN KEY (nodeid, dspgenid)
                             REFERENCES dsp_generator
);



CREATE TABLE telnet_config (
       nodeid               integer NOT NULL,
       telnet_port          integer NOT NULL,
       telnet_timeout       smallint NOT NULL,
       telnet_password      char(33),
       PRIMARY KEY (nodeid, telnet_port)
);



CREATE TABLE codec (
       nodeid               integer NOT NULL,
       codec_id             smallint NOT NULL,
       codec_name           smallint DEFAULT 144 NOT NULL,
       codec_desc           char(30) NOT NULL,
       packet_time          smallint DEFAULT 20 NOT NULL,
       rtp_payload_type     smallint DEFAULT 101 NOT NULL,
       silence_suppr        smallint DEFAULT 0 NOT NULL,
       ss_threshold         smallint DEFAULT '-40' NOT NULL,
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
       PRIMARY KEY (nodeid, codec_feature_id),
       FOREIGN KEY (nodeid, prio10_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio1_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio9_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio8_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio7_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio6_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio5_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio4_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio3_codecid)
                             REFERENCES codec,
       FOREIGN KEY (nodeid, prio2_codecid)
                             REFERENCES codec
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
       dtmf_relay_mode      smallint DEFAULT 1 NOT NULL,
       expr_time            smallint DEFAULT 1000 NOT NULL,
       pulse_dur            smallint DEFAULT 70 NOT NULL,
       pause_dur            smallint DEFAULT 120 NOT NULL,
       level_att            smallint DEFAULT 0 NOT NULL,
       rtp_payload_type     smallint DEFAULT 101 NOT NULL,
       rx_dig_gain          smallint DEFAULT 0 NOT NULL,
       tx_dig_gain          smallint DEFAULT 0 NOT NULL,
       dsp_ip_param1        smallint,
       dsp_ip_param2        smallint,
       dsp_ip_param3        smallint,
       dsp_ip_param4        smallint,
       dsp_ip_param5        smallint,
       vad_threshold        tinyint DEFAULT '-30' NOT NULL,
       time_dtct_silence    smallint DEFAULT 500 NOT NULL,
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
       echo_canc            smallint DEFAULT 0 NOT NULL,
       rtp_reserve1         smallint,
       PRIMARY KEY (nodeid, tdm_rtp_id),
       FOREIGN KEY (nodeid, dsp_ip_feature_id)
                             REFERENCES dsp_ip_feature,
       FOREIGN KEY (nodeid, audio_codec_set)
                             REFERENCES codec_set,
       FOREIGN KEY (nodeid, fax_codec_set)
                             REFERENCES codec_set,
       FOREIGN KEY (nodeid, data_codec_set)
                             REFERENCES codec_set,
       FOREIGN KEY (nodeid, video_codec_set)
                             REFERENCES codec_set
);



CREATE TABLE nailed_up_con (
       nodeid               integer NOT NULL,
       nuc_id               smallint NOT NULL,
       nuc_prps             smallint DEFAULT 0 NOT NULL,
       nuc_member1_type     smallint NOT NULL,
       nuc_member2_type     smallint NOT NULL,
       member1_status       smallint DEFAULT 0 NOT NULL,
       member2_status       smallint DEFAULT 0 NOT NULL,
       nuc_type             smallint DEFAULT 0 NOT NULL,
       required_status      smallint DEFAULT 1 NOT NULL,
       current_status       smallint DEFAULT 0 NOT NULL,
       nuc_param1           smallint,
       nuc_param2           smallint,
       nuc_desc             char(35) DEFAULT '' NOT NULL,
       nuc_pair_id          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, nuc_id)
);



CREATE TABLE nuc_ip_data (
       nodeid               integer NOT NULL,
       nuc_id               smallint NOT NULL,
       nuc_side             smallint NOT NULL,
       tdm_rtp_id           smallint NOT NULL,
       rtp_stream_dir       smallint DEFAULT 1 NOT NULL,
       max_fax_mode_dur     smallint DEFAULT 0 NOT NULL,
       data_mode_dur        smallint NOT NULL,
       loc_rtp_ip_addr      char(15) NOT NULL,
       loc_rtp_port         integer NOT NULL,
       loc_rtcp_ip_addr     char(15) NOT NULL,
       loc_rtcp_port        smallint NOT NULL,
       rem_rtp_ip_addr      char(15) NOT NULL,
       rem_rtp_port         integer NOT NULL,
       rem_rtcp_ip_addr     char(15) NOT NULL,
       rem_rtcp_port        integer NOT NULL,
       nuc_ip_param1        smallint,
       nuc_ip_param2        smallint,
       PRIMARY KEY (nodeid, nuc_id, nuc_side),
       FOREIGN KEY (nodeid, nuc_id)
                             REFERENCES nailed_up_con,
       FOREIGN KEY (nodeid, tdm_rtp_id)
                             REFERENCES tdm_rtp_profile
);



CREATE TABLE chap_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       chall_int            smallint NOT NULL,
       max_retr             smallint NOT NULL,
       retr_int             smallint NOT NULL,
       local_username       char(24) NOT NULL,
       chap_enable          smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
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



CREATE TABLE casmux_param (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       scan_pause           smallint NOT NULL,
       conn_refresh_time    smallint NOT NULL,
       casmux_mode          smallint NOT NULL,
       add_mode_par         smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE alarm_panel (
       nodeid               integer NOT NULL,
       ap_id                smallint NOT NULL,
       ap_equp              smallint NOT NULL,
       PRIMARY KEY (nodeid, ap_id)
);



CREATE TABLE ap_ext_error (
       nodeid               integer NOT NULL,
       ap_id                smallint NOT NULL,
       ap_ext               smallint NOT NULL,
       errcod               integer NOT NULL,
       alr_detect           smallint NOT NULL,
       PRIMARY KEY (nodeid, ap_id, ap_ext),
       FOREIGN KEY (nodeid, ap_id)
                             REFERENCES alarm_panel
);



CREATE TABLE iua_appl_server (
       nodeid               integer NOT NULL,
       as_id                smallint NOT NULL,
       iua_side             smallint NOT NULL,
       as_state             smallint NOT NULL,
       traffic_mode         smallint NOT NULL,
       tm_recov             smallint NOT NULL,
       tm_activate          smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, as_id)
);



CREATE TABLE iua_intf_profile (
       nodeid               integer NOT NULL,
       iua_intf_prf_id      smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       iid_type             smallint NOT NULL,
       iua_access_stat      smallint NOT NULL,
       iua_hb               smallint NOT NULL,
       prot_ver             smallint NOT NULL,
       tm_up_init           smallint NOT NULL,
       tm_up                smallint NOT NULL,
       nr_up_try            smallint NOT NULL,
       tm_down_init         smallint NOT NULL,
       tm_down              smallint NOT NULL,
       nr_down_try          smallint NOT NULL,
       tm_hb                smallint NOT NULL,
       context              smallint NOT NULL,
       chunk_lifetime       smallint NOT NULL,
       delivery             smallint NOT NULL,
       bundle               smallint NOT NULL,
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



CREATE UNIQUE INDEX AK1_iua_intf_profi ON iua_intf_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE iua_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       as_id                smallint NOT NULL,
       asp_id               integer NOT NULL,
       init_state           smallint NOT NULL,
       iua_assoc_repeat     smallint DEFAULT 0 NOT NULL,
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
                             REFERENCES sys_interface,
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



CREATE TABLE ne_hostname (
       nodeid               integer NOT NULL,
       hostname             char(30) NOT NULL,
       hostname1            char(30),
       hostname2            char(30),
       PRIMARY KEY (nodeid)
);



CREATE TABLE disk_test (
       nodeid               integer NOT NULL,
       disk_id              smallint NOT NULL,
       device_name          char(50),
       min_temp             smallint DEFAULT 0 NOT NULL,
       max_temp             smallint DEFAULT 70 NOT NULL,
       min_spare_blocks     smallint DEFAULT 25 NOT NULL,
       PRIMARY KEY (nodeid, disk_id)
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
       stream_for_asptm     smallint DEFAULT '-1' NOT NULL,
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
       m2ua_prf_id          smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, m2ua_as_id),
       FOREIGN KEY (nodeid, m2ua_prf_id)
                             REFERENCES m2ua_profile
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



CREATE TABLE host (
       nodeid               integer NOT NULL,
       host_name            char(30) NOT NULL,
       host_ip_addr         char(15) NOT NULL,
       PRIMARY KEY (nodeid, host_name)
);



CREATE TABLE m3ua_asp (
       nodeid               integer NOT NULL,
       m3ua_asp_id          smallint NOT NULL,
       dpc_ss7_dstid        smallint NOT NULL,
       m3ua_register_mode   smallint DEFAULT 2 NOT NULL,
       PRIMARY KEY (nodeid, m3ua_asp_id)
);



CREATE TABLE m3ua_profile (
       nodeid               integer NOT NULL,
       m3ua_prf_id          smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       m3ua_version         smallint NOT NULL,
       tm_tr                smallint NOT NULL,
       tm_hb                smallint NOT NULL,
       tm_ack               smallint NOT NULL,
       tm_paud              smallint NOT NULL,
       m3ua_hb              smallint NOT NULL,
       sp_lsh_method        smallint NOT NULL,
       stream_lsh_method    smallint NOT NULL,
       fail_over_buff       integer NOT NULL,
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
       m3ua_side            smallint NOT NULL,
       m3ua_type            smallint NOT NULL,
       dpc_ss7_dstid        smallint NOT NULL,
       traffic_mode         smallint NOT NULL,
       sg_traffic_mode      smallint DEFAULT 1 NOT NULL,
       sigtrace_req         smallint NOT NULL,
       m3ua_prf_id          smallint NOT NULL,
       PRIMARY KEY (nodeid, m3ua_as_id),
       FOREIGN KEY (nodeid, m3ua_prf_id)
                             REFERENCES m3ua_profile
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
       PRIMARY KEY (nodeid, m3ua_as_assoc_id),
       FOREIGN KEY (nodeid, m3ua_as_id)
                             REFERENCES m3ua_appl_server,
       FOREIGN KEY (nodeid, m3ua_asp_id)
                             REFERENCES m3ua_asp
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
       PRIMARY KEY (nodeid, boardnr)
);



CREATE TABLE port (
       nodeid               integer NOT NULL,
       portnr               smallint NOT NULL,
       port_id              smallint NOT NULL,
       boardnr              smallint NOT NULL,
       port_equip           smallint NOT NULL,
       port_oosi            smallint NOT NULL,
       sigtrace_req         smallint DEFAULT 8 NOT NULL,
       port_mlb             smallint NOT NULL,
       log_stat_group_id    smallint NOT NULL,
       port_profile_type    smallint NOT NULL,
       port_profile_id      smallint NOT NULL,
       port_sys_name        char(32) NOT NULL,
       phy_activity         tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, portnr),
       FOREIGN KEY (nodeid, boardnr)
                             REFERENCES board
);



CREATE UNIQUE INDEX i_portsysaccid ON port
(
	nodeid                ASC,
	port_id               ASC,
	boardnr               ASC,
	port_profile_type     ASC
);



CREATE TABLE echo_control_dev (
       nodeid               integer NOT NULL,
       ecd_id               smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ecd_type             smallint NOT NULL,
       ecd_init             smallint NOT NULL,
       ecd_on               smallint NOT NULL,
       ecd_off              smallint NOT NULL,
       PRIMARY KEY (nodeid, ecd_id),
       FOREIGN KEY (nodeid, portnr)
                             REFERENCES port
);



CREATE UNIQUE INDEX i_echo_control ON echo_control_dev
(
	modulenr              DESC,
	portnr                ASC
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



CREATE TABLE lcp_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       conf_req_send_int    smallint NOT NULL,
       echo_req_send_int    smallint NOT NULL,
       max_conf_fail        smallint NOT NULL,
       max_conf_req         smallint NOT NULL,
       max_term_req         smallint NOT NULL,
       max_unack_echo_req   smallint NOT NULL,
       mru                  smallint NOT NULL,
       term_req_int         smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE ipcp_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       conf_req_send_int    smallint NOT NULL,
       max_conf_req         smallint NOT NULL,
       term_req_int         smallint NOT NULL,
       max_term_req         smallint NOT NULL,
       vjc_on               smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE trunk (
       nodeid               integer NOT NULL,
       trunkid              smallint NOT NULL,
       modulenr             integer NOT NULL,
       portnr               smallint NOT NULL,
       ci                   smallint NOT NULL,
       trnkgrpid            smallint NOT NULL,
       cic                  smallint NOT NULL,
       trunk_equp           smallint NOT NULL,
       trunk_oosi_dyn       smallint NOT NULL,
       trunk_oosi_spd       smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, trunkid),
       FOREIGN KEY (nodeid, portnr)
                             REFERENCES port
);



CREATE UNIQUE INDEX i_trunkch ON trunk
(
	nodeid                ASC,
	portnr                ASC,
	ci                    ASC
);



CREATE TABLE sigtrace_actions (
       nodeid               integer NOT NULL,
       action               smallint NOT NULL,
       unitid               char(64),
       PRIMARY KEY (nodeid, action)
);



CREATE TABLE ss7_destination (
       nodeid               integer NOT NULL,
       ss7_dstid            smallint NOT NULL,
       ntwrkind             smallint DEFAULT 2 NOT NULL,
       point_code           smallint NOT NULL,
       point_type           smallint NOT NULL,
       ss7_linksetid1       smallint NOT NULL,
       ss7_linksetid2       smallint NOT NULL,
       ss7_linksetid3       smallint NOT NULL,
       sls_bit              smallint NOT NULL,
       dststs               smallint NOT NULL,
       msudiscrut           integer NOT NULL,
       tm_isup_pause        smallint NOT NULL,
       sendgrs              smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       ss7_linksetid4       smallint DEFAULT 0 NOT NULL,
       ss7_pc_format_id     tinyint DEFAULT 1 NOT NULL,
       ss7_dst_equip        tinyint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, ss7_dstid)
);



CREATE TABLE ss7_link_set (
       nodeid               integer NOT NULL,
       ss7_linksetid        smallint NOT NULL,
       ss7_dstid            smallint NOT NULL,
       linkset_type         smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, ss7_linksetid),
       FOREIGN KEY (nodeid, ss7_dstid)
                             REFERENCES ss7_destination
);



CREATE TABLE ss7_link (
       nodeid               integer NOT NULL,
       ss7_linkid           smallint NOT NULL,
       ss7_linksetid        smallint NOT NULL,
       sys_intf_id          integer,
       portnr               smallint NOT NULL,
       ci                   smallint NOT NULL,
       cda_id               smallint NOT NULL,
       errcormeth           smallint NOT NULL,
       slc                  smallint NOT NULL,
       link_status          integer NOT NULL,
       nosuerr              integer NOT NULL,
       msuocttx             integer NOT NULL,
       msuoctrx             integer NOT NULL,
       msudisccng           integer NOT NULL,
       add_hdlc_flags       smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       d_bit_sf             smallint DEFAULT 0 NOT NULL,
       ocm_threshold        integer DEFAULT 40 NOT NULL,
       PRIMARY KEY (nodeid, ss7_linkid),
       FOREIGN KEY (nodeid, ss7_linksetid)
                             REFERENCES ss7_link_set,
       FOREIGN KEY (nodeid, portnr)
                             REFERENCES port
);



CREATE TABLE out_calling_conv (
       nodeid               integer NOT NULL,
       cgp_numtype          smallint NOT NULL,
       routeid              smallint NOT NULL,
       dicon                char(25),
       newcgp_numtype       smallint NOT NULL,
       PRIMARY KEY (nodeid, cgp_numtype, routeid)
);



CREATE TABLE port_property (
       nodeid               integer NOT NULL,
       portnr               smallint NOT NULL,
       sys_intf_id          integer NOT NULL,
       crc_check            smallint NOT NULL,
       PRIMARY KEY (nodeid, portnr),
       FOREIGN KEY (nodeid, portnr)
                             REFERENCES port
);



CREATE TABLE coco_net_addr (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       net_addr_priority    smallint NOT NULL,
       dst_ip_addr          char(15) NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, net_addr_priority)
);



CREATE INDEX IE1_coco_net_addr ON coco_net_addr
(
	nodeid                ASC,
	dst_ip_addr           ASC
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



CREATE TABLE h323_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       peer_type            smallint NOT NULL,
       ip_addr              char(15),
       ethernet_addr        char(17),
       inc_ident_mode       smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id)
);



CREATE TABLE h323_acc_profile (
       nodeid               integer NOT NULL,
       h323_acc_prf_id      smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       call_start_var       smallint NOT NULL,
       tone_var             smallint NOT NULL,
       audio_mode           smallint NOT NULL,
       fax_mode             smallint NOT NULL,
       data_mode            smallint NOT NULL,
       packet_time          smallint NOT NULL,
       tm_status_enq        smallint NOT NULL,
       admission_mode       smallint NOT NULL,
       h245tunneling        smallint DEFAULT 0 NOT NULL,
       oob_dtmf_mode        smallint DEFAULT 1 NOT NULL,
       acct_auth            smallint DEFAULT 0 NOT NULL,
       dtmf_relay_mode      smallint DEFAULT 0 NOT NULL,
       expr_time            smallint DEFAULT 1000 NOT NULL,
       pulse_dur            smallint DEFAULT 70 NOT NULL,
       pause_dur            smallint DEFAULT 120 NOT NULL,
       level_att            smallint DEFAULT 0 NOT NULL,
       rtp_payload_type     smallint DEFAULT 101 NOT NULL,
       h323_param1          smallint,
       h323_param2          smallint,
       h323_param3          smallint,
       PRIMARY KEY (nodeid, h323_acc_prf_id)
);



CREATE UNIQUE INDEX AK1_h323_acc_profi ON h323_acc_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE h323_access (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       ip_addr              char(15),
       ethernet_addr        char(17),
       outg_ident_mode      smallint NOT NULL,
       inc_ident_mode       smallint NOT NULL,
       access_equipped      smallint NOT NULL,
       access_block         smallint NOT NULL,
       access_state         smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       h323_acc_prf_id      smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES h323_interface,
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES sys_interface,
       FOREIGN KEY (nodeid, h323_acc_prf_id)
                             REFERENCES h323_acc_profile
);



CREATE TABLE ap_alr_ind (
       nodeid               integer NOT NULL,
       ap_id                smallint NOT NULL,
       ap_ind               smallint NOT NULL,
       errcod               integer NOT NULL,
       PRIMARY KEY (nodeid, ap_id, ap_ind),
       FOREIGN KEY (nodeid, ap_id)
                             REFERENCES alarm_panel
);



CREATE TABLE pap_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       auth_req_int         smallint NOT NULL,
       max_auth_req_retr    smallint NOT NULL,
       local_username       char(24) NOT NULL,
       pap_enable           smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE phy_log_stat_group (
       nodeid               integer NOT NULL,
       stat_group_id        smallint NOT NULL,
       log_stat_group_id    smallint NOT NULL,
       PRIMARY KEY (nodeid, stat_group_id, log_stat_group_id)
);



CREATE TABLE cm_port_mg (
       nodeid               integer NOT NULL,
       portnr               smallint NOT NULL,
       PRIMARY KEY (nodeid, portnr),
       FOREIGN KEY (nodeid, portnr)
                             REFERENCES port
);



CREATE TABLE network_service (
       nodeid               integer NOT NULL,
       service_name         char(33) NOT NULL,
       ip_addr              char(15) NOT NULL,
       subnet_mask          char(15) NOT NULL,
       PRIMARY KEY (nodeid, service_name, ip_addr, subnet_mask)
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



CREATE TABLE mgcp_intf_profile (
       nodeid               integer NOT NULL,
       mgcp_intf_prf_id     smallint NOT NULL,
       profile_name         char(50) NOT NULL,
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
       add_stst_desc        smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, mgcp_intf_prf_id)
);



CREATE UNIQUE INDEX AK1_mgcp_intf_prof ON mgcp_intf_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE mgcp_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       mgcp_domain_name     char(64) NOT NULL,
       mgcp_intf_id         integer NOT NULL,
       mgcp_side            smallint NOT NULL,
       mgcp_intf_prf_id     smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       intf_func            smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id),
       FOREIGN KEY (nodeid, mgcp_intf_prf_id)
                             REFERENCES mgcp_intf_profile
);



CREATE UNIQUE INDEX AK1_mgcp_interface ON mgcp_interface
(
	nodeid                ASC,
	mgcp_intf_id          ASC,
	mgcp_side             ASC
);



CREATE UNIQUE INDEX AK2_mgcp_interface ON mgcp_interface
(
	nodeid                ASC,
	mgcp_domain_name      ASC
);



CREATE TABLE mgcp_access (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       mgcp_access_type     char(10),
       mgcp_access_id       smallint NOT NULL,
       access_equipped      smallint NOT NULL,
       access_block         smallint NOT NULL,
       access_state         smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES sys_interface,
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES mgcp_interface
);



CREATE UNIQUE INDEX AK1_mgcp_access ON mgcp_access
(
	nodeid                ASC,
	sys_intf_id           ASC,
	mgcp_access_id        ASC
);



CREATE TABLE nuc_tdm_data (
       nodeid               integer NOT NULL,
       nuc_id               smallint NOT NULL,
       nuc_side             smallint NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       ci                   smallint NOT NULL,
       nuc_tdm_param1       smallint,
       nuc_tdm_param2       smallint,
       sig_ch_dir           tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, nuc_id, nuc_side),
       FOREIGN KEY (nodeid, nuc_id)
                             REFERENCES nailed_up_con
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



CREATE TABLE h323_access_group (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sequence_nr          smallint NOT NULL,
       sys_access_id        integer NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sequence_nr)
);



CREATE TABLE cli_privilege (
       nodeid               integer NOT NULL,
       privilege_name       char(32) NOT NULL,
       cli_action           char(32) NOT NULL,
       cli_module           char(32),
       PRIMARY KEY (nodeid, privilege_name)
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



CREATE TABLE h323_alias (
       nodeid               integer NOT NULL,
       user_alias_type      smallint NOT NULL,
       user_alias           char(80) NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       outg_ident_ind       smallint NOT NULL,
       PRIMARY KEY (nodeid, user_alias_type, user_alias)
);



CREATE UNIQUE INDEX i_h323_alias ON h323_alias
(
	nodeid                ASC,
	sys_intf_id           ASC,
	sys_access_id         ASC,
	outg_ident_ind        ASC
);



CREATE TABLE e1_profile (
       nodeid               integer NOT NULL,
       e1_profile_id        smallint NOT NULL,
       profile_name         char(20) NOT NULL,
       sig_mode             smallint NOT NULL,
       hlb_delay            smallint NOT NULL,
       PRIMARY KEY (nodeid, e1_profile_id)
);



CREATE UNIQUE INDEX i_e1_pname ON e1_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE m2pa_profile (
       nodeid               integer NOT NULL,
       m2pa_prf_id          smallint NOT NULL,
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
       m2pa_prf_id          smallint NOT NULL,
       m2pa_type            smallint NOT NULL,
       sys_intf_id1         integer,
       sys_intf_id2         integer,
       sys_intf_id3         integer,
       sys_intf_id4         integer,
       PRIMARY KEY (nodeid, ss7_linkid),
       FOREIGN KEY (nodeid, m2pa_prf_id)
                             REFERENCES m2pa_profile
);



CREATE TABLE dss1_d_channel (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       dss1_port_type       smallint NOT NULL,
       level2_variant       smallint NOT NULL,
       dss1_l3_variant      smallint NOT NULL,
       portctg              smallint NOT NULL,
       dss1_layers          smallint NOT NULL,
       dss1_side            smallint NOT NULL,
       log_com_ch_id        integer NOT NULL,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES sys_interface
);



CREATE TABLE log_term (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       tei                  smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id, tei),
       FOREIGN KEY (nodeid, sys_intf_id, sys_access_id)
                             REFERENCES dss1_d_channel
);



CREATE TABLE h248_nonstd_prf (
       nodeid               integer NOT NULL,
       h248_ns_prf_id       smallint NOT NULL,
       h248_prf_name        char(20) NOT NULL,
       h248_prf_data        integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, h248_ns_prf_id)
);



CREATE UNIQUE INDEX AK1_h248_nonstd_pr ON h248_nonstd_prf
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
       tmax_retrans_dur     integer DEFAULT 2000 NOT NULL,
       max_transact_dur     integer DEFAULT 7000 NOT NULL,
       ip_precedence        smallint NOT NULL,
       mg_provis_resp_tm    smallint DEFAULT 160 NOT NULL,
       mgc_provis_resp_tm   smallint DEFAULT 160 NOT NULL,
       mgorig_pend_limit    smallint DEFAULT 7 NOT NULL,
       mgcorig_pend_limit   smallint DEFAULT 7 NOT NULL,
       intf_present         smallint DEFAULT 1 NOT NULL,
       acc_present          smallint DEFAULT 1 NOT NULL,
       ch_present           smallint DEFAULT 1 NOT NULL,
       h248trans_protocol   smallint DEFAULT 0 NOT NULL,
       add_stst_desc        smallint DEFAULT 1 NOT NULL,
       analog_port_pfx      char(10) DEFAULT NULL,
       bra_port_pfx         char(10) DEFAULT NULL,
       e1_port_pfx          char(10) DEFAULT NULL,
       eph_term_pfx         char(10) DEFAULT 'E' NOT NULL,
       phy_board_pfx        char(10) DEFAULT NULL,
       phy_board_data       integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, h248_intf_prf_id)
);



CREATE UNIQUE INDEX AK1_h248_intf_prof ON h248_intf_profile
(
	nodeid                ASC,
	profile_name          ASC
);



CREATE TABLE h248_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       h248_domain_name     char(64) NOT NULL,
       h248_intf_id         smallint NOT NULL,
       h248_side            smallint DEFAULT 1 NOT NULL,
       h248_intf_prf_id     smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       intf_func            smallint DEFAULT 0 NOT NULL,
       h248_intf_options    smallint DEFAULT 1 NOT NULL,
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
	h248_domain_name      ASC
);



CREATE TABLE h248_access (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       h248_access_type     char(10),
       h248_access_id       smallint NOT NULL,
       access_equipped      smallint NOT NULL,
       access_block         smallint NOT NULL,
       access_state         smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES h248_interface,
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES sys_interface
);



CREATE UNIQUE INDEX AK1_h248_access ON h248_access
(
	nodeid                ASC,
	sys_intf_id           ASC,
	h248_access_id        ASC
);



CREATE TABLE ce1_interface (
       nodeid               integer NOT NULL,
       ce1_id               smallint NOT NULL,
       ce1_valid            smallint NOT NULL,
       PRIMARY KEY (nodeid, ce1_id)
);



CREATE TABLE ce1_channel (
       nodeid               integer NOT NULL,
       ce1_id               smallint NOT NULL,
       interface_id         smallint NOT NULL,
       portnr               smallint NOT NULL,
       ch_from              smallint NOT NULL,
       ch_to                smallint NOT NULL,
       ppp_interface        smallint DEFAULT NULL,
       PRIMARY KEY (nodeid, interface_id, portnr, ch_from),
       FOREIGN KEY (nodeid, ce1_id)
                             REFERENCES ce1_interface
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



CREATE TABLE snmp_trap_config (
       nodeid               integer NOT NULL,
       trap_dest_ip_addr    char(15) NOT NULL,
       PRIMARY KEY (nodeid, trap_dest_ip_addr)
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



CREATE TABLE error_filter (
       nodeid               integer NOT NULL,
       errfilt_id           integer NOT NULL,
       errmask              char(10) NOT NULL,
       obj_mask             char(80) NOT NULL,
       PRIMARY KEY (nodeid, errfilt_id)
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



CREATE TABLE v5_interface_var (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       v5_variant_id        smallint NOT NULL,
       v5_regular_var       smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, v5_variant_id)
);



CREATE TABLE v5_link (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       v5_variant_id        smallint NOT NULL,
       portnr               smallint NOT NULL,
       v5_link_id           smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, v5_variant_id, portnr),
       FOREIGN KEY (nodeid, sys_intf_id, v5_variant_id)
                             REFERENCES v5_interface_var
);



CREATE TABLE physical_com_ch (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       v5_variant_id        smallint NOT NULL,
       portnr               smallint NOT NULL,
       v5_com_time_slot     smallint NOT NULL,
       phys_com_ch_type     smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, v5_variant_id, portnr, v5_com_time_slot),
       FOREIGN KEY (nodeid, sys_intf_id, v5_variant_id, portnr)
                             REFERENCES v5_link
);



CREATE TABLE logical_com_ch (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       v5_variant_id        smallint NOT NULL,
       log_com_ch_id        integer NOT NULL,
       log_com_ch_type      smallint NOT NULL,
       portnr               smallint NOT NULL,
       v5_com_time_slot     smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, v5_variant_id, log_com_ch_id),
       FOREIGN KEY (nodeid, sys_intf_id, v5_variant_id, portnr, v5_com_time_slot)
                             REFERENCES physical_com_ch
);



CREATE TABLE vxml_config (
       nodeid               integer NOT NULL,
       dummy_pk             smallint DEFAULT 0 NOT NULL,
       vxml_active          smallint DEFAULT 0 NOT NULL,
       vxml_sdl_debug       smallint DEFAULT 0 NOT NULL,
       vxml_hsl_code_incl   smallint DEFAULT 0 NOT NULL,
       drv_incl             smallint DEFAULT 0 NOT NULL,
       vxml_folder          char(50) NOT NULL,
       fetch_timeout        integer DEFAULT 30000 NOT NULL,
       input_mode           smallint DEFAULT 3 NOT NULL,
       interdigit_timeout   smallint DEFAULT 1000 NOT NULL,
       safe_caching         smallint DEFAULT 0 NOT NULL,
       term_dtmf_code       char(1) NOT NULL,
       term_timeout         integer DEFAULT 10000 NOT NULL,
       noinput_timeout      integer DEFAULT 15000 NOT NULL,
       js_memory_size       integer DEFAULT 1000000 NOT NULL,
       dmg_block_size       integer DEFAULT 1024 NOT NULL,
       dmg_block_count      integer DEFAULT 1024 NOT NULL,
       dmg_proxy_addr       char(15),
       dmg_proxy_port       smallint,
       dmg_thread_count     integer DEFAULT 10 NOT NULL,
       rec_final_silence    smallint DEFAULT 500 NOT NULL,
       rec_max_time         smallint DEFAULT 300 NOT NULL,
       trans_conn_timeout   integer DEFAULT 30000 NOT NULL,
       trans_call_maxtime   integer DEFAULT 600 NOT NULL,
       bargein              smallint DEFAULT 1 NOT NULL,
       best_effort_level    smallint DEFAULT 100 NOT NULL,
       lite_level_lc_nr     smallint DEFAULT 0 NOT NULL,
       simple_level_lc_nr   smallint DEFAULT 0 NOT NULL,
       medium_level_lc_nr   smallint DEFAULT 0 NOT NULL,
       advanc_level_lc_nr   smallint DEFAULT 0 NOT NULL,
       full_level_lc_nr     smallint DEFAULT 0 NOT NULL,
       vxml_file_transfer   smallint DEFAULT 0 NOT NULL,
       vxmlmaxspeechtout    smallint DEFAULT 30 NOT NULL,
       vxmlfetchaudiodly    smallint DEFAULT 3 NOT NULL,
       vxmlfetchaudiomin    smallint DEFAULT 5 NOT NULL,
       vxmlaudiomaxage      integer DEFAULT NULL,
       vxmlaudiomaxstale    integer DEFAULT 300,
       vxmldocmaxage        integer DEFAULT NULL,
       vxmldocmaxstale      integer DEFAULT 0,
       vxmlgrammaxage       integer DEFAULT NULL,
       vxmlgrammaxstale     integer DEFAULT 0,
       vxmlscriptmaxage     integer DEFAULT NULL,
       vxmlscriptmaxstale   integer DEFAULT 0,
       vxml_proxy_type      smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
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



CREATE TABLE h323_gatekeeper (
       nodeid               integer NOT NULL,
       gk_ip_addr           char(15) NOT NULL,
       gk_sec_ip_addr       char(15),
       gk_eth_addr          char(17),
       gk_sec_eth_addr      char(17),
       gk_eth_ident_mode    smallint NOT NULL,
       gk_reg_mode          smallint NOT NULL,
       gw_alias_type        smallint,
       gw_alias             char(80),
       timetolive           smallint DEFAULT 60 NOT NULL,
       gk_param             smallint,
       PRIMARY KEY (nodeid, gk_ip_addr)
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



CREATE TABLE ss7_translation (
       nodeid               integer NOT NULL,
       ss7_dstid            smallint NOT NULL,
       cic_min              smallint NOT NULL,
       cic_max              smallint NOT NULL,
       orig_ss7_dstid       smallint NOT NULL,
       term_ss7_dstid       smallint NOT NULL,
       PRIMARY KEY (nodeid, ss7_dstid, cic_min)
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



CREATE TABLE snmp_client (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       get_community        char(30) NOT NULL,
       set_community        char(30) NOT NULL,
       trap_community       char(30) NOT NULL,
       spec_trap_portnr     smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE dsp_conference (
       nodeid               integer NOT NULL,
       dspcnfid             smallint NOT NULL,
       dspid                smallint NOT NULL,
       dsplinkid            smallint NOT NULL,
       dspchid              smallint NOT NULL,
       dsp_cnfch_type       smallint NOT NULL,
       PRIMARY KEY (nodeid, dspcnfid)
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



CREATE TABLE dsp_tone_level (
       nodeid               integer NOT NULL,
       mf_level             smallint NOT NULL,
       mf_level_const       smallint NOT NULL,
       PRIMARY KEY (nodeid, mf_level)
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



CREATE TABLE ip_route (
       nodeid               integer NOT NULL,
       dest_ip_addr         char(15) NOT NULL,
       gw_ip_addr           char(15) NOT NULL,
       subnet_mask          char(15) NOT NULL,
       route_metric         smallint,
       pmtu                 smallint,
       PRIMARY KEY (nodeid, dest_ip_addr, subnet_mask)
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



CREATE TABLE atsk_param (
       nodeid               integer NOT NULL,
       sec_interface_id     smallint NOT NULL,
       in_digit_nr          smallint NOT NULL,
       out_digit_nr         smallint NOT NULL,
       in_regsigtype        smallint NOT NULL,
       in_regsigvariant     smallint NOT NULL,
       out_regsigtype       smallint NOT NULL,
       out_regsigvariant    smallint NOT NULL,
       test_portnr          smallint NOT NULL,
       PRIMARY KEY (nodeid, sec_interface_id)
);



CREATE TABLE ppp_connection (
       nodeid               integer NOT NULL,
       ppp_id               integer NOT NULL,
       sub_type             smallint NOT NULL,
       sub_intf_id          smallint NOT NULL,
       ppp_mode             smallint NOT NULL,
       adm_status           smallint NOT NULL,
       mlppp_id             integer,
       ppp_username         char(24),
       remote_ip_addr       char(15) NOT NULL,
       local_ip_addr        char(15) NOT NULL,
       auth_protocol        smallint DEFAULT 2 NOT NULL,
       connect_status       smallint DEFAULT 0 NOT NULL,
       echo_interval        smallint DEFAULT 15 NOT NULL,
       vjc_on               smallint NOT NULL,
       ppp_description      char(16) NOT NULL,
       ppp_password         char(16),
       PRIMARY KEY (nodeid, ppp_id)
);



CREATE TABLE privilege_profile (
       nodeid               integer NOT NULL,
       privilege_name       char(32) NOT NULL,
       user_profile_name    char(50) NOT NULL,
       privilege_type       char(16) NOT NULL,
       PRIMARY KEY (nodeid, privilege_name, user_profile_name, privilege_type)
);



CREATE TABLE dsp_receiver (
       nodeid               integer NOT NULL,
       dsprecid             smallint NOT NULL,
       dspid                smallint NOT NULL,
       dsplinkid            smallint NOT NULL,
       dspchid              smallint NOT NULL,
       dsprectype           smallint NOT NULL,
       PRIMARY KEY (nodeid, dsprecid)
);



CREATE TABLE alarm (
       nodeid               integer NOT NULL,
       alrpri               smallint NOT NULL,
       alrcnt               smallint NOT NULL,
       PRIMARY KEY (nodeid, alrpri)
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
       l2_param1            smallint DEFAULT 0 NOT NULL,
       l2_param2            smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, level2_variant)
);



CREATE TABLE local_access (
       nodeid               integer NOT NULL,
       portnr               smallint NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       PRIMARY KEY (nodeid, portnr)
);



CREATE UNIQUE INDEX AK1_local_access ON local_access
(
	nodeid                ASC,
	sys_access_id         ASC
);



CREATE TABLE qsig_d_channel (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_access_id        integer NOT NULL,
       qsig_port_type       smallint NOT NULL,
       level2_variant       smallint NOT NULL,
       qsig_l3_variant      smallint NOT NULL,
       qsig_side            smallint NOT NULL,
       sigtrace_req         smallint NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id, sys_access_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES sys_interface
);



CREATE TABLE ppp_channel (
       nodeid               integer NOT NULL,
       ppp_id               smallint NOT NULL,
       modulenr             smallint NOT NULL,
       portnr               smallint NOT NULL,
       ci                   smallint NOT NULL,
       cda_id               smallint NOT NULL,
       pppchstat            smallint NOT NULL,
       PRIMARY KEY (nodeid, ppp_id)
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
       regsigparvalue1      integer NOT NULL,
       regsigparvalue2      integer NOT NULL,
       regsigparvalue3      integer NOT NULL,
       regsigparvalue4      integer NOT NULL,
       regsigparvalue5      integer NOT NULL,
       regsigparvalue6      integer NOT NULL,
       regsigparvalue7      integer NOT NULL,
       regsigparvalue8      integer NOT NULL,
       regsigparvalue9      integer NOT NULL,
       regsigparvalue10     integer NOT NULL,
       regsigparvalue11     integer NOT NULL,
       regsigparvalue12     integer DEFAULT 8 NOT NULL,
       regsigparvalue13     integer DEFAULT 8 NOT NULL,
       regsigparvalue14     integer DEFAULT 8 NOT NULL,
       regsigparvalue15     integer DEFAULT 8 NOT NULL,
       regsigparvalue16     integer DEFAULT 0 NOT NULL,
       regsigparvalue17     integer DEFAULT 0 NOT NULL,
       regsigparvalue18     integer DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, regsigtype, regsigvariant, casopermode)
);



CREATE TABLE resource_load (
       nodeid               integer NOT NULL,
       resource_type        smallint NOT NULL,
       all_event_limit      integer NOT NULL,
       link_event_limit     integer NOT NULL,
       port_event_limit     integer NOT NULL,
       PRIMARY KEY (nodeid, resource_type)
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
       incnp_numtype        smallint NOT NULL,
       outcnp_numtype       smallint NOT NULL,
       org_charge_code      smallint NOT NULL,
       cbac_barrclass       smallint,
       icb_ctg              smallint NOT NULL,
       crg_class            smallint NOT NULL,
       aoc_auth             smallint NOT NULL,
       sndlinetype          smallint NOT NULL,
       ete_allowed          smallint NOT NULL,
       a_release_type       smallint NOT NULL,
       display_type         smallint NOT NULL,
       tone_type            smallint NOT NULL,
       stat_group_id        smallint NOT NULL,
       trunk_group_dn       integer,
       area_code            char(6),
       cgpn_lac_length      smallint NOT NULL,
       cint_variant         smallint,
       incom_ring_type      smallint NOT NULL,
       camp_invmode         smallint NOT NULL,
       inc_digit_tmvar      smallint NOT NULL,
       reanswer_ind         smallint NOT NULL,
       priority_ind         smallint NOT NULL,
       PRIMARY KEY (nodeid, trnkgrpid)
);



CREATE TABLE mtpl2_timer (
       nodeid               integer NOT NULL,
       timer_number         smallint NOT NULL,
       lower_bound          smallint NOT NULL,
       upper_bound          smallint NOT NULL,
       tmvalue              smallint NOT NULL,
       PRIMARY KEY (nodeid, timer_number)
);



CREATE TABLE mtpl3_timer (
       nodeid               integer NOT NULL,
       timer_number         smallint NOT NULL,
       lower_bound          integer NOT NULL,
       upper_bound          integer NOT NULL,
       tmvalue              integer NOT NULL,
       PRIMARY KEY (nodeid, timer_number)
);



CREATE TABLE mtpsltc_timer (
       nodeid               integer NOT NULL,
       timer_number         smallint NOT NULL,
       lower_bound          smallint NOT NULL,
       upper_bound          smallint NOT NULL,
       tmvalue              smallint NOT NULL,
       PRIMARY KEY (nodeid, timer_number)
);



CREATE TABLE vxml_server (
       nodeid               integer NOT NULL,
       vxml_server_type     char(1) NOT NULL,
       ip_addr              char(15) NOT NULL,
       vxml_port            smallint NOT NULL,
       load_factors         char(16) NOT NULL,
       vxml_protocol        smallint NOT NULL,
       PRIMARY KEY (nodeid, vxml_server_type, ip_addr, vxml_port, vxml_protocol)
);



CREATE TABLE vxml_trace (
       nodeid               integer NOT NULL,
       vxml_module          smallint NOT NULL,
       vxml_tracemask       smallint DEFAULT 0 NOT NULL,
       vxml_debugmask       smallint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, vxml_module)
);



CREATE TABLE sctp_profile (
       nodeid               integer NOT NULL,
       sctp_prf_id          smallint NOT NULL,
       profile_name         char(50) NOT NULL,
       sctp_hb              smallint NOT NULL,
       checksum_algorithm   smallint NOT NULL,
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
       ipv4_addr_scoping    smallint NOT NULL,
       add_ip               smallint NOT NULL,
       cong_proc            smallint NOT NULL,
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
       sigtrace_req         smallint NOT NULL,
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



CREATE UNIQUE INDEX AK3_dst_ip_address ON dst_ip_address
(
	nodeid                ASC,
	dst_ip_port           ASC,
	dst_ip_addr           ASC
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



CREATE TABLE sctp_instance (
       nodeid               integer NOT NULL,
       sctp_inst_id         smallint NOT NULL,
       sctp_type            smallint NOT NULL,
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



CREATE TABLE otc_ana_dutynr (
       nodeid               integer NOT NULL,
       otc_id               char(3) NOT NULL,
       otc_ana_firstfrq     smallint NOT NULL,
       otc_ana_secfrq       smallint NOT NULL,
       default_enbl         tinyint DEFAULT 1 NOT NULL,
       generator_type       tinyint DEFAULT 4 NOT NULL,
       PRIMARY KEY (nodeid, otc_id)
);



CREATE TABLE ne_srv_security (
       nodeid               integer NOT NULL,
       srv_acc_ip_addr      char(15) NOT NULL,
       srv_scrt_name        smallint NOT NULL,
       scrt_rule_action     smallint NOT NULL,
       PRIMARY KEY (nodeid, srv_acc_ip_addr, srv_scrt_name)
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
       tm_inter_digit       smallint NOT NULL,
       tm_cw                smallint NOT NULL,
       PRIMARY KEY (nodeid, access_variant)
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



CREATE TABLE proc_condition (
       nodeid               integer NOT NULL,
       proc_name            smallint NOT NULL,
       proc_state           smallint NOT NULL,
       state_cond           smallint NOT NULL,
       PRIMARY KEY (nodeid, proc_name, proc_state)
);



CREATE TABLE start_execution (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       sigtrace_state       smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE mf_tone (
       nodeid               integer NOT NULL,
       mftoneid             smallint NOT NULL,
       mf_frequency1        smallint NOT NULL,
       mf_frequency2        smallint NOT NULL,
       PRIMARY KEY (nodeid, mftoneid)
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



CREATE TABLE network_regime (
       nodeid               integer NOT NULL,
       dummy_pk             smallint NOT NULL,
       net_task_regime      smallint NOT NULL,
       net_task_period      smallint NOT NULL,
       eth_end_int_delay    smallint NOT NULL,
       eth_end_int_tx       smallint NOT NULL,
       eth_end_int_rx       smallint NOT NULL,
       PRIMARY KEY (nodeid, dummy_pk)
);



CREATE TABLE ext_dsp_options (
       nodeid               integer NOT NULL,
       fax_rate_maneg       smallint NOT NULL,
       fax_max_bit_rate     integer DEFAULT 14400 NOT NULL,
       fax_udp_ec           smallint DEFAULT 1 NOT NULL,
       fax_fill_bit_rem     smallint DEFAULT 0 NOT NULL,
       fax_trans_jbig       smallint DEFAULT 0 NOT NULL,
       fax_trans_mmr        smallint DEFAULT 0 NOT NULL,
       fax_version          integer DEFAULT 0 NOT NULL,
       fax_max_buffer       integer DEFAULT 800 NOT NULL,
       fax_max_datagram     integer DEFAULT 189 NOT NULL,
       dtmf_fr_spread       smallint DEFAULT 2 NOT NULL,
       dtmf_dtct_time       smallint DEFAULT 30 NOT NULL,
       rx_alc               tinyint DEFAULT 0 NOT NULL,
       silence_supp_tresh   tinyint DEFAULT 0 NOT NULL,
       PRIMARY KEY (nodeid, fax_rate_maneg)
);



CREATE TABLE ip_access_list (
       nodeid               integer NOT NULL,
       ip_addr              char(15) NOT NULL,
       link_type            smallint NOT NULL,
       link_subtype         smallint NOT NULL,
       ethernet_addr        char(17),
       PRIMARY KEY (nodeid, ip_addr)
);



CREATE TABLE rtp_control (
       nodeid               integer NOT NULL,
       dst_ip_addr          char(15) NOT NULL,
       dst_ip_addr_name     char(20) NOT NULL,
       dst_error_limit      smallint NOT NULL,
       error_flag           smallint DEFAULT 0 NOT NULL,
       voip_profile         smallint DEFAULT 1 NOT NULL,
       PRIMARY KEY (nodeid, dst_ip_addr)
);



CREATE TABLE cli_config (
       nodeid               integer NOT NULL,
       cli_item             char(20) NOT NULL,
       cli_value            char(15) NOT NULL,
       PRIMARY KEY (nodeid, cli_item)
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



CREATE TABLE syslog_client (
       nodeid               integer NOT NULL,
       log_srv_ip           char(15) NOT NULL,
       log_srv_udp_port     integer DEFAULT 514 NOT NULL,
       syslog_state         smallint NOT NULL,
       syslog_severity      smallint NOT NULL,
       PRIMARY KEY (nodeid, log_srv_ip)
);



CREATE TABLE dpl_mode (
       nodeid               integer NOT NULL,
       autonumber_pk        smallint NOT NULL,
       dpl_ip_addr          char(15) NOT NULL,
       PRIMARY KEY (nodeid, autonumber_pk)
);



CREATE TABLE v5_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       v5_id                integer NOT NULL,
       v5_type              smallint NOT NULL,
       port_alignment       smallint NOT NULL,
       active_v5_var_id     smallint NOT NULL,
       v5_link_id_req       smallint DEFAULT 1 NOT NULL,
       v5_side              smallint NOT NULL,
       v5_sigtrace_req      smallint NOT NULL,
       v5ua_sys_intf_id     integer NOT NULL,
       v52_version          integer DEFAULT 0 NOT NULL,
       rdnd_nodeid          integer,
       rdnd_v5_intf_indx    smallint,
       v52_comment          char(132),
       PRIMARY KEY (nodeid, sys_intf_id),
       FOREIGN KEY (nodeid, sys_intf_id)
                             REFERENCES sys_interface
);



CREATE TABLE m3ua_routing_key (
       nodeid               integer NOT NULL,
       m3ua_rk_id           smallint NOT NULL,
       ntwrk_appear         smallint NOT NULL,
       ntwrkind             smallint NOT NULL,
       dpc_ss7_dstid        smallint NOT NULL,
       opc_ss7_dstid        smallint NOT NULL,
       service_ind          smallint NOT NULL,
       m3ua_as_id           smallint NOT NULL,
       PRIMARY KEY (nodeid, m3ua_rk_id),
       FOREIGN KEY (nodeid, m3ua_as_id)
                             REFERENCES m3ua_appl_server
);



CREATE TABLE ss7_pc_disp_format (
       nodeid               integer NOT NULL,
       ss7_pc_format_id     tinyint NOT NULL,
       ss7_pc_format        char(30) NOT NULL,
       ss7_pc_format_name   char(50) NOT NULL,
       PRIMARY KEY (nodeid, ss7_pc_format_id)
);



CREATE TABLE rtp_limit (
       nodeid               integer NOT NULL,
       rtp_limit_type       tinyint NOT NULL,
       rtp_limit_value      integer DEFAULT 0 NOT NULL,
       rtp_limit_alr_on     tinyint DEFAULT 100 NOT NULL,
       rtp_limit_alr_off    tinyint DEFAULT 90 NOT NULL,
       rtp_limit_sts_time   tinyint DEFAULT 10 NOT NULL,
       rtp_limit_tm_valid   integer DEFAULT 0 NOT NULL,
       rtp_limit_sts        char(32) DEFAULT '' NOT NULL,
       PRIMARY KEY (nodeid, rtp_limit_type)
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



CREATE TABLE squid_ne_port (
       nodeid               integer NOT NULL,
       squid_ne_port_nr     integer DEFAULT 3128 NOT NULL,
       PRIMARY KEY (nodeid)
);



CREATE TABLE rtcp (
       nodeid               integer NOT NULL,
       rtcp_id              smallint NOT NULL,
       rtcp_type            smallint NOT NULL,
       rtcp_mode            smallint NOT NULL,
       PRIMARY KEY (nodeid, rtcp_id)
);



CREATE TABLE mn_ss7_link_set (
       nodeid               integer NOT NULL,
       ss7_linksetid        smallint NOT NULL,
       ss7_linkset_name     char(32) NOT NULL,
       PRIMARY KEY (nodeid, ss7_linksetid)
);



CREATE TABLE mn_ss7_link (
       nodeid               integer NOT NULL,
       ss7_linkid           smallint NOT NULL,
       ss7_link_name        char(32) NOT NULL,
       PRIMARY KEY (nodeid, ss7_linkid)
);



CREATE TABLE mn_ss7_destination (
       nodeid               integer NOT NULL,
       ss7_dstid            smallint NOT NULL,
       ss7_dst_name         char(32) NOT NULL,
       PRIMARY KEY (nodeid, ss7_dstid)
);



CREATE TABLE reg_sig_level (
       nodeid               integer NOT NULL,
       regsigtype           smallint NOT NULL,
       first_mf_level       smallint NOT NULL,
       scnd_mf_level        smallint NOT NULL,
       PRIMARY KEY (nodeid, regsigtype)
);



CREATE TABLE rtp_quality (
       nodeid               integer NOT NULL,
       test_type            smallint NOT NULL,
       test_mode            smallint DEFAULT 1 NOT NULL,
       test_cycle           smallint DEFAULT 5 NOT NULL,
       d_factor             smallint DEFAULT 10 NOT NULL,
       j_factor             smallint DEFAULT 10 NOT NULL,
       a_factor             smallint DEFAULT 0 NOT NULL,
       r_warning_limit      smallint DEFAULT 70 NOT NULL,
       r_error_limit        smallint DEFAULT 80 NOT NULL,
       r_error_filter       smallint DEFAULT 3 NOT NULL,
       module_error_limit   smallint NOT NULL,
       voip_codec           smallint DEFAULT 8 NOT NULL,
       quality_profileid    smallint DEFAULT 1 NOT NULL,
       rerl_warning_limit   smallint DEFAULT 15 NOT NULL,
       rerl_error_limit     smallint DEFAULT 5 NOT NULL,
       PRIMARY KEY (nodeid, test_type)
);



CREATE UNIQUE INDEX AK1_rtp_quality ON rtp_quality
(
	nodeid                ASC,
	voip_codec            ASC
);



CREATE UNIQUE INDEX AK2_rtp_quality ON rtp_quality
(
	nodeid                ASC,
	quality_profileid     ASC
);



CREATE TABLE mn_dsp_ip_feature (
       nodeid               integer NOT NULL,
       dsp_ip_feature_id    smallint NOT NULL,
       dsp_ip_name          char(32) NOT NULL,
       PRIMARY KEY (nodeid, dsp_ip_feature_id)
);



CREATE UNIQUE INDEX AK1_mn_dsp_ip_feat ON mn_dsp_ip_feature
(
	nodeid                ASC,
	dsp_ip_name           ASC
);



CREATE TABLE mn_access (
       nodeid               integer NOT NULL,
       sys_access_id        integer NOT NULL,
       access_name          char(32) NOT NULL,
       PRIMARY KEY (nodeid, sys_access_id)
);



CREATE UNIQUE INDEX i_an_access ON mn_access
(
	nodeid                ASC,
	access_name           ASC
);



CREATE TABLE mn_sys_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       sys_intf_name        char(15) NOT NULL,
       PRIMARY KEY (nodeid, sys_intf_id)
);



CREATE UNIQUE INDEX i_an_sys_interfa ON mn_sys_interface
(
	nodeid                ASC,
	sys_intf_name         ASC
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



CREATE UNIQUE INDEX AK1_gain_control_p ON gain_control_profile
(
	nodeid                ASC,
	agc_prf_name          ASC
);



CREATE TABLE v5ua_appl_server (
       nodeid               integer NOT NULL,
       as_id                smallint NOT NULL,
       v5ua_side            smallint DEFAULT 0 NOT NULL,
       traffic_mode         smallint DEFAULT 1 NOT NULL,
       tm_recov             smallint DEFAULT 3 NOT NULL,
       PRIMARY KEY (nodeid, as_id)
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



CREATE INDEX IE1_v5ua_intf_prof ON v5ua_intf_profile
(
	profile_name          ASC
);



CREATE TABLE v5ua_interface (
       nodeid               integer NOT NULL,
       sys_intf_id          integer NOT NULL,
       as_id                smallint NOT NULL,
       asp_id               integer NOT NULL,
       init_state           smallint DEFAULT 2 NOT NULL,
       v5ua_assoc_repeat    smallint DEFAULT 0 NOT NULL,
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



CREATE TABLE arp (
       nodeid               integer NOT NULL,
       ip_addr              char(15) NOT NULL,
       mac_addr             char(17) NOT NULL,
       arp_proxy            smallint NOT NULL,
       PRIMARY KEY (nodeid, ip_addr)
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



CREATE TABLE protocol_qos (
       nodeid               integer NOT NULL,
       protocol_type        tinyint NOT NULL,
       dscp                 tinyint DEFAULT 26 NOT NULL,
       PRIMARY KEY (nodeid, protocol_type)
);



CREATE TABLE ne_hosts (
       nodeid               integer NOT NULL,
       host_srv_ip_addr     char(15) NOT NULL,
       ip_domain_name       char(80) NOT NULL,
       ip_host_name         char(20) NOT NULL,
       PRIMARY KEY (nodeid, host_srv_ip_addr)
);



commit work;


