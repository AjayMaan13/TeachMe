FROM container-registry.oracle.com/database/express:latest

# Environment variables for database configuration
ENV ORACLE_PWD=teachme123
ENV ORACLE_SID=XE
ENV ORACLE_PDB=TEACHMEPDB

# Copy SQL scripts to container
COPY ./sql /opt/oracle/scripts/startup

# Set execute permissions
USER root
RUN chmod -R 755 /opt/oracle/scripts/startup
USER oracle