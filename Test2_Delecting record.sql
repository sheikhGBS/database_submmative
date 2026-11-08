-- -------------------------------------------------------------
-- TEST 2: Controlled DELETE
-- Deletes appointment 32 only if no dependent records exist.
-- -------------------------------------------------------------
START TRANSACTION;

SELECT
 appointment_id
FROM
 appointment
WHERE appointment_id = 32;

SELECT
 appointment_id
FROM
 appointment_diagnosis
WHERE appointment_id = 32;

SELECT
 appointment_id
FROM
 prescription
WHERE appointment_id = 32;

SELECT
 appointment_id
FROM
 follow_up
WHERE appointment_id = 32;

DELETE FROM
 appointment
WHERE appointment_id = 32;

SELECT
 appointment_id
FROM
 appointment
WHERE appointment_id = 32;

COMMIT;