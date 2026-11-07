-- ============================================================
-- Query 6: Stored Procedure
-- Purpose: Full patient history procedure
-- ============================================================

USE crownfield_eye_hospital_db;



DROP PROCEDURE IF EXISTS sp_patient_full_history;
DELIMITER $$
CREATE PROCEDURE sp_patient_full_history(IN in_patient_id INT)

BEGIN
    IF NOT EXISTS (SELECT 1 FROM patient WHERE patient_id = in_patient_id) THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT = 'Validation failed: Patient ID does not exist';
    END IF;
    -- Return complete appiontment history
    SELECT 
        a.appointment_id,
        a.appointment_date,
        a.appointment_time,
        CONCAT_WS(' ', cl.clinician_first_name,
                  cl.clinician_last_name) AS clinician_name,
        c.clinic_name,
        a.notes,
        fu.due_date AS follow_up_due,
        fu.status AS follow_up_status
    FROM appointment a
    LEFT JOIN clinician cl ON a.clinician_id = cl.clinician_id
    LEFT JOIN clinic c ON a.clinic_id = c.clinic_id
    LEFT JOIN follow_up fu ON a.appointment_id = fu.appointment_id
    WHERE a.patient_id = in_patient_id
    ORDER BY a.appointment_date DESC;
END $$

DELIMITER ;


-- calling stored procedure sp_patient_full_history(patient_id): 
CALL sp_patient_full_history(9);


-- if you need to drop a stored procedure
drop procedure if exists sp_patient_full_history;