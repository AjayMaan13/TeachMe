#!/bin/bash
# Script to run SQL scripts in the correct order

# Wait for the database to be ready
sleep 30

# Connect to the database and run the scripts
echo "Running TeachMe database setup scripts..."
sqlplus system/teachme123@//localhost:1521/TEACHMEPDB @/opt/oracle/scripts/startup/01_create_tables.sql
sqlplus system/teachme123@//localhost:1521/TEACHMEPDB @/opt/oracle/scripts/startup/02_insert_sample_data.sql
sqlplus system/teachme123@//localhost:1521/TEACHMEPDB @/opt/oracle/scripts/startup/03_create_views.sql

echo "Database setup complete!"