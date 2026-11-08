-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Crownfield Eye Hospital Database — Schema Creation
-- Project:  Clinical Information System
-- Version:  1.0
-- Date:     2026-11-07
-- Purpose:  Create database and all core tables with constraints
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- Create database if it does not exist
CREATE DATABASE IF NOT EXISTS crownfield_eye_hospital_db;

-- Select database for subsequent operations
USE crownfield_eye_hospital_db;

	
-- 					Patient Table
-- Stores core demographic and contact details for all patients
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create table patient(
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_first_name VARCHAR(75) NOT NULL,
    patient_middle_name VARCHAR(70),
    patient_last_name VARCHAR(80) NOT NULL,
    patient_dob DATE NOT NULL,
    patient_address VARCHAR(250) NOT NULL,
    patient_postcode VARCHAR(12) NOT NULL,
    patient_contact VARCHAR(25) NOT NULL,
    patient_email VARCHAR(125));
    
-- Viewing Table --
Select * from patient;

	
-- 					Specialty Table
-- Clinical specialties available within the hospital
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create table specialty(
    specialty_id INT PRIMARY KEY AUTO_INCREMENT,
    specialty_name VARCHAR(70) NOT NULL UNIQUE,
    specialty_code VARCHAR(15) NOT NULL UNIQUE,
    specialty_description TEXT,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

-- Viewing Table Specialty: --

Select * from specialty;

	
-- 					Clinician Table
-- Medical staff records linked to their specialty
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create table clinician(
    clinician_id INT PRIMARY KEY AUTO_INCREMENT,
    clinician_first_name VARCHAR(85) NOT NULL,
    clinician_last_name VARCHAR(55) NOT NULL,
    clinician_email VARCHAR(125),
    clinician_gmc_number VARCHAR(20) NOT NULL UNIQUE,
    specialty_id INT NOT NULL,
    FOREIGN KEY (specialty_id) REFERENCES specialty(specialty_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
-- view table Clinian --
Select * from clinician;


	
-- 						Clinic Table
-- Physical locations where services are delivered
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
Create table clinic(
    clinic_id INT PRIMARY KEY AUTO_INCREMENT,
    clinic_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(140) NOT NULL,
    opening_hours VARCHAR(125) NOT NULL,
    is_teaching_site BOOLEAN NOT NULL DEFAULT FALSE,
    contact_tel VARCHAR(18));
    
-- View Table clinic:

Select * from clinic;

	
-- 				Appointment Table
-- Scheduled or attended patient consultations
-- ++++++++++++++++++++++++++++++++++++++++++++
create table appointment(
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    clinician_id INT NOT NULL,
    clinic_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    checkin_time TIME,
    status ENUM('Scheduled','Checked-in','Completed','Cancelled','DNA') NOT NULL DEFAULT 'Scheduled',
    duration_mins INT NOT NULL DEFAULT 15,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (clinician_id) REFERENCES clinician(clinician_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (clinic_id) REFERENCES clinic(clinic_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
-- Viewing Table APPOINTMENT ---

Select * from appointment;

	
-- 					Diagnosis Table
-- Standard clinical diagnosis reference data
-- +++++++++++++++++++++++++++++++++++++++++++
create table diagnosis(
    diagnosis_id INT PRIMARY KEY AUTO_INCREMENT,
    diagnosis_name VARCHAR(150) NOT NULL UNIQUE,
    diagnosis_code VARCHAR(25) NOT NULL UNIQUE,
    category VARCHAR(30) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

-- Viewing table DIAGNOSIS: --
Select * from diagnosis;

	
-- 			Appointment Diagnosis Junction Table
-- Links appointments to one or more recorded diagnoses
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
create table appointment_diagnosis(
    appointment_id INT NOT NULL,
    diagnosis_id INT NOT NULL,
    notes TEXT,
    PRIMARY KEY (appointment_id, diagnosis_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (diagnosis_id) REFERENCES diagnosis(diagnosis_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Viewing Table APPOINTMENT_ Diagnosis --
select * from appointment_diagnosis;



-- 				Prescription Table
-- Encounters where medication is authorised
-- ++++++++++++++++++++++++++++++++++++++++++

create table prescription(
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    prescribed_date DATE NOT NULL,
    prescriber_role VARCHAR(60) NOT NULL,
    is_repeat BOOLEAN NOT NULL DEFAULT FALSE,
    authorisation_ref VARCHAR(40),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Viewing Table PRESCRIPTION --

select * from prescription;


	
-- 				Medicine Table
-- Drug catalogue including standard coding
-- +++++++++++++++++++++++++++++++++++++++++
create table  medicine(
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    medicine_name VARCHAR(80) NOT NULL UNIQUE,
    dmdd_code VARCHAR(15) NOT NULL UNIQUE,
    manufacturer VARCHAR(150),
    is_controlled BOOLEAN NOT NULL DEFAULT FALSE
);

-- Viewing Table PRESCRIPTION --
select * from MEDICINE;


	
-- 			Prescription Item Junction Table
-- Individual medication lines within a prescription
-- ++++++++++++++++++++++++++++++++++++++++++++++++++
create table prescription_item(
    prescription_id INT NOT NULL,
    medicine_id INT NOT NULL,
    dose VARCHAR(60) NOT NULL,
    route VARCHAR(60) NOT NULL,
    frequency VARCHAR(60) NOT NULL,
    duration_days INT,
    quantity DECIMAL(10,2) NOT NULL,
    refills_allowed INT NOT NULL DEFAULT 0,
    PRIMARY KEY (prescription_id, medicine_id),
    FOREIGN KEY (prescription_id) REFERENCES prescription(prescription_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES medicine(medicine_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Viewing Table PRESCRIPTION_ITEM ---

select * from prescription_item;




-- 			Follow Up Table
-- Planned or scheduled review arrangements
-- ++++++++++++++++++++++++++++++++++++++++
create table follow_up(
    follow_up_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL UNIQUE,
    due_date DATE NOT NULL,
    priority ENUM('Low','Medium','High') NOT NULL,
    status ENUM('Planned','Reminded','Completed','Cancelled','Missed') NOT NULL DEFAULT 'Planned',
    reminder_sent BOOLEAN NOT NULL DEFAULT FALSE,
    outcome_notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Viewing Table FOLLOW_UP --

select * from follow_up;

