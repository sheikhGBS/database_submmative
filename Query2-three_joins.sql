

-- 				Query 2: Inner Join — Three or More Tables
-- Purpose: List appointments with full patient, clinician and clinic details
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

USE crownfield_eye_hospital_db;

SELECT  CONCAT_WS(' ', p.patient_first_name,
                   p.patient_middle_name,
                   p.patient_last_name) AS patient_name,
                   a.appointment_date,
                    CONCAT_WS(' ', cl.clinician_first_name,
                   cl.clinician_last_name) AS clinician_name, c.clinic_name
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN clinician cl ON a.clinician_id = cl.clinician_id
INNER JOIN clinic c ON a.clinic_id = c.clinic_id
ORDER BY a.appointment_date DESC;
