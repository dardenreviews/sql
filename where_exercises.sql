-- 1. Create a file named where_exercises.sql. Make sure to use the employees database.

USE employees;

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned. (709 observations or rows)

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? (709 observations; it matches.)

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name =  'Maya';

-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned. (441 observations)

SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
AND gender = 'M';

-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. (7330 observations)

SELECT *
FROM employees 
WHERE last_name like 'E%';

-- 6. Find all current or previous employees whose last name starts OR ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. (30_723 observations)

SELECT *
FROM employees 
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

-- How many employees have a last name that ends with E, but does not start with E? (23_393 observations)

SELECT *
FROM employees 
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';

-- 7. Find all current or previous employees employees whose last name starts AND ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. (899 observations)

SELECT *
FROM employees 
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

-- How many employees' last names end with E, regardless of whether they start with E? (24_292 observations)

SELECT *
FROM employees 
WHERE last_name LIKE '%E';


-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned. 135_214

SELECT * 
FROM employees
WHERE hire_date LIKE '199%';

-- We can also use WHERE BETWEEN AND. (135_214 observations; it matches.)

SELECT * 
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned. (842 observations)

SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned. (362 observations)

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25';

-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned. (1873 observations)

SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? (547 observations)

SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%';

-- Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
SELECT *
FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Maya'
OR first_name = 'Vidya';

-- Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT *
FROM employees
WHERE gender = "M"
AND (
first_name = 'Irena'
OR first_name = 'Maya'
OR first_name = 'Vidya'
);

-- A and B == B and A
-- A + B == B + A
SELECT *
FROM employees
WHERE (
first_name = 'Irena'
OR first_name = 'Maya'
OR first_name = 'Vidya'
) 
AND gender = "M";


-- Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT *
FROM employees
WHERE last_name LIKE 'e%'
OR last_name LIKE '%e';


-- Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT *
FROM employees
WHERE last_name LIKE 'e%'
AND last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE 'e%e';

-- Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT * 
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25';

-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

-- Find employees hired on Halloween and born in Oct
SELECT *
FROM employees
WHERE hire_date LIKE '%-10-31'
AND birth_date LIKE '%-10-%';