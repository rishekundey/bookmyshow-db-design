# 🎬 BookMyShow Database Design (Enterprise-Level Documentation)

---

## 📌 Project Overview

This project implements a **fully normalized relational database design** for a simplified BookMyShow-like movie ticketing system using **MySQL**.

The system supports the following core functionality:

- View the next 7 days of shows at a given theatre
- Select a specific date
- List all movies running in that theatre
- View their respective show timings

The schema strictly follows:

- ✅ First Normal Form (1NF)
- ✅ Second Normal Form (2NF)
- ✅ Third Normal Form (3NF)
- ✅ Boyce-Codd Normal Form (BCNF)

---

# 🏗️ System Entities & Detailed Table Design

---

## 1️⃣ THEATRE

Represents a cinema location.

### Table Structure

| Column        | Type            | Constraints | Description |
|--------------|----------------|------------|------------|
| theatre_id   | INT            | PK, AI     | Unique identifier for theatre |
| name         | VARCHAR(100)   | NOT NULL   | Theatre name |
| city         | VARCHAR(100)   | NOT NULL   | City where theatre is located |
| address      | VARCHAR(255)   | NULL       | Full address |
| created_at   | DATETIME       | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |

### Business Rules
- One theatre can have multiple screens.
- One theatre can have multiple shows.
- Theatre data is independent of movie scheduling.

---

## 2️⃣ SCREEN

Represents individual screens inside a theatre.

### Table Structure

| Column      | Type          | Constraints | Description |
|------------|--------------|------------|------------|
| screen_id  | INT          | PK, AI     | Unique screen identifier |
| theatre_id | INT          | FK         | References theatre(theatre_id) |
| screen_name| VARCHAR(50)  | NOT NULL   | Screen label (Screen 1, IMAX, etc.) |
| total_seats| INT          | NOT NULL   | Total seating capacity |

### Business Rules
- A screen belongs to exactly one theatre.
- A theatre can have multiple screens (1:N).
- A screen can have multiple shows (1:N).

---

## 3️⃣ MOVIE

Represents movie metadata independent of scheduling.

### Table Structure

| Column            | Type         | Constraints | Description |
|------------------|-------------|------------|------------|
| movie_id         | INT         | PK, AI     | Unique movie identifier |
| title            | VARCHAR(150)| NOT NULL   | Movie title |
| language         | VARCHAR(50) | NULL       | Language of movie |
| duration_minutes | INT         | NULL       | Duration in minutes |
| certificate      | VARCHAR(10) | NULL       | Certification (UA, A, U, etc.) |
| release_date     | DATE        | NULL       | Official release date |

### Business Rules
- Movie metadata is independent of theatre.
- A movie can run in multiple theatres and screens.

---

## 4️⃣ SHOW_DETAILS 

Represents a scheduled show for a movie on a specific screen at a specific theatre.

### Table Structure

| Column      | Type         | Constraints | Description |
|------------|-------------|------------|------------|
| show_id    | INT         | PK, AI     | Unique show identifier |
| theatre_id | INT         | FK         | References theatre(theatre_id) |
| movie_id   | INT         | FK         | References movie(movie_id) |
| screen_id  | INT         | FK         | References screen(screen_id) |
| show_date  | DATE        | NOT NULL   | Date of show |
| show_time  | TIME        | NOT NULL   | Time of show |
| price      | DECIMAL(8,2)| NOT NULL   | Ticket price |

### Constraints
- FOREIGN KEY(theatre_id)
- FOREIGN KEY(movie_id)
- FOREIGN KEY(screen_id)
- UNIQUE(theatre_id, movie_id, screen_id, show_date, show_time)

### Business Rules
- A theatre can host multiple shows per day.
- A screen cannot have overlapping shows at the same date & time.
- A movie can have multiple shows across theatres and screens.
- Composite UNIQUE constraint prevents duplicate scheduling.

---

# 🔁 Relationship Summary

| Relationship | Type |
|-------------|------|
| Theatre → Screen | 1 : N |
| Theatre → Show_Details | 1 : N |
| Screen → Show_Details | 1 : N |
| Movie → Show_Details | 1 : N |

---

# 📊 Normalization Explanation (With Examples)

---

## ✅ First Normal Form (1NF)

**Rule:**
- No repeating groups
- All attributes must contain atomic values

### ❌ Example (Violates 1NF)

| theatre_id | screens |
|------------|--------|
| 1 | Screen1, Screen2 |

Multiple values stored in one column.

### ✅ Our Design

Screens stored in separate SCREEN table.
Each row represents exactly one screen.

✔ Atomic values maintained.

---

## ✅ Second Normal Form (2NF)

**Rule:**
- Must be in 1NF
- No partial dependency on composite key

Since all tables use **single-column primary keys**, partial dependency cannot exist.

Example:
SHOW_DETAILS uses show_id as PK.
All other attributes depend fully on show_id.

✔ No partial dependency.

---

## ✅ Third Normal Form (3NF)

**Rule:**
- Must be in 2NF
- No transitive dependency

### ❌ Bad Example

If SHOW_DETAILS stored:
- theatre_name
- movie_title

These depend indirectly via foreign keys.

This creates redundancy and update anomalies.

### ✅ Our Design

SHOW_DETAILS stores only foreign keys:
- theatre_id
- movie_id
- screen_id

All descriptive data is retrieved using JOIN operations.

✔ No transitive dependency.

---

## ✅ Boyce-Codd Normal Form (BCNF)

**Rule:**
Every determinant must be a candidate key.

Example:
UNIQUE(theatre_id, movie_id, screen_id, show_date, show_time)

This ensures:
- No duplicate show scheduling
- Determinant is enforced via constraint

All functional dependencies are handled by:
- Primary Keys
- Unique constraints

✔ BCNF satisfied.

---

# 🚀 How to Execute

1. Create database:
   ```sql
   CREATE DATABASE bookmyshow;
   USE bookmyshow;
   ```

2. Run files in order:
   - schema.sql
   - sample_data.sql
   - queries.sql

---

# 📁 Project Structure

```
bookmyshow-db-design/
│
├── schema.sql
├── sample_data.sql
├── queries.sql
├── er_diagram.png
└── README.md
```

---

# 🧩 Future Extensibility

This design can be extended to include:

- User table
- Seat table
- Booking table
- Payment table
- Show seat allocation table
- Dynamic pricing tiers
- Offers & Coupons

The current schema is designed to scale without structural refactoring.

---
