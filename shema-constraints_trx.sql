-- ============================================================
-- Crownfield Eye Hospital — Constraints & Transaction Tests
-- Purpose: Demonstrate referential integrity rules and safe updates
-- ============================================================

USE crownfield_eye_hospital_db;

-- ------------------------------------------------------------
-- Constraint Behaviour Tests
-- ------------------------------------------------------------

-- 1. ON DELETE RESTRICT example: Cannot delete a clinician with linked appointments
-- DELETE FROM clinician WHERE clinician_id = 1; 
-- Expected: Fails with foreign key constraint error

-- 2. ON UPDATE CASCADE example: Updating a patient ID propagates automatically
-- UPDATE patient SET patient_id = 99 WHERE patient_id = 1;
-- SELECT appointment_id, patient_id FROM appointment WHERE patient_id = 99;
-- Result: All related appointment rows reflect the new ID automatically

-- ------------------------------------------------------------
-- Transaction Example
-- ------------------------------------------------------------

START TRANSACTION;

-- Step 1: Insert new appointment
-- INSERT INTO appointment (...) VALUES (...);

-- Step 2: Insert linked follow up
-- INSERT INTO follow_up (...) VALUES (...);

-- Commit if all steps successful — or ROLLBACK if any error occurs
COMMIT;
-- ROLLBACK;