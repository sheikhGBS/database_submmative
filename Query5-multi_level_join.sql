-- ============================================================
-- Query 5: Multi-Level Join 
-- Purpose: Prescriptions with medicine details 
-- ============================================================

USE crownfield_eye_hospital_db;
-- ---------- Multi-level join: All prescribed medicines from 1 Jan 2026 ----------
SELECT 
  pr.prescription_id,
 CONCAT_WS(' ', p.patient_first_name,
				p.patient_middle_name,
                   p.patient_last_name) AS patient_name,
  pr.prescribed_date,
  m.medicine_name,
  pi.dose,
  pi.route,
  pi.frequency,
  pi.duration_days
FROM prescription pr
JOIN appointment a ON pr.appointment_id = a.appointment_id
JOIN patient p ON a.patient_id = p.patient_id
JOIN prescription_item pi ON pr.prescription_id = pi.prescription_id
JOIN medicine m ON pi.medicine_id = m.medicine_id
WHERE pr.prescribed_date >= '2026-01-01'
ORDER BY pr.prescribed_date DESC;



