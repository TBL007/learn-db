SET NAMES utf8mb4;
START TRANSACTION;

-- ============================================================
-- COURSES
-- ============================================================
INSERT INTO courses (id, title, info, logo) VALUES
('mysql', 'MySQL',
 '["MySQL is one of the most widely used relational database management systems in the world. It is free, open source and runs everything from student projects to large web services.", "Data is stored in tables of rows and columns, and you work with it using SQL. This guide teaches the core concepts step by step, using a small university database as the running example."]',
 '/mysql.png'),
('mariadb', 'MariaDB',
 '["MariaDB is a free, open-source relational database that started as a community fork of MySQL and stays largely compatible with it. It runs everything from small websites to large production systems.", "Data is stored in tables of rows and columns, and you work with it using SQL. This guide teaches the core concepts step by step, using a small university database as the running example."]',
 '/mariadb.png');

-- ============================================================
-- CATEGORIES (id, course_id, title, info, position)
-- ============================================================
INSERT INTO categories (id, course_id, title, info, position) VALUES
('mysql-getting-started', 'mysql', 'Getting Started',
 'This guide will teach you the core foundational concepts of databases using MySQL, one of the most widely used relational database management systems in the world.', 0),
('mysql-creating-tables', 'mysql', 'Creating Tables',
 'Create a database, choose sensible data types and define tables with primary keys and constraints.', 1),
('mysql-working-with-data-crud', 'mysql', 'Working with Data (CRUD)',
 'Create, read, update and delete rows. Together these are known as CRUD.', 2),
('mysql-filtering-and-sorting', 'mysql', 'Filtering and Sorting',
 'Ask more precise questions: filter rows, sort the result and limit how much you get back.', 3),
('mysql-summarizing-data', 'mysql', 'Summarizing Data',
 'Aggregate functions boil many rows down to one value. GROUP BY does it once per group.', 4),
('mysql-relationships-and-joins', 'mysql', 'Relationships and Joins',
 'Real data is split across tables. Foreign keys link the tables and keep the data consistent, and joins combine them again when you query.', 5),
('mysql-intermediate-queries', 'mysql', 'Intermediate Queries',
 'Subqueries, views, indexes and transactions: tools for writing cleaner, faster and safer queries.', 6),
('mysql-security-and-safety', 'mysql', 'Security and Safety',
 'Give each user only the access they need, protect your queries against SQL injection and keep backups.', 7),
('mysql-using-mysql-in-a-real-application', 'mysql', 'Using MySQL in a Real Application',
 'Connect to MySQL from Node.js: keep credentials out of your code, use parameterized queries and handle errors.', 8),
('mysql-next-steps', 'mysql', 'Next Steps',
 'You now know the core of relational databases. Here is what to explore next.', 9),
('mariadb-getting-started', 'mariadb', 'Getting Started',
 'This guide will teach you the core foundational concepts of databases using MariaDB, a free and open-source relational database management system that started as a fork of MySQL.', 0),
('mariadb-creating-tables', 'mariadb', 'Creating Tables',
 'Create a database, choose sensible data types and define tables with primary keys and constraints.', 1),
('mariadb-working-with-data-crud', 'mariadb', 'Working with Data (CRUD)',
 'Create, read, update and delete rows. Together these are known as CRUD.', 2),
('mariadb-filtering-and-sorting', 'mariadb', 'Filtering and Sorting',
 'Ask more precise questions: filter rows, sort the result and limit how much you get back.', 3),
('mariadb-summarizing-data', 'mariadb', 'Summarizing Data',
 'Aggregate functions boil many rows down to one value. GROUP BY does it once per group.', 4),
('mariadb-relationships-and-joins', 'mariadb', 'Relationships and Joins',
 'Real data is split across tables. Foreign keys link the tables and keep the data consistent, and joins combine them again when you query.', 5),
('mariadb-intermediate-queries', 'mariadb', 'Intermediate Queries',
 'Subqueries, views, indexes and transactions: tools for writing cleaner, faster and safer queries.', 6),
('mariadb-security-and-safety', 'mariadb', 'Security and Safety',
 'Give each user only the access they need, protect your queries against SQL injection and keep backups.', 7),
('mariadb-using-mariadb-in-a-real-application', 'mariadb', 'Using MariaDB in a Real Application',
 'Connect to MariaDB from Node.js: keep credentials out of your code, use parameterized queries and handle errors.', 8),
('mariadb-next-steps', 'mariadb', 'Next Steps',
 'You now know the core of relational databases. Here is what to explore next.', 9);

-- ============================================================
-- STEPS (id, category_id, title, text, image, important, code, position)
-- ============================================================
INSERT INTO steps (id, category_id, title, text, image, important, code, position) VALUES
('mysql-getting-started-what-is-a-database', 'mysql-getting-started', 'What is a database?',
 'A database is an organized collection of structured data stored electronically. Unlike a spreadsheet, a database is built to handle large amounts of data safely, prevent errors and let many users and programs read and write at the same time. The software that manages it is called a database management system (DBMS).',
 NULL, 'The database is the data. MySQL is the DBMS: the program that stores, protects and serves it.',
 NULL, 0),
('mysql-getting-started-relational-databases-the-spreadsheet-analogy', 'mysql-getting-started', 'Relational Databases & The Spreadsheet Analogy',
 'MySQL is a relational database management system (RDBMS): the data lives in tables that can be linked to each other. If you know spreadsheets you already know the layout. A table is like one sheet about a single subject (students). A column is a category with a name and a data type (email). A row is one record (one student). In relational theory these are called a relation, an attribute and a tuple.',
 '/images/mysqltable.png', NULL,
 NULL, 1),
('mysql-getting-started-keys-and-relationships', 'mysql-getting-started', 'Keys and relationships',
 'In a spreadsheet, a student who takes five courses means repeating their name and email five times. In a relational database you store the student once and link to it using keys. A primary key uniquely identifies each row in a table. A foreign key is a column that holds the primary key of a row in another table, and that is what creates the relationship. You will build this in chapter 6.',
 NULL, 'Every table should have a primary key.',
 NULL, 2),
('mysql-getting-started-what-is-sql', 'mysql-getting-started', 'What is SQL?',
 'SQL (Structured Query Language) is the standard language for talking to relational databases. Its English-like statements fall into groups: DDL defines structure (CREATE, ALTER, DROP), DML works with data (INSERT, SELECT, UPDATE, DELETE) and DCL controls access (GRANT, REVOKE). The four data operations are known as CRUD: Create, Read, Update, Delete.',
 NULL, NULL,
 NULL, 3),
('mysql-getting-started-downloading-mysql', 'mysql-getting-started', 'Downloading MySQL',
 'Head over to the <a href=''https://dev.mysql.com/downloads/mysql/'' target=''_blank'' rel=''noreferrer''>MySQL Community Server downloads page</a> and pick the latest LTS (long-term support) release for your operating system. Also get <a href=''https://dev.mysql.com/downloads/workbench/'' target=''_blank'' rel=''noreferrer''>MySQL Workbench</a>, a graphical client.',
 NULL, NULL,
 NULL, 4),
('mysql-getting-started-installing-mysql', 'mysql-getting-started', 'Installing MySQL',
 'Open the installer you downloaded and walk through the steps. On Windows, choose ''Server only'', or ''Developer Default'' if you also want Workbench. You will be asked to set a password for the root user.',
 NULL, 'Store the root password in a password manager. You cannot read it back later, only reset it.',
 NULL, 5),
('mysql-getting-started-open-a-terminal', 'mysql-getting-started', 'Open a terminal',
 'To talk to the server you need a command line. On Windows open ''MySQL Command Line Client'' from the start menu (or Command Prompt), on macOS or Linux open Terminal.',
 '/images/mysqlcmd.png', 'If the terminal says ''mysql'' is not recognized, the MySQL bin folder is missing from your PATH. Use the MySQL Command Line Client shortcut instead.',
 NULL, 6),
('mysql-getting-started-connect', 'mysql-getting-started', 'Connect',
 'Connect to the server on localhost, port 3306, as the root user.',
 NULL, '-u picks the user and -p makes the client ask for the password.',
 'mysql -u root -p', 7),
('mysql-getting-started-login', 'mysql-getting-started', 'Login',
 'Type your password when prompted. When you see the ''mysql>'' prompt you are connected.',
 '/images/mysqlconnect.png', NULL,
 NULL, 8),
('mysql-getting-started-check-that-it-works', 'mysql-getting-started', 'Check that it works',
 'Ask the server which version it is running, then leave the client again.',
 NULL, 'Every SQL statement ends with a semicolon.',
 'SELECT VERSION();
exit', 9),
('mysql-creating-tables-create-a-database', 'mysql-creating-tables', 'Create a database',
 'Create a database for the university. The utf8mb4 character set stores every character, including emoji and non-English letters.',
 NULL, NULL,
 'CREATE DATABASE university CHARACTER SET utf8mb4;', 0),
('mysql-creating-tables-select-it', 'mysql-creating-tables', 'Select it',
 'Make it the active database, then list all databases to confirm it exists.',
 NULL, NULL,
 'USE university;
SHOW DATABASES;', 1),
('mysql-creating-tables-pick-data-types', 'mysql-creating-tables', 'Pick data types',
 'Common types: INT for whole numbers, TINYINT for small ones, DECIMAL(10,2) for exact decimals such as money, VARCHAR(n) for short text up to n characters, CHAR(n) for fixed-length text, TEXT for long text, DATE and TIMESTAMP for time, BOOLEAN for true/false (stored as 0 or 1).',
 NULL, 'Never store money in FLOAT or DOUBLE. They store binary approximations, so 0.1 + 0.2 is not exactly 0.3.',
 NULL, 2),
('mysql-creating-tables-create-the-students-table', 'mysql-creating-tables', 'Create the students table',
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
('mysql-creating-tables-what-the-constraints-do', 'mysql-creating-tables', 'What the constraints do',
 'PRIMARY KEY identifies each row uniquely. AUTO_INCREMENT generates the next id for you. NOT NULL forbids empty values. UNIQUE stops two rows from sharing the same value. DEFAULT fills in a value when you leave it out. CHECK makes sure a condition is true for every row.',
 NULL, 'CHECK constraints are enforced from MySQL 8.0.16. Older versions accepted them but silently ignored them.',
 NULL, 4),
('mysql-creating-tables-create-the-courses-table', 'mysql-creating-tables', 'Create the courses table',
 'Create a second table. Course codes must be unique, and credits must be positive.',
 NULL, NULL,
 'CREATE TABLE courses (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  code    VARCHAR(10) NOT NULL UNIQUE,
  title   VARCHAR(100) NOT NULL,
  credits TINYINT NOT NULL DEFAULT 10 CHECK (credits > 0)
);', 5),
('mysql-creating-tables-change-a-table', 'mysql-creating-tables', 'Change a table',
 'Use ALTER TABLE to change a table that already exists. Add a column for the study program. You can also use MODIFY to change a column type and DROP COLUMN to remove one.',
 NULL, NULL,
 'ALTER TABLE students ADD COLUMN program VARCHAR(50);
DESCRIBE students;', 6),
('mysql-creating-tables-delete-a-table', 'mysql-creating-tables', 'Delete a table',
 'DROP TABLE removes a table and all of its data. Try it on a throwaway table.',
 NULL, 'There is no undo. DROP TABLE and DROP DATABASE delete the data immediately.',
 'CREATE TABLE scratch (id INT);
DROP TABLE scratch;', 7),
('mysql-working-with-data-crud-insert-data', 'mysql-working-with-data-crud', 'Insert data',
 'Add a single row to the table. Leave out id and enrolled_at, MySQL fills them in.',
 NULL, NULL,
 'INSERT INTO students (name, email, program)
VALUES (''Ola Nordmann'', ''ola@example.com'', ''Computer Science'');', 0),
('mysql-working-with-data-crud-insert-several-rows', 'mysql-working-with-data-crud', 'Insert several rows',
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
('mysql-working-with-data-crud-read-data', 'mysql-working-with-data-crud', 'Read data',
 'Select everything you have inserted so far.',
 NULL, 'In real applications list the columns you need instead of using *.',
 'SELECT * FROM students;', 2),
('mysql-working-with-data-crud-read-specific-columns', 'mysql-working-with-data-crud', 'Read specific columns',
 'List the columns after SELECT to get only what you need.',
 NULL, NULL,
 'SELECT name, email FROM students;', 3),
('mysql-working-with-data-crud-change-data', 'mysql-working-with-data-crud', 'Change data',
 'Change a row by telling UPDATE which row to touch.',
 NULL, 'Always include WHERE and prefer the primary key. Without WHERE, every row is updated. MySQL Workbench has ''safe updates'' on by default and refuses such statements with error 1175.',
 'UPDATE students
SET name = ''Ola N. Nordmann''
WHERE id = 1;', 4),
('mysql-working-with-data-crud-delete-data', 'mysql-working-with-data-crud', 'Delete data',
 'Remove a row with DELETE. Check what will match first by running the same WHERE as a SELECT. We insert a throwaway student first so we do not lose real data. Email is UNIQUE, so it matches at most one row.',
 NULL, NULL,
 'INSERT INTO students (name, email)
VALUES (''Test Person'', ''test@example.com'');

-- 1. see which row(s) will be affected
SELECT * FROM students WHERE email = ''test@example.com'';

-- 2. then delete them
DELETE FROM students WHERE email = ''test@example.com'';', 5),
('mysql-working-with-data-crud-understanding-null', 'mysql-working-with-data-crud', 'Understanding NULL',
 'NULL means ''no value / unknown''. It is not zero and not an empty string. Any comparison with NULL using = gives unknown, so the row is never returned. Use IS NULL and IS NOT NULL instead. Jonas has no program, so he is the row that matches.',
 NULL, NULL,
 '-- returns nothing, even though Jonas has no program
SELECT name FROM students WHERE program = NULL;

-- correct
SELECT name FROM students WHERE program IS NULL;', 6),
('mysql-filtering-and-sorting-filter-with-where', 'mysql-filtering-and-sorting', 'Filter with WHERE',
 'Only return the rows that match a condition.',
 NULL, NULL,
 'SELECT name, email
FROM students
WHERE program = ''Computer Science'';', 0),
('mysql-filtering-and-sorting-combine-conditions', 'mysql-filtering-and-sorting', 'Combine conditions',
 'Use AND, OR and parentheses to combine several conditions. AND is evaluated before OR, so use parentheses when you mix them.',
 NULL, NULL,
 'SELECT *
FROM students
WHERE program = ''Computer Science''
  AND enrolled_at >= ''2026-01-01'';', 1),
('mysql-filtering-and-sorting-in-and-between', 'mysql-filtering-and-sorting', 'IN and BETWEEN',
 'IN checks against a list of values. BETWEEN checks a range, and both ends are included.',
 NULL, NULL,
 'SELECT * FROM students
WHERE program IN (''Computer Science'', ''Informatics'');

SELECT code, title FROM courses
WHERE credits BETWEEN 5 AND 10;', 2),
('mysql-filtering-and-sorting-search-text-with-like', 'mysql-filtering-and-sorting', 'Search text with LIKE',
 'The % sign matches any number of characters and _ matches exactly one.',
 NULL, NULL,
 'SELECT *
FROM students
WHERE email LIKE ''%@example.com'';', 3),
('mysql-filtering-and-sorting-sort-and-limit', 'mysql-filtering-and-sorting', 'Sort and limit',
 'This returns the three newest students.',
 NULL, 'Without ORDER BY the row order is not guaranteed.',
 'SELECT *
FROM students
ORDER BY enrolled_at DESC
LIMIT 3;', 4),
('mysql-filtering-and-sorting-distinct-and-aliases', 'mysql-filtering-and-sorting', 'DISTINCT and aliases',
 'DISTINCT removes duplicate rows from the result. AS gives a column a readable name in the output.',
 NULL, NULL,
 'SELECT DISTINCT program FROM students;

SELECT name AS student_name, email AS contact
FROM students;', 5),
('mysql-summarizing-data-count-rows', 'mysql-summarizing-data', 'Count rows',
 'COUNT(*) counts rows. COUNT(column) counts only the rows where that column is not NULL.',
 NULL, 'The two queries give different numbers, because Jonas has no program.',
 'SELECT COUNT(*) AS all_students FROM students;
SELECT COUNT(program) AS with_program FROM students;', 0),
('mysql-summarizing-data-sum-avg-min-and-max', 'mysql-summarizing-data', 'SUM, AVG, MIN and MAX',
 'The other aggregate functions work on numeric columns and ignore NULL.',
 NULL, NULL,
 'SELECT SUM(credits) AS total,
       AVG(credits) AS average,
       MIN(credits) AS smallest,
       MAX(credits) AS largest
FROM courses;', 1),
('mysql-summarizing-data-count-per-group', 'mysql-summarizing-data', 'Count per group',
 'GROUP BY splits the rows into groups and runs the aggregate once for each. NULL values form their own group.',
 NULL, NULL,
 'SELECT program, COUNT(*) AS students
FROM students
GROUP BY program;', 2),
('mysql-summarizing-data-having-vs-where', 'mysql-summarizing-data', 'HAVING vs WHERE',
 'WHERE filters rows before they are grouped. HAVING filters the groups after the aggregate is calculated. This is why you cannot use COUNT(*) in a WHERE clause.',
 NULL, 'Order of evaluation: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT.',
 'SELECT program, COUNT(*) AS students
FROM students
WHERE program IS NOT NULL
GROUP BY program
HAVING COUNT(*) >= 2;', 3),
('mysql-summarizing-data-built-in-functions', 'mysql-summarizing-data', 'Built-in functions',
 'MySQL has many functions for text, dates and numbers. You can use them in SELECT and in WHERE.',
 NULL, NULL,
 'SELECT UPPER(name)                    AS shout,
       CONCAT(name, '' <'', email, ''>'') AS contact,
       YEAR(enrolled_at)              AS year_enrolled
FROM students;

SELECT ROUND(AVG(credits), 1) AS avg_credits,
       CURDATE()              AS today
FROM courses;', 4),
('mysql-relationships-and-joins-why-split-data-up', 'mysql-relationships-and-joins', 'Why split data up?',
 'If every row repeated the lecturer''s name and office, changing an office would mean editing many rows, and missing one would leave conflicting data. Storing each fact once and pointing to it by id is called normalization. In short: 1NF means every cell holds a single value, 2NF means every column depends on the whole key, and 3NF means columns depend on the key and nothing else.',
 NULL, NULL,
 NULL, 0),
('mysql-relationships-and-joins-one-to-many', 'mysql-relationships-and-joins', 'One-to-many',
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
('mysql-relationships-and-joins-add-data-to-the-relation', 'mysql-relationships-and-joins', 'Add data to the relation',
 'Insert two lecturers and connect the courses to them.',
 NULL, NULL,
 'INSERT INTO lecturers (name, office) VALUES
  (''Ingrid Solberg'', ''B-204''),
  (''Henrik Moe'',     ''A-110'');

UPDATE courses SET lecturer_id = 1 WHERE code IN (''DB101'', ''PR101'');
UPDATE courses SET lecturer_id = 2 WHERE code = ''MA101'';', 2),
('mysql-relationships-and-joins-see-it-being-enforced', 'mysql-relationships-and-joins', 'See it being enforced',
 'Try to point a course at a lecturer that does not exist. You get error 1452 and the database refuses to create the broken link. This is called referential integrity.',
 NULL, NULL,
 'UPDATE courses SET lecturer_id = 99 WHERE code = ''MA101'';
-- ERROR 1452: Cannot add or update a child row: a foreign key constraint fails', 3),
('mysql-relationships-and-joins-decide-what-happens-on-delete', 'mysql-relationships-and-joins', 'Decide what happens on delete',
 'By default (RESTRICT) MySQL refuses to delete a lecturer that still has courses and gives error 1451. ON DELETE CASCADE deletes the child rows along with the parent. ON DELETE SET NULL keeps them but clears the link (the column must allow NULL).',
 NULL, 'CASCADE is convenient but can delete far more than you expect. Use it deliberately.',
 'FOREIGN KEY (lecturer_id) REFERENCES lecturers(id)
  ON DELETE SET NULL', 4),
('mysql-relationships-and-joins-many-to-many', 'mysql-relationships-and-joins', 'Many-to-many',
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
('mysql-relationships-and-joins-enrol-some-students', 'mysql-relationships-and-joins', 'Enrol some students',
 'Add a few enrolments. The ids below assume you followed the earlier chapters, so check with SELECT * FROM students and SELECT * FROM courses first.',
 NULL, NULL,
 'INSERT INTO enrolments (student_id, course_id, grade) VALUES
  (1, 1, ''A''),
  (1, 2, ''B''),
  (2, 1, ''B''),
  (3, 3, NULL);', 6),
('mysql-relationships-and-joins-inner-join', 'mysql-relationships-and-joins', 'INNER JOIN',
 'A join combines rows from two tables where the ON condition is true. INNER JOIN returns only the rows that have a match on both sides.',
 NULL, NULL,
 'SELECT c.code, c.title, l.name AS lecturer
FROM courses c
INNER JOIN lecturers l ON l.id = c.lecturer_id;', 7),
('mysql-relationships-and-joins-left-join', 'mysql-relationships-and-joins', 'LEFT JOIN',
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
('mysql-relationships-and-joins-join-three-tables', 'mysql-relationships-and-joins', 'Join three tables',
 'Chain joins to follow the relations all the way from student to course.',
 NULL, NULL,
 'SELECT s.name, c.title, e.grade
FROM enrolments e
JOIN students s ON s.id = e.student_id
JOIN courses c  ON c.id = e.course_id;', 9),
('mysql-relationships-and-joins-combine-with-group-by', 'mysql-relationships-and-joins', 'Combine with GROUP BY',
 'Count how many students are in each course. COUNT(e.student_id) is used instead of COUNT(*) so a course with no students shows 0.',
 NULL, NULL,
 'SELECT c.title, COUNT(e.student_id) AS students
FROM courses c
LEFT JOIN enrolments e ON e.course_id = c.id
GROUP BY c.id, c.title
ORDER BY students DESC;', 10),
('mysql-intermediate-queries-subqueries', 'mysql-intermediate-queries', 'Subqueries',
 'A subquery is a SELECT inside another query. The inner query runs first and its result is used by the outer one. Find the students enrolled in DB101.',
 NULL, NULL,
 'SELECT name
FROM students
WHERE id IN (
  SELECT student_id
  FROM enrolments
  WHERE course_id = 1
);', 0),
('mysql-intermediate-queries-exists-and-correlated-subqueries', 'mysql-intermediate-queries', 'EXISTS and correlated subqueries',
 'A correlated subquery refers to the outer query, so it is checked once per outer row. EXISTS is true when the subquery returns at least one row. This finds students with at least one enrolment.',
 NULL, NULL,
 'SELECT s.name
FROM students s
WHERE EXISTS (
  SELECT 1
  FROM enrolments e
  WHERE e.student_id = s.id
);', 1),
('mysql-intermediate-queries-views', 'mysql-intermediate-queries', 'Views',
 'A view is a saved query that you can use like a table. It stores no data of its own, it runs the query each time. Use it to hide complicated joins.',
 NULL, NULL,
 'CREATE VIEW student_courses AS
SELECT s.name AS student, c.title AS course, e.grade
FROM enrolments e
JOIN students s ON s.id = e.student_id
JOIN courses c  ON c.id = e.course_id;

SELECT * FROM student_courses WHERE grade = ''A'';', 2),
('mysql-intermediate-queries-what-is-an-index', 'mysql-intermediate-queries', 'What is an index?',
 'An index works like the index of a book: instead of reading every row (a full table scan), the database jumps straight to the matching ones. Primary keys, UNIQUE columns and foreign keys are indexed automatically. Indexes are usually stored as B-trees.',
 NULL, 'Indexes speed up reads but slow down writes and use disk space. Add them where you actually filter or join.',
 'CREATE INDEX idx_students_program ON students (program);', 3),
('mysql-intermediate-queries-check-with-explain', 'mysql-intermediate-queries', 'Check with EXPLAIN',
 'Put EXPLAIN in front of a query. Look at the ''key'' column to see which index was used. NULL means no index, so a full table scan.',
 NULL, NULL,
 'EXPLAIN SELECT * FROM students WHERE program = ''Computer Science'';', 4),
('mysql-intermediate-queries-transactions', 'mysql-intermediate-queries', 'Transactions',
 'A transaction groups several statements into one unit of work. Nothing is permanent until COMMIT, and ROLLBACK undoes everything since START TRANSACTION. Try changing a grade and then undoing it.',
 NULL, NULL,
 'START TRANSACTION;

UPDATE enrolments SET grade = ''A''
WHERE student_id = 2 AND course_id = 1;

SELECT * FROM enrolments;

ROLLBACK;   -- use COMMIT; to keep the change', 5),
('mysql-intermediate-queries-acid', 'mysql-intermediate-queries', 'ACID',
 'Transactions give you four guarantees. Atomicity: all statements succeed or none do. Consistency: the data always satisfies the rules (keys, constraints). Isolation: concurrent transactions do not see each other''s half-finished work. Durability: once committed, the data survives a crash.',
 NULL, 'Transactions need the InnoDB engine (the default). Statements like CREATE TABLE and DROP TABLE commit automatically and cannot be rolled back.',
 NULL, 6),
('mysql-security-and-safety-do-not-use-root-in-applications', 'mysql-security-and-safety', 'Do not use root in applications',
 'root can do anything, including dropping every database. If an application uses root and gets compromised, the attacker gets everything. Create a separate user for each application with only the privileges it needs. This is called the principle of least privilege.',
 NULL, NULL,
 NULL, 0),
('mysql-security-and-safety-create-a-user', 'mysql-security-and-safety', 'Create a user',
 'Create a user that can only connect from the same machine.',
 NULL, NULL,
 'CREATE USER ''app_user''@''localhost''
IDENTIFIED BY ''choose-a-strong-password'';', 1),
('mysql-security-and-safety-grant-privileges', 'mysql-security-and-safety', 'Grant privileges',
 'Give the user access to the university database only, and only for the four CRUD operations. Then check what it can do.',
 NULL, NULL,
 'GRANT SELECT, INSERT, UPDATE, DELETE
ON university.*
TO ''app_user''@''localhost'';

SHOW GRANTS FOR ''app_user''@''localhost'';', 2),
('mysql-security-and-safety-revoke-and-remove', 'mysql-security-and-safety', 'Revoke and remove',
 'Take privileges away with REVOKE and delete a user with DROP USER.',
 NULL, 'Do not run DROP USER yet if you want to use app_user in the next chapter.',
 'REVOKE DELETE ON university.* FROM ''app_user''@''localhost'';
DROP USER ''app_user''@''localhost'';', 3),
('mysql-security-and-safety-sql-injection', 'mysql-security-and-safety', 'SQL injection',
 'SQL injection happens when an application glues user input into a query as text. If someone types '' OR ''1''=''1 as their email, the query below returns every student, because the condition is always true. Attackers can use the same trick to read or destroy data.',
 NULL, 'Never build SQL by concatenating user input into a string. Use prepared statements.',
 '-- what the database receives when the input is glued in
SELECT * FROM students WHERE email = '''' OR ''1''=''1'';', 4),
('mysql-security-and-safety-prepared-statements', 'mysql-security-and-safety', 'Prepared statements',
 'A prepared statement sends the query and the values separately. The ? is a placeholder, and the value is always treated as data, never as SQL. Your programming language''s MySQL driver does this for you (see chapter 9).',
 NULL, NULL,
 'PREPARE find_student FROM
  ''SELECT * FROM students WHERE email = ?'';

SET @email = ''ola@example.com'';
EXECUTE find_student USING @email;

DEALLOCATE PREPARE find_student;', 5),
('mysql-security-and-safety-backups', 'mysql-security-and-safety', 'Backups',
 'mysqldump exports a database as a text file of SQL statements. Run it in your normal terminal, not inside the mysql client. To restore, feed the file back into mysql.',
 NULL, 'A backup you have never restored is not a backup. Test it, and keep a copy somewhere other than the same computer.',
 'mysqldump -u root -p --databases university > university_backup.sql

mysql -u root -p < university_backup.sql', 6),
('mysql-using-mysql-in-a-real-application-how-an-application-talks-to-mysql', 'mysql-using-mysql-in-a-real-application', 'How an application talks to MySQL',
 'Your program does not type into the mysql client. It uses a driver (a library) that opens a connection to the server, sends SQL, and turns the result rows into objects in your language. In Node.js, a popular driver is mysql2.',
 NULL, NULL,
 NULL, 0),
('mysql-using-mysql-in-a-real-application-install-the-driver', 'mysql-using-mysql-in-a-real-application', 'Install the driver',
 'In your project folder, install mysql2.',
 NULL, NULL,
 'npm install mysql2', 1),
('mysql-using-mysql-in-a-real-application-keep-credentials-in-environment-variables', 'mysql-using-mysql-in-a-real-application', 'Keep credentials in environment variables',
 'Never write passwords directly in your source code. Put them in a .env file (Next.js uses .env.local) and read them with process.env.',
 NULL, 'Add .env to .gitignore so the password never ends up in Git.',
 'DB_HOST=localhost
DB_USER=app_user
DB_PASSWORD=choose-a-strong-password
DB_NAME=university', 2),
('mysql-using-mysql-in-a-real-application-connect-and-run-a-query', 'mysql-using-mysql-in-a-real-application', 'Connect and run a query',
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
('mysql-using-mysql-in-a-real-application-insert-data-safely', 'mysql-using-mysql-in-a-real-application', 'Insert data safely',
 'Pass values in the array, never inside the query string. The driver sends them separately, which prevents SQL injection.',
 NULL, 'Do not write "... VALUES (''" + name + "'')". That is exactly what SQL injection needs.',
 'await pool.execute(
  "INSERT INTO students (name, email, program) VALUES (?, ?, ?)",
  [name, email, program]
);', 4),
('mysql-using-mysql-in-a-real-application-handle-errors', 'mysql-using-mysql-in-a-real-application', 'Handle errors',
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
('mysql-next-steps-stored-procedures', 'mysql-next-steps', 'Stored procedures',
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
('mysql-next-steps-triggers', 'mysql-next-steps', 'Triggers',
 'A trigger is SQL that MySQL runs automatically when a row is inserted, updated or deleted. They are handy for audit logs and validation, but they run invisibly, so use them sparingly and document them.',
 NULL, NULL,
 NULL, 1),
('mysql-next-steps-mysql-mariadb-postgresql-and-sqlite', 'mysql-next-steps', 'MySQL, MariaDB, PostgreSQL and SQLite',
 'MariaDB started as a fork of MySQL and is mostly compatible with it. PostgreSQL is another open-source RDBMS with richer features and stricter standards compliance. SQLite stores the whole database in one file with no server, which is why it is used in phones and small apps. The SQL you learned here carries over with small differences.',
 NULL, NULL,
 NULL, 2),
('mysql-next-steps-practice-ideas', 'mysql-next-steps', 'Practice ideas',
 'The best way to learn is by building. Try a library database with authors, books and loans, or a webshop with customers, orders and products. Draw the tables on paper first, decide the keys, then write the CREATE TABLE statements.',
 NULL, NULL,
 NULL, 3),
('mysql-next-steps-keep-learning', 'mysql-next-steps', 'Keep learning',
 'The <a href=''https://dev.mysql.com/doc/'' target=''_blank'' rel=''noreferrer''>official MySQL documentation</a> is the reference for every statement and function. Good topics to explore next: query optimization, replication, window functions and NoSQL databases.',
 NULL, NULL,
 NULL, 4),
('mariadb-getting-started-what-is-a-database', 'mariadb-getting-started', 'What is a database?',
 'A database is an organized collection of structured data stored electronically. Unlike a spreadsheet, a database is built to handle large amounts of data safely, prevent errors and let many users and programs read and write at the same time. The software that manages it is called a database management system (DBMS).',
 NULL, 'The database is the data. MariaDB is the DBMS: the program that stores, protects and serves it.',
 NULL, 0),
('mariadb-getting-started-relational-databases-the-spreadsheet-analogy', 'mariadb-getting-started', 'Relational Databases & The Spreadsheet Analogy',
 'MariaDB is a relational database management system (RDBMS): the data lives in tables that can be linked to each other. If you know spreadsheets you already know the layout. A table is like one sheet about a single subject (students). A column is a category with a name and a data type (email). A row is one record (one student). In relational theory these are called a relation, an attribute and a tuple.',
 '/images/mariatable.png', NULL,
 NULL, 1),
('mariadb-getting-started-keys-and-relationships', 'mariadb-getting-started', 'Keys and relationships',
 'In a spreadsheet, a student who takes five courses means repeating their name and email five times. In a relational database you store the student once and link to it using keys. A primary key uniquely identifies each row in a table. A foreign key is a column that holds the primary key of a row in another table, and that is what creates the relationship. You will build this in chapter 6.',
 NULL, 'Every table should have a primary key.',
 NULL, 2),
('mariadb-getting-started-what-is-sql', 'mariadb-getting-started', 'What is SQL?',
 'SQL (Structured Query Language) is the standard language for talking to relational databases. Its English-like statements fall into groups: DDL defines structure (CREATE, ALTER, DROP), DML works with data (INSERT, SELECT, UPDATE, DELETE) and DCL controls access (GRANT, REVOKE). The four data operations are known as CRUD: Create, Read, Update, Delete.',
 NULL, NULL,
 NULL, 3),
('mariadb-getting-started-downloading-mariadb', 'mariadb-getting-started', 'Downloading MariaDB',
 'Head over to the <a href=''https://mariadb.com/downloads/'' target=''_blank'' rel=''noreferrer''>MariaDB downloads page</a> and pick the latest stable long-term support (LTS) release for your operating system. On Windows the installer can also include HeidiSQL, a graphical client.',
 NULL, NULL,
 NULL, 4),
('mariadb-getting-started-installing-mariadb', 'mariadb-getting-started', 'Installing MariaDB',
 'Open the installer you downloaded and walk through the steps. On Windows, keep HeidiSQL ticked if you want a graphical client. You will be asked to set a password for the root user.',
 NULL, 'Store the root password in a password manager. You cannot read it back later, only reset it.',
 NULL, 5),
('mariadb-getting-started-open-a-terminal', 'mariadb-getting-started', 'Open a terminal',
 'To talk to the server you need a command line. On Windows open ''MariaDB Command Prompt'' from the start menu (or Command Prompt), on macOS or Linux open Terminal.',
 '/images/mariacmd.png', 'If the terminal says ''mariadb'' is not recognized, the MariaDB bin folder is missing from your PATH. Use the MariaDB Command Prompt shortcut instead.',
 NULL, 6),
('mariadb-getting-started-connect', 'mariadb-getting-started', 'Connect',
 'Connect to the server on localhost, port 3306, as the root user.',
 NULL, '-u picks the user and -p makes the client ask for the password. Older versions (before 10.4.6) only ship the command as ''mysql''.',
 'mariadb -u root -p', 7),
('mariadb-getting-started-login', 'mariadb-getting-started', 'Login',
 'Type your password when prompted. When you see the ''MariaDB [(none)]>'' prompt you are connected.',
 '/images/mariaconnect.png', NULL,
 NULL, 8),
('mariadb-getting-started-check-that-it-works', 'mariadb-getting-started', 'Check that it works',
 'Ask the server which version it is running, then leave the client again.',
 NULL, 'Every SQL statement ends with a semicolon.',
 'SELECT VERSION();
exit', 9),
('mariadb-creating-tables-create-a-database', 'mariadb-creating-tables', 'Create a database',
 'Create a database for the university. The utf8mb4 character set stores every character, including emoji and non-English letters.',
 NULL, NULL,
 'CREATE DATABASE university CHARACTER SET utf8mb4;', 0),
('mariadb-creating-tables-select-it', 'mariadb-creating-tables', 'Select it',
 'Make it the active database, then list all databases to confirm it exists.',
 NULL, NULL,
 'USE university;
SHOW DATABASES;', 1),
('mariadb-creating-tables-pick-data-types', 'mariadb-creating-tables', 'Pick data types',
 'Common types: INT for whole numbers, TINYINT for small ones, DECIMAL(10,2) for exact decimals such as money, VARCHAR(n) for short text up to n characters, CHAR(n) for fixed-length text, TEXT for long text, DATE and TIMESTAMP for time, BOOLEAN for true/false (stored as 0 or 1).',
 NULL, 'Never store money in FLOAT or DOUBLE. They store binary approximations, so 0.1 + 0.2 is not exactly 0.3.',
 NULL, 2),
('mariadb-creating-tables-create-the-students-table', 'mariadb-creating-tables', 'Create the students table',
 'Create a students table, then inspect it. DESCRIBE lists every column with its type and constraints.',
 '/images/mariatablecreated.png', NULL,
 'CREATE TABLE students (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(100) NOT NULL,
  email       VARCHAR(255) NOT NULL UNIQUE,
  enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW TABLES;
DESCRIBE students;', 3),
('mariadb-creating-tables-what-the-constraints-do', 'mariadb-creating-tables', 'What the constraints do',
 'PRIMARY KEY identifies each row uniquely. AUTO_INCREMENT generates the next id for you. NOT NULL forbids empty values. UNIQUE stops two rows from sharing the same value. DEFAULT fills in a value when you leave it out. CHECK makes sure a condition is true for every row.',
 NULL, 'CHECK constraints are enforced from MariaDB 10.2.1. Older versions accepted them but silently ignored them.',
 NULL, 4),
('mariadb-creating-tables-create-the-courses-table', 'mariadb-creating-tables', 'Create the courses table',
 'Create a second table. Course codes must be unique, and credits must be positive.',
 NULL, NULL,
 'CREATE TABLE courses (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  code    VARCHAR(10) NOT NULL UNIQUE,
  title   VARCHAR(100) NOT NULL,
  credits TINYINT NOT NULL DEFAULT 10 CHECK (credits > 0)
);', 5),
('mariadb-creating-tables-change-a-table', 'mariadb-creating-tables', 'Change a table',
 'Use ALTER TABLE to change a table that already exists. Add a column for the study program. You can also use MODIFY to change a column type and DROP COLUMN to remove one.',
 NULL, NULL,
 'ALTER TABLE students ADD COLUMN program VARCHAR(50);
DESCRIBE students;', 6),
('mariadb-creating-tables-delete-a-table', 'mariadb-creating-tables', 'Delete a table',
 'DROP TABLE removes a table and all of its data. Try it on a throwaway table.',
 NULL, 'There is no undo. DROP TABLE and DROP DATABASE delete the data immediately.',
 'CREATE TABLE scratch (id INT);
DROP TABLE scratch;', 7),
('mariadb-working-with-data-crud-insert-data', 'mariadb-working-with-data-crud', 'Insert data',
 'Add a single row to the table. Leave out id and enrolled_at, MariaDB fills them in.',
 NULL, NULL,
 'INSERT INTO students (name, email, program)
VALUES (''Ola Nordmann'', ''ola@example.com'', ''Computer Science'');', 0),
('mariadb-working-with-data-crud-insert-several-rows', 'mariadb-working-with-data-crud', 'Insert several rows',
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
('mariadb-working-with-data-crud-read-data', 'mariadb-working-with-data-crud', 'Read data',
 'Select everything you have inserted so far.',
 NULL, 'In real applications list the columns you need instead of using *.',
 'SELECT * FROM students;', 2),
('mariadb-working-with-data-crud-read-specific-columns', 'mariadb-working-with-data-crud', 'Read specific columns',
 'List the columns after SELECT to get only what you need.',
 NULL, NULL,
 'SELECT name, email FROM students;', 3),
('mariadb-working-with-data-crud-change-data', 'mariadb-working-with-data-crud', 'Change data',
 'Change a row by telling UPDATE which row to touch.',
 NULL, 'Always include WHERE and prefer the primary key. Without WHERE, every row is updated. The command line client can protect you: start it with ''mariadb --safe-updates'' and it refuses UPDATE and DELETE statements that have no key in the WHERE clause.',
 'UPDATE students
SET name = ''Ola N. Nordmann''
WHERE id = 1;', 4),
('mariadb-working-with-data-crud-delete-data', 'mariadb-working-with-data-crud', 'Delete data',
 'Remove a row with DELETE. Check what will match first by running the same WHERE as a SELECT. We insert a throwaway student first so we do not lose real data. Email is UNIQUE, so it matches at most one row.',
 NULL, NULL,
 'INSERT INTO students (name, email)
VALUES (''Test Person'', ''test@example.com'');

-- 1. see which row(s) will be affected
SELECT * FROM students WHERE email = ''test@example.com'';

-- 2. then delete them
DELETE FROM students WHERE email = ''test@example.com'';', 5),
('mariadb-working-with-data-crud-understanding-null', 'mariadb-working-with-data-crud', 'Understanding NULL',
 'NULL means ''no value / unknown''. It is not zero and not an empty string. Any comparison with NULL using = gives unknown, so the row is never returned. Use IS NULL and IS NOT NULL instead. Jonas has no program, so he is the row that matches.',
 NULL, NULL,
 '-- returns nothing, even though Jonas has no program
SELECT name FROM students WHERE program = NULL;

-- correct
SELECT name FROM students WHERE program IS NULL;', 6),
('mariadb-filtering-and-sorting-filter-with-where', 'mariadb-filtering-and-sorting', 'Filter with WHERE',
 'Only return the rows that match a condition.',
 NULL, NULL,
 'SELECT name, email
FROM students
WHERE program = ''Computer Science'';', 0),
('mariadb-filtering-and-sorting-combine-conditions', 'mariadb-filtering-and-sorting', 'Combine conditions',
 'Use AND, OR and parentheses to combine several conditions. AND is evaluated before OR, so use parentheses when you mix them.',
 NULL, NULL,
 'SELECT *
FROM students
WHERE program = ''Computer Science''
  AND enrolled_at >= ''2026-01-01'';', 1),
('mariadb-filtering-and-sorting-in-and-between', 'mariadb-filtering-and-sorting', 'IN and BETWEEN',
 'IN checks against a list of values. BETWEEN checks a range, and both ends are included.',
 NULL, NULL,
 'SELECT * FROM students
WHERE program IN (''Computer Science'', ''Informatics'');

SELECT code, title FROM courses
WHERE credits BETWEEN 5 AND 10;', 2),
('mariadb-filtering-and-sorting-search-text-with-like', 'mariadb-filtering-and-sorting', 'Search text with LIKE',
 'The % sign matches any number of characters and _ matches exactly one.',
 NULL, NULL,
 'SELECT *
FROM students
WHERE email LIKE ''%@example.com'';', 3),
('mariadb-filtering-and-sorting-sort-and-limit', 'mariadb-filtering-and-sorting', 'Sort and limit',
 'This returns the three newest students.',
 NULL, 'Without ORDER BY the row order is not guaranteed.',
 'SELECT *
FROM students
ORDER BY enrolled_at DESC
LIMIT 3;', 4),
('mariadb-filtering-and-sorting-distinct-and-aliases', 'mariadb-filtering-and-sorting', 'DISTINCT and aliases',
 'DISTINCT removes duplicate rows from the result. AS gives a column a readable name in the output.',
 NULL, NULL,
 'SELECT DISTINCT program FROM students;

SELECT name AS student_name, email AS contact
FROM students;', 5),
('mariadb-summarizing-data-count-rows', 'mariadb-summarizing-data', 'Count rows',
 'COUNT(*) counts rows. COUNT(column) counts only the rows where that column is not NULL.',
 NULL, 'The two queries give different numbers, because Jonas has no program.',
 'SELECT COUNT(*) AS all_students FROM students;
SELECT COUNT(program) AS with_program FROM students;', 0),
('mariadb-summarizing-data-sum-avg-min-and-max', 'mariadb-summarizing-data', 'SUM, AVG, MIN and MAX',
 'The other aggregate functions work on numeric columns and ignore NULL.',
 NULL, NULL,
 'SELECT SUM(credits) AS total,
       AVG(credits) AS average,
       MIN(credits) AS smallest,
       MAX(credits) AS largest
FROM courses;', 1),
('mariadb-summarizing-data-count-per-group', 'mariadb-summarizing-data', 'Count per group',
 'GROUP BY splits the rows into groups and runs the aggregate once for each. NULL values form their own group.',
 NULL, NULL,
 'SELECT program, COUNT(*) AS students
FROM students
GROUP BY program;', 2),
('mariadb-summarizing-data-having-vs-where', 'mariadb-summarizing-data', 'HAVING vs WHERE',
 'WHERE filters rows before they are grouped. HAVING filters the groups after the aggregate is calculated. This is why you cannot use COUNT(*) in a WHERE clause.',
 NULL, 'Order of evaluation: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT.',
 'SELECT program, COUNT(*) AS students
FROM students
WHERE program IS NOT NULL
GROUP BY program
HAVING COUNT(*) >= 2;', 3),
('mariadb-summarizing-data-built-in-functions', 'mariadb-summarizing-data', 'Built-in functions',
 'MariaDB has many functions for text, dates and numbers. You can use them in SELECT and in WHERE.',
 NULL, NULL,
 'SELECT UPPER(name)                    AS shout,
       CONCAT(name, '' <'', email, ''>'') AS contact,
       YEAR(enrolled_at)              AS year_enrolled
FROM students;

SELECT ROUND(AVG(credits), 1) AS avg_credits,
       CURDATE()              AS today
FROM courses;', 4),
('mariadb-relationships-and-joins-why-split-data-up', 'mariadb-relationships-and-joins', 'Why split data up?',
 'If every row repeated the lecturer''s name and office, changing an office would mean editing many rows, and missing one would leave conflicting data. Storing each fact once and pointing to it by id is called normalization. In short: 1NF means every cell holds a single value, 2NF means every column depends on the whole key, and 3NF means columns depend on the key and nothing else.',
 NULL, NULL,
 NULL, 0),
('mariadb-relationships-and-joins-one-to-many', 'mariadb-relationships-and-joins', 'One-to-many',
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
('mariadb-relationships-and-joins-add-data-to-the-relation', 'mariadb-relationships-and-joins', 'Add data to the relation',
 'Insert two lecturers and connect the courses to them.',
 NULL, NULL,
 'INSERT INTO lecturers (name, office) VALUES
  (''Ingrid Solberg'', ''B-204''),
  (''Henrik Moe'',     ''A-110'');

UPDATE courses SET lecturer_id = 1 WHERE code IN (''DB101'', ''PR101'');
UPDATE courses SET lecturer_id = 2 WHERE code = ''MA101'';', 2),
('mariadb-relationships-and-joins-see-it-being-enforced', 'mariadb-relationships-and-joins', 'See it being enforced',
 'Try to point a course at a lecturer that does not exist. You get error 1452 and the database refuses to create the broken link. This is called referential integrity.',
 NULL, NULL,
 'UPDATE courses SET lecturer_id = 99 WHERE code = ''MA101'';
-- ERROR 1452: Cannot add or update a child row: a foreign key constraint fails', 3),
('mariadb-relationships-and-joins-decide-what-happens-on-delete', 'mariadb-relationships-and-joins', 'Decide what happens on delete',
 'By default (RESTRICT) MariaDB refuses to delete a lecturer that still has courses and gives error 1451. ON DELETE CASCADE deletes the child rows along with the parent. ON DELETE SET NULL keeps them but clears the link (the column must allow NULL).',
 NULL, 'CASCADE is convenient but can delete far more than you expect. Use it deliberately.',
 'FOREIGN KEY (lecturer_id) REFERENCES lecturers(id)
  ON DELETE SET NULL', 4),
('mariadb-relationships-and-joins-many-to-many', 'mariadb-relationships-and-joins', 'Many-to-many',
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
('mariadb-relationships-and-joins-enrol-some-students', 'mariadb-relationships-and-joins', 'Enrol some students',
 'Add a few enrolments. The ids below assume you followed the earlier chapters, so check with SELECT * FROM students and SELECT * FROM courses first.',
 NULL, NULL,
 'INSERT INTO enrolments (student_id, course_id, grade) VALUES
  (1, 1, ''A''),
  (1, 2, ''B''),
  (2, 1, ''B''),
  (3, 3, NULL);', 6),
('mariadb-relationships-and-joins-inner-join', 'mariadb-relationships-and-joins', 'INNER JOIN',
 'A join combines rows from two tables where the ON condition is true. INNER JOIN returns only the rows that have a match on both sides.',
 NULL, NULL,
 'SELECT c.code, c.title, l.name AS lecturer
FROM courses c
INNER JOIN lecturers l ON l.id = c.lecturer_id;', 7),
('mariadb-relationships-and-joins-left-join', 'mariadb-relationships-and-joins', 'LEFT JOIN',
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
('mariadb-relationships-and-joins-join-three-tables', 'mariadb-relationships-and-joins', 'Join three tables',
 'Chain joins to follow the relations all the way from student to course.',
 NULL, NULL,
 'SELECT s.name, c.title, e.grade
FROM enrolments e
JOIN students s ON s.id = e.student_id
JOIN courses c  ON c.id = e.course_id;', 9),
('mariadb-relationships-and-joins-combine-with-group-by', 'mariadb-relationships-and-joins', 'Combine with GROUP BY',
 'Count how many students are in each course. COUNT(e.student_id) is used instead of COUNT(*) so a course with no students shows 0.',
 NULL, NULL,
 'SELECT c.title, COUNT(e.student_id) AS students
FROM courses c
LEFT JOIN enrolments e ON e.course_id = c.id
GROUP BY c.id, c.title
ORDER BY students DESC;', 10),
('mariadb-intermediate-queries-subqueries', 'mariadb-intermediate-queries', 'Subqueries',
 'A subquery is a SELECT inside another query. The inner query runs first and its result is used by the outer one. Find the students enrolled in DB101.',
 NULL, NULL,
 'SELECT name
FROM students
WHERE id IN (
  SELECT student_id
  FROM enrolments
  WHERE course_id = 1
);', 0),
('mariadb-intermediate-queries-exists-and-correlated-subqueries', 'mariadb-intermediate-queries', 'EXISTS and correlated subqueries',
 'A correlated subquery refers to the outer query, so it is checked once per outer row. EXISTS is true when the subquery returns at least one row. This finds students with at least one enrolment.',
 NULL, NULL,
 'SELECT s.name
FROM students s
WHERE EXISTS (
  SELECT 1
  FROM enrolments e
  WHERE e.student_id = s.id
);', 1),
('mariadb-intermediate-queries-views', 'mariadb-intermediate-queries', 'Views',
 'A view is a saved query that you can use like a table. It stores no data of its own, it runs the query each time. Use it to hide complicated joins.',
 NULL, NULL,
 'CREATE VIEW student_courses AS
SELECT s.name AS student, c.title AS course, e.grade
FROM enrolments e
JOIN students s ON s.id = e.student_id
JOIN courses c  ON c.id = e.course_id;

SELECT * FROM student_courses WHERE grade = ''A'';', 2),
('mariadb-intermediate-queries-what-is-an-index', 'mariadb-intermediate-queries', 'What is an index?',
 'An index works like the index of a book: instead of reading every row (a full table scan), the database jumps straight to the matching ones. Primary keys, UNIQUE columns and foreign keys are indexed automatically. Indexes are usually stored as B-trees.',
 NULL, 'Indexes speed up reads but slow down writes and use disk space. Add them where you actually filter or join.',
 'CREATE INDEX idx_students_program ON students (program);', 3),
('mariadb-intermediate-queries-check-with-explain', 'mariadb-intermediate-queries', 'Check with EXPLAIN',
 'Put EXPLAIN in front of a query. Look at the ''key'' column to see which index was used. NULL means no index, so a full table scan.',
 NULL, NULL,
 'EXPLAIN SELECT * FROM students WHERE program = ''Computer Science'';', 4),
('mariadb-intermediate-queries-transactions', 'mariadb-intermediate-queries', 'Transactions',
 'A transaction groups several statements into one unit of work. Nothing is permanent until COMMIT, and ROLLBACK undoes everything since START TRANSACTION. Try changing a grade and then undoing it.',
 NULL, NULL,
 'START TRANSACTION;

UPDATE enrolments SET grade = ''A''
WHERE student_id = 2 AND course_id = 1;

SELECT * FROM enrolments;

ROLLBACK;   -- use COMMIT; to keep the change', 5),
('mariadb-intermediate-queries-acid', 'mariadb-intermediate-queries', 'ACID',
 'Transactions give you four guarantees. Atomicity: all statements succeed or none do. Consistency: the data always satisfies the rules (keys, constraints). Isolation: concurrent transactions do not see each other''s half-finished work. Durability: once committed, the data survives a crash.',
 NULL, 'Transactions need the InnoDB engine (the default). Statements like CREATE TABLE and DROP TABLE commit automatically and cannot be rolled back.',
 NULL, 6),
('mariadb-security-and-safety-do-not-use-root-in-applications', 'mariadb-security-and-safety', 'Do not use root in applications',
 'root can do anything, including dropping every database. If an application uses root and gets compromised, the attacker gets everything. Create a separate user for each application with only the privileges it needs. This is called the principle of least privilege.',
 NULL, NULL,
 NULL, 0),
('mariadb-security-and-safety-create-a-user', 'mariadb-security-and-safety', 'Create a user',
 'Create a user that can only connect from the same machine.',
 NULL, NULL,
 'CREATE USER ''app_user''@''localhost''
IDENTIFIED BY ''choose-a-strong-password'';', 1),
('mariadb-security-and-safety-grant-privileges', 'mariadb-security-and-safety', 'Grant privileges',
 'Give the user access to the university database only, and only for the four CRUD operations. Then check what it can do.',
 NULL, NULL,
 'GRANT SELECT, INSERT, UPDATE, DELETE
ON university.*
TO ''app_user''@''localhost'';

SHOW GRANTS FOR ''app_user''@''localhost'';', 2),
('mariadb-security-and-safety-revoke-and-remove', 'mariadb-security-and-safety', 'Revoke and remove',
 'Take privileges away with REVOKE and delete a user with DROP USER.',
 NULL, 'Do not run DROP USER yet if you want to use app_user in the next chapter.',
 'REVOKE DELETE ON university.* FROM ''app_user''@''localhost'';
DROP USER ''app_user''@''localhost'';', 3),
('mariadb-security-and-safety-sql-injection', 'mariadb-security-and-safety', 'SQL injection',
 'SQL injection happens when an application glues user input into a query as text. If someone types '' OR ''1''=''1 as their email, the query below returns every student, because the condition is always true. Attackers can use the same trick to read or destroy data.',
 NULL, 'Never build SQL by concatenating user input into a string. Use prepared statements.',
 '-- what the database receives when the input is glued in
SELECT * FROM students WHERE email = '''' OR ''1''=''1'';', 4),
('mariadb-security-and-safety-prepared-statements', 'mariadb-security-and-safety', 'Prepared statements',
 'A prepared statement sends the query and the values separately. The ? is a placeholder, and the value is always treated as data, never as SQL. Your programming language''s database driver does this for you (see chapter 9).',
 NULL, NULL,
 'PREPARE find_student FROM
  ''SELECT * FROM students WHERE email = ?'';

SET @email = ''ola@example.com'';
EXECUTE find_student USING @email;

DEALLOCATE PREPARE find_student;', 5),
('mariadb-security-and-safety-backups', 'mariadb-security-and-safety', 'Backups',
 'mariadb-dump exports a database as a text file of SQL statements. Run it in your normal terminal, not inside the mariadb client. To restore, feed the file back into mariadb.',
 NULL, 'A backup you have never restored is not a backup. Test it, and keep a copy somewhere other than the same computer. On versions before 10.5 the tool is called mysqldump.',
 'mariadb-dump -u root -p --databases university > university_backup.sql

mariadb -u root -p < university_backup.sql', 6),
('mariadb-using-mariadb-in-a-real-application-how-an-application-talks-to-mariadb', 'mariadb-using-mariadb-in-a-real-application', 'How an application talks to MariaDB',
 'Your program does not type into the mariadb client. It uses a driver (a library) that opens a connection to the server, sends SQL, and turns the result rows into objects in your language. In Node.js, mysql2 is a popular driver and it works with MariaDB because the two speak the same protocol. MariaDB also publishes its own official Node.js connector, called mariadb.',
 NULL, NULL,
 NULL, 0),
('mariadb-using-mariadb-in-a-real-application-install-the-driver', 'mariadb-using-mariadb-in-a-real-application', 'Install the driver',
 'In your project folder, install mysql2.',
 NULL, NULL,
 'npm install mysql2', 1),
('mariadb-using-mariadb-in-a-real-application-keep-credentials-in-environment-variables', 'mariadb-using-mariadb-in-a-real-application', 'Keep credentials in environment variables',
 'Never write passwords directly in your source code. Put them in a .env file (Next.js uses .env.local) and read them with process.env.',
 NULL, 'Add .env to .gitignore so the password never ends up in Git.',
 'DB_HOST=localhost
DB_USER=app_user
DB_PASSWORD=choose-a-strong-password
DB_NAME=university', 2),
('mariadb-using-mariadb-in-a-real-application-connect-and-run-a-query', 'mariadb-using-mariadb-in-a-real-application', 'Connect and run a query',
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
('mariadb-using-mariadb-in-a-real-application-insert-data-safely', 'mariadb-using-mariadb-in-a-real-application', 'Insert data safely',
 'Pass values in the array, never inside the query string. The driver sends them separately, which prevents SQL injection.',
 NULL, 'Do not write "... VALUES (''" + name + "'')". That is exactly what SQL injection needs.',
 'await pool.execute(
  "INSERT INTO students (name, email, program) VALUES (?, ?, ?)",
  [name, email, program]
);', 4),
('mariadb-using-mariadb-in-a-real-application-handle-errors', 'mariadb-using-mariadb-in-a-real-application', 'Handle errors',
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
('mariadb-next-steps-stored-procedures', 'mariadb-next-steps', 'Stored procedures',
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
('mariadb-next-steps-triggers', 'mariadb-next-steps', 'Triggers',
 'A trigger is SQL that MariaDB runs automatically when a row is inserted, updated or deleted. They are handy for audit logs and validation, but they run invisibly, so use them sparingly and document them.',
 NULL, NULL,
 NULL, 1),
('mariadb-next-steps-mysql-mariadb-postgresql-and-sqlite', 'mariadb-next-steps', 'MySQL, MariaDB, PostgreSQL and SQLite',
 'MariaDB started as a fork of MySQL and is mostly compatible with it, but the two have drifted apart over the years and now have different version numbers and some different features (MariaDB has built-in sequences, for example). PostgreSQL is another open-source RDBMS with richer features and stricter standards compliance. SQLite stores the whole database in one file with no server, which is why it is used in phones and small apps. The SQL you learned here carries over with small differences.',
 NULL, NULL,
 NULL, 2),
('mariadb-next-steps-practice-ideas', 'mariadb-next-steps', 'Practice ideas',
 'The best way to learn is by building. Try a library database with authors, books and loans, or a webshop with customers, orders and products. Draw the tables on paper first, decide the keys, then write the CREATE TABLE statements.',
 NULL, NULL,
 NULL, 3),
('mariadb-next-steps-keep-learning', 'mariadb-next-steps', 'Keep learning',
 'The <a href=''https://mariadb.com/docs/'' target=''_blank'' rel=''noreferrer''>official MariaDB documentation</a> is the reference for every statement and function. Good topics to explore next: query optimization, replication, window functions and NoSQL databases.',
 NULL, NULL,
 NULL, 4);

-- ============================================================
-- QUESTIONS (id, category_id, question, answertype, alternatives, answer, position)
-- ============================================================
INSERT INTO questions (id, category_id, question, answertype, alternatives, answer, position) VALUES
('mysql-getting-started-question-1', 'mysql-getting-started', 'What does RDBMS stand for?', 'multiple',
 '["Relational Database Management System", "Remote Data Backup Management System", "Relational Data Binary Mapping Structure"]',
 'Relational Database Management System', 0),
('mysql-getting-started-question-2', 'mysql-getting-started', 'What links a row in one table to a row in another table?', 'multiple',
 '["A foreign key", "A spreadsheet formula", "A column alias", "A comment"]',
 'A foreign key', 1),
('mysql-getting-started-question-3', 'mysql-getting-started', 'Which command connects as root and asks for a password?', 'multiple',
 '["mysql -u root -p", "mysql --root --password-none", "connect mysql root"]',
 'mysql -u root -p', 2),
('mysql-getting-started-question-4', 'mysql-getting-started', 'Which port does MySQL listen on by default?', 'text',
 NULL,
 '3306', 3),
('mysql-creating-tables-question-1', 'mysql-creating-tables', 'Which data type is best for a price like 19.99?', 'multiple',
 '["DECIMAL(10,2)", "FLOAT", "VARCHAR(10)", "TEXT"]',
 'DECIMAL(10,2)', 0),
('mysql-creating-tables-question-2', 'mysql-creating-tables', 'Which keyword makes MySQL generate the next id automatically?', 'text',
 NULL,
 'AUTO_INCREMENT', 1),
('mysql-creating-tables-question-3', 'mysql-creating-tables', 'Which constraint stops two students from having the same email?', 'multiple',
 '["UNIQUE", "DEFAULT", "CHECK", "INDEX"]',
 'UNIQUE', 2),
('mysql-creating-tables-question-4', 'mysql-creating-tables', 'Which command lists the columns of a table?', 'text',
 NULL,
 'DESCRIBE', 3),
('mysql-working-with-data-crud-question-1', 'mysql-working-with-data-crud', 'How do you add a row to a table?', 'multiple',
 '["ADD TO students name = ''Ola''", "INSERT INTO students (name) VALUES (''Ola'')", "PUT ''Ola'' IN students"]',
 'INSERT INTO students (name) VALUES (''Ola'')', 0),
('mysql-working-with-data-crud-question-2', 'mysql-working-with-data-crud', 'How do you change the name of the student with id 1?', 'multiple',
 '["CHANGE students SET name = ''Hi'' WHERE id = 1", "UPDATE students SET name = ''Hi'' WHERE id = 1", "UPDATE students name = ''Hi'' IF id = 1"]',
 'UPDATE students SET name = ''Hi'' WHERE id = 1', 1),
('mysql-working-with-data-crud-question-3', 'mysql-working-with-data-crud', 'Which clause stops UPDATE and DELETE from affecting every row?', 'text',
 NULL,
 'WHERE', 2),
('mysql-working-with-data-crud-question-4', 'mysql-working-with-data-crud', 'How do you find rows where program has no value?', 'multiple',
 '["WHERE program IS NULL", "WHERE program = NULL", "WHERE program = ''''", "WHERE program = 0"]',
 'WHERE program IS NULL', 3),
('mysql-filtering-and-sorting-question-1', 'mysql-filtering-and-sorting', 'How do you sort the newest rows first?', 'multiple',
 '["ORDER BY enrolled_at DESC", "ORDER BY enrolled_at ASC", "SORT enrolled_at NEWEST"]',
 'ORDER BY enrolled_at DESC', 0),
('mysql-filtering-and-sorting-question-2', 'mysql-filtering-and-sorting', 'Which keyword restricts the number of rows returned?', 'text',
 NULL,
 'LIMIT', 1),
('mysql-filtering-and-sorting-question-3', 'mysql-filtering-and-sorting', 'Which keyword removes duplicate rows from a result?', 'multiple',
 '["DISTINCT", "UNIQUE", "ONLY", "SINGLE"]',
 'DISTINCT', 2),
('mysql-summarizing-data-question-1', 'mysql-summarizing-data', 'Which function counts the number of rows?', 'text',
 NULL,
 'COUNT', 0),
('mysql-summarizing-data-question-2', 'mysql-summarizing-data', 'Which clause filters groups after aggregation?', 'multiple',
 '["HAVING", "WHERE", "LIMIT", "DISTINCT"]',
 'HAVING', 1),
('mysql-summarizing-data-question-3', 'mysql-summarizing-data', 'What does COUNT(program) do with NULL values?', 'multiple',
 '["Ignores them", "Counts them as 0", "Counts them as 1", "Gives an error"]',
 'Ignores them', 2),
('mysql-relationships-and-joins-question-1', 'mysql-relationships-and-joins', 'What does a foreign key do?', 'multiple',
 '["Links a column to the primary key of another table and enforces it", "Encrypts the column", "Makes the column faster to search", "Copies the data into another table"]',
 'Links a column to the primary key of another table and enforces it', 0),
('mysql-relationships-and-joins-question-2', 'mysql-relationships-and-joins', 'In a one-to-many relation, which table stores the foreign key?', 'multiple',
 '["The ''many'' side", "The ''one'' side", "Both", "Neither"]',
 'The ''many'' side', 1),
('mysql-relationships-and-joins-question-3', 'mysql-relationships-and-joins', 'What do you need to model a many-to-many relation?', 'multiple',
 '["A junction table", "A bigger primary key", "A VARCHAR column with comma-separated ids", "A view"]',
 'A junction table', 2),
('mysql-relationships-and-joins-question-4', 'mysql-relationships-and-joins', 'Which join keeps all rows from the left table even when there is no match?', 'multiple',
 '["LEFT JOIN", "INNER JOIN", "CROSS JOIN", "SELF JOIN"]',
 'LEFT JOIN', 3),
('mysql-relationships-and-joins-question-5', 'mysql-relationships-and-joins', 'What value do unmatched columns get in a LEFT JOIN?', 'text',
 NULL,
 'NULL', 4),
('mysql-intermediate-queries-question-1', 'mysql-intermediate-queries', 'What is a subquery?', 'multiple',
 '["A SELECT inside another query", "A query that runs in the background", "A copy of a table", "A query without a WHERE"]',
 'A SELECT inside another query', 0),
('mysql-intermediate-queries-question-2', 'mysql-intermediate-queries', 'Which keyword shows the query plan?', 'text',
 NULL,
 'EXPLAIN', 1),
('mysql-intermediate-queries-question-3', 'mysql-intermediate-queries', 'Which command undoes a transaction?', 'text',
 NULL,
 'ROLLBACK', 2),
('mysql-intermediate-queries-question-4', 'mysql-intermediate-queries', 'What does the A in ACID stand for?', 'multiple',
 '["Atomicity", "Availability", "Authentication", "Aggregation"]',
 'Atomicity', 3),
('mysql-security-and-safety-question-1', 'mysql-security-and-safety', 'Why should an application not connect to MySQL as root?', 'multiple',
 '["root has too many privileges, so a breach does far more damage", "root is slower than other users", "root cannot read data", "root cannot use SELECT"]',
 'root has too many privileges, so a breach does far more damage', 0),
('mysql-security-and-safety-question-2', 'mysql-security-and-safety', 'Which statement gives a user privileges?', 'text',
 NULL,
 'GRANT', 1),
('mysql-security-and-safety-question-3', 'mysql-security-and-safety', 'What is the best protection against SQL injection?', 'multiple',
 '["Prepared statements", "Longer passwords", "Using uppercase SQL", "Adding more indexes"]',
 'Prepared statements', 2),
('mysql-security-and-safety-question-4', 'mysql-security-and-safety', 'Which tool exports a database to a .sql file?', 'text',
 NULL,
 'mysqldump', 3),
('mysql-using-mysql-in-a-real-application-question-1', 'mysql-using-mysql-in-a-real-application', 'Which character is used as a placeholder in a parameterized query?', 'text',
 NULL,
 '?', 0),
('mysql-using-mysql-in-a-real-application-question-2', 'mysql-using-mysql-in-a-real-application', 'Why should database passwords be kept in a .env file?', 'multiple',
 '["So they are not hard-coded in the source code or committed to Git", "So queries run faster", "Because MySQL requires it", "So they are encrypted automatically"]',
 'So they are not hard-coded in the source code or committed to Git', 1),
('mysql-using-mysql-in-a-real-application-question-3', 'mysql-using-mysql-in-a-real-application', 'What does a connection pool do?', 'multiple',
 '["Reuses open connections instead of opening a new one each time", "Backs up the database", "Encrypts the queries", "Creates indexes"]',
 'Reuses open connections instead of opening a new one each time', 2),
('mysql-next-steps-question-1', 'mysql-next-steps', 'Which keyword runs a stored procedure?', 'text',
 NULL,
 'CALL', 0),
('mysql-next-steps-question-2', 'mysql-next-steps', 'Which database stores everything in a single file without a server?', 'multiple',
 '["SQLite", "MySQL", "PostgreSQL", "MariaDB"]',
 'SQLite', 1),
('mariadb-getting-started-question-1', 'mariadb-getting-started', 'What does RDBMS stand for?', 'multiple',
 '["Relational Database Management System", "Remote Data Backup Management System", "Relational Data Binary Mapping Structure"]',
 'Relational Database Management System', 0),
('mariadb-getting-started-question-2', 'mariadb-getting-started', 'What links a row in one table to a row in another table?', 'multiple',
 '["A foreign key", "A spreadsheet formula", "A column alias", "A comment"]',
 'A foreign key', 1),
('mariadb-getting-started-question-3', 'mariadb-getting-started', 'Which command connects as root and asks for a password?', 'multiple',
 '["mariadb -u root -p", "mariadb --root --password-none", "connect mariadb root"]',
 'mariadb -u root -p', 2),
('mariadb-getting-started-question-4', 'mariadb-getting-started', 'Which port does MariaDB listen on by default?', 'text',
 NULL,
 '3306', 3),
('mariadb-creating-tables-question-1', 'mariadb-creating-tables', 'Which data type is best for a price like 19.99?', 'multiple',
 '["DECIMAL(10,2)", "FLOAT", "VARCHAR(10)", "TEXT"]',
 'DECIMAL(10,2)', 0),
('mariadb-creating-tables-question-2', 'mariadb-creating-tables', 'Which keyword makes MariaDB generate the next id automatically?', 'text',
 NULL,
 'AUTO_INCREMENT', 1),
('mariadb-creating-tables-question-3', 'mariadb-creating-tables', 'Which constraint stops two students from having the same email?', 'multiple',
 '["UNIQUE", "DEFAULT", "CHECK", "INDEX"]',
 'UNIQUE', 2),
('mariadb-creating-tables-question-4', 'mariadb-creating-tables', 'Which command lists the columns of a table?', 'text',
 NULL,
 'DESCRIBE', 3),
('mariadb-working-with-data-crud-question-1', 'mariadb-working-with-data-crud', 'How do you add a row to a table?', 'multiple',
 '["ADD TO students name = ''Ola''", "INSERT INTO students (name) VALUES (''Ola'')", "PUT ''Ola'' IN students"]',
 'INSERT INTO students (name) VALUES (''Ola'')', 0),
('mariadb-working-with-data-crud-question-2', 'mariadb-working-with-data-crud', 'How do you change the name of the student with id 1?', 'multiple',
 '["CHANGE students SET name = ''Hi'' WHERE id = 1", "UPDATE students SET name = ''Hi'' WHERE id = 1", "UPDATE students name = ''Hi'' IF id = 1"]',
 'UPDATE students SET name = ''Hi'' WHERE id = 1', 1),
('mariadb-working-with-data-crud-question-3', 'mariadb-working-with-data-crud', 'Which clause stops UPDATE and DELETE from affecting every row?', 'text',
 NULL,
 'WHERE', 2),
('mariadb-working-with-data-crud-question-4', 'mariadb-working-with-data-crud', 'How do you find rows where program has no value?', 'multiple',
 '["WHERE program IS NULL", "WHERE program = NULL", "WHERE program = ''''", "WHERE program = 0"]',
 'WHERE program IS NULL', 3),
('mariadb-filtering-and-sorting-question-1', 'mariadb-filtering-and-sorting', 'How do you sort the newest rows first?', 'multiple',
 '["ORDER BY enrolled_at DESC", "ORDER BY enrolled_at ASC", "SORT enrolled_at NEWEST"]',
 'ORDER BY enrolled_at DESC', 0),
('mariadb-filtering-and-sorting-question-2', 'mariadb-filtering-and-sorting', 'Which keyword restricts the number of rows returned?', 'text',
 NULL,
 'LIMIT', 1),
('mariadb-filtering-and-sorting-question-3', 'mariadb-filtering-and-sorting', 'Which keyword removes duplicate rows from a result?', 'multiple',
 '["DISTINCT", "UNIQUE", "ONLY", "SINGLE"]',
 'DISTINCT', 2),
('mariadb-summarizing-data-question-1', 'mariadb-summarizing-data', 'Which function counts the number of rows?', 'text',
 NULL,
 'COUNT', 0),
('mariadb-summarizing-data-question-2', 'mariadb-summarizing-data', 'Which clause filters groups after aggregation?', 'multiple',
 '["HAVING", "WHERE", "LIMIT", "DISTINCT"]',
 'HAVING', 1),
('mariadb-summarizing-data-question-3', 'mariadb-summarizing-data', 'What does COUNT(program) do with NULL values?', 'multiple',
 '["Ignores them", "Counts them as 0", "Counts them as 1", "Gives an error"]',
 'Ignores them', 2),
('mariadb-relationships-and-joins-question-1', 'mariadb-relationships-and-joins', 'What does a foreign key do?', 'multiple',
 '["Links a column to the primary key of another table and enforces it", "Encrypts the column", "Makes the column faster to search", "Copies the data into another table"]',
 'Links a column to the primary key of another table and enforces it', 0),
('mariadb-relationships-and-joins-question-2', 'mariadb-relationships-and-joins', 'In a one-to-many relation, which table stores the foreign key?', 'multiple',
 '["The ''many'' side", "The ''one'' side", "Both", "Neither"]',
 'The ''many'' side', 1),
('mariadb-relationships-and-joins-question-3', 'mariadb-relationships-and-joins', 'What do you need to model a many-to-many relation?', 'multiple',
 '["A junction table", "A bigger primary key", "A VARCHAR column with comma-separated ids", "A view"]',
 'A junction table', 2),
('mariadb-relationships-and-joins-question-4', 'mariadb-relationships-and-joins', 'Which join keeps all rows from the left table even when there is no match?', 'multiple',
 '["LEFT JOIN", "INNER JOIN", "CROSS JOIN", "SELF JOIN"]',
 'LEFT JOIN', 3),
('mariadb-relationships-and-joins-question-5', 'mariadb-relationships-and-joins', 'What value do unmatched columns get in a LEFT JOIN?', 'text',
 NULL,
 'NULL', 4),
('mariadb-intermediate-queries-question-1', 'mariadb-intermediate-queries', 'What is a subquery?', 'multiple',
 '["A SELECT inside another query", "A query that runs in the background", "A copy of a table", "A query without a WHERE"]',
 'A SELECT inside another query', 0),
('mariadb-intermediate-queries-question-2', 'mariadb-intermediate-queries', 'Which keyword shows the query plan?', 'text',
 NULL,
 'EXPLAIN', 1),
('mariadb-intermediate-queries-question-3', 'mariadb-intermediate-queries', 'Which command undoes a transaction?', 'text',
 NULL,
 'ROLLBACK', 2),
('mariadb-intermediate-queries-question-4', 'mariadb-intermediate-queries', 'What does the A in ACID stand for?', 'multiple',
 '["Atomicity", "Availability", "Authentication", "Aggregation"]',
 'Atomicity', 3),
('mariadb-security-and-safety-question-1', 'mariadb-security-and-safety', 'Why should an application not connect to MariaDB as root?', 'multiple',
 '["root has too many privileges, so a breach does far more damage", "root is slower than other users", "root cannot read data", "root cannot use SELECT"]',
 'root has too many privileges, so a breach does far more damage', 0),
('mariadb-security-and-safety-question-2', 'mariadb-security-and-safety', 'Which statement gives a user privileges?', 'text',
 NULL,
 'GRANT', 1),
('mariadb-security-and-safety-question-3', 'mariadb-security-and-safety', 'What is the best protection against SQL injection?', 'multiple',
 '["Prepared statements", "Longer passwords", "Using uppercase SQL", "Adding more indexes"]',
 'Prepared statements', 2),
('mariadb-security-and-safety-question-4', 'mariadb-security-and-safety', 'Which tool exports a database to a .sql file?', 'text',
 NULL,
 'mariadb-dump', 3),
('mariadb-using-mariadb-in-a-real-application-question-1', 'mariadb-using-mariadb-in-a-real-application', 'Which character is used as a placeholder in a parameterized query?', 'text',
 NULL,
 '?', 0),
('mariadb-using-mariadb-in-a-real-application-question-2', 'mariadb-using-mariadb-in-a-real-application', 'Why should database passwords be kept in a .env file?', 'multiple',
 '["So they are not hard-coded in the source code or committed to Git", "So queries run faster", "Because MariaDB requires it", "So they are encrypted automatically"]',
 'So they are not hard-coded in the source code or committed to Git', 1),
('mariadb-using-mariadb-in-a-real-application-question-3', 'mariadb-using-mariadb-in-a-real-application', 'What does a connection pool do?', 'multiple',
 '["Reuses open connections instead of opening a new one each time", "Backs up the database", "Encrypts the queries", "Creates indexes"]',
 'Reuses open connections instead of opening a new one each time', 2),
('mariadb-next-steps-question-1', 'mariadb-next-steps', 'Which keyword runs a stored procedure?', 'text',
 NULL,
 'CALL', 0),
('mariadb-next-steps-question-2', 'mariadb-next-steps', 'Which database stores everything in a single file without a server?', 'multiple',
 '["SQLite", "MySQL", "PostgreSQL", "MariaDB"]',
 'SQLite', 1);

COMMIT;
