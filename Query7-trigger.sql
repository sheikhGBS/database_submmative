
-- 							Query 7: Trigger
-- Purpose: Prevent follow up due date being earlier than appointment date
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

USE crownfield_eye_hospital_db;

DROP TRIGGER IF EXISTS trg_follow_up_due_date_check;

DELIMITER //
CREATE TRIGGER trg_follow_up_due_date_check
BEFORE INSERT ON follow_up
FOR EACH ROW
BEGIN
    DECLARE appt_date DATE;

    -- Retrieve appointment date for the linked record
    SELECT appointment_date
    INTO appt_date
    FROM appointment
    WHERE appointment_id = NEW.appointment_id;

    -- Enforce business rule
    IF NEW.due_date < appt_date THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Validation failed: Follow up due date cannot be earlier than appointment date';
    END IF;
END //
DELIMITER ;

-- Verify trigger creation
SHOW TRIGGERS;