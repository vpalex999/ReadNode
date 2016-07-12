"CREATE PROCEDURE IT_NE_SP_POST_EVENT_CREATE_CONFERENCE(nodeid INTEGER, cnf_request_id VARCHAR(20), appl_server_id INTEGER, cnf_type TINYINT,
	cnf_moderator_id INTEGER, cnf_maxparticipant INTEGER, cnf_security_type TINYINT, cnf_pin VARCHAR(9),
	cnf_state TINYINT, cnf_start_date BIGINT, cnf_stop_date BIGINT, cnf_delete_on_end TINYINT, cnf_name WVARCHAR(25),
	number_of_mixers TINYINT = 1)
	
	RETURNS (cnf_id BIGINT, cnf_dialin_dn VARCHAR(15), cnf_mixer_dn VARCHAR(15), cnf_mixer_cs INTEGER)
BEGIN
-- First set action for failing statements.
	EXEC SQL WHENEVER SQLERROR ROLLBACK, ABORT;

--Set transaction isolation level
	--EXEC SQL COMMIT WORK;
	--EXEC SQL EXECDIRECT SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	
-- Fetch new conference ID
	EXEC SEQUENCE seq_cnf_id.NEXT INTO (cnf_id);

--Insert conference
	EXEC SQL PREPARE insert_conference
		INSERT INTO conference VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);

	EXEC SQL EXECUTE insert_conference USING (nodeid, cnf_id, cnf_request_id,
                appl_server_id, cnf_type,       cnf_moderator_id, cnf_maxparticipant,
                cnf_security_type, cnf_pin,     cnf_state, cnf_start_date,
                cnf_stop_date, cnf_delete_on_end, cnf_name);

	EXEC SQL CLOSE insert_conference;
	EXEC SQL DROP insert_conference;
	
-- Retrieve conference dialin number
	EXEC SQL PREPARE define_dialin
		UPDATE cnf_dialin SET cnf_id = ? WHERE
			phoneid IN (SELECT phoneid FROM cnf_dialin 
			WHERE cnf_id IS NULL AND reserved=0 AND ROWNUM<2);

	EXEC SQL EXECUTE define_dialin USING (cnf_id);
	IF SQLROWCOUNT <> 1 THEN
		EXEC SQL ROLLBACK WORK;
		EXEC SQL CLOSE define_dialin;
		EXEC SQL DROP define_dialin;
		RETURN SQLERROR 'Conference DIALIN not available';
	END IF
	EXEC SQL CLOSE define_dialin;
	EXEC SQL DROP define_dialin;

-- Fetch conference dialin number	
	EXEC SQL PREPARE get_dialin
		SELECT phone_number FROM phone INNER JOIN cnf_dialin ON 
		cnf_dialin.phoneid=phone.phoneid WHERE cnf_dialin.cnf_id=?;
		
	EXEC SQL EXECUTE get_dialin USING (cnf_id) INTO (cnf_dialin_dn);
	EXEC SQL FETCH get_dialin;
	EXEC SQL CLOSE get_dialin;
	EXEC SQL DROP get_dialin;

	
-- Retrieve conference mixer number
	EXEC SQL PREPARE define_mixer
		UPDATE cnf_mixer SET cnf_id = ? WHERE
			phoneid IN (SELECT phoneid FROM cnf_mixer 
			WHERE cnf_id IS NULL AND ROWNUM<2);

	WHILE number_of_mixers <> 0 LOOP
		EXEC SQL EXECUTE define_mixer USING (cnf_id);
		IF SQLROWCOUNT <> 1 THEN
			EXEC SQL ROLLBACK WORK;
			EXEC SQL CLOSE define_mixer;
			EXEC SQL DROP define_mixer;
			RETURN SQLERROR 'Conference MIXER not available';
		END IF
		number_of_mixers := number_of_mixers - 1;
	END LOOP;
		
	EXEC SQL CLOSE define_mixer;
	EXEC SQL DROP define_mixer;
	
-- Fetch lines dependent of required conference mixer numbers
	EXEC SQL PREPARE get_mixer
		SELECT phone_number, cs_id FROM phone INNER JOIN cnf_mixer ON 
		cnf_mixer.phoneid=phone.phoneid WHERE cnf_mixer.cnf_id=?;
		
	EXEC SQL EXECUTE get_mixer USING (cnf_id) INTO (cnf_mixer_dn, cnf_mixer_cs);
	EXEC SQL FETCH get_mixer;
	IF SQLSUCCESS THEN
		WHILE SQLSUCCESS LOOP
			RETURN ROW;
			EXEC SQL FETCH get_mixer;
		END LOOP;
	ELSE
		RETURN ROW;
	END IF
	EXEC SQL CLOSE get_mixer;
	EXEC SQL DROP get_mixer;

	EXEC SQL COMMIT WORK;
END";


"CREATE PROCEDURE IT_NE_SP_POST_EVENT_CREATE_CONFERENCE_DIALIN_DEFINED(nodeid INTEGER, cnf_request_id VARCHAR(20), appl_server_id INTEGER, cnf_type TINYINT,
	cnf_moderator_id INTEGER, cnf_maxparticipant INTEGER, cnf_security_type TINYINT, cnf_pin VARCHAR(9),
	cnf_state TINYINT, cnf_start_date BIGINT, cnf_stop_date BIGINT, cnf_delete_on_end TINYINT, cnf_name WVARCHAR(25),
	number_of_mixers TINYINT = 1, dialin_dn VARCHAR(15))
	
	RETURNS (cnf_id BIGINT, cnf_dialin_dn VARCHAR(15), cnf_mixer_dn VARCHAR(15), cnf_mixer_cs INTEGER)
BEGIN
	DECLARE phoneid_tmp INTEGER;

-- First set action for failing statements.
	EXEC SQL WHENEVER SQLERROR ROLLBACK, ABORT;

--Set transaction isolation level
	--EXEC SQL COMMIT WORK;
	--EXEC SQL EXECDIRECT SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	
-- Fetch new conference ID
	EXEC SEQUENCE seq_cnf_id.NEXT INTO (cnf_id);

--Insert conference
	EXEC SQL PREPARE insert_conference
		INSERT INTO conference VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);

	EXEC SQL EXECUTE insert_conference USING (nodeid, cnf_id, cnf_request_id,
                appl_server_id, cnf_type,       cnf_moderator_id, cnf_maxparticipant,
                cnf_security_type, cnf_pin,     cnf_state, cnf_start_date,
                cnf_stop_date, cnf_delete_on_end, cnf_name);

	EXEC SQL CLOSE insert_conference;
	EXEC SQL DROP insert_conference;

-- Fetch conference dialin phone	
	EXEC SQL PREPARE get_dialin_phone
		SELECT phone.phoneid FROM phone INNER JOIN cnf_dialin ON cnf_dialin.phoneid=phone.phoneid WHERE phone.phone_number=? AND cnf_dialin.reserved=1;
		
	EXEC SQL EXECUTE get_dialin_phone USING (dialin_dn) INTO (phoneid_tmp);
	EXEC SQL FETCH get_dialin_phone;
	IF NOT SQLSUCCESS THEN
		EXEC SQL ROLLBACK WORK;
		EXEC SQL CLOSE get_dialin_phone;
		EXEC SQL DROP get_dialin_phone;
		RETURN SQLERROR 'Reserved conference DIALIN not defined or marked as reserved';
	END IF
	EXEC SQL CLOSE get_dialin_phone;
	EXEC SQL DROP get_dialin_phone;
	
-- Reserve conference dialin number if available
	EXEC SQL PREPARE define_dialin
		UPDATE cnf_dialin SET cnf_id=? WHERE
			phoneid=? AND cnf_id IS NULL;

	EXEC SQL EXECUTE define_dialin USING (cnf_id, phoneid_tmp);
	IF SQLROWCOUNT <> 1 THEN
		EXEC SQL ROLLBACK WORK;
		EXEC SQL CLOSE define_dialin;
		EXEC SQL DROP define_dialin;
		RETURN SQLERROR 'Reserved conference DIALIN not available';
	END IF
	EXEC SQL CLOSE define_dialin;
	EXEC SQL DROP define_dialin;
	
-- Set return dialin number
	cnf_dialin_dn := dialin_dn;

-- Retrieve conference mixer number
	EXEC SQL PREPARE define_mixer
		UPDATE cnf_mixer SET cnf_id = ? WHERE
			phoneid IN (SELECT phoneid FROM cnf_mixer 
			WHERE cnf_id IS NULL AND ROWNUM<2);

	WHILE number_of_mixers <> 0 LOOP
		EXEC SQL EXECUTE define_mixer USING (cnf_id);
		IF SQLROWCOUNT <> 1 THEN
			EXEC SQL ROLLBACK WORK;
			EXEC SQL CLOSE define_mixer;
			EXEC SQL DROP define_mixer;
			RETURN SQLERROR 'Conference MIXER not available';
		END IF
		number_of_mixers := number_of_mixers - 1;
	END LOOP;
		
	EXEC SQL CLOSE define_mixer;
	EXEC SQL DROP define_mixer;
	
-- Fetch lines dependent of required conference mixer numbers
	EXEC SQL PREPARE get_mixer
		SELECT phone_number, cs_id FROM phone INNER JOIN cnf_mixer ON 
		cnf_mixer.phoneid=phone.phoneid WHERE cnf_mixer.cnf_id=?;
		
	EXEC SQL EXECUTE get_mixer USING (cnf_id) INTO (cnf_mixer_dn, cnf_mixer_cs);
	EXEC SQL FETCH get_mixer;
	IF SQLSUCCESS THEN
		WHILE SQLSUCCESS LOOP
			RETURN ROW;
			EXEC SQL FETCH get_mixer;
		END LOOP;
	ELSE
		RETURN ROW;
	END IF
	EXEC SQL CLOSE get_mixer;
	EXEC SQL DROP get_mixer;

	EXEC SQL COMMIT WORK;
END";

"CREATE PROCEDURE IT_NE_SP_POST_EVENT_DELETE_CONFERENCE(conf_id BIGINT)
BEGIN
-- First set action for failing statements.
	EXEC SQL WHENEVER SQLERROR ABORT;

-- Delete conference dialin number
	EXEC SQL PREPARE delete_dialin
		UPDATE cnf_dialin SET cnf_id=NULL WHERE cnf_id=?;
	EXEC SQL EXECUTE delete_dialin USING (conf_id);
	EXEC SQL CLOSE delete_dialin;
	EXEC SQL DROP delete_dialin;

-- Delete conference mixers number	
	EXEC SQL PREPARE delete_mixers
		UPDATE cnf_mixer SET cnf_id=NULL WHERE cnf_id=?;
		
	EXEC SQL EXECUTE delete_mixers USING (conf_id);
	EXEC SQL CLOSE delete_mixers;
	EXEC SQL DROP delete_mixers;
  
--Delete participants config
	EXEC SQL PREPARE delete_part_configs
		DELETE FROM cnf_part_config WHERE cnf_id=?;
	
	EXEC SQL EXECUTE delete_part_configs USING (conf_id);
	EXEC SQL CLOSE delete_part_configs;
	EXEC SQL DROP delete_part_configs;
  
--Delete participants
	EXEC SQL PREPARE delete_participants
		DELETE FROM cnf_participant WHERE cnf_id=?;
	
	EXEC SQL EXECUTE delete_participants USING (conf_id);
	EXEC SQL CLOSE delete_participants;
	EXEC SQL DROP delete_participants;
  
-- Delete conference
	EXEC SQL PREPARE delete_conference
		DELETE FROM conference WHERE cnf_id=?;
	
	EXEC SQL EXECUTE delete_conference USING (conf_id);
	EXEC SQL CLOSE delete_conference;
	EXEC SQL DROP delete_conference;

	EXEC SQL COMMIT WORK;
END";

"CREATE PROCEDURE IT_NE_SP_POST_EVENT_DELETE_CONFERENCE_ALL(appl_server_id INTEGER)
BEGIN
	DECLARE cnf_id BIGINT;
  
-- First set action for failing statements.
	EXEC SQL WHENEVER SQLERROR ABORT;
  
	EXEC SQL PREPARE call_deleter CALL IT_NE_SP_POST_EVENT_DELETE_CONFERENCE(?);
  
-- Fetch all conferences for particular node id
	EXEC SQL PREPARE get_conferences
		SELECT cnf_id FROM conference WHERE appl_server_id = ?;
	EXEC SQL EXECUTE get_conferences USING (appl_server_id) INTO (cnf_id);
	
	EXEC SQL FETCH get_conferences;
	WHILE SQLSUCCESS LOOP
		EXEC SQL EXECUTE call_deleter USING (cnf_id);
		IF NOT SQLSUCCESS THEN
			EXEC SQL CLOSE call_deleter;
		        EXEC SQL DROP call_deleter;

        		EXEC SQL CLOSE get_conferences;
        		EXEC SQL DROP get_conferences;

			RETURN SQLERROR OF call_deleter;
		END IF
		EXEC SQL FETCH get_conferences;
	END LOOP;
	
	EXEC SQL CLOSE call_deleter;
	EXEC SQL DROP call_deleter;
	
	EXEC SQL CLOSE get_conferences;
	EXEC SQL DROP get_conferences;

	EXEC SQL COMMIT WORK;
END";
