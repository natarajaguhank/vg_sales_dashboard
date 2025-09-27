#!/bin/bash
set -e

# Create Superset admin user using .env variables
superset fab create-admin \
   --username $SUPERSET_ADMIN \
   --firstname Superset \
   --lastname Admin \
   --email admin@admin.com \
   --password $SUPERSET_ADMIN_PASSWORD || true

# Upgrade DB & initialize Superset
superset db upgrade
superset init
