# superset_config.py
import os

# Secret key for Superset
SECRET_KEY = os.environ.get("SUPERSET_SECRET_KEY", "default_secret_key")

# set SQLALCHEMY connection:
SQLALCHEMY_DATABASE_URI = f"postgresql+psycopg2://{os.environ.get('POSTGRES_USER')}:{os.environ.get('POSTGRES_PASSWORD')}@postgres:5432/{os.environ.get('POSTGRES_DB')}"
