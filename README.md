# VG Sales Dashboard Project

This project demonstrates a **data engineering and visualization stack** using PostgreSQL, Superset, and Docker. It loads a CSV dataset into a Postgres database and visualizes it in Superset dashboards.

---

## Project Structure

```
vg_sales/
├─ data/
│  └─ vgsales.csv               # Dataset
├─ postgres/
│  ├─ init.sql                  # Schema and table creation
│  └─ load_data.sql             # Data load from CSV
├─ superset/
│  ├─ superset_config.py        # Custom Superset configuration
│  └─ superset-dashboard/       # Exported dashboards as JSON
├─ docker-compose.yml           # Docker services configuration
├─ .env                         # Environment variables
└─ README.md                    # Project documentation
```

---

## Prerequisites

- Docker & Docker Compose installed
- PowerShell or Bash terminal
- Basic knowledge of SQL and Superset

---

## Setup Instructions

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd vg_sales
```

### 2. Configure environment variables

Create a `.env` file:

```env
POSTGRES_USER=admin
POSTGRES_PASSWORD=admin123
POSTGRES_DB=analytics_db

SUPERSET_ADMIN_USERNAME=admin
SUPERSET_ADMIN_PASSWORD=admin123
SUPERSET_ADMIN_FIRST_NAME=Admin
SUPERSET_ADMIN_LAST_NAME=User
SUPERSET_ADMIN_EMAIL=admin@example.com
SUPERSET_SECRET_KEY=your_secret_key
```

### 3. Start Docker services

```bash
docker-compose up -d
```

This will start:

- PostgreSQL database
- Superset visualization platform

---

### 4. Load CSV data into PostgreSQL

If not automatically loaded via Docker:

```bash
docker exec -i postgres_db psql -U admin -d analytics_db -c "\copy Sales FROM '/docker-entrypoint-initdb.d/vgsales.csv' CSV HEADER;"
```

---

### 5. Access Superset

- URL: [http://localhost:8088](http://localhost:8088)  
- Login using credentials from `.env` file.

---

### 6. Export Superset dashboards as JSON

Inside the container:

```bash
docker exec -it superset superset export-dashboards --dashboard-file /app/superset_home/exports/vgsales_dashboard.json
```

Copy JSON to local machine:

```powershell
docker cp superset:/app/superset_home/exports/vgsales_dashboard.json "E:\Practice\Docker Projects\vg_sales\superset\superset-dashboard\"
```

---

## Notes

- `superset_config.py` contains custom configurations for connecting to Postgres.  
- Ensure `superset_home/exports` folder exists inside container with write permissions.  
- Use `--dashboard-ids-file` if exporting multiple dashboards.  

---

## Future Enhancements

- Integrate **Airflow** for automated ETL pipelines.  
- Use **dbt** for data transformation.  
- Add **Superset charts and dashboards versioning** in Git.  
- Implement **Redis or Memcached** caching for production use.

---

## References

- [Superset Official Documentation](https://superset.apache.org/docs/intro)  
- [PostgreSQL Official Documentation](https://www.postgresql.org/docs/)  
- [Docker Official Documentation](https://docs.docker.com/)

