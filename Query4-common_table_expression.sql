
-- 				Query 4: CTE — Common Table Expression
-- Purpose: Retrieve each patient's most recent appointment date
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

USE crownfield_eye_hospital_db;

WITH latest_appt AS (
    SELECT patient_id, MAX(appointment_date) AS last_seen
    FROM appointment
    GROUP BY patient_id
)
SELECT CONCAT_WS(' ', p.patient_first_name,
                   p.patient_middle_name,
                   p.patient_last_name) AS patient_name, la.last_seen
FROM patient p
JOIN latest_appt la ON p.patient_id = la.patient_id
ORDER BY la.last_seen DESC;
