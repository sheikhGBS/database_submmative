-- ============================================================
-- Crownfield Eye Hospital Database — Schema Creation
-- Project:  Clinical Information System
-- Version:  1.0
-- Date:     2026-11-07
-- Purpose:  Create database and all core tables with constraints
-- ============================================================


USE crownfield_eye_hospital_db;

-- ------------------------------------------------------------
-- Patient Records
-- ------------------------------------------------------------
INSERT INTO patient (patient_first_name, patient_middle_name, patient_last_name,
                     patient_dob, patient_address, patient_postcode, patient_contact, patient_email) VALUES
('Oliver',  'James',  'Harris',   '1968-03-15', '12 Elm Grove, Birmingham',            'B13 9AA', '01214440001', 'oliver.harris@email.com'),
('Sophie',  NULL,     'Clarke',   '1990-11-22', '34 Birch Road, Coventry',              'CV4 8BB', '01214440002', 'sophie.clarke@email.com'),
('Daniel',  'Mark',   'Walker',   '1975-06-08', '56 Cedar Avenue, Wolverhampton',       'WV3 7CC', '01214440003', 'daniel.walker@email.com'),
('Chloe',   'Anne',   'Wright',   '1988-09-30', '78 Maple Lane, Dudley',                'DY2 4DD', '01214440004', 'chloe.wright@email.com'),
('Ethan',   NULL,     'Robinson', '1960-01-12', '90 Pine Street, Solihull',             'B92 5EE', '01214440005', 'ethan.robinson@email.com'),
('Isla',    'Grace',  'Thompson', '2001-05-04', '11 Willow Way, Sutton Coldfield',      'B73 6FF', '01214440006', 'isla.thompson@email.com'),
('Mohammed','Ali',    'Hussain',  '1972-12-19', '22 Aspen Close, Birmingham',           'B17 8GG', '01214440007', 'm.hussain@email.com'),
('Amelia',  'Rose',   'Evans',    '1998-08-25', '33 Rowan Drive, Coventry',             'CV5 9HH', '01214440008', 'amelia.evans@email.com'),
('George',  'Henry',  'Bennett',  '1955-04-07', '44 Sycamore Road, Wolverhampton',      'WV6 1II', '01214440009', 'george.bennett@email.com'),
('Freya',   NULL,     'Mitchell', '1983-10-14', '55 Holly Crescent, Dudley',            'DY3 2JJ', '01214440010', 'freya.mitchell@email.com');

select * from patient;

-- ------------------------------------------------------------
-- Specialty Reference Data
-- ------------------------------------------------------------
INSERT INTO specialty(specialty_name, specialty_code, specialty_description, is_active) VALUES
('General Ophthalmology', 'OPH_011', 'Comprehensive eye care and routine consultations', TRUE),
('Retina', 'OPH_022', 'Vitreoretinal surgery and macular disorders', TRUE),
('Cornea & External Disease', 'OPH_333', 'Corneal transplantation and ocular surface', TRUE),
('Glaucoma', 'OPH_414', 'Diagnosis and management of intraocular pressure', TRUE),
('Paediatric Ophthalmology', 'OPH_500', 'Eye care for children and adolescents', TRUE),
('Neuro-ophthalmology', 'OPH_061', 'Visual pathway and neurological disorders', TRUE),
('Oculoplastic Surgery', 'OPH_072', 'Eyelid, orbital and facial surgery', TRUE);


-- ------------------------------------------------------------
-- Clinician Records
-- ------------------------------------------------------------

INSERT INTO CLINICIAN (clinician_first_name, clinician_last_name, clinician_email, clinician_gmc_number, specialty_id) VALUES
('Elena', 'Patel', 'e.patel@hospital.nhs.uk', 'GMC1234567', 1),
('James', 'Chen', 'jams.chen@hospital.nhs.uk', 'GMC2345678', 2),
('Maria', 'Santos', 'm.santos@hospital.nhs.uk', 'GMC3456789', 3),
('Robert', 'Khan', 'r.khan@hospital.nhs.uk', 'GMC4567890', 4),
('Fiona', 'Owen', 'f.owen@hospital.nhs.uk', 'GMC5678901', 5),
('Simon', 'Lau', 's.lau@hospital.nhs.uk', 'GMC6789012', 6),
('Nina', 'Butt', 'n.butt@hospital.nhs.uk', 'GMC7890123', 7);

-- ------------------------------------------------------------
-- Clinic Location Records
-- ------------------------------------------------------------
INSERT INTO CLINIC (clinic_name, location, opening_hours, is_teaching_site, contact_tel) VALUES
('Main Eye Clinic', 'Ground Floor, Block A', 'Mon-Fri: 08:00-18:00', TRUE, '01218880001'),
('Retina Centre', 'First Floor, Block B', 'Mon-Wed: 09:00-17:00', TRUE, '01218880002'),
('Cornea Unit', 'Second Floor, Block A', 'Tue-Thu: 08:30-16:30', FALSE, '01218880003'),
('Glaucoma Service', 'Ground Floor, Block C', 'Mon-Fri: 09:00-17:00', TRUE, '01218880004'),
('Paediatric Eye Care', 'Third Floor, Block B', 'Mon-Fri: 09:00-17:00', TRUE, '01218880005'),
('Neuro-ophthalmology', 'First Floor, Block C', 'Wed-Fri: 10:00-16:00', FALSE, '01218880006'),
('Oculoplastics', 'Second Floor, Block C', 'Mon-Tue: 08:00-15:00', FALSE, '01218880007');

-- ------------------------------------------------------------
-- Appointment Records — Initial Dataset
-- ------------------------------------------------------------
INSERT INTO appointment (patient_id, clinician_id, clinic_id, appointment_date, appointment_time, checkin_time, status, duration_mins, notes) VALUES
(8, 1, 1, '2026-10-01', '09:15:00', '09:10:00', 'Completed', 30, 'Routine check-up — vision stable'),
(9, 2, 2, '2026-10-02', '10:30:00', '10:25:00', 'Completed', 45, 'Follow-up for diabetic retinopathy'),
(10, 4, 4, '2026-10-03', '08:45:00', NULL, 'DNA', 30, 'Patient did not attend'),
(11, 3, 3, '2026-10-05', '14:00:00', '13:50:00', 'Completed', 60, 'Post-corneal transplant assessment'),
(12, 1, 1, '2026-10-08', '11:15:00', '11:20:00', 'Completed', 30, 'New patient referral — cataract evaluation'),
(13, 5, 5, '2026-10-10', '09:00:00', '09:05:00', 'Completed', 45, 'Paediatric squint review'),
(14, 7, 7, '2026-10-15', '15:30:00', NULL, 'Scheduled', 60, 'Pre-operative assessment — ptosis repair');

INSERT INTO appointment (patient_id, clinician_id, clinic_id, appointment_date, appointment_time, checkin_time, status, duration_mins, notes) VALUES
(14, 7, 7, '2026-10-15', '15:30:00', NULL, 'Scheduled', 60, 'Pre-operative assessment — ptosis repair');

-- ------------------------------------------------------------
-- Diagnosis Reference Data
-- ------------------------------------------------------------
INSERT INTO DIAGNOSIS (diagnosis_name, diagnosis_code, category, is_active) VALUES
('Age related cataract', 'H26', 'Lens Disorders', TRUE),
('Diabetic retinopathy-', 'H37.0', 'Retinal Disorders', TRUE),
('Primary open- angle glaucoma', 'H 40.1', 'Glaucoma', TRUE),
('Keratoconus ', 'H18. 6', 'Corneal Disorders', TRUE),
('Macular  degeneration — dry', 'H 35.3', 'Retinal Disorders', TRUE),
('Amblyopia ', 'H 53.0', 'Visual Disorders', TRUE),
('Blepharitis ', 'H 01.0', 'Eyelid Disorders', TRUE);
select * from appointment;

-- ------------------------------------------------------------
-- Appointment Diagnosis Links
-- ------------------------------------------------------------
INSERT INTO APPOINTMENT_DIAGNOSIS (appointment_id, diagnosis_id, notes) VALUES
(22, 1, 'Early nuclear sclerosis — monitor annually'),
(23, 2, 'Moderate non-proliferative retinopathy — control blood sugar'),
(24, 4, 'Stable post-cross-linking — continue topical meds'),
(25, 1, 'Right eye cataract — surgical options discussed'),
(26, 6, 'Left amblyopia — patching compliance improved'),
(27, 7, 'Bilateral involutional ptosis — listed for surgery'),
(28, 5, 'Incidental finding — dry AMD in left eye');

-- ------------------------------------------------------------
-- Prescription Records — Base Dataset
-- ------------------------------------------------------------
INSERT INTO PRESCRIPTION (appointment_id, prescribed_date, prescriber_role, is_repeat, authorisation_ref) VALUES
(22, '2026-10-01', 'Ophthalmologist', FALSE, 'AUTH-00123'),
(23, '2026-10-02', 'Consultant Retinal Surgeon', TRUE, 'AUTH-00124'),
(24, '2026-10-05', 'Cornea Specialist', FALSE, 'AUTH-00125'),
(25, '2026-10-08', 'Ophthalmologist', FALSE, 'AUTH-00126'),
(26, '2026-10-10', 'Paediatric Ophthalmologist', TRUE, 'AUTH-00127'),
(27, '2026-10-15', 'Oculoplastic Surgeon', FALSE, 'AUTH-00128'),
(28, '2026-10-16', 'Ophthalmologist', TRUE, 'AUTH-00129');

select * from prescription;

-- ------------------------------------------------------------
-- Medicine Catalogue — Base Dataset
-- ------------------------------------------------------------
INSERT INTO MEDICINE (medicine_name, dmdd_code, manufacturer, is_controlled) VALUES
('Artificial Tears', '123456700001', 'VisionCare Ltd', FALSE),
('Latanoprost 50mcg/ml Eye Drops', '123456700002', 'PharmaVision', FALSE),
('Chloramphenicol 0.5% Eye Drops', '123456700003', 'EyeMed', FALSE),
('Dexamethasone 0.1% Eye Drops', '123456700004', 'SightPharm', FALSE),
('Cyclopentolate 1% Eye Drops', '123456700005', 'VisionCare Ltd', FALSE),
('Timolol 0.25% Eye Drops', '123456700006', 'PharmaVision', FALSE),
('Prednisolone 0.5% Eye Drops', '123456700007', 'SightPharm', FALSE);

-- ------------------------------------------------------------
-- Prescription Item Records — Base Dataset
-- ------------------------------------------------------------
INSERT INTO PRESCRIPTION_ITEM (prescription_id, medicine_id, dose, route, frequency, duration_days, quantity, refills_allowed) VALUES
(8, 1, '1 drop', 'Topical — Right eye', '4 times daily', 14, 10.0, 0),
(9, 2, '1 drop', 'Topical — Both eyes', 'Once daily at night', 90, 25.0, 3),
(10, 4, '1 drop', 'Topical — Left eye', 'Twice daily', 21, 15.0, 0),
(11, 3, '1 drop', 'Topical — Right eye', 'Every 4 hours', 7, 8.0, 0),
(12, 5, '1 drop', 'Topical — Both eyes', 'Once daily', 3, 5.0, 0),
(13, 1, 'As required', 'Topical — Both eyes', 'Maximum 4 times daily', 28, 15.0, 1),
(14, 6, '1 drop', 'Topical — Both eyes', 'Twice daily', 60, 20.0, 2);

-- ------------------------------------------------------------
-- Follow Up Records — Base Dataset
-- ------------------------------------------------------------
INSERT INTO FOLLOW_UP (appointment_id, due_date, priority, status, reminder_sent, outcome_notes) VALUES
(22, '2027-04-01', 'Low', 'Planned', FALSE, 'Routine annual review'),
(23, '2026-12-02', 'Medium', 'Planned', TRUE, 'Retina clinic appointment sent'),
(24, '2026-11-05', 'Medium', 'Reminded', TRUE, 'Cornea review — confirm healing'),
(25, '2026-11-12', 'High', 'Planned', FALSE, 'Discuss surgical date'),
(26, '2026-12-10', 'Medium', 'Planned', FALSE, 'Progress check — patching regime'),
(27, '2026-11-05', 'High', 'Reminded', TRUE, 'Surgical listing confirmed'),
(28, '2026-10-10', 'Medium', 'Missed', TRUE, 'Re-scheduled — patient contacted');

select * from specialty;



--- new records for each table to complete the part B requirement
INSERT INTO clinician (clinician_first_name, clinician_last_name, clinician_email, clinician_gmc_number, specialty_id) VALUES
('Priya',    'Shah',      'p.shah@hospital.nhs.uk',     'GMC8001001', 1),
('Thomas',   'Reed',      't.reed@hospital.nhs.uk',     'GMC8001002', 2),
('Aisha',    'Malik',     'a.malik@hospital.nhs.uk',    'GMC8001003', 3),
('Kevin',    'Nguyen',    'k.nguyen@hospital.nhs.uk',   'GMC8001004', 4),
('Laura',    'Fitzgerald','l.fitzgerald@hospital.nhs.uk','GMC8001005', 5),
('Hassan',   'Rahman',    'h.rahman@hospital.nhs.uk',   'GMC8001006', 6),
('Charlotte','Price',     'c.price@hospital.nhs.uk',    'GMC8001007', 7),
('Ravi',     'Kumar',     'r.kumar@hospital.nhs.uk',    'GMC8001008', 15),
('Emma',     'Walsh',     'e.walsh@hospital.nhs.uk',    'GMC8001009', 16),
('Victor',   'Osei',      'v.osei@hospital.nhs.uk',     'GMC8001010', 17);

select * from clinician;


INSERT INTO clinic (clinic_name, location, opening_hours, is_teaching_site, contact_tel) VALUES
('Uveitis Clinic_1',        'Fourth Floor, Block A', 'Mon-Fri: 09:00-17:00', FALSE, '01218880008'),
('Oncology Day Unit_1',     'Fifth Floor, Block B',  'Tue-Thu: 08:00-18:00', TRUE,  '01218880009'),
('Refractive Suite_1',      'Ground Floor, Block D', 'Mon-Sat: 08:00-20:00', FALSE, '01218880010');

select * from clinic;


INSERT INTO appointment (patient_id, clinician_id, clinic_id, appointment_date, appointment_time,
                         checkin_time, status, duration_mins, notes) VALUES
(8,  1,  8,  '2026-11-01', '09:00:00', '08:55:00', 'Completed',  30, 'Uveitis review — tapering steroids'),
(9,  2,  9,  '2026-11-02', '10:00:00', '09:58:00', 'Completed',  45, 'Choroidal naevus monitoring'),
(10, 3, 10, '2026-11-03', '11:00:00', NULL,       'Scheduled',  30, 'Refractive surgery consultation'),
(11, 4, 1,  '2026-11-04', '13:30:00', '13:25:00', 'Completed',  20, 'Routine ophthalmic check'),
(12, 5, 2,  '2026-11-05', '14:00:00', '13:55:00', 'Completed',  30, 'Retina follow-up — stable'),
(13, 6, 3,  '2026-11-06', '08:30:00', NULL,       'Cancelled',  15, 'Patient cancelled — rebooking needed'),
(14, 7, 4,  '2026-11-07', '09:45:00', '09:40:00', 'Checked-in', 30, 'IOP check'),
(15, 25, 5,  '2026-11-08', '10:15:00', '10:10:00', 'Completed',  45, 'Paediatric review'),
(16, 26, 6,  '2026-11-09', '15:00:00', NULL,       'DNA',        30, 'Did not attend'),
(17, 27, 7,  '2026-11-10', '16:00:00', NULL,       'Scheduled',  60, 'Oculoplastics consultation');

select * from appointment;

-- ------------------------------------------------------------
-- -- deleting one records where appointment id = 32
-- ------------------------------------------------------------

DELETE FROM appointment
WHERE appointment_id = 32;

INSERT INTO diagnosis (diagnosis_name, diagnosis_code, category,  is_active) VALUES
('Uveitis — anterior',         'H20.0', 'Uveitis',           TRUE),
('Choroidal naevus',           'D31.3', 'Oncology',          TRUE),
('Myopia',                     'H52.1', 'Refractive',        TRUE),
('Retinal detachment',         'H33.0', 'Retinal Disorders', TRUE),
('Optic neuritis',             'H46',   'Neuro-ophthalmology', TRUE);

select * from diagnosis;

INSERT INTO appointment_diagnosis (appointment_id, diagnosis_id, notes) VALUES
(29, 119,  'Amblyopia — patching continued'),
(30, 7, 'Retinal detachment — urgent referral'),
(31, 120, 'Optic neuritis — neuro review booked');

select * from appointment_diagnosis;

INSERT INTO prescription (appointment_id, prescribed_date, prescriber_role, is_repeat, authorisation_ref) VALUES
(22,  '2026-11-01', 'Uveitis Specialist',  FALSE, 'AUTH-00130'),
(23,  '2026-11-02', 'Oncology Consultant', FALSE, 'AUTH-00131'),
(24, '2026-11-03', 'Refractive Surgeon',  FALSE, 'AUTH-00132'),
(25, '2026-11-04', 'Ophthalmologist',     TRUE,  'AUTH-00133'),
(26, '2026-11-05', 'Retinal Surgeon',     TRUE,  'AUTH-00134'),
(27, '2026-11-06', 'Ophthalmologist',     FALSE, 'AUTH-00135'),
(28, '2026-11-07', 'Glaucoma Specialist', TRUE,  'AUTH-00136'),
(29, '2026-11-08', 'Paediatric Ophthalmologist', FALSE, 'AUTH-00137'),
(30, '2026-11-09', 'Ophthalmologist',     FALSE, 'AUTH-00138'),
(31, '2026-11-10', 'Oculoplastic Surgeon',FALSE, 'AUTH-00139');

select * from prescription;

INSERT INTO medicine (medicine_name, dmdd_code, manufacturer, is_controlled) VALUES
('Ofloxacin 0.3% Eye Drops',        '123456700008', 'EyeMed',       FALSE),
('Brimonidine 0.2% Eye Drops',      '123456700009', 'PharmaVision', FALSE),
('Atropine 1% Eye Drops',           '123456700010', 'SightPharm',   FALSE);

select * from medicine;

INSERT INTO prescription_item (prescription_id, medicine_id, dose, route, frequency, duration_days, quantity, refills_allowed) VALUES
(25,  7, '1 drop', 'Topical — Left eye',  '4 times daily',  14, 10.0, 0),
(26,  1, '1 drop', 'Topical — Both eyes','As required',     30, 15.0, 1),
(27, 5, '1 drop', 'Topical — Both eyes','Once daily',       3,  5.0, 0),
(28, 2, '1 drop', 'Topical — Both eyes','Once daily at night', 90, 25.0, 3),
(29, 6, '1 drop', 'Topical — Both eyes','Twice daily',     60, 20.0, 2),
(30, 1, '1 drop', 'Topical — Both eyes','4 times daily',   14, 10.0, 0),
(31, 9, '1 drop', 'Topical — Both eyes','Twice daily',     30, 15.0, 1),
(32, 5, '1 drop', 'Topical — Both eyes','Once daily',       3,  5.0, 0),
(33, 8, '1 drop', 'Topical — Right eye','4 times daily',    7,  8.0, 0),
(34, 10,'1 drop', 'Topical — Both eyes','Once daily',       7,  5.0, 0);

select * from prescription_item;

INSERT INTO follow_up (appointment_id, due_date, priority, status, reminder_sent, outcome_notes) VALUES
(31,  '2027-01-15', 'Medium', 'Planned',   FALSE, 'Uveitis review — stable'),
(30,  '2027-05-02', 'Low',    'Planned',   FALSE, 'Annual naevus photo'),
(29, '2026-12-03', 'Medium', 'Planned',   FALSE, 'Pre-op assessment');
select * from follow_up;

-- ============================================================
-- End of Data Insertion
-- ============================================================


