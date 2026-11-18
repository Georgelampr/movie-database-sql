# 🎬 Movie Database Management System (SQL)

A complete relational database design and SQL implementation for managing cinema data, including movies, cast & crew members, character roles, sequels, and production companies.

Developed as part of the **Databases** course at the Department of Informatics and Telematics, Harokopio University of Athens.

---

## 📌 Project Overview

The project is divided into two main phases:
1. **Conceptual & Logical Design (`diagrams/`):**
   - Entity-Relationship (ER) modeling using Visual Paradigm.
   - Mapping to a normalized Relational Schema handling multivalued attributes (`Genre`, `Keywords`, `Professions`), recursive relationships (`Sequels`), many-to-many relationships (`Acting`, `Directing`, `Screenwriting`), and a ternary relationship (`Role Portrayal`).
2. **Physical Implementation & Querying (`sql/`):**
   - **DDL (`01_create_schema.sql`):** Table creation with primary keys, foreign keys, `NOT NULL`, and `CHECK` constraints following strict naming conventions.
   - **DML (`02_insert_data.sql`):** Populating the database with sample movies, actors, directors, production companies, and roles.
   - **Analytical Queries (`03_queries.sql`):** Complex SQL queries utilizing multi-table `JOIN`s, `GROUP BY`, `HAVING`, aggregate functions, and relational division.
   - **Cleanup (`04_drop_schema.sql`):** Safe schema teardown script.

---

## 🗂️ Repository Structure

```text
├── diagrams/
│   ├── er_diagram.jpg               # Entity-Relationship (ER) Diagram
│   └── database_design_report.pdf   # Detailed design assumptions & relational mapping
└── sql/
    ├── 01_create_schema.sql         # DDL statements (Tables & Constraints)
    ├── 02_insert_data.sql           # Sample dataset insertion
    ├── 03_queries.sql               # Business & analytical SQL queries
    ├── 04_drop_schema.sql           # Schema deletion script
    └── query_results.pdf            # Executed query outputs




