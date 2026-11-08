
-- 			TEST 3: Referential-integrity protection
-- This DELETE must fail because clinician 1 has appointments.
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
START TRANSACTION;

DELETE FROM clinician
WHERE clinician_id = 1;

ROLLBACK;