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

