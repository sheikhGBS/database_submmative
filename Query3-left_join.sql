-- ============================================================
-- Query 3: Left Join — Identify Incomplete Records
-- Purpose: Find appointments with no diagnosis, no prescription and no follow up
-- ============================================================

SELECT
    a.appointment_id,
    CONCAT_WS(' ', p.patient_first_name,
                   p.patient_middle_name,
                   p.patient_last_name) AS patient_name,
    a.appointment_date
FROM appointment a
LEFT JOIN patient p                ON a.patient_id      = p.patient_id
LEFT JOIN appointment_diagnosis ad ON a.appointment_id  = ad.appointment_id
LEFT JOIN prescription pr          ON a.appointment_id  = pr.appointment_id
LEFT JOIN follow_up fu             ON a.appointment_id  = fu.appointment_id
WHERE ad.appointment_id IS NULL
  AND pr.prescription_id IS NULL
  AND fu.follow_up_id IS NULL;




