#  Ecommerce dbt Project

A simple end-to-end **dbt (Data Build Tool)** project demonstrating how to transform raw data into analytics-ready models using staging and marts layers.

---

#  1. Prerequisites

Before starting, ensure you have:

* Python (3.8 or higher)
* PostgreSQL installed and running
* Git (optional but recommended)
* Basic knowledge of SQL

---

#  2. Project Setup

### Clone or create project folder

```bash
git clone <your-repo-url>
cd ecommercev2_dbt
```

### Create virtual environment

```bash
python -m venv .venv
```

### Activate virtual environment

**Windows (Git Bash):**

```bash
source .venv/Scripts/activate
```

**Windows (CMD):**

```bash
.venv\Scripts\activate
```

**Copy environment file:**

```bash
cp .env.example .env
```
**Add your credentials inside .env:**
```bash
DBT_HOST=localhost
DBT_PORT=5433
DBT_USER=postgres
DBT_PASSWORD=your_password
DBT_DBNAME=ecommerce
DBT_SCHEMA=public
```



---

#  3. Install Dependencies

### Install dbt (PostgreSQL adapter)

```bash
pip install dbt-postgres
```

### Install project dependencies

```bash
dbt deps
```

---

##  Lock Dependencies 

Freeze dependencies for reproducibility:

```bash
pip freeze > requirements.txt
```

To reinstall later:

```bash
pip install -r requirements.txt
```

---

#  4. Configure dbt Profile

Update your profile file:

```
C:\Users\<your-user>\.dbt\profiles.yml
```

Example:

```yaml
ecommerce_project:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: postgres
      password: your_password
      port: 5433
      dbname: ecommerce
      schema: public
      threads: 4
```

---

#  5. Verify Setup

```bash
dbt debug
```

✅ Ensures connection and configuration are correct

---

#  6. Run dbt Models

### Run all models

```bash
dbt run
```

### Run specific model

```bash
dbt run -s model_name
```

### Run model with dependencies

```bash
dbt run -s +model_name
```

---

#  7. Run Tests

```bash
dbt test
```

Tests included:

* `not_null`
* `unique`
* `relationships`

---

#  8. Generate Documentation

```bash
dbt docs generate
dbt docs serve
```

Open in browser:

```
http://localhost:8080
```

---

#  9. Clean Project

Remove compiled files:

```bash
dbt clean
```

---

#  10. Full Refresh (Rebuild Models)

```bash
dbt run --full-refresh
```

---

#  Project Structure

```
models/
 ├── staging/
 │    ├── stg_customers.sql
 │    ├── stg_orders.sql
 │    └── sources.yml
 │
 ├── marts/
 │    ├── fct_orders.sql
 │    └── schema.yml
```

---

#  Architecture Overview

```
Raw Tables (PostgreSQL)
        ↓
sources.yml
        ↓
staging (data cleaning)
        ↓
marts (business logic)
```

---

#  Common Commands Cheat Sheet

| Task             | Command             |
| ---------------- | ------------------- |
| Run all models   | `dbt run`           |
| Run one model    | `dbt run -s model`  |
| Run tests        | `dbt test`          |
| Debug connection | `dbt debug`         |
| Install packages | `dbt deps`          |
| Generate docs    | `dbt docs generate` |

---

#  Summary

This project demonstrates:

* Data transformation using dbt
* Modular SQL modeling
* Data quality testing
* Documentation generation
* Scalable project structure

---
