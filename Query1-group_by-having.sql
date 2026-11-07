-- ============================================================
-- Query 1: Group By + Having
-- Purpose: Identify specialties with more than one appointment
-- ============================================================

USE crownfield_eye_hospital_db;

SELECT s.specialty_name, COUNT(a.appointment_id) AS appointment_count
FROM specialty s
JOIN clinician c ON s.specialty_id = c.specialty_id
JOIN appointment a ON c.clinician_id = a.clinician_id
GROUP BY s.specialty_id, s.specialty_name
HAVING COUNT(a.appointment_id) > 1;
