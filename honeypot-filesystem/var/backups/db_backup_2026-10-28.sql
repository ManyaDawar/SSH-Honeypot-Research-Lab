-- FICTIONAL NORTHSTAR ANALYTICS DATABASE BACKUP
-- All records are synthetic and nonfunctional.

CREATE TABLE employees (
    employee_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO employees VALUES
(101, 'Alex Morgan', 'Engineering', 'alex@northstar.test'),
(102, 'Jamie Chen', 'Finance', 'jamie@northstar.test'),
(103, 'Riley Patel', 'IT Operations', 'riley@northstar.test');
