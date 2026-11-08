
-- 					TEST 1: Controlled UPDATE
-- Updates patient postcode without breaking appointment links.
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
START TRANSACTION;

SELECT 
    patient_id,
    CONCAT_WS(' ', 
        patient_first_name,
        patient_middle_name,
        patient_last_name
    ) AS patient_name,
    patient_postcode
FROM patient
WHERE patient_id = 8;

UPDATE patient
SET patient_postcode = 'B73 6QB'
WHERE patient_id = 8;

SELECT 
    patient_id,
    CONCAT_WS(' ', 
        patient_first_name,
        patient_middle_name,
        patient_last_name
    ) AS patient_name,
    patient_postcode
FROM patient
WHERE patient_id = 8;

SELECT 
    appointment_id,
    patient_id
FROM appointment
WHERE patient_id = 8;

COMMIT;

SELECT * FROM patient;