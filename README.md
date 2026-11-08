# database_submmative
Crownfield eye hospital Database 
# Crownfield Eye Hospital Database
Clinical Information System — Relational Database Design & Implementation

## Project Overview
This repository contains the complete database implementation for Crownfield Eye Hospital, designed to manage patient records, appointments, clinicians, clinics, diagnoses, prescriptions, medicines, and follow-up arrangements. The database follows normalisation principles up to Third Normal Form (3NF) and includes referential integrity, stored procedures, data validation triggers, and example queries.

## Repository Structure
crownfield-eye-db/
├── README.md # Project overview, setup and usage guide

├── schema/ # Database definition and data
│ ├── create_tables.sql # Table creation, constraints and relationships
│ ├── insert_data.sql # Base and extended dataset insertion
│ └── constraints_trx.sql # Referential integrity tests and transactions
├── sql/ # Queries, procedures and triggers
│ ├── q1_group_having.sql # Grouping and aggregation
│ ├── q2_three_join.sql # Multi-table inner join
│ ├── q3_left_join.sql # Incomplete record identification
│ ├── q4_cte_subquery.sql # Common Table Expression
│ ├── q5_procedure.sql # Prescription details + stored procedure
│ └── q6_trigger.sql # Follow-up date validation trigger
├── 

plaintext

## Database Schema
### Core Tables
| Table | Purpose |
|---|---|
| `patient` | Demographic and contact details for all patients |
| `specialty` | Clinical specialties offered at the hospital |
| `clinician` | Medical staff linked to their specialty |
| `clinic` | Physical locations where services are delivered |
| `appointment` | Scheduled, attended or cancelled patient consultations |
| `diagnosis` | Standardised clinical diagnosis reference data |
| `appointment_diagnosis` | Junction table linking appointments to recorded diagnoses |
| `prescription` | Medication authorisation records |
| `medicine` | Catalogue of drugs including coding and manufacturer details |
| `prescription_item` | Individual medication lines within each prescription |
| `follow_up` | Planned or completed review arrangements |

### Key Features
- **Normalised Design**: Structured to 3NF to eliminate redundancy and ensure data consistency
- **Referential Integrity**: Foreign keys enforce valid relationships between tables
- **Cascade Behaviour**: `ON DELETE RESTRICT` protects core records; `ON DELETE CASCADE` removes dependent records appropriately
- **Business Rules**: Stored procedures and triggers validate data at the database level
- **Enumerated Statuses**: Consistent values for appointment and follow-up states

## Setup Instructions
### Prerequisites
- MySQL 5.7+ or MariaDB 10.2+
- Git (optional, for version control)

### Installation
1. Clone or download this repository
2. Create and select the database:
   ```sql
   source schema/create_tables.sql
