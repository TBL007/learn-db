SET NAMES utf8mb4;
START TRANSACTION;

-- ============================================================
-- COURSES
-- ============================================================
INSERT INTO courses (id, title, info, logo) VALUES
('db-1', 'MySQL',
 '["MySQL is one of the most widely used relational database management systems in the world. It is free, open source and runs everything from student projects to large web services.", "Data is stored in tables of rows and columns, and you work with it using SQL. This guide teaches the core concepts step by step, using a small university database as the running example."]',
 '/mysql.png'),
('mariadb', 'MariaDB',
 '["MariaDB is a free, open-source relational database that started as a community fork of MySQL and stays largely compatible with it.", "Data is stored in tables of rows and columns, and you work with it using SQL. It powers everything from small websites to large production systems."]',
 '/mariadb.png');

-- ============================================================
-- CATEGORIES (id, course_id, title, info, position)
-- ============================================================
INSERT INTO categories (id, course_id, title, info, position) VALUES
('db-1-cat-1', 'db-1', 'Getting Started',
 'This guide will teach you the core foundational concepts of databases using MySQL, one of the most widely used relational database management systems in the world.', 0),
('db-1-cat-2', 'db-1', 'Creating Tables',
 'Create a database, choose sensible data types and define tables with primary keys and constraints.', 1),
('db-1-cat-3', 'db-1', 'Working with Data (CRUD)',
 'Create, read, update and delete rows. Together these are known as CRUD.', 2),
('db-1-cat-4', 'db-1', 'Filtering and Sorting',
 'Ask more precise questions: filter rows, sort the result and limit how much you get back.', 3),
('db-1-cat-5', 'db-1', 'Summarizing Data',
 'Aggregate functions boil many rows down to one value. GROUP BY does it once per group.', 4),
('db-1-cat-6', 'db-1', 'Relationships and Joins',
 'Real data is split across tables. Foreign keys link the tables and keep the data consistent, and joins combine them again when you query.', 5),
('db-1-cat-7', 'db-1', 'Intermediate Queries',
 'Subqueries, views, indexes and transactions: tools for writing cleaner, faster and safer queries.', 6),
('db-1-cat-8', 'db-1', 'Security and Safety',
 'Give each user only the access they need, protect your queries against SQL injection and keep backups.', 7),
('db-1-cat-9', 'db-1', 'Using MySQL in a Real Application',
 'Connect to MySQL from Node.js: keep credentials out of your code, use parameterized queries and handle errors.', 8),
('db-1-cat-10', 'db-1', 'Next Steps',
 'You now know the core of relational databases. Here is what to explore next.', 9),

('mariadb-getting-started', 'mariadb', 'Getting started',
 'Install MariaDB, open a terminal and connect to your server for the first time.', 0),
('first-table', 'mariadb', 'Creating your first table',
 'Create a database, choose sensible data types and define a table with a primary key.', 1),
('data', 'mariadb', 'Manipulating data',
 'Create, read, update and delete rows. Together these are known as CRUD.', 2),
('filtering-sorting', 'mariadb', 'Filtering and sorting',
 'Ask more precise questions: filter rows, sort the result and limit how much you get back.', 3),
('relations', 'mariadb', 'Relations and foreign keys',
 'Real data is split across tables. A foreign key links a row in one table to a row in another and keeps the data consistent.', 4),
('many-to-many', 'mariadb', 'Many-to-many relations',
 'An order can contain many products and a product can appear in many orders. This needs a junction table in between.', 5),
('joins', 'mariadb', 'Joining tables',
 'Joins combine rows from several tables into one result using the relations you defined.', 6),
('indexes', 'mariadb', 'Indexes and performance',
 'Indexes make lookups fast. EXPLAIN shows whether the database is using them.', 7),
('transactions', 'mariadb', 'Transactions',
 'A transaction groups several statements so they either all succeed or none do.', 8),
('users-security', 'mariadb', 'Users and security',
 'Do not run your applications as root. Create a dedicated user with only the permissions it needs.', 9),
('backup-restore', 'mariadb', 'Backup and restore',
 'Hardware fails and mistakes happen. Make backups before you need them, and test restoring them.', 10);

-- ============================================================
-- STEPS (id, category_id, title, text, image, important, code, position)
-- ============================================================
INSERT INTO steps (id, category_id, title, text, image, important, code, position) VALUES
-- MySQL / 1. Getting Started
('db-1-cat-1-step-1', 'db-1-cat-1', 'What is a database?',
 'A database is an organized collection of structured data stored electronically. Unlike a spreadsheet, a database is built to handle large amounts of data safely, prevent errors and let many users and programs read and write at the same time. The software that manages it is called a database management system (DBMS).',
 NULL, 'The database is the data. MySQL is the DBMS: the program that stores, protects and serves it.', NULL, 0),
('db-1-cat-1-step-2', 'db-1-cat-1', 'Relational Databases & The Spreadsheet Analogy',
 'MySQL is a relational database management system (RDBMS): the data lives in tables that can be linked to each other. If you know spreadsheets you already know the layout. A table is like one sheet about a single subject (students). A column is a category with a name and a data type (email). A row is one record (one student). In relational theory these are called a relation, an attribute and a tuple.',
 '/images/mysqltable.png', NULL, NULL, 1),
('db-1-cat-1-step-3', 'db-1-cat-1', 'Keys and relationships',
 'In a spreadsheet, a student who takes five courses means repeating their name and email five times. In a relational database you store the student once and link to it using keys. A primary key uniquely identifies each row in a table. A foreign key is a column that holds the primary key of a row in another table, and that is what creates the relationship. You will build this in chapter 6.',
 NULL, 'Every table should have a primary key.', NULL, 2),
('db-1-cat-1-step-4', 'db-1-cat-1', 'What is SQL?',
 'SQL (Structured Query Language) is the standard language for talking to relational databases. Its English-like statements fall into groups: DDL defines structure (CREATE, ALTER, DROP), DML works with data (INSERT, SELECT, UPDATE, DELETE) and DCL controls access (GRANT, REVOKE). The four data operations are known as CRUD: Create, Read, Update, Delete.',
 NULL, NULL, NULL, 3),
('db-1-cat-1-step-5', 'db-1-cat-1', 'Downloading MySQL',
 'Head over to the <a href=''https://dev.mysql.com/downloads/mysql/'' target=''_blank'' rel=''noreferrer''>MySQL Community Server downloads page</a> and pick the latest LTS (long-term support) release for your operating system, also get <a href=''https://dev.mysql.com/downloads/workbench/'' target=''_blank'' rel=''noreferrer''>MySQL Workbench</a>, a graphical client.',
 NULL, NULL, NULL, 4),
('db-1-cat-1-step-6', 'db-1-cat-1', 'Installing MySQL',
 'Open the installer you downloaded and walk through the steps. On Windows, choose ''Server only'', or ''Developer Default'' if you also want Workbench. You will be asked to set a password for the root user.',
 NULL, 'Store the root password in a password manager. You cannot read it back later, only reset it.', NULL, 5),
('db-1-cat-1-step-7', 'db-1-cat-1', 'Open a terminal',
 'To talk to the server you need a command line. On Windows open ''MySQL Command Line Client'' from the start menu (or Command Prompt), on macOS or Linux open Terminal.',
 '/images/mysqlcmd.png', 'If the terminal says ''mysql'' is not recognized, the MySQL bin folder is missing from your PATH. Use the MySQL Command Line Client shortcut instead.', NULL, 6),
('db-1-cat-1-step-8', 'db-1-cat-1', 'Connect',
 'Connect to the server on localhost, port 3306, as the root user.',
 NULL, '-u picks the user and -p makes the client ask for the password.',
 'mysql -u root -p', 7),
('db-1-cat-1-step-9', 'db-1-cat-1', 'Login',
 'Type your password when prompted. When you see the ''mysql>'' prompt you are connected.',
 '/images/mysqlconnect.png', NULL, NULL, 8),
('db-1-cat-1-step-10', 'db-1-cat-1', 'Check that it works',
 'Ask the server which version it is running, then leave the client again.',
 NULL, 'Every SQL statement ends with a semicolon.',
 'SELECT VERSION();
exit', 9),

-- MySQL / 2. Creating Tables
('db-1-cat-2-step-1', 'db-1-cat-2', 'Create a database',
 'Create a database for the university. The utf8mb4 character set stores every character, including emoji and non-English letters.',
 NULL, NULL,
 'CREATE DATABASE university CHARACTER SET utf8mb4;', 0),
('db-1-cat-2-step-2', 'db-1-cat-2', 'Select it',
 'Make it the active database, then list all databases to confirm it exists.',
 NULL, NULL,
 'USE university;
SHOW DATABASES;', 1),
('db-1-cat-2-step-3', 'db-1-cat-2', 'Pick data types',
 'Common types: INT for whole numbers, TINYINT for small ones, DECIMAL(10,2) for exact decimals such as money, VARCHAR(n) for short text up to n characters, CHAR(n) for fixed-length text, TEXT for long text, DATE and TIMESTAMP for time, BOOLEAN for true/false (stored as 0 or 1).',
 NULL, 'Never store money in FLOAT or DOUBLE. They store binary approximations, so 0.1 + 0.2 is not exactly 0.3.', NULL, 2),
('db-1-cat-2-step-4', 'db-1-cat-2', 'Create the students table',
 'Create a students table, then inspect it. DESCRIBE lists every column with its type and constraints.',
 '/images/mysqltablecreated.png', NULL,
 'CREATE TABLE students (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(100) NOT NULL,
  email       VARCHAR(255) NOT NULL UNIQUE,
  enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW TABLES;
DESCRIBE students;', 3),
('db-1-cat-2-step-5', 'db-1-cat-2', 'What the constraints do',
 'PRIMARY KEY identifies each row uniquely. AUTO_INCREMENT generates the next id for you. NOT NULL forbids empty values. UNIQUE stops two rows from sharing the same value. DEFAULT fills in a value when you leave it out. CHECK makes sure a condition is true for every row.',
 NULL, 'CHECK constraints are enforced from MySQL 8.0.16. Older versions accepted them but silently ignored them.', NULL, 4),
('db-1-cat-2-step-6', 'db-1-cat-2', 'Create the courses table',
 'Create a second table. Course codes must be unique, and credits must be positive.',
 NULL, NULL,
 'CREATE TABLE courses (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  code    VARCHAR(10) NOT NULL UNIQUE,
  title   VARCHAR(100) NOT NULL,
  credits TINYINT NOT NULL DEFAULT 10 CHECK (credits > 0)
);', 5),
('db-1-cat-2-step-7', 'db-1-cat-2', 'Change a table',
 'Use ALTER TABLE to change a table that already exists. Add a column for the study program. You can also use MODIFY to change a column type and DROP COLUMN to remove one.',
 NULL, NULL,
 'ALTER TABLE students ADD COLUMN program VARCHAR(50);
DESCRIBE students;', 6),
('db-1-cat-2-step-8', 'db-1-cat-2', 'Delete a table',
 'DROP TABLE removes a table and all of its data. Try it on a throwaway table.',
 NULL, 'There is no undo. DROP TABLE and DROP DATABASE delete the data immediately.',
 'CREATE TABLE scratch (id INT);
DROP TABLE scratch;', 7),

-- MySQL / 3. CRUD
('db-1-cat-3-step-1', 'db-1-cat-3', 'Insert data',
 'Add a single row to the table. Leave out id and enrolled_at, MySQL fills them in.',
 NULL, NULL,
 'INSERT INTO students (name, email, program)
VALUES (''Ola Nordmann'', ''ola@example.com'', ''Computer Science'');', 0),
('db-1-cat-3-step-2', 'db-1-cat-3', 'Insert several rows',
 'You can add many rows in one statement by separating the value lists with commas. Jonas has no program yet, so we leave that column out.',
 NULL, NULL,
 'INSERT INTO students (name, email, program) VALUES
  (''Kari Hansen'', ''kari@example.com'', ''Computer Science''),
  (''Anna Berg'',   ''anna@example.com'', ''Informatics'');

INSERT INTO students (name, email)
VALUES (''Jonas Lie'', ''jonas@example.com'');

INSERT INTO courses (code, title, credits) VALUES
  (''DB101'', ''Introduction to Databases'', 10),
  (''PR101'', ''Programming 1'',             10),
  (''MA101'', ''Discrete Mathematics'',      10);', 1),
('db-1-cat-3-step-3', 'db-1-cat-3', 'Read data',
 'Select everything you have inserted so far.',
 NULL, 'In real applications list the columns you need instead of using *.',
 'SELECT * FROM students;', 2),
('db-1-cat-3-step-4', 'db-1-cat-3', 'Read specific columns',
 'List the columns after SELECT to get only what you need.',
 NULL, NULL,
 'SELECT name, email FROM students;', 3),
('db-1-cat-3-step-5', 'db-1-cat-3', 'Change data',
 'Change a row by telling UPDATE which row to touch.',
 NULL, 'Always include WHERE and prefer the primary key. Without WHERE, every row is updated. MySQL Workbench has ''safe updates'' on by default and refuses such statements with error 1175.',
 'UPDATE students
SET name = ''Ola N. Nordmann''
WHERE id = 1;', 4),
('db-1-cat-3-step-6', 'db-1-cat-3', 'Delete data',
 'Remove a row with DELETE. Check what will match first by running the same WHERE as a SELECT. We insert a throwaway student first so we do not lose real data. Email is UNIQUE, so it matches at most one row.',
 NULL, NULL,
 'INSERT INTO students (name, email)
VALUES (''Test Person'', ''test@example.com'');

-- 1. see which row(s) will be affected
SELECT * FROM students WHERE email = ''test@example.com'';

-- 2. then delete them
DELETE FROM students WHERE email = ''test@example.com'';', 5),
('db-1-cat-3-step-7', 'db-1-cat-3', 'Understanding NULL',
 'NULL means ''no value / unknown''. It is not zero and not an empty string. Any comparison with NULL using = gives unknown, so the row is never returned. Use IS NULL and IS NOT NULL instead. Jonas has no program, so he is the row that matches.',
 NULL, NULL,
 '-- returns nothing, even though Jonas has no program
SELECT name FROM students WHERE program = NULL;

-- correct
SELECT name FROM students WHERE program IS NULL;', 6),

-- MySQL / 4. Filtering and Sorting
('db-1-cat-4-step-1', 'db-1-cat-4', 'Filter with WHERE',
 'Only return the rows that match a condition.',
 NULL, NULL,
 'SELECT name, email
FROM students
WHERE program = ''Computer Science'';', 0),
('db-1-cat-4-step-2', 'db-1-cat-4', 'Combine conditions',
 'Use AND, OR and parentheses to combine several conditions. AND is evaluated before OR, so use parentheses when you mix them.',
 NULL, NULL,
 'SELECT *
FROM students
WHERE program = ''Computer Science''
  AND enrolled_at >= ''2026-01-01'';', 1),
('db-1-cat-4-step-3', 'db-1-cat-4', 'IN and BETWEEN',
 'IN checks against a list of values. BETWEEN checks a range, and both ends are included.',
 NULL, NULL,
 'SELECT * FROM students
WHERE program IN (''Computer Science'', ''Informatics'');

SELECT code, title FROM courses
WHERE credits BETWEEN 5 AND 10;', 2),
('db-1-cat-4-step-4', 'db-1-cat-4', 'Search text with LIKE',
 'The % sign matches any number of characters and _ matches exactly one.',
 NULL, NULL,
 'SELECT *
FROM students
WHERE email LIKE ''%@example.com'';', 3),
('db-1-cat-4-step-5', 'db-1-cat-4', 'Sort and limit',
 'This returns the three newest students.',
 NULL, 'Without ORDER BY the row order is not guaranteed.',
 'SELECT *
FROM students
ORDER BY enrolled_at DESC
LIMIT 3;', 4),
('db-1-cat-4-step-6', 'db-1-cat-4', 'DISTINCT and aliases',
 'DISTINCT removes duplicate rows from the result. AS gives a column a readable name in the output.',
 NULL, NULL,
 'SELECT DISTINCT program FROM students;

SELECT name AS student_name, email AS contact
FROM students;', 5),

-- MySQL / 5. Summarizing Data
('db-1-cat-5-step-1', 'db-1-cat-5', 'Count rows',
 'COUNT(*) counts rows. COUNT(column) counts only the rows where that column is not NULL.',
 NULL, 'The two queries give different numbers, because Jonas has no program.',
 'SELECT COUNT(*) AS all_students FROM students;
SELECT COUNT(program) AS with_program FROM students;', 0),
('db-1-cat-5-step-2', 'db-1-cat-5', 'SUM, AVG, MIN and MAX',
 'The other aggregate functions work on numeric columns and ignore NULL.',
 NULL, NULL,
 'SELECT SUM(credits) AS total,
      AVG(credits) AS average,
      MIN(credits) AS smallest,
      MAX(credits) AS largest
FROM courses;', 1),
('db-1-cat-5-step-3', 'db-1-cat-5', 'Count per group',
 'GROUP BY splits the rows into groups and runs the aggregate once for each. NULL values form their own group.',
 NULL, NULL,
 'SELECT program, COUNT(*) AS students
FROM students
GROUP BY program;', 2),
('db-1-cat-5-step-4', 'db-1-cat-5', 'HAVING vs WHERE',
 'WHERE filters rows before they are grouped. HAVING filters the groups after the aggregate is calculated. This is why you cannot use COUNT(*) in a WHERE clause.',
 NULL, 'Order of evaluation: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT.',
 'SELECT program, COUNT(*) AS students
FROM students
WHERE program IS NOT NULL
GROUP BY program
HAVING COUNT(*) >= 2;', 3),
('db-1-cat-5-step-5', 'db-1-cat-5', 'Built-in functions',
 'MySQL has many functions for text, dates and numbers. You can use them in SELECT and in WHERE.',
 NULL, NULL,
 'SELECT UPPER(name)                    AS shout,
      CONCAT(name, '' <'', email, ''>'') AS contact,
      YEAR(enrolled_at)              AS year_enrolled
FROM students;

SELECT ROUND(AVG(credits), 1) AS avg_credits,
      CURDATE()              AS today
FROM courses;', 4),

-- MySQL / 6. Relationships and Joins
('db-1-cat-6-step-1', 'db-1-cat-6', 'Why split data up?',
 'If every row repeated the lecturer''s name and office, changing an office would mean editing many rows, and missing one would leave conflicting data. Storing each fact once and pointing to it by id is called normalization. In short: 1NF means every cell holds a single value, 2NF means every column depends on the whole key, and 3NF means columns depend on the key and nothing else.',
 NULL, NULL, NULL, 0),
('db-1-cat-6-step-2', 'db-1-cat-6', 'One-to-many',
 'One lecturer teaches many courses, but each course has exactly one lecturer. The ''many'' side (courses) stores the id of the ''one'' side (lecturers). Create the lecturers table and add a foreign key to courses.',
 NULL, 'Both columns must have the same type, and both tables must use the InnoDB engine (the default).',
 'CREATE TABLE lecturers (
  id     INT AUTO_INCREMENT PRIMARY KEY,
  name   VARCHAR(100) NOT NULL,
  office VARCHAR(20)
);

ALTER TABLE courses
  ADD COLUMN lecturer_id INT,
  ADD FOREIGN KEY (lecturer_id) REFERENCES lecturers(id);', 1),
('db-1-cat-6-step-3', 'db-1-cat-6', 'Add data to the relation',
 'Insert two lecturers and connect the courses to them.',
 NULL, NULL,
 'INSERT INTO lecturers (name, office) VALUES
  (''Ingrid Solberg'', ''B-204''),
  (''Henrik Moe'',     ''A-110'');

UPDATE courses SET lecturer_id = 1 WHERE code IN (''DB101'', ''PR101'');
UPDATE courses SET lecturer_id = 2 WHERE code = ''MA101'';', 2),
('db-1-cat-6-step-4', 'db-1-cat-6', 'See it being enforced',
 'Try to point a course at a lecturer that does not exist. You get error 1452 and the database refuses to create the broken link. This is called referential integrity.',
 NULL, NULL,
 'UPDATE courses SET lecturer_id = 99 WHERE code = ''MA101'';
-- ERROR 1452: Cannot add or update a child row: a foreign key constraint fails', 3),
('db-1-cat-6-step-5', 'db-1-cat-6', 'Decide what happens on delete',
 'By default (RESTRICT) MySQL refuses to delete a lecturer that still has courses and gives error 1451. ON DELETE CASCADE deletes the child rows along with the parent. ON DELETE SET NULL keeps them but clears the link (the column must allow NULL).',
 NULL, 'CASCADE is convenient but can delete far more than you expect. Use it deliberately.',
 'FOREIGN KEY (lecturer_id) REFERENCES lecturers(id)
  ON DELETE SET NULL', 4),
('db-1-cat-6-step-6', 'db-1-cat-6', 'Many-to-many',
 'A student can take many courses and a course can have many students. This needs a junction table in between that holds one row per enrolment and points to both sides. Any fact about the link itself, such as the grade, lives here.',
 NULL, 'The primary key is made of both columns (a composite key), so a student cannot be enrolled in the same course twice.',
 'CREATE TABLE enrolments (
  student_id INT NOT NULL,
  course_id  INT NOT NULL,
  grade      CHAR(1),
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (course_id)  REFERENCES courses(id)
);', 5),
('db-1-cat-6-step-7', 'db-1-cat-6', 'Enrol some students',
 'Add a few enrolments. The ids below assume you followed the earlier chapters, so check with SELECT * FROM students and SELECT * FROM courses first.',
 NULL, NULL,
 'INSERT INTO enrolments (student_id, course_id, grade) VALUES
  (1, 1, ''A''),
  (1, 2, ''B''),
  (2, 1, ''B''),
  (3, 3, NULL);', 6),
('db-1-cat-6-step-8', 'db-1-cat-6', 'INNER JOIN',
 'A join combines rows from two tables where the ON condition is true. INNER JOIN returns only the rows that have a match on both sides.',
 NULL, NULL,
 'SELECT c.code, c.title, l.name AS lecturer
FROM courses c
INNER JOIN lecturers l ON l.id = c.lecturer_id;', 7),
('db-1-cat-6-step-9', 'db-1-cat-6', 'LEFT JOIN',
 'Keeps every row from the left table, even if there is no match. The missing columns are NULL. Add a WHERE on the right table''s key to find rows with no match at all.',
 NULL, NULL,
 '-- all students, with their enrolments if any
SELECT s.name, e.course_id
FROM students s
LEFT JOIN enrolments e ON e.student_id = s.id;

-- only students who are not enrolled in anything
SELECT s.name
FROM students s
LEFT JOIN enrolments e ON e.student_id = s.id
WHERE e.course_id IS NULL;', 8),
('db-1-cat-6-step-10', 'db-1-cat-6', 'Join three tables',
 'Chain joins to follow the relations all the way from student to course.',
 NULL, NULL,
 'SELECT s.name, c.title, e.grade
FROM enrolments e
JOIN students s ON s.id = e.student_id
JOIN courses c  ON c.id = e.course_id;', 9),
('db-1-cat-6-step-11', 'db-1-cat-6', 'Combine with GROUP BY',
 'Count how many students are in each course. COUNT(e.student_id) is used instead of COUNT(*) so a course with no students shows 0.',
 NULL, NULL,
 'SELECT c.title, COUNT(e.student_id) AS students
FROM courses c
LEFT JOIN enrolments e ON e.course_id = c.id
GROUP BY c.id, c.title
ORDER BY students DESC;', 10),

-- MySQL / 7. Intermediate Queries
('db-1-cat-7-step-1', 'db-1-cat-7', 'Subqueries',
 'A subquery is a SELECT inside another query. The inner query runs first and its result is used by the outer one. Find the students enrolled in DB101.',
 NULL, NULL,
 'SELECT name
FROM students
WHERE id IN (
  SELECT student_id
  FROM enrolments
  WHERE course_id = 1
);', 0),
('db-1-cat-7-step-2', 'db-1-cat-7', 'EXISTS and correlated subqueries',
 'A correlated subquery refers to the outer query, so it is checked once per outer row. EXISTS is true when the subquery returns at least one row. This finds students with at least one enrolment.',
 NULL, NULL,
 'SELECT s.name
FROM students s
WHERE EXISTS (
  SELECT 1
  FROM enrolments e
  WHERE e.student_id = s.id
);', 1),
('db-1-cat-7-step-3', 'db-1-cat-7', 'Views',
 'A view is a saved query that you can use like a table. It stores no data of its own, it runs the query each time. Use it to hide complicated joins.',
 NULL, NULL,
 'CREATE VIEW student_courses AS
SELECT s.name AS student, c.title AS course, e.grade
FROM enrolments e
JOIN students s ON s.id = e.student_id
JOIN courses c  ON c.id = e.course_id;

SELECT * FROM student_courses WHERE grade = ''A'';', 2),
('db-1-cat-7-step-4', 'db-1-cat-7', 'What is an index?',
 'An index works like the index of a book: instead of reading every row (a full table scan), the database jumps straight to the matching ones. Primary keys, UNIQUE columns and foreign keys are indexed automatically. Indexes are usually stored as B-trees.',
 NULL, 'Indexes speed up reads but slow down writes and use disk space. Add them where you actually filter or join.',
 'CREATE INDEX idx_students_program ON students (program);', 3),
('db-1-cat-7-step-5', 'db-1-cat-7', 'Check with EXPLAIN',
 'Put EXPLAIN in front of a query. Look at the ''key'' column to see which index was used. NULL means no index, so a full table scan.',
 NULL, NULL,
 'EXPLAIN SELECT * FROM students WHERE program = ''Computer Science'';', 4),
('db-1-cat-7-step-6', 'db-1-cat-7', 'Transactions',
 'A transaction groups several statements into one unit of work. Nothing is permanent until COMMIT, and ROLLBACK undoes everything since START TRANSACTION. Try changing a grade and then undoing it.',
 NULL, NULL,
 'START TRANSACTION;

UPDATE enrolments SET grade = ''A''
WHERE student_id = 2 AND course_id = 1;

SELECT * FROM enrolments;

ROLLBACK;   -- use COMMIT; to keep the change', 5),
('db-1-cat-7-step-7', 'db-1-cat-7', 'ACID',
 'Transactions give you four guarantees. Atomicity: all statements succeed or none do. Consistency: the data always satisfies the rules (keys, constraints). Isolation: concurrent transactions do not see each other''s half-finished work. Durability: once committed, the data survives a crash.',
 NULL, 'Transactions need the InnoDB engine (the default). Statements like CREATE TABLE and DROP TABLE commit automatically and cannot be rolled back.', NULL, 6),

-- MySQL / 8. Security and Safety
('db-1-cat-8-step-1', 'db-1-cat-8', 'Do not use root in applications',
 'root can do anything, including dropping every database. If an application uses root and gets compromised, the attacker gets everything. Create a separate user for each application with only the privileges it needs. This is called the principle of least privilege.',
 NULL, NULL, NULL, 0),
('db-1-cat-8-step-2', 'db-1-cat-8', 'Create a user',
 'Create a user that can only connect from the same machine.',
 NULL, NULL,
 'CREATE USER ''app_user''@''localhost''
IDENTIFIED BY ''choose-a-strong-password'';', 1),
('db-1-cat-8-step-3', 'db-1-cat-8', 'Grant privileges',
 'Give the user access to the university database only, and only for the four CRUD operations. Then check what it can do.',
 NULL, NULL,
 'GRANT SELECT, INSERT, UPDATE, DELETE
ON university.*
TO ''app_user''@''localhost'';

SHOW GRANTS FOR ''app_user''@''localhost'';', 2),
('db-1-cat-8-step-4', 'db-1-cat-8', 'Revoke and remove',
 'Take privileges away with REVOKE and delete a user with DROP USER.',
 NULL, 'Do not run DROP USER yet if you want to use app_user in the next chapter.',
 'REVOKE DELETE ON university.* FROM ''app_user''@''localhost'';
DROP USER ''app_user''@''localhost'';', 3),
('db-1-cat-8-step-5', 'db-1-cat-8', 'SQL injection',
 'SQL injection happens when an application glues user input into a query as text. If someone types '' OR ''1''=''1 as their email, the query below returns every student, because the condition is always true. Attackers can use the same trick to read or destroy data.',
 NULL, 'Never build SQL by concatenating user input into a string. Use prepared statements.',
 '-- what the database receives when the input is glued in
SELECT * FROM students WHERE email = '''' OR ''1''=''1'';', 4),
('db-1-cat-8-step-6', 'db-1-cat-8', 'Prepared statements',
 'A prepared statement sends the query and the values separately. The ? is a placeholder, and the value is always treated as data, never as SQL. Your programming language''s MySQL driver does this for you (see chapter 9).',
 NULL, NULL,
 'PREPARE find_student FROM
  ''SELECT * FROM students WHERE email = ?'';

SET @email = ''ola@example.com'';
EXECUTE find_student USING @email;

DEALLOCATE PREPARE find_student;', 5),
('db-1-cat-8-step-7', 'db-1-cat-8', 'Backups',
 'mysqldump exports a database as a text file of SQL statements. Run it in your normal terminal, not inside the mysql client. To restore, feed the file back into mysql.',
 NULL, 'A backup you have never restored is not a backup. Test it, and keep a copy somewhere other than the same computer.',
 'mysqldump -u root -p --databases university > university_backup.sql

mysql -u root -p < university_backup.sql', 6),

-- MySQL / 9. Using MySQL in a Real Application
('db-1-cat-9-step-1', 'db-1-cat-9', 'How an application talks to MySQL',
 'Your program does not type into the mysql client. It uses a driver (a library) that opens a connection to the server, sends SQL, and turns the result rows into objects in your language. In Node.js, a popular driver is mysql2.',
 NULL, NULL, NULL, 0),
('db-1-cat-9-step-2', 'db-1-cat-9', 'Install the driver',
 'In your project folder, install mysql2.',
 NULL, NULL,
 'npm install mysql2', 1),
('db-1-cat-9-step-3', 'db-1-cat-9', 'Keep credentials in environment variables',
 'Never write passwords directly in your source code. Put them in a .env file (Next.js uses .env.local) and read them with process.env.',
 NULL, 'Add .env to .gitignore so the password never ends up in Git.',
 'DB_HOST=localhost
DB_USER=app_user
DB_PASSWORD=choose-a-strong-password
DB_NAME=university', 2),
('db-1-cat-9-step-4', 'db-1-cat-9', 'Connect and run a query',
 'Create a connection pool, which reuses connections instead of opening a new one for every query, and run a SELECT. The ? is a placeholder for the value.',
 NULL, NULL,
 'import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

const [rows] = await pool.execute(
  "SELECT id, name FROM students WHERE program = ?",
  ["Computer Science"]
);
console.log(rows);', 3),
('db-1-cat-9-step-5', 'db-1-cat-9', 'Insert data safely',
 'Pass values in the array, never inside the query string. The driver sends them separately, which prevents SQL injection.',
 NULL, 'Do not write "... VALUES (''" + name + "'')". That is exactly what SQL injection needs.',
 'await pool.execute(
  "INSERT INTO students (name, email, program) VALUES (?, ?, ?)",
  [name, email, program]
);', 4),
('db-1-cat-9-step-6', 'db-1-cat-9', 'Handle errors',
 'Queries can fail: the server may be down, or a constraint may be violated. Wrap them in try/catch and check the error code. Inserting an email that already exists gives ER_DUP_ENTRY.',
 NULL, NULL,
 'try {
  await pool.execute(
    "INSERT INTO students (name, email) VALUES (?, ?)",
    ["Ola Nordmann", "ola@example.com"]
  );
} catch (err) {
  if (err.code === "ER_DUP_ENTRY") {
    console.log("That email is already registered.");
  } else {
    throw err;
  }
}', 5),

-- MySQL / 10. Next Steps
('db-1-cat-10-step-1', 'db-1-cat-10', 'Stored procedures',
 'A stored procedure is a named block of SQL saved in the database that you run with CALL. DELIMITER temporarily changes the statement terminator, so the semicolons inside the procedure do not end the CREATE statement early.',
 NULL, NULL,
 'DELIMITER //
CREATE PROCEDURE courses_for_student(IN sid INT)
BEGIN
  SELECT c.code, c.title, e.grade
  FROM enrolments e
  JOIN courses c ON c.id = e.course_id
  WHERE e.student_id = sid;
END //
DELIMITER ;

CALL courses_for_student(1);', 0),
('db-1-cat-10-step-2', 'db-1-cat-10', 'Triggers',
 'A trigger is SQL that MySQL runs automatically when a row is inserted, updated or deleted. They are handy for audit logs and validation, but they run invisibly, so use them sparingly and document them.',
 NULL, NULL, NULL, 1),
('db-1-cat-10-step-3', 'db-1-cat-10', 'MySQL, MariaDB, PostgreSQL and SQLite',
 'MariaDB started as a fork of MySQL and is mostly compatible with it. PostgreSQL is another open-source RDBMS with richer features and stricter standards compliance. SQLite stores the whole database in one file with no server, which is why it is used in phones and small apps. The SQL you learned here carries over with small differences.',
 NULL, NULL, NULL, 2),
('db-1-cat-10-step-4', 'db-1-cat-10', 'Practice ideas',
 'The best way to learn is by building. Try a library database with authors, books and loans, or a webshop with customers, orders and products. Draw the tables on paper first, decide the keys, then write the CREATE TABLE statements.',
 NULL, NULL, NULL, 3),
('db-1-cat-10-step-5', 'db-1-cat-10', 'Keep learning',
 'The <a href=''https://dev.mysql.com/doc/'' target=''_blank'' rel=''noreferrer''>official MySQL documentation</a> is the reference for every statement and function. Good topics to explore next: query optimization, replication, window functions and NoSQL databases.',
 NULL, NULL, NULL, 4),

-- MariaDB / Getting started
('download', 'mariadb-getting-started', 'Downloading MariaDB',
 'Head over to the <a href=''https://mariadb.com/downloads/'' target=''_blank'' rel=''noreferrer''>MariaDB downloads page</a> and pick the latest stable (GA) release for your operating system.',
 NULL, NULL, NULL, 0),
('install', 'mariadb-getting-started', 'Installing MariaDB',
 'Open the installer you downloaded and walk through the steps. On Windows you will be asked to set a password for the root user.',
 NULL, 'Store the root password in a password manager. You cannot read it back later, only reset it.', NULL, 1),
('open-terminal', 'mariadb-getting-started', 'Open a terminal',
 'To talk to the server you need a command line. On Windows open ''Command Prompt'' or the ''MariaDB'' shortcut from the start menu, on macOS or Linux open Terminal.',
 '/images/mariacmd.png', NULL, NULL, 2),
('connect', 'mariadb-getting-started', 'Connect',
 'Connect to the server on localhost, port 3306, as the root user.',
 NULL, '-u picks the user and -p makes the client ask for the password.',
 'mariadb -u root -p', 3),
('login', 'mariadb-getting-started', 'Login',
 'Type your password when prompted. When you see the ''MariaDB [(none)]>'' prompt you are connected.',
 '/images/mariaconnect.png', NULL, NULL, 4),
('check-version', 'mariadb-getting-started', 'Check that it works',
 'Ask the server which version it is running, then leave the client again.',
 NULL, 'Every SQL statement ends with a semicolon.',
 'SELECT VERSION();
exit', 5),

-- MariaDB / First table
('create-db', 'first-table', 'Create a database',
 'Create a database for the shop. The utf8mb4 character set stores every character, including emoji and non-English letters.',
 NULL, NULL,
 'CREATE DATABASE shop CHARACTER SET utf8mb4;', 0),
('open-db', 'first-table', 'Select it',
 'Make it the active database, then list all databases to confirm it exists.',
 NULL, NULL,
 'USE shop;
SHOW DATABASES;', 1),
('data-types', 'first-table', 'Pick data types',
 'Common types: INT for whole numbers, DECIMAL(10,2) for money, VARCHAR(255) for short text, TEXT for long text, DATE and TIMESTAMP for time, BOOLEAN for true/false.',
 NULL, 'Never store money in FLOAT or DOUBLE. Rounding errors will bite you.', NULL, 2),
('create-table', 'first-table', 'Create a table',
 'Create a customers table, then inspect it. DESCRIBE lists every column with its type and constraints.',
 '/images/mariatablecreated.png', NULL,
 'CREATE TABLE customers (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  email      VARCHAR(255) NOT NULL UNIQUE,
  country    CHAR(2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW TABLES;
DESCRIBE customers;', 3),
('constraints', 'first-table', 'What the constraints do',
 'PRIMARY KEY identifies each row uniquely. NOT NULL forbids empty values. UNIQUE stops two rows from sharing the same value. DEFAULT fills in a value when you leave it out.',
 NULL, NULL, NULL, 4),

-- MariaDB / Manipulating data
('insert-data', 'data', 'Insert data',
 'Add a single row to the table.',
 NULL, NULL,
 'INSERT INTO customers (name, email, country)
VALUES (''Ola Nordmann'', ''ola@example.com'', ''NO'');', 0),
('insert-many', 'data', 'Insert several rows',
 'You can add many rows in one statement by separating the value lists with commas.',
 NULL, NULL,
 'INSERT INTO customers (name, email, country) VALUES
  (''Kari Hansen'', ''kari@example.com'', ''NO''),
  (''Anna Berg'',   ''anna@example.com'', ''SE'');', 1),
('read-data', 'data', 'Read data',
 'Select everything you have inserted so far.',
 NULL, 'In real applications list the columns you need instead of using *.',
 'SELECT * FROM customers;', 2),
('change-data', 'data', 'Change data',
 'Change a row by telling UPDATE which row to touch.',
 NULL, 'Always include WHERE and prefer the primary key. Without WHERE, every row is updated.',
 'UPDATE customers
SET name = ''Ola N. Nordmann''
WHERE id = 1;', 3),
('delete-data', 'data', 'Delete data',
 'Remove a row with DELETE. Check what will match first by running the same WHERE as a SELECT.',
 NULL, NULL,
 '-- 1. see which row(s) will be affected
SELECT * FROM customers WHERE id = 3;

-- 2. then delete them
DELETE FROM customers WHERE id = 3;', 4),

-- MariaDB / Filtering and sorting
('where', 'filtering-sorting', 'Filter with WHERE',
 'Only return the rows that match a condition.',
 NULL, NULL,
 'SELECT name, email
FROM customers
WHERE country = ''NO'';', 0),
('and-or', 'filtering-sorting', 'Combine conditions',
 'Use AND, OR and parentheses to combine several conditions.',
 NULL, NULL,
 'SELECT *
FROM customers
WHERE country = ''NO''
  AND created_at >= ''2026-01-01'';', 1),
('like', 'filtering-sorting', 'Search text with LIKE',
 'The % sign matches any number of characters.',
 NULL, NULL,
 'SELECT *
FROM customers
WHERE email LIKE ''%@example.com'';', 2),
('order-limit', 'filtering-sorting', 'Sort and limit',
 'This returns the ten newest customers.',
 NULL, 'Without ORDER BY the row order is not guaranteed.',
 'SELECT *
FROM customers
ORDER BY created_at DESC
LIMIT 10;', 3),
('aggregate', 'filtering-sorting', 'Count and group',
 'Count how many customers there are in each country.',
 NULL, NULL,
 'SELECT country, COUNT(*) AS customers
FROM customers
GROUP BY country;', 4),

-- MariaDB / Relations
('why-relations', 'relations', 'Why split data up?',
 'A customer can place many orders. Instead of repeating the customer''s name and email on every order, store the customer once and point to it by id. This is called normalization and it avoids duplicated and conflicting data.',
 NULL, NULL, NULL, 0),
('one-to-many', 'relations', 'One-to-many',
 'One customer has many orders, but each order belongs to exactly one customer. The ''many'' side (orders) stores the id of the ''one'' side (customers) in a column called customer_id.',
 NULL, NULL, NULL, 1),
('create-fk', 'relations', 'Create a foreign key',
 'Create the orders table. The FOREIGN KEY line tells MariaDB that customer_id must match an existing row in customers.',
 NULL, 'Both columns must have the same type, and both tables must use the InnoDB engine (the default).',
 'CREATE TABLE orders (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  total       DECIMAL(10,2) NOT NULL,
  ordered_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);', 2),
('fk-enforced', 'relations', 'See it being enforced',
 'Try to create an order for a customer that does not exist. You get error 1452 and the database refuses to create an orphaned order.',
 NULL, NULL,
 'INSERT INTO orders (customer_id, total)
VALUES (999, 49.90);
-- ERROR 1452: Cannot add or update a child row: a foreign key constraint fails', 3),
('referential-actions', 'relations', 'Decide what happens on delete',
 'ON DELETE CASCADE deletes a customer''s orders along with the customer. ON DELETE SET NULL keeps the orders but clears the link (the column must allow NULL). The default, RESTRICT, blocks the delete.',
 NULL, 'CASCADE is convenient but can delete far more than you expect. Use it deliberately.',
 'FOREIGN KEY (customer_id) REFERENCES customers(id)
  ON DELETE CASCADE', 4),
('one-to-one', 'relations', 'One-to-one',
 'Sometimes a table is split in two, for example customers and customer_profiles. Make the foreign key column UNIQUE so each customer can have at most one profile.',
 NULL, NULL,
 'CREATE TABLE customer_profiles (
  customer_id INT PRIMARY KEY,
  bio         TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);', 5),

-- MariaDB / Many-to-many
('products-table', 'many-to-many', 'Create products',
 'First create a table for the things that can be ordered.',
 NULL, NULL,
 'CREATE TABLE products (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  name  VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);', 0),
('junction', 'many-to-many', 'Create the junction table',
 'The junction table holds one row per product in an order and points to both sides.',
 NULL, 'The primary key is made of both columns (a composite key), so the same product cannot be added to the same order twice.',
 'CREATE TABLE order_items (
  order_id   INT NOT NULL,
  product_id INT NOT NULL,
  quantity   INT NOT NULL DEFAULT 1,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id)   REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id)
);', 1),
('fill-junction', 'many-to-many', 'Add data',
 'Insert a few products and an order, then link them in the junction table.',
 NULL, NULL,
 'INSERT INTO products (name, price) VALUES
  (''Coffee beans 500g'', 89.00),
  (''Ceramic mug'',       129.00);

INSERT INTO orders (customer_id, total) VALUES (1, 307.00);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
  (1, 1, 2),
  (1, 2, 1);', 2),
('extra-columns', 'many-to-many', 'Store data about the relation',
 'The junction table is the right place for facts about the link itself, such as quantity. Prices are often copied here too (unit_price) so old orders keep their price if the product price changes later.',
 NULL, NULL, NULL, 3),

-- MariaDB / Joins
('inner-join', 'joins', 'INNER JOIN',
 'Returns only customers that have at least one order.',
 NULL, NULL,
 'SELECT c.name, o.id AS order_id, o.total
FROM customers c
INNER JOIN orders o ON o.customer_id = c.id;', 0),
('left-join', 'joins', 'LEFT JOIN',
 'Keeps every customer, even those without orders. The missing order columns are NULL. Add a WHERE on the right table''s id to find customers that have never ordered.',
 NULL, NULL,
 '-- all customers, with their orders if any
SELECT c.name, o.id AS order_id
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id;

-- only customers with no orders
SELECT c.name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
WHERE o.id IS NULL;', 1),
('multi-join', 'joins', 'Join three tables',
 'Chain joins to follow the relations all the way from customer to product.',
 NULL, NULL,
 'SELECT c.name, p.name AS product, oi.quantity
FROM customers c
JOIN orders o       ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id   = o.id
JOIN products p     ON p.id          = oi.product_id;', 2),
('aggregate-join', 'joins', 'Combine with GROUP BY',
 'Show how much each customer has spent, best customers first.',
 NULL, NULL,
 'SELECT c.name, SUM(o.total) AS spent
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY spent DESC;', 3),

-- MariaDB / Indexes
('what-index', 'indexes', 'What is an index?',
 'An index works like the index of a book: instead of reading every row, the database jumps straight to the matching ones. Primary keys, UNIQUE columns and foreign keys are indexed automatically.',
 NULL, NULL, NULL, 0),
('create-index', 'indexes', 'Create an index',
 'Add an index on a column you often filter or join on.',
 NULL, 'Indexes speed up reads but slow down writes and use disk space. Add them where you actually filter or join.',
 'CREATE INDEX idx_customers_country ON customers (country);', 1),
('explain', 'indexes', 'Check with EXPLAIN',
 'Put EXPLAIN in front of a query. Look at the ''key'' column to see which index was used. NULL means a full table scan.',
 NULL, NULL,
 'EXPLAIN SELECT * FROM customers WHERE country = ''NO'';', 2),
('drop-index', 'indexes', 'Remove an index',
 'Drop an index you no longer need.',
 NULL, NULL,
 'DROP INDEX idx_customers_country ON customers;', 3),

-- MariaDB / Transactions
('why-transactions', 'transactions', 'Why you need them',
 'Placing an order means inserting into orders and order_items. If the second insert fails, you do not want a half-finished order left behind.',
 NULL, NULL, NULL, 0),
('start-commit', 'transactions', 'START TRANSACTION and COMMIT',
 'Start a transaction, run your statements, then COMMIT to save everything at once.',
 NULL, NULL,
 'START TRANSACTION;

INSERT INTO orders (customer_id, total) VALUES (2, 89.00);
INSERT INTO order_items (order_id, product_id, quantity)
VALUES (LAST_INSERT_ID(), 1, 1);

COMMIT;', 1),
('rollback', 'transactions', 'ROLLBACK',
 'If something goes wrong, ROLLBACK undoes every change since START TRANSACTION.',
 NULL, 'Transactions only work on InnoDB tables.',
 'START TRANSACTION;
DELETE FROM orders;   -- oops
ROLLBACK;             -- nothing was deleted', 2),
('acid', 'transactions', 'ACID',
 'InnoDB follows ACID: Atomic (all or nothing), Consistent (rules are respected), Isolated (transactions do not disturb each other) and Durable (committed data survives a crash).',
 NULL, NULL, NULL, 3),

-- MariaDB / Users and security
('create-user', 'users-security', 'Create a user',
 'Create a user that can only connect from the same machine.',
 NULL, 'Never commit passwords to Git. Keep them in environment variables or a secrets manager.',
 'CREATE USER ''shopapp''@''localhost'' IDENTIFIED BY ''a-long-random-password'';', 0),
('grant', 'users-security', 'Grant permissions',
 'Give the user only what the application needs, and only on the shop database.',
 NULL, NULL,
 'GRANT SELECT, INSERT, UPDATE, DELETE ON shop.* TO ''shopapp''@''localhost'';', 1),
('show-grants', 'users-security', 'Review permissions',
 'List exactly what the user may do.',
 NULL, NULL,
 'SHOW GRANTS FOR ''shopapp''@''localhost'';', 2),
('revoke', 'users-security', 'Remove access',
 'Take away a single permission, or remove the user entirely.',
 NULL, NULL,
 'REVOKE DELETE ON shop.* FROM ''shopapp''@''localhost'';

DROP USER ''shopapp''@''localhost'';', 3),
('injection', 'users-security', 'Beware of SQL injection',
 'Never build queries by gluing user input into a string. Use prepared statements (parameterized queries) in your application code.',
 NULL, NULL,
 '-- bad: user input is part of the SQL text
"SELECT * FROM customers WHERE email = ''" + email + "''"

-- good: the value is sent separately from the query
"SELECT * FROM customers WHERE email = ?"', 4),

-- MariaDB / Backup and restore
('dump', 'backup-restore', 'Back up with mariadb-dump',
 'Run this from a normal terminal, not inside the mariadb client. It writes the whole database to a .sql file.',
 NULL, 'On older versions the tool is called mysqldump.',
 'mariadb-dump -u root -p shop > shop-backup.sql', 0),
('restore', 'backup-restore', 'Restore a backup',
 'Create an empty database, then feed the file back in.',
 NULL, NULL,
 'mariadb -u root -p -e "CREATE DATABASE shop_restored;"
mariadb -u root -p shop_restored < shop-backup.sql', 1),
('schedule', 'backup-restore', 'Automate it',
 'Run the dump on a schedule (cron on Linux, Task Scheduler on Windows) and keep copies somewhere other than the same machine.',
 NULL, NULL,
 '# crontab: every night at 02:30
30 2 * * * mariadb-dump -u backup -p''secret'' shop > /backups/shop-$(date +\\%F).sql', 2),
('test-restore', 'backup-restore', 'Test your backups',
 'A backup you have never restored is only a hope. Try restoring into a test database now and then.',
 NULL, NULL, NULL, 3);

-- ============================================================
-- QUESTIONS (id, category_id, question, answertype, alternatives, answer, position)
-- ============================================================
INSERT INTO questions (id, category_id, question, answertype, alternatives, answer, position) VALUES
-- MySQL / 1. Getting Started
('db-1-cat-1-q-1', 'db-1-cat-1', 'What does RDBMS stand for?', 'multiple',
 '["Relational Database Management System", "Remote Data Backup Management System", "Relational Data Binary Mapping Structure"]',
 'Relational Database Management System', 0),
('db-1-cat-1-q-2', 'db-1-cat-1', 'What links a row in one table to a row in another table?', 'multiple',
 '["A foreign key", "A spreadsheet formula", "A column alias", "A comment"]',
 'A foreign key', 1),
('db-1-cat-1-q-3', 'db-1-cat-1', 'Which command connects as root and asks for a password?', 'multiple',
 '["mysql -u root -p", "mysql --root --password-none", "connect mysql root"]',
 'mysql -u root -p', 2),
('db-1-cat-1-q-4', 'db-1-cat-1', 'Which port does MySQL listen on by default?', 'text',
 NULL, '3306', 3),

-- MySQL / 2. Creating Tables
('db-1-cat-2-q-1', 'db-1-cat-2', 'Which data type is best for a price like 19.99?', 'multiple',
 '["DECIMAL(10,2)", "FLOAT", "VARCHAR(10)", "TEXT"]', 'DECIMAL(10,2)', 0),
('db-1-cat-2-q-2', 'db-1-cat-2', 'Which keyword makes MySQL generate the next id automatically?', 'text',
 NULL, 'AUTO_INCREMENT', 1),
('db-1-cat-2-q-3', 'db-1-cat-2', 'Which constraint stops two students from having the same email?', 'multiple',
 '["UNIQUE", "DEFAULT", "CHECK", "INDEX"]', 'UNIQUE', 2),
('db-1-cat-2-q-4', 'db-1-cat-2', 'Which command lists the columns of a table?', 'text',
 NULL, 'DESCRIBE', 3),

-- MySQL / 3. CRUD
('db-1-cat-3-q-1', 'db-1-cat-3', 'How do you add a row to a table?', 'multiple',
 '["ADD TO students name = ''Ola''", "INSERT INTO students (name) VALUES (''Ola'')", "PUT ''Ola'' IN students"]',
 'INSERT INTO students (name) VALUES (''Ola'')', 0),
('db-1-cat-3-q-2', 'db-1-cat-3', 'How do you change the name of the student with id 1?', 'multiple',
 '["CHANGE students SET name = ''Hi'' WHERE id = 1", "UPDATE students SET name = ''Hi'' WHERE id = 1", "UPDATE students name = ''Hi'' IF id = 1"]',
 'UPDATE students SET name = ''Hi'' WHERE id = 1', 1),
('db-1-cat-3-q-3', 'db-1-cat-3', 'Which clause stops UPDATE and DELETE from affecting every row?', 'text',
 NULL, 'WHERE', 2),
('db-1-cat-3-q-4', 'db-1-cat-3', 'How do you find rows where program has no value?', 'multiple',
 '["WHERE program IS NULL", "WHERE program = NULL", "WHERE program = ''''", "WHERE program = 0"]',
 'WHERE program IS NULL', 3),

-- MySQL / 4. Filtering and Sorting
('db-1-cat-4-q-1', 'db-1-cat-4', 'How do you sort the newest rows first?', 'multiple',
 '["ORDER BY enrolled_at DESC", "ORDER BY enrolled_at ASC", "SORT enrolled_at NEWEST"]',
 'ORDER BY enrolled_at DESC', 0),
('db-1-cat-4-q-2', 'db-1-cat-4', 'Which keyword restricts the number of rows returned?', 'text',
 NULL, 'LIMIT', 1),
('db-1-cat-4-q-3', 'db-1-cat-4', 'Which keyword removes duplicate rows from a result?', 'multiple',
 '["DISTINCT", "UNIQUE", "ONLY", "SINGLE"]', 'DISTINCT', 2),

-- MySQL / 5. Summarizing Data
('db-1-cat-5-q-1', 'db-1-cat-5', 'Which function counts the number of rows?', 'text',
 NULL, 'COUNT', 0),
('db-1-cat-5-q-2', 'db-1-cat-5', 'Which clause filters groups after aggregation?', 'multiple',
 '["HAVING", "WHERE", "LIMIT", "DISTINCT"]', 'HAVING', 1),
('db-1-cat-5-q-3', 'db-1-cat-5', 'What does COUNT(program) do with NULL values?', 'multiple',
 '["Ignores them", "Counts them as 0", "Counts them as 1", "Gives an error"]', 'Ignores them', 2),

-- MySQL / 6. Relationships and Joins
('db-1-cat-6-q-1', 'db-1-cat-6', 'What does a foreign key do?', 'multiple',
 '["Links a column to the primary key of another table and enforces it", "Encrypts the column", "Makes the column faster to search", "Copies the data into another table"]',
 'Links a column to the primary key of another table and enforces it', 0),
('db-1-cat-6-q-2', 'db-1-cat-6', 'In a one-to-many relation, which table stores the foreign key?', 'multiple',
 '["The ''many'' side", "The ''one'' side", "Both", "Neither"]', 'The ''many'' side', 1),
('db-1-cat-6-q-3', 'db-1-cat-6', 'What do you need to model a many-to-many relation?', 'multiple',
 '["A junction table", "A bigger primary key", "A VARCHAR column with comma-separated ids", "A view"]',
 'A junction table', 2),
('db-1-cat-6-q-4', 'db-1-cat-6', 'Which join keeps all rows from the left table even when there is no match?', 'multiple',
 '["LEFT JOIN", "INNER JOIN", "CROSS JOIN", "SELF JOIN"]', 'LEFT JOIN', 3),
('db-1-cat-6-q-5', 'db-1-cat-6', 'What value do unmatched columns get in a LEFT JOIN?', 'text',
 NULL, 'NULL', 4),

-- MySQL / 7. Intermediate Queries
('db-1-cat-7-q-1', 'db-1-cat-7', 'What is a subquery?', 'multiple',
 '["A SELECT inside another query", "A query that runs in the background", "A copy of a table", "A query without a WHERE"]',
 'A SELECT inside another query', 0),
('db-1-cat-7-q-2', 'db-1-cat-7', 'Which keyword shows the query plan?', 'text',
 NULL, 'EXPLAIN', 1),
('db-1-cat-7-q-3', 'db-1-cat-7', 'Which command undoes a transaction?', 'text',
 NULL, 'ROLLBACK', 2),
('db-1-cat-7-q-4', 'db-1-cat-7', 'What does the A in ACID stand for?', 'multiple',
 '["Atomicity", "Availability", "Authentication", "Aggregation"]', 'Atomicity', 3),

-- MySQL / 8. Security and Safety
('db-1-cat-8-q-1', 'db-1-cat-8', 'Why should an application not connect to MySQL as root?', 'multiple',
 '["root has too many privileges, so a breach does far more damage", "root is slower than other users", "root cannot read data", "root cannot use SELECT"]',
 'root has too many privileges, so a breach does far more damage', 0),
('db-1-cat-8-q-2', 'db-1-cat-8', 'Which statement gives a user privileges?', 'text',
 NULL, 'GRANT', 1),
('db-1-cat-8-q-3', 'db-1-cat-8', 'What is the best protection against SQL injection?', 'multiple',
 '["Prepared statements", "Longer passwords", "Using uppercase SQL", "Adding more indexes"]',
 'Prepared statements', 2),
('db-1-cat-8-q-4', 'db-1-cat-8', 'Which tool exports a database to a .sql file?', 'text',
 NULL, 'mysqldump', 3),

-- MySQL / 9. Using MySQL in a Real Application
('db-1-cat-9-q-1', 'db-1-cat-9', 'Which character is used as a placeholder in a parameterized query?', 'text',
 NULL, '?', 0),
('db-1-cat-9-q-2', 'db-1-cat-9', 'Why should database passwords be kept in a .env file?', 'multiple',
 '["So they are not hard-coded in the source code or committed to Git", "So queries run faster", "Because MySQL requires it", "So they are encrypted automatically"]',
 'So they are not hard-coded in the source code or committed to Git', 1),
('db-1-cat-9-q-3', 'db-1-cat-9', 'What does a connection pool do?', 'multiple',
 '["Reuses open connections instead of opening a new one each time", "Backs up the database", "Encrypts the queries", "Creates indexes"]',
 'Reuses open connections instead of opening a new one each time', 2),

-- MySQL / 10. Next Steps
('db-1-cat-10-q-1', 'db-1-cat-10', 'Which keyword runs a stored procedure?', 'text',
 NULL, 'CALL', 0),
('db-1-cat-10-q-2', 'db-1-cat-10', 'Which database stores everything in a single file without a server?', 'multiple',
 '["SQLite", "MySQL", "PostgreSQL", "MariaDB"]', 'SQLite', 1),

-- MariaDB / Getting started
('gs-connect-q', 'mariadb-getting-started', 'Which command connects as root and asks for a password?', 'multiple',
 '["mariadb -u root -p", "mariadb --root --password-none", "connect mariadb root"]',
 'mariadb -u root -p', 0),
('gs-port-q', 'mariadb-getting-started', 'Which port does MariaDB listen on by default?', 'text',
 NULL, '3306', 1),

-- MariaDB / First table
('ft-type-q', 'first-table', 'Which data type is best for a price like 19.99?', 'multiple',
 '["DECIMAL(10,2)", "FLOAT", "VARCHAR(10)", "TEXT"]', 'DECIMAL(10,2)', 0),
('ft-autoinc-q', 'first-table', 'Which keyword makes MariaDB generate the next id automatically?', 'text',
 NULL, 'AUTO_INCREMENT', 1),
('ft-unique-q', 'first-table', 'Which constraint stops two customers from having the same email?', 'multiple',
 '["UNIQUE", "DEFAULT", "CHECK", "INDEX"]', 'UNIQUE', 2),

-- MariaDB / Manipulating data
('insert-data-q', 'data', 'How do you add a row to a table?', 'multiple',
 '["ADD TO customers name = ''Ola''", "INSERT INTO customers (name) VALUES (''Ola'')", "PUT ''Ola'' IN customers"]',
 'INSERT INTO customers (name) VALUES (''Ola'')', 0),
('read-data-q', 'data', 'How do you see all the data in a table?', 'multiple',
 '["SELECT * FROM customers", "SHOW DATA customers", "READ ALL FROM customers"]',
 'SELECT * FROM customers', 1),
('change-data-q', 'data', 'How do you change the name of the customer with id 1?', 'multiple',
 '["CHANGE customers SET name = ''Hi'' WHERE id = 1", "UPDATE customers SET name = ''Hi'' WHERE id = 1", "UPDATE customers name = ''Hi'' IF id = 1"]',
 'UPDATE customers SET name = ''Hi'' WHERE id = 1', 2),
('delete-data-q', 'data', 'Which clause stops UPDATE and DELETE from affecting every row?', 'text',
 NULL, 'WHERE', 3),

-- MariaDB / Filtering and sorting
('fs-sort-q', 'filtering-sorting', 'How do you sort the newest rows first?', 'multiple',
 '["ORDER BY created_at DESC", "ORDER BY created_at ASC", "SORT created_at NEWEST"]',
 'ORDER BY created_at DESC', 0),
('fs-limit-q', 'filtering-sorting', 'Which keyword restricts the number of rows returned?', 'text',
 NULL, 'LIMIT', 1),
('fs-group-q', 'filtering-sorting', 'Which clause lets you count rows per country?', 'multiple',
 '["GROUP BY", "ORDER BY", "HAVING ONLY", "COUNT BY"]', 'GROUP BY', 2),

-- MariaDB / Relations
('rel-fk-q', 'relations', 'What does a foreign key do?', 'multiple',
 '["Links a column to the primary key of another table and enforces it", "Encrypts the column", "Makes the column faster to search", "Copies the data into another table"]',
 'Links a column to the primary key of another table and enforces it', 0),
('rel-many-q', 'relations', 'In a one-to-many relation, which table stores the foreign key?', 'multiple',
 '["The ''many'' side", "The ''one'' side", "Both", "Neither"]', 'The ''many'' side', 1),
('rel-cascade-q', 'relations', 'Which option deletes a customer''s orders automatically when the customer is deleted?', 'text',
 NULL, 'ON DELETE CASCADE', 2),

-- MariaDB / Many-to-many
('m2m-q1', 'many-to-many', 'What do you need to model a many-to-many relation?', 'multiple',
 '["A junction table", "A bigger primary key", "A VARCHAR column with comma-separated ids", "A view"]',
 'A junction table', 0),
('m2m-q2', 'many-to-many', 'What is a primary key made from two columns called?', 'text',
 NULL, 'Composite key', 1),

-- MariaDB / Joins
('join-left-q', 'joins', 'Which join keeps all rows from the left table even when there is no match?', 'multiple',
 '["LEFT JOIN", "INNER JOIN", "CROSS JOIN", "SELF JOIN"]', 'LEFT JOIN', 0),
('join-on-q', 'joins', 'Which keyword defines how two tables are matched in a join?', 'text',
 NULL, 'ON', 1),
('join-null-q', 'joins', 'What value do unmatched columns get in a LEFT JOIN?', 'text',
 NULL, 'NULL', 2),

-- MariaDB / Indexes
('idx-q1', 'indexes', 'Which of these speeds up lookups?', 'multiple',
 '["An index", "A comment", "A trigger", "A view"]', 'An index', 0),
('idx-q2', 'indexes', 'Which keyword shows the query plan?', 'text',
 NULL, 'EXPLAIN', 1),

-- MariaDB / Transactions
('tx-q1', 'transactions', 'Which statement undoes all changes since the transaction started?', 'text',
 NULL, 'ROLLBACK', 0),
('tx-q2', 'transactions', 'What does the A in ACID stand for?', 'multiple',
 '["Atomicity", "Authentication", "Availability", "Automation"]', 'Atomicity', 1),

-- MariaDB / Users and security
('sec-q1', 'users-security', 'Why should an application not connect as root?', 'multiple',
 '["A bug or attack could then do anything to the whole server", "Root is slower", "Root cannot use SELECT"]',
 'A bug or attack could then do anything to the whole server', 0),
('sec-q2', 'users-security', 'Which statement gives a user permission to read a database?', 'text',
 NULL, 'GRANT', 1),

-- MariaDB / Backup and restore
('bk-q1', 'backup-restore', 'Which tool creates a logical backup of a database?', 'multiple',
 '["mariadb-dump", "mariadb-clean", "mariadb-copy", "mariadb-save"]', 'mariadb-dump', 0),
('bk-q2', 'backup-restore', 'What file format does a dump normally contain?', 'text',
 NULL, 'SQL', 1);

COMMIT;
