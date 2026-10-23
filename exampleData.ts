const dataBases: Array<LearnDB.DataBase> = [
  {
    id: "db-1",
    title: "MySQL",
    info: [
    "MySQL is one of the most widely used relational database management systems in the world. It is free, open source and runs everything from student projects to large web services.",
    "Data is stored in tables of rows and columns, and you work with it using SQL. This guide teaches the core concepts step by step, using a small university database as the running example.",
  ],
    logo: "/mysql.png",
    categories: [
    // ───────────────────────── 1. Getting started ─────────────────────────
      {
        id: "db-1-cat-1",
        title: "Getting Started",
        info: "This guide will teach you the core foundational concepts of databases using MySQL, one of the most widely used relational database management systems in the world.",
        steps: [
          {
            id: "db-1-cat-1-step-1",
            title: "What is a database?",
            text: "A database is an organized collection of structured data stored electronically. Unlike a spreadsheet, a database is built to handle large amounts of data safely, prevent errors and let many users and programs read and write at the same time. The software that manages it is called a database management system (DBMS).",
            important:
              "The database is the data. MySQL is the DBMS: the program that stores, protects and serves it.",
          },
          {
            id: "db-1-cat-1-step-2",
            title: "Relational Databases & The Spreadsheet Analogy",
            text: "MySQL is a relational database management system (RDBMS): the data lives in tables that can be linked to each other. If you know spreadsheets you already know the layout. A table is like one sheet about a single subject (students). A column is a category with a name and a data type (email). A row is one record (one student). In relational theory these are called a relation, an attribute and a tuple.",
            image: "/images/mysqltable.png",
          },
          {
            id: "db-1-cat-1-step-3",
            title: "Keys and relationships",
            text: "In a spreadsheet, a student who takes five courses means repeating their name and email five times. In a relational database you store the student once and link to it using keys. A primary key uniquely identifies each row in a table. A foreign key is a column that holds the primary key of a row in another table, and that is what creates the relationship. You will build this in chapter 6.",
            important: "Every table should have a primary key.",
          },
          {
            id: "db-1-cat-1-step-4",
            title: "What is SQL?",
            text: "SQL (Structured Query Language) is the standard language for talking to relational databases. Its English-like statements fall into groups: DDL defines structure (CREATE, ALTER, DROP), DML works with data (INSERT, SELECT, UPDATE, DELETE) and DCL controls access (GRANT, REVOKE). The four data operations are known as CRUD: Create, Read, Update, Delete.",
          },
          {
            id: "db-1-cat-1-step-5",
            title: "Downloading MySQL",
            text: "Head over to the <a href='https://dev.mysql.com/downloads/mysql/' target='_blank' rel='noreferrer'>MySQL Community Server downloads page</a> and pick the latest LTS (long-term support) release for your operating system, also get <a href='https://dev.mysql.com/downloads/workbench/' target='_blank' rel='noreferrer'>MySQL Workbench</a>, a graphical client.",
          },
          {
            id: "db-1-cat-1-step-6",
            title: "Installing MySQL",
            text: "Open the installer you downloaded and walk through the steps. On Windows, choose 'Server only', or 'Developer Default' if you also want Workbench. You will be asked to set a password for the root user.",
            important:
              "Store the root password in a password manager. You cannot read it back later, only reset it.",
          },
          {
            id: "db-1-cat-1-step-7",
            title: "Open a terminal",
            text: "To talk to the server you need a command line. On Windows open 'MySQL Command Line Client' from the start menu (or Command Prompt), on macOS or Linux open Terminal.",
            image: "/images/mysqlcmd.png",
            important:
              "If the terminal says 'mysql' is not recognized, the MySQL bin folder is missing from your PATH. Use the MySQL Command Line Client shortcut instead.",
          },
          {
            id: "db-1-cat-1-step-8",
            title: "Connect",
            text: "Connect to the server on localhost, port 3306, as the root user.",
            code: `mysql -u root -p`,
            important:
              "-u picks the user and -p makes the client ask for the password.",
          },
          {
            id: "db-1-cat-1-step-9",
            title: "Login",
            text: "Type your password when prompted. When you see the 'mysql>' prompt you are connected.",
            image: "/images/mysqlconnect.png",
          },
          {
            id: "db-1-cat-1-step-10",
            title: "Check that it works",
            text: "Ask the server which version it is running, then leave the client again.",
            code: `SELECT VERSION();
  exit`,
            important: "Every SQL statement ends with a semicolon.",
          },
        ],
        questions: [
          {
            id: "db-1-cat-1-q-1",
            question: "What does RDBMS stand for?",
            answertype: "multiple",
            alternatives: [
              "Relational Database Management System",
              "Remote Data Backup Management System",
              "Relational Data Binary Mapping Structure",
            ],
            answer: "Relational Database Management System",
          },
          {
            id: "db-1-cat-1-q-2",
            question:
              "What links a row in one table to a row in another table?",
            answertype: "multiple",
            alternatives: [
              "A foreign key",
              "A spreadsheet formula",
              "A column alias",
              "A comment",
            ],
            answer: "A foreign key",
          },
          {
            id: "db-1-cat-1-q-3",
            question: "Which command connects as root and asks for a password?",
            answertype: "multiple",
            alternatives: [
              "mysql -u root -p",
              "mysql --root --password-none",
              "connect mysql root",
            ],
            answer: "mysql -u root -p",
          },
          {
            id: "db-1-cat-1-q-4",
            question: "Which port does MySQL listen on by default?",
            answertype: "text",
            answer: "3306",
          },
        ],
      },
        // ───────────────────────── 2. Creating tables ─────────────────────────
      {
        id: "db-1-cat-2",
        title: "Creating Tables",
        info: "Create a database, choose sensible data types and define tables with primary keys and constraints.",
        steps: [
          {
            id: "db-1-cat-2-step-1",
            title: "Create a database",
            text: "Create a database for the university. The utf8mb4 character set stores every character, including emoji and non-English letters.",
            code: `CREATE DATABASE university CHARACTER SET utf8mb4;`,
          },
          {
            id: "db-1-cat-2-step-2",
            title: "Select it",
            text: "Make it the active database, then list all databases to confirm it exists.",
            code: `USE university;
  SHOW DATABASES;`,
          },
          {
            id: "db-1-cat-2-step-3",
            title: "Pick data types",
            text: "Common types: INT for whole numbers, TINYINT for small ones, DECIMAL(10,2) for exact decimals such as money, VARCHAR(n) for short text up to n characters, CHAR(n) for fixed-length text, TEXT for long text, DATE and TIMESTAMP for time, BOOLEAN for true/false (stored as 0 or 1).",
            important:
              "Never store money in FLOAT or DOUBLE. They store binary approximations, so 0.1 + 0.2 is not exactly 0.3.",
          },
          {
            id: "db-1-cat-2-step-4",
            title: "Create the students table",
            text: "Create a students table, then inspect it. DESCRIBE lists every column with its type and constraints.",
            code: `CREATE TABLE students (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(255) NOT NULL UNIQUE,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
  
  SHOW TABLES;
  DESCRIBE students;`,
            image: "/images/mysqltablecreated.png",
          },
          {
            id: "db-1-cat-2-step-5",
            title: "What the constraints do",
            text: "PRIMARY KEY identifies each row uniquely. AUTO_INCREMENT generates the next id for you. NOT NULL forbids empty values. UNIQUE stops two rows from sharing the same value. DEFAULT fills in a value when you leave it out. CHECK makes sure a condition is true for every row.",
            important:
              "CHECK constraints are enforced from MySQL 8.0.16. Older versions accepted them but silently ignored them.",
          },
          {
            id: "db-1-cat-2-step-6",
            title: "Create the courses table",
            text: "Create a second table. Course codes must be unique, and credits must be positive.",
            code: `CREATE TABLE courses (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    code    VARCHAR(10) NOT NULL UNIQUE,
    title   VARCHAR(100) NOT NULL,
    credits TINYINT NOT NULL DEFAULT 10 CHECK (credits > 0)
  );`,
          },
          {
            id: "db-1-cat-2-step-7",
            title: "Change a table",
            text: "Use ALTER TABLE to change a table that already exists. Add a column for the study program. You can also use MODIFY to change a column type and DROP COLUMN to remove one.",
            code: `ALTER TABLE students ADD COLUMN program VARCHAR(50);
  DESCRIBE students;`,
          },
          {
            id: "db-1-cat-2-step-8",
            title: "Delete a table",
            text: "DROP TABLE removes a table and all of its data. Try it on a throwaway table.",
            code: `CREATE TABLE scratch (id INT);
  DROP TABLE scratch;`,
            important:
              "There is no undo. DROP TABLE and DROP DATABASE delete the data immediately.",
          },
        ],
        questions: [
          {
            id: "db-1-cat-2-q-1",
            question: "Which data type is best for a price like 19.99?",
            answertype: "multiple",
            alternatives: ["DECIMAL(10,2)", "FLOAT", "VARCHAR(10)", "TEXT"],
            answer: "DECIMAL(10,2)",
          },
          {
            id: "db-1-cat-2-q-2",
            question:
              "Which keyword makes MySQL generate the next id automatically?",
            answertype: "text",
            answer: "AUTO_INCREMENT",
          },
          {
            id: "db-1-cat-2-q-3",
            question:
              "Which constraint stops two students from having the same email?",
            answertype: "multiple",
            alternatives: ["UNIQUE", "DEFAULT", "CHECK", "INDEX"],
            answer: "UNIQUE",
          },
          {
            id: "db-1-cat-2-q-4",
            question: "Which command lists the columns of a table?",
            answertype: "text",
            answer: "DESCRIBE",
          },
        ],
      },
  
    // ───────────────────────── 3. CRUD ─────────────────────────
      {
        id: "db-1-cat-3",
        title: "Working with Data (CRUD)",
        info: "Create, read, update and delete rows. Together these are known as CRUD.",
        steps: [
          {
            id: "db-1-cat-3-step-1",
            title: "Insert data",
            text: "Add a single row to the table. Leave out id and enrolled_at, MySQL fills them in.",
            code: `INSERT INTO students (name, email, program)
  VALUES ('Ola Nordmann', 'ola@example.com', 'Computer Science');`,
          },
          {
            id: "db-1-cat-3-step-2",
            title: "Insert several rows",
            text: "You can add many rows in one statement by separating the value lists with commas. Jonas has no program yet, so we leave that column out.",
            code: `INSERT INTO students (name, email, program) VALUES
    ('Kari Hansen', 'kari@example.com', 'Computer Science'),
    ('Anna Berg',   'anna@example.com', 'Informatics');
  
  INSERT INTO students (name, email)
  VALUES ('Jonas Lie', 'jonas@example.com');
  
  INSERT INTO courses (code, title, credits) VALUES
    ('DB101', 'Introduction to Databases', 10),
    ('PR101', 'Programming 1',             10),
    ('MA101', 'Discrete Mathematics',      10);`,
          },
          {
            id: "db-1-cat-3-step-3",
            title: "Read data",
            text: "Select everything you have inserted so far.",
            code: `SELECT * FROM students;`,
            important:
              "In real applications list the columns you need instead of using *.",
          },
          {
            id: "db-1-cat-3-step-4",
            title: "Read specific columns",
            text: "List the columns after SELECT to get only what you need.",
            code: `SELECT name, email FROM students;`,
          },
          {
            id: "db-1-cat-3-step-5",
            title: "Change data",
            text: "Change a row by telling UPDATE which row to touch.",
            code: `UPDATE students
  SET name = 'Ola N. Nordmann'
  WHERE id = 1;`,
            important:
              "Always include WHERE and prefer the primary key. Without WHERE, every row is updated. MySQL Workbench has 'safe updates' on by default and refuses such statements with error 1175.",
          },
          {
            id: "db-1-cat-3-step-6",
            title: "Delete data",
            text: "Remove a row with DELETE. Check what will match first by running the same WHERE as a SELECT. We insert a throwaway student first so we do not lose real data. Email is UNIQUE, so it matches at most one row.",
            code: `INSERT INTO students (name, email)
  VALUES ('Test Person', 'test@example.com');
  
  -- 1. see which row(s) will be affected
  SELECT * FROM students WHERE email = 'test@example.com';
  
  -- 2. then delete them
  DELETE FROM students WHERE email = 'test@example.com';`,
          },
          {
            id: "db-1-cat-3-step-7",
            title: "Understanding NULL",
            text: "NULL means 'no value / unknown'. It is not zero and not an empty string. Any comparison with NULL using = gives unknown, so the row is never returned. Use IS NULL and IS NOT NULL instead. Jonas has no program, so he is the row that matches.",
            code: `-- returns nothing, even though Jonas has no program
  SELECT name FROM students WHERE program = NULL;
  
  -- correct
  SELECT name FROM students WHERE program IS NULL;`,
          },
        ],
        questions: [
          {
            id: "db-1-cat-3-q-1",
            question: "How do you add a row to a table?",
            answertype: "multiple",
            alternatives: [
              "ADD TO students name = 'Ola'",
              "INSERT INTO students (name) VALUES ('Ola')",
              "PUT 'Ola' IN students",
            ],
            answer: "INSERT INTO students (name) VALUES ('Ola')",
          },
          {
            id: "db-1-cat-3-q-2",
            question: "How do you change the name of the student with id 1?",
            answertype: "multiple",
            alternatives: [
              "CHANGE students SET name = 'Hi' WHERE id = 1",
              "UPDATE students SET name = 'Hi' WHERE id = 1",
              "UPDATE students name = 'Hi' IF id = 1",
            ],
            answer: "UPDATE students SET name = 'Hi' WHERE id = 1",
          },
          {
            id: "db-1-cat-3-q-3",
            question:
              "Which clause stops UPDATE and DELETE from affecting every row?",
            answertype: "text",
            answer: "WHERE",
          },
          {
            id: "db-1-cat-3-q-4",
            question: "How do you find rows where program has no value?",
            answertype: "multiple",
            alternatives: [
              "WHERE program IS NULL",
              "WHERE program = NULL",
              "WHERE program = ''",
              "WHERE program = 0",
            ],
            answer: "WHERE program IS NULL",
          },
        ],
      },
        // ───────────────────────── 4. Filtering and sorting ─────────────────────────
      {
        id: "db-1-cat-4",
        title: "Filtering and Sorting",
        info: "Ask more precise questions: filter rows, sort the result and limit how much you get back.",
        steps: [
          {
            id: "db-1-cat-4-step-1",
            title: "Filter with WHERE",
            text: "Only return the rows that match a condition.",
            code: `SELECT name, email
  FROM students
  WHERE program = 'Computer Science';`,
          },
          {
            id: "db-1-cat-4-step-2",
            title: "Combine conditions",
            text: "Use AND, OR and parentheses to combine several conditions. AND is evaluated before OR, so use parentheses when you mix them.",
            code: `SELECT *
  FROM students
  WHERE program = 'Computer Science'
    AND enrolled_at >= '2026-01-01';`,
          },
          {
            id: "db-1-cat-4-step-3",
            title: "IN and BETWEEN",
            text: "IN checks against a list of values. BETWEEN checks a range, and both ends are included.",
            code: `SELECT * FROM students
  WHERE program IN ('Computer Science', 'Informatics');
  
  SELECT code, title FROM courses
  WHERE credits BETWEEN 5 AND 10;`,
          },
          {
            id: "db-1-cat-4-step-4",
            title: "Search text with LIKE",
            text: "The % sign matches any number of characters and _ matches exactly one.",
            code: `SELECT *
  FROM students
  WHERE email LIKE '%@example.com';`,
          },
          {
            id: "db-1-cat-4-step-5",
            title: "Sort and limit",
            text: "This returns the three newest students.",
            code: `SELECT *
  FROM students
  ORDER BY enrolled_at DESC
  LIMIT 3;`,
            important: "Without ORDER BY the row order is not guaranteed.",
          },
          {
            id: "db-1-cat-4-step-6",
            title: "DISTINCT and aliases",
            text: "DISTINCT removes duplicate rows from the result. AS gives a column a readable name in the output.",
            code: `SELECT DISTINCT program FROM students;
  
  SELECT name AS student_name, email AS contact
  FROM students;`,
          },
        ],
        questions: [
          {
            id: "db-1-cat-4-q-1",
            question: "How do you sort the newest rows first?",
            answertype: "multiple",
            alternatives: [
              "ORDER BY enrolled_at DESC",
              "ORDER BY enrolled_at ASC",
              "SORT enrolled_at NEWEST",
            ],
            answer: "ORDER BY enrolled_at DESC",
          },
          {
            id: "db-1-cat-4-q-2",
            question: "Which keyword restricts the number of rows returned?",
            answertype: "text",
            answer: "LIMIT",
          },
          {
            id: "db-1-cat-4-q-3",
            question: "Which keyword removes duplicate rows from a result?",
            answertype: "multiple",
            alternatives: ["DISTINCT", "UNIQUE", "ONLY", "SINGLE"],
            answer: "DISTINCT",
          },
        ],
      },
  
        // ───────────────────────── 5. Summarizing data ─────────────────────────
      {
        id: "db-1-cat-5",
        title: "Summarizing Data",
        info: "Aggregate functions boil many rows down to one value. GROUP BY does it once per group.",
        steps: [
          {
            id: "db-1-cat-5-step-1",
            title: "Count rows",
            text: "COUNT(*) counts rows. COUNT(column) counts only the rows where that column is not NULL.",
            code: `SELECT COUNT(*) AS all_students FROM students;
  SELECT COUNT(program) AS with_program FROM students;`,
            important:
              "The two queries give different numbers, because Jonas has no program.",
          },
          {
            id: "db-1-cat-5-step-2",
            title: "SUM, AVG, MIN and MAX",
            text: "The other aggregate functions work on numeric columns and ignore NULL.",
            code: `SELECT SUM(credits) AS total,
        AVG(credits) AS average,
        MIN(credits) AS smallest,
        MAX(credits) AS largest
  FROM courses;`,
          },
          {
            id: "db-1-cat-5-step-3",
            title: "Count per group",
            text: "GROUP BY splits the rows into groups and runs the aggregate once for each. NULL values form their own group.",
            code: `SELECT program, COUNT(*) AS students
  FROM students
  GROUP BY program;`,
          },
          {
            id: "db-1-cat-5-step-4",
            title: "HAVING vs WHERE",
            text: "WHERE filters rows before they are grouped. HAVING filters the groups after the aggregate is calculated. This is why you cannot use COUNT(*) in a WHERE clause.",
            code: `SELECT program, COUNT(*) AS students
  FROM students
  WHERE program IS NOT NULL
  GROUP BY program
  HAVING COUNT(*) >= 2;`,
            important:
              "Order of evaluation: FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT.",
          },
          {
            id: "db-1-cat-5-step-5",
            title: "Built-in functions",
            text: "MySQL has many functions for text, dates and numbers. You can use them in SELECT and in WHERE.",
            code: `SELECT UPPER(name)                    AS shout,
        CONCAT(name, ' <', email, '>') AS contact,
        YEAR(enrolled_at)              AS year_enrolled
  FROM students;
  
  SELECT ROUND(AVG(credits), 1) AS avg_credits,
        CURDATE()              AS today
  FROM courses;`,
          },
        ],
        questions: [
          {
            id: "db-1-cat-5-q-1",
            question: "Which function counts the number of rows?",
            answertype: "text",
            answer: "COUNT",
          },
          {
            id: "db-1-cat-5-q-2",
            question: "Which clause filters groups after aggregation?",
            answertype: "multiple",
            alternatives: ["HAVING", "WHERE", "LIMIT", "DISTINCT"],
            answer: "HAVING",
          },
          {
            id: "db-1-cat-5-q-3",
            question: "What does COUNT(program) do with NULL values?",
            answertype: "multiple",
            alternatives: [
              "Ignores them",
              "Counts them as 0",
              "Counts them as 1",
              "Gives an error",
            ],
            answer: "Ignores them",
          },
        ],
      },
        // ───────────────────────── 6. Relationships and joins ─────────────────────────
      {
        id: "db-1-cat-6",
        title: "Relationships and Joins",
        info: "Real data is split across tables. Foreign keys link the tables and keep the data consistent, and joins combine them again when you query.",
        steps: [
          {
            id: "db-1-cat-6-step-1",
            title: "Why split data up?",
            text: "If every row repeated the lecturer's name and office, changing an office would mean editing many rows, and missing one would leave conflicting data. Storing each fact once and pointing to it by id is called normalization. In short: 1NF means every cell holds a single value, 2NF means every column depends on the whole key, and 3NF means columns depend on the key and nothing else.",
          },
          {
            id: "db-1-cat-6-step-2",
            title: "One-to-many",
            text: "One lecturer teaches many courses, but each course has exactly one lecturer. The 'many' side (courses) stores the id of the 'one' side (lecturers). Create the lecturers table and add a foreign key to courses.",
            code: `CREATE TABLE lecturers (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    name   VARCHAR(100) NOT NULL,
    office VARCHAR(20)
  );
  
  ALTER TABLE courses
    ADD COLUMN lecturer_id INT,
    ADD FOREIGN KEY (lecturer_id) REFERENCES lecturers(id);`,
            important:
              "Both columns must have the same type, and both tables must use the InnoDB engine (the default).",
          },
          {
            id: "db-1-cat-6-step-3",
            title: "Add data to the relation",
            text: "Insert two lecturers and connect the courses to them.",
            code: `INSERT INTO lecturers (name, office) VALUES
    ('Ingrid Solberg', 'B-204'),
    ('Henrik Moe',     'A-110');
  
  UPDATE courses SET lecturer_id = 1 WHERE code IN ('DB101', 'PR101');
  UPDATE courses SET lecturer_id = 2 WHERE code = 'MA101';`,
          },
          {
            id: "db-1-cat-6-step-4",
            title: "See it being enforced",
            text: "Try to point a course at a lecturer that does not exist. You get error 1452 and the database refuses to create the broken link. This is called referential integrity.",
            code: `UPDATE courses SET lecturer_id = 99 WHERE code = 'MA101';
  -- ERROR 1452: Cannot add or update a child row: a foreign key constraint fails`,
          },
          {
            id: "db-1-cat-6-step-5",
            title: "Decide what happens on delete",
            text: "By default (RESTRICT) MySQL refuses to delete a lecturer that still has courses and gives error 1451. ON DELETE CASCADE deletes the child rows along with the parent. ON DELETE SET NULL keeps them but clears the link (the column must allow NULL).",
            code: `FOREIGN KEY (lecturer_id) REFERENCES lecturers(id)
    ON DELETE SET NULL`,
            important:
              "CASCADE is convenient but can delete far more than you expect. Use it deliberately.",
          },
          {
            id: "db-1-cat-6-step-6",
            title: "Many-to-many",
            text: "A student can take many courses and a course can have many students. This needs a junction table in between that holds one row per enrolment and points to both sides. Any fact about the link itself, such as the grade, lives here.",
            code: `CREATE TABLE enrolments (
    student_id INT NOT NULL,
    course_id  INT NOT NULL,
    grade      CHAR(1),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id)  REFERENCES courses(id)
  );`,
            important:
              "The primary key is made of both columns (a composite key), so a student cannot be enrolled in the same course twice.",
          },
          {
            id: "db-1-cat-6-step-7",
            title: "Enrol some students",
            text: "Add a few enrolments. The ids below assume you followed the earlier chapters, so check with SELECT * FROM students and SELECT * FROM courses first.",
            code: `INSERT INTO enrolments (student_id, course_id, grade) VALUES
    (1, 1, 'A'),
    (1, 2, 'B'),
    (2, 1, 'B'),
    (3, 3, NULL);`,
          },
          {
            id: "db-1-cat-6-step-8",
            title: "INNER JOIN",
            text: "A join combines rows from two tables where the ON condition is true. INNER JOIN returns only the rows that have a match on both sides.",
            code: `SELECT c.code, c.title, l.name AS lecturer
  FROM courses c
  INNER JOIN lecturers l ON l.id = c.lecturer_id;`,
          },
          {
            id: "db-1-cat-6-step-9",
            title: "LEFT JOIN",
            text: "Keeps every row from the left table, even if there is no match. The missing columns are NULL. Add a WHERE on the right table's key to find rows with no match at all.",
            code: `-- all students, with their enrolments if any
  SELECT s.name, e.course_id
  FROM students s
  LEFT JOIN enrolments e ON e.student_id = s.id;
  
  -- only students who are not enrolled in anything
  SELECT s.name
  FROM students s
  LEFT JOIN enrolments e ON e.student_id = s.id
  WHERE e.course_id IS NULL;`,
          },
          {
            id: "db-1-cat-6-step-10",
            title: "Join three tables",
            text: "Chain joins to follow the relations all the way from student to course.",
            code: `SELECT s.name, c.title, e.grade
  FROM enrolments e
  JOIN students s ON s.id = e.student_id
  JOIN courses c  ON c.id = e.course_id;`,
          },
          {
            id: "db-1-cat-6-step-11",
            title: "Combine with GROUP BY",
            text: "Count how many students are in each course. COUNT(e.student_id) is used instead of COUNT(*) so a course with no students shows 0.",
            code: `SELECT c.title, COUNT(e.student_id) AS students
  FROM courses c
  LEFT JOIN enrolments e ON e.course_id = c.id
  GROUP BY c.id, c.title
  ORDER BY students DESC;`,
          },
        ],
        questions: [
          {
            id: "db-1-cat-6-q-1",
            question: "What does a foreign key do?",
            answertype: "multiple",
            alternatives: [
              "Links a column to the primary key of another table and enforces it",
              "Encrypts the column",
              "Makes the column faster to search",
              "Copies the data into another table",
            ],
            answer:
              "Links a column to the primary key of another table and enforces it",
          },
          {
            id: "db-1-cat-6-q-2",
            question:
              "In a one-to-many relation, which table stores the foreign key?",
            answertype: "multiple",
            alternatives: ["The 'many' side", "The 'one' side", "Both", "Neither"],
            answer: "The 'many' side",
          },
          {
            id: "db-1-cat-6-q-3",
            question: "What do you need to model a many-to-many relation?",
            answertype: "multiple",
            alternatives: [
              "A junction table",
              "A bigger primary key",
              "A VARCHAR column with comma-separated ids",
              "A view",
            ],
            answer: "A junction table",
          },
          {
            id: "db-1-cat-6-q-4",
            question:
              "Which join keeps all rows from the left table even when there is no match?",
            answertype: "multiple",
            alternatives: ["LEFT JOIN", "INNER JOIN", "CROSS JOIN", "SELF JOIN"],
            answer: "LEFT JOIN",
          },
          {
            id: "db-1-cat-6-q-5",
            question: "What value do unmatched columns get in a LEFT JOIN?",
            answertype: "text",
            answer: "NULL",
          },
        ],
      },
  
        // ───────────────────────── 7. Intermediate queries ─────────────────────────
      {
        id: "db-1-cat-7",
        title: "Intermediate Queries",
        info: "Subqueries, views, indexes and transactions: tools for writing cleaner, faster and safer queries.",
        steps: [
          {
            id: "db-1-cat-7-step-1",
            title: "Subqueries",
            text: "A subquery is a SELECT inside another query. The inner query runs first and its result is used by the outer one. Find the students enrolled in DB101.",
            code: `SELECT name
  FROM students
  WHERE id IN (
    SELECT student_id
    FROM enrolments
    WHERE course_id = 1
  );`,
          },
          {
            id: "db-1-cat-7-step-2",
            title: "EXISTS and correlated subqueries",
            text: "A correlated subquery refers to the outer query, so it is checked once per outer row. EXISTS is true when the subquery returns at least one row. This finds students with at least one enrolment.",
            code: `SELECT s.name
  FROM students s
  WHERE EXISTS (
    SELECT 1
    FROM enrolments e
    WHERE e.student_id = s.id
  );`,
          },
          {
            id: "db-1-cat-7-step-3",
            title: "Views",
            text: "A view is a saved query that you can use like a table. It stores no data of its own, it runs the query each time. Use it to hide complicated joins.",
            code: `CREATE VIEW student_courses AS
  SELECT s.name AS student, c.title AS course, e.grade
  FROM enrolments e
  JOIN students s ON s.id = e.student_id
  JOIN courses c  ON c.id = e.course_id;
  
  SELECT * FROM student_courses WHERE grade = 'A';`,
          },
          {
            id: "db-1-cat-7-step-4",
            title: "What is an index?",
            text: "An index works like the index of a book: instead of reading every row (a full table scan), the database jumps straight to the matching ones. Primary keys, UNIQUE columns and foreign keys are indexed automatically. Indexes are usually stored as B-trees.",
            code: `CREATE INDEX idx_students_program ON students (program);`,
            important:
              "Indexes speed up reads but slow down writes and use disk space. Add them where you actually filter or join.",
          },
          {
            id: "db-1-cat-7-step-5",
            title: "Check with EXPLAIN",
            text: "Put EXPLAIN in front of a query. Look at the 'key' column to see which index was used. NULL means no index, so a full table scan.",
            code: `EXPLAIN SELECT * FROM students WHERE program = 'Computer Science';`,
          },
          {
            id: "db-1-cat-7-step-6",
            title: "Transactions",
            text: "A transaction groups several statements into one unit of work. Nothing is permanent until COMMIT, and ROLLBACK undoes everything since START TRANSACTION. Try changing a grade and then undoing it.",
            code: `START TRANSACTION;
  
  UPDATE enrolments SET grade = 'A'
  WHERE student_id = 2 AND course_id = 1;
  
  SELECT * FROM enrolments;
  
  ROLLBACK;   -- use COMMIT; to keep the change`,
          },
          {
            id: "db-1-cat-7-step-7",
            title: "ACID",
            text: "Transactions give you four guarantees. Atomicity: all statements succeed or none do. Consistency: the data always satisfies the rules (keys, constraints). Isolation: concurrent transactions do not see each other's half-finished work. Durability: once committed, the data survives a crash.",
            important:
              "Transactions need the InnoDB engine (the default). Statements like CREATE TABLE and DROP TABLE commit automatically and cannot be rolled back.",
          },
        ],
        questions: [
          {
            id: "db-1-cat-7-q-1",
            question: "What is a subquery?",
            answertype: "multiple",
            alternatives: [
              "A SELECT inside another query",
              "A query that runs in the background",
              "A copy of a table",
              "A query without a WHERE",
            ],
            answer: "A SELECT inside another query",
          },
          {
            id: "db-1-cat-7-q-2",
            question: "Which keyword shows the query plan?",
            answertype: "text",
            answer: "EXPLAIN",
          },
          {
            id: "db-1-cat-7-q-3",
            question: "Which command undoes a transaction?",
            answertype: "text",
            answer: "ROLLBACK",
          },
          {
            id: "db-1-cat-7-q-4",
            question: "What does the A in ACID stand for?",
            answertype: "multiple",
            alternatives: ["Atomicity", "Availability", "Authentication", "Aggregation"],
            answer: "Atomicity",
          },
        ],
      },
  
        // ───────────────────────── 8. Security and safety ─────────────────────────
      {
        id: "db-1-cat-8",
        title: "Security and Safety",
        info: "Give each user only the access they need, protect your queries against SQL injection and keep backups.",
        steps: [
          {
            id: "db-1-cat-8-step-1",
            title: "Do not use root in applications",
            text: "root can do anything, including dropping every database. If an application uses root and gets compromised, the attacker gets everything. Create a separate user for each application with only the privileges it needs. This is called the principle of least privilege.",
          },
          {
            id: "db-1-cat-8-step-2",
            title: "Create a user",
            text: "Create a user that can only connect from the same machine.",
            code: `CREATE USER 'app_user'@'localhost'
  IDENTIFIED BY 'choose-a-strong-password';`,
          },
          {
            id: "db-1-cat-8-step-3",
            title: "Grant privileges",
            text: "Give the user access to the university database only, and only for the four CRUD operations. Then check what it can do.",
            code: `GRANT SELECT, INSERT, UPDATE, DELETE
  ON university.*
  TO 'app_user'@'localhost';
  
  SHOW GRANTS FOR 'app_user'@'localhost';`,
          },
          {
            id: "db-1-cat-8-step-4",
            title: "Revoke and remove",
            text: "Take privileges away with REVOKE and delete a user with DROP USER.",
            code: `REVOKE DELETE ON university.* FROM 'app_user'@'localhost';
  DROP USER 'app_user'@'localhost';`,
            important:
              "Do not run DROP USER yet if you want to use app_user in the next chapter.",
          },
          {
            id: "db-1-cat-8-step-5",
            title: "SQL injection",
            text: "SQL injection happens when an application glues user input into a query as text. If someone types ' OR '1'='1 as their email, the query below returns every student, because the condition is always true. Attackers can use the same trick to read or destroy data.",
            code: `-- what the database receives when the input is glued in
  SELECT * FROM students WHERE email = '' OR '1'='1';`,
            important:
              "Never build SQL by concatenating user input into a string. Use prepared statements.",
          },
          {
            id: "db-1-cat-8-step-6",
            title: "Prepared statements",
            text: "A prepared statement sends the query and the values separately. The ? is a placeholder, and the value is always treated as data, never as SQL. Your programming language's MySQL driver does this for you (see chapter 9).",
            code: `PREPARE find_student FROM
    'SELECT * FROM students WHERE email = ?';
  
  SET @email = 'ola@example.com';
  EXECUTE find_student USING @email;
  
  DEALLOCATE PREPARE find_student;`,
          },
          {
            id: "db-1-cat-8-step-7",
            title: "Backups",
            text: "mysqldump exports a database as a text file of SQL statements. Run it in your normal terminal, not inside the mysql client. To restore, feed the file back into mysql.",
            code: `mysqldump -u root -p --databases university > university_backup.sql
  
  mysql -u root -p < university_backup.sql`,
            important:
              "A backup you have never restored is not a backup. Test it, and keep a copy somewhere other than the same computer.",
          },
        ],
        questions: [
          {
            id: "db-1-cat-8-q-1",
            question:
              "Why should an application not connect to MySQL as root?",
            answertype: "multiple",
            alternatives: [
              "root has too many privileges, so a breach does far more damage",
              "root is slower than other users",
              "root cannot read data",
              "root cannot use SELECT",
            ],
            answer:
              "root has too many privileges, so a breach does far more damage",
          },
          {
            id: "db-1-cat-8-q-2",
            question: "Which statement gives a user privileges?",
            answertype: "text",
            answer: "GRANT",
          },
          {
            id: "db-1-cat-8-q-3",
            question: "What is the best protection against SQL injection?",
            answertype: "multiple",
            alternatives: [
              "Prepared statements",
              "Longer passwords",
              "Using uppercase SQL",
              "Adding more indexes",
            ],
            answer: "Prepared statements",
          },
          {
            id: "db-1-cat-8-q-4",
            question: "Which tool exports a database to a .sql file?",
            answertype: "text",
            answer: "mysqldump",
          },
        ],
      },
 
        // ───────────────────────── 9. Using MySQL in a real application ─────────────────────────
      {
        id: "db-1-cat-9",
        title: "Using MySQL in a Real Application",
        info: "Connect to MySQL from Node.js: keep credentials out of your code, use parameterized queries and handle errors.",
        steps: [
          {
            id: "db-1-cat-9-step-1",
            title: "How an application talks to MySQL",
            text: "Your program does not type into the mysql client. It uses a driver (a library) that opens a connection to the server, sends SQL, and turns the result rows into objects in your language. In Node.js, a popular driver is mysql2.",
          },
          {
            id: "db-1-cat-9-step-2",
            title: "Install the driver",
            text: "In your project folder, install mysql2.",
            code: `npm install mysql2`,
          },
          {
            id: "db-1-cat-9-step-3",
            title: "Keep credentials in environment variables",
            text: "Never write passwords directly in your source code. Put them in a .env file (Next.js uses .env.local) and read them with process.env.",
            code: `DB_HOST=localhost
  DB_USER=app_user
  DB_PASSWORD=choose-a-strong-password
  DB_NAME=university`,
            important:
              "Add .env to .gitignore so the password never ends up in Git.",
          },
          {
            id: "db-1-cat-9-step-4",
            title: "Connect and run a query",
            text: "Create a connection pool, which reuses connections instead of opening a new one for every query, and run a SELECT. The ? is a placeholder for the value.",
            code: `import mysql from "mysql2/promise";
  
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
  console.log(rows);`,
          },
          {
            id: "db-1-cat-9-step-5",
            title: "Insert data safely",
            text: "Pass values in the array, never inside the query string. The driver sends them separately, which prevents SQL injection.",
            code: `await pool.execute(
    "INSERT INTO students (name, email, program) VALUES (?, ?, ?)",
    [name, email, program]
  );`,
            important:
              "Do not write \"... VALUES ('\" + name + \"')\". That is exactly what SQL injection needs.",
          },
          {
            id: "db-1-cat-9-step-6",
            title: "Handle errors",
            text: "Queries can fail: the server may be down, or a constraint may be violated. Wrap them in try/catch and check the error code. Inserting an email that already exists gives ER_DUP_ENTRY.",
            code: `try {
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
  }`,
          },
        ],
        questions: [
          {
            id: "db-1-cat-9-q-1",
            question:
              "Which character is used as a placeholder in a parameterized query?",
            answertype: "text",
            answer: "?",
          },
          {
            id: "db-1-cat-9-q-2",
            question: "Why should database passwords be kept in a .env file?",
            answertype: "multiple",
            alternatives: [
              "So they are not hard-coded in the source code or committed to Git",
              "So queries run faster",
              "Because MySQL requires it",
              "So they are encrypted automatically",
            ],
            answer:
              "So they are not hard-coded in the source code or committed to Git",
          },
          {
            id: "db-1-cat-9-q-3",
            question: "What does a connection pool do?",
            answertype: "multiple",
            alternatives: [
              "Reuses open connections instead of opening a new one each time",
              "Backs up the database",
              "Encrypts the queries",
              "Creates indexes",
            ],
            answer:
              "Reuses open connections instead of opening a new one each time",
          },
        ],
      },
 
       // ───────────────────────── 10. Next steps ─────────────────────────
      {
        id: "db-1-cat-10",
        title: "Next Steps",
        info: "You now know the core of relational databases. Here is what to explore next.",
        steps: [
          {
            id: "db-1-cat-10-step-1",
            title: "Stored procedures",
            text: "A stored procedure is a named block of SQL saved in the database that you run with CALL. DELIMITER temporarily changes the statement terminator, so the semicolons inside the procedure do not end the CREATE statement early.",
            code: `DELIMITER //
  CREATE PROCEDURE courses_for_student(IN sid INT)
  BEGIN
    SELECT c.code, c.title, e.grade
    FROM enrolments e
    JOIN courses c ON c.id = e.course_id
    WHERE e.student_id = sid;
  END //
  DELIMITER ;
  
  CALL courses_for_student(1);`,
          },
          {
            id: "db-1-cat-10-step-2",
            title: "Triggers",
            text: "A trigger is SQL that MySQL runs automatically when a row is inserted, updated or deleted. They are handy for audit logs and validation, but they run invisibly, so use them sparingly and document them.",
          },
          {
            id: "db-1-cat-10-step-3",
            title: "MySQL, MariaDB, PostgreSQL and SQLite",
            text: "MariaDB started as a fork of MySQL and is mostly compatible with it. PostgreSQL is another open-source RDBMS with richer features and stricter standards compliance. SQLite stores the whole database in one file with no server, which is why it is used in phones and small apps. The SQL you learned here carries over with small differences.",
          },
          {
            id: "db-1-cat-10-step-4",
            title: "Practice ideas",
            text: "The best way to learn is by building. Try a library database with authors, books and loans, or a webshop with customers, orders and products. Draw the tables on paper first, decide the keys, then write the CREATE TABLE statements.",
          },
          {
            id: "db-1-cat-10-step-5",
            title: "Keep learning",
            text: "The <a href='https://dev.mysql.com/doc/' target='_blank' rel='noreferrer'>official MySQL documentation</a> is the reference for every statement and function. Good topics to explore next: query optimization, replication, window functions and NoSQL databases.",
          },
        ],
        questions: [
          {
            id: "db-1-cat-10-q-1",
            question: "Which keyword runs a stored procedure?",
            answertype: "text",
            answer: "CALL",
          },
          {
            id: "db-1-cat-10-q-2",
            question: "Which database stores everything in a single file without a server?",
            answertype: "multiple",
            alternatives: ["SQLite", "MySQL", "PostgreSQL", "MariaDB"],
            answer: "SQLite",
          },
        ],
      },   
      ],
  },
  {
    id: "mariadb",
    title: "MariaDB",
    info: [
      "MariaDB is a free, open-source relational database that started as a community fork of MySQL and stays largely compatible with it.",
      "Data is stored in tables of rows and columns, and you work with it using SQL. It powers everything from small websites to large production systems.",
    ],
    logo: "/mariadb.png",
    categories: [
      // ───────────────────────── 1. Getting started ─────────────────────────
      {
        id: "mariadb-getting-started",
        title: "Getting started",
        info: "Install MariaDB, open a terminal and connect to your server for the first time.",
        steps: [
          {
            id: "download",
            title: "Downloading MariaDB",
            text: "Head over to the <a href='https://mariadb.com/downloads/' target='_blank' rel='noreferrer' '>MariaDB downloads page</a> and pick the latest stable (GA) release for your operating system.",
          },
          {
            id: "install",
            title: "Installing MariaDB",
            text: "Open the installer you downloaded and walk through the steps. On Windows you will be asked to set a password for the root user.",
            important:
              "Store the root password in a password manager. You cannot read it back later, only reset it.",
          },
          {
            id: "open-terminal",
            title: "Open a terminal",
            text: "To talk to the server you need a command line. On Windows open 'Command Prompt' or the 'MariaDB' shortcut from the start menu, on macOS or Linux open Terminal.",
            image: "/images/mariacmd.png",
          },
          {
            id: "connect",
            title: "Connect",
            text: "Connect to the server on localhost, port 3306, as the root user.",
            code: `mariadb -u root -p`,
            important:
              "-u picks the user and -p makes the client ask for the password.",
          },
          {
            id: "login",
            title: "Login",
            text: "Type your password when prompted. When you see the 'MariaDB [(none)]>' prompt you are connected.",
            image: "/images/mariaconnect.png",
          },
          {
            id: "check-version",
            title: "Check that it works",
            text: "Ask the server which version it is running, then leave the client again.",
            code: `SELECT VERSION();
exit`,
            important: "Every SQL statement ends with a semicolon.",
          },
        ],
        questions: [
          {
            id: "gs-connect-q",
            question: "Which command connects as root and asks for a password?",
            answertype: "multiple",
            alternatives: [
              "mariadb -u root -p",
              "mariadb --root --password-none",
              "connect mariadb root",
            ],
            answer: "mariadb -u root -p",
          },
          {
            id: "gs-port-q",
            question: "Which port does MariaDB listen on by default?",
            answertype: "text",
            answer: "3306",
          },
        ],
      },

      // ───────────────────────── 2. First table ─────────────────────────
      {
        id: "first-table",
        title: "Creating your first table",
        info: "Create a database, choose sensible data types and define a table with a primary key.",
        steps: [
          {
            id: "create-db",
            title: "Create a database",
            text: "Create a database for the shop. The utf8mb4 character set stores every character, including emoji and non-English letters.",
            code: `CREATE DATABASE shop CHARACTER SET utf8mb4;`,
          },
          {
            id: "open-db",
            title: "Select it",
            text: "Make it the active database, then list all databases to confirm it exists.",
            code: `USE shop;
SHOW DATABASES;`,
          },
          {
            id: "data-types",
            title: "Pick data types",
            text: "Common types: INT for whole numbers, DECIMAL(10,2) for money, VARCHAR(255) for short text, TEXT for long text, DATE and TIMESTAMP for time, BOOLEAN for true/false.",
            important:
              "Never store money in FLOAT or DOUBLE. Rounding errors will bite you.",
          },
          {
            id: "create-table",
            title: "Create a table",
            text: "Create a customers table, then inspect it. DESCRIBE lists every column with its type and constraints.",
            code: `CREATE TABLE customers (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  email      VARCHAR(255) NOT NULL UNIQUE,
  country    CHAR(2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
SHOW TABLES;
DESCRIBE customers;`,
            image: "/images/mariatablecreated.png",
          },
          {
            id: "constraints",
            title: "What the constraints do",
            text: "PRIMARY KEY identifies each row uniquely. NOT NULL forbids empty values. UNIQUE stops two rows from sharing the same value. DEFAULT fills in a value when you leave it out.",
          },
        ],
        questions: [
          {
            id: "ft-type-q",
            question: "Which data type is best for a price like 19.99?",
            answertype: "multiple",
            alternatives: ["DECIMAL(10,2)", "FLOAT", "VARCHAR(10)", "TEXT"],
            answer: "DECIMAL(10,2)",
          },
          {
            id: "ft-autoinc-q",
            question:
              "Which keyword makes MariaDB generate the next id automatically?",
            answertype: "text",
            answer: "AUTO_INCREMENT",
          },
          {
            id: "ft-unique-q",
            question:
              "Which constraint stops two customers from having the same email?",
            answertype: "multiple",
            alternatives: ["UNIQUE", "DEFAULT", "CHECK", "INDEX"],
            answer: "UNIQUE",
          },
        ],
      },

      // ───────────────────────── 3. Manipulating data ─────────────────────────
      {
        id: "data",
        title: "Manipulating data",
        info: "Create, read, update and delete rows. Together these are known as CRUD.",
        steps: [
          {
            id: "insert-data",
            title: "Insert data",
            text: "Add a single row to the table.",
            code: `INSERT INTO customers (name, email, country)
VALUES ('Ola Nordmann', 'ola@example.com', 'NO');`,
          },
          {
            id: "insert-many",
            title: "Insert several rows",
            text: "You can add many rows in one statement by separating the value lists with commas.",
            code: `INSERT INTO customers (name, email, country) VALUES
  ('Kari Hansen', 'kari@example.com', 'NO'),
  ('Anna Berg',   'anna@example.com', 'SE');`,
          },
          {
            id: "read-data",
            title: "Read data",
            text: "Select everything you have inserted so far.",
            code: `SELECT * FROM customers;`,
            important:
              "In real applications list the columns you need instead of using *.",
          },
          {
            id: "change-data",
            title: "Change data",
            text: "Change a row by telling UPDATE which row to touch.",
            code: `UPDATE customers
SET name = 'Ola N. Nordmann'
WHERE id = 1;`,
            important:
              "Always include WHERE and prefer the primary key. Without WHERE, every row is updated.",
          },
          {
            id: "delete-data",
            title: "Delete data",
            text: "Remove a row with DELETE. Check what will match first by running the same WHERE as a SELECT.",
            code: `-- 1. see which row(s) will be affected
SELECT * FROM customers WHERE id = 3;
 
-- 2. then delete them
DELETE FROM customers WHERE id = 3;`,
          },
        ],
        questions: [
          {
            id: "insert-data-q",
            question: "How do you add a row to a table?",
            answertype: "multiple",
            alternatives: [
              "ADD TO customers name = 'Ola'",
              "INSERT INTO customers (name) VALUES ('Ola')",
              "PUT 'Ola' IN customers",
            ],
            answer: "INSERT INTO customers (name) VALUES ('Ola')",
          },
          {
            id: "read-data-q",
            question: "How do you see all the data in a table?",
            answertype: "multiple",
            alternatives: [
              "SELECT * FROM customers",
              "SHOW DATA customers",
              "READ ALL FROM customers",
            ],
            answer: "SELECT * FROM customers",
          },
          {
            id: "change-data-q",
            question: "How do you change the name of the customer with id 1?",
            answertype: "multiple",
            alternatives: [
              "CHANGE customers SET name = 'Hi' WHERE id = 1",
              "UPDATE customers SET name = 'Hi' WHERE id = 1",
              "UPDATE customers name = 'Hi' IF id = 1",
            ],
            answer: "UPDATE customers SET name = 'Hi' WHERE id = 1",
          },
          {
            id: "delete-data-q",
            question:
              "Which clause stops UPDATE and DELETE from affecting every row?",
            answertype: "text",
            answer: "WHERE",
          },
        ],
      },

      // ───────────────────────── 4. Filtering & sorting ─────────────────────────
      {
        id: "filtering-sorting",
        title: "Filtering and sorting",
        info: "Ask more precise questions: filter rows, sort the result and limit how much you get back.",
        steps: [
          {
            id: "where",
            title: "Filter with WHERE",
            text: "Only return the rows that match a condition.",
            code: `SELECT name, email
FROM customers
WHERE country = 'NO';`,
          },
          {
            id: "and-or",
            title: "Combine conditions",
            text: "Use AND, OR and parentheses to combine several conditions.",
            code: `SELECT *
FROM customers
WHERE country = 'NO'
  AND created_at >= '2026-01-01';`,
          },
          {
            id: "like",
            title: "Search text with LIKE",
            text: "The % sign matches any number of characters.",
            code: `SELECT *
FROM customers
WHERE email LIKE '%@example.com';`,
          },
          {
            id: "order-limit",
            title: "Sort and limit",
            text: "This returns the ten newest customers.",
            code: `SELECT *
FROM customers
ORDER BY created_at DESC
LIMIT 10;`,
            important: "Without ORDER BY the row order is not guaranteed.",
          },
          {
            id: "aggregate",
            title: "Count and group",
            text: "Count how many customers there are in each country.",
            code: `SELECT country, COUNT(*) AS customers
FROM customers
GROUP BY country;`,
          },
        ],
        questions: [
          {
            id: "fs-sort-q",
            question: "How do you sort the newest rows first?",
            answertype: "multiple",
            alternatives: [
              "ORDER BY created_at DESC",
              "ORDER BY created_at ASC",
              "SORT created_at NEWEST",
            ],
            answer: "ORDER BY created_at DESC",
          },
          {
            id: "fs-limit-q",
            question: "Which keyword restricts the number of rows returned?",
            answertype: "text",
            answer: "LIMIT",
          },
          {
            id: "fs-group-q",
            question: "Which clause lets you count rows per country?",
            answertype: "multiple",
            alternatives: ["GROUP BY", "ORDER BY", "HAVING ONLY", "COUNT BY"],
            answer: "GROUP BY",
          },
        ],
      },

      // ───────────────────────── 5. Relations ─────────────────────────
      {
        id: "relations",
        title: "Relations and foreign keys",
        info: "Real data is split across tables. A foreign key links a row in one table to a row in another and keeps the data consistent.",
        steps: [
          {
            id: "why-relations",
            title: "Why split data up?",
            text: "A customer can place many orders. Instead of repeating the customer's name and email on every order, store the customer once and point to it by id. This is called normalization and it avoids duplicated and conflicting data.",
          },
          {
            id: "one-to-many",
            title: "One-to-many",
            text: "One customer has many orders, but each order belongs to exactly one customer. The 'many' side (orders) stores the id of the 'one' side (customers) in a column called customer_id.",
          },
          {
            id: "create-fk",
            title: "Create a foreign key",
            text: "Create the orders table. The FOREIGN KEY line tells MariaDB that customer_id must match an existing row in customers.",
            code: `CREATE TABLE orders (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  total       DECIMAL(10,2) NOT NULL,
  ordered_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);`,
            important:
              "Both columns must have the same type, and both tables must use the InnoDB engine (the default).",
          },
          {
            id: "fk-enforced",
            title: "See it being enforced",
            text: "Try to create an order for a customer that does not exist. You get error 1452 and the database refuses to create an orphaned order.",
            code: `INSERT INTO orders (customer_id, total)
VALUES (999, 49.90);
-- ERROR 1452: Cannot add or update a child row: a foreign key constraint fails`,
          },
          {
            id: "referential-actions",
            title: "Decide what happens on delete",
            text: "ON DELETE CASCADE deletes a customer's orders along with the customer. ON DELETE SET NULL keeps the orders but clears the link (the column must allow NULL). The default, RESTRICT, blocks the delete.",
            code: `FOREIGN KEY (customer_id) REFERENCES customers(id)
  ON DELETE CASCADE`,
            important:
              "CASCADE is convenient but can delete far more than you expect. Use it deliberately.",
          },
          {
            id: "one-to-one",
            title: "One-to-one",
            text: "Sometimes a table is split in two, for example customers and customer_profiles. Make the foreign key column UNIQUE so each customer can have at most one profile.",
            code: `CREATE TABLE customer_profiles (
  customer_id INT PRIMARY KEY,
  bio         TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);`,
          },
        ],
        questions: [
          {
            id: "rel-fk-q",
            question: "What does a foreign key do?",
            answertype: "multiple",
            alternatives: [
              "Links a column to the primary key of another table and enforces it",
              "Encrypts the column",
              "Makes the column faster to search",
              "Copies the data into another table",
            ],
            answer:
              "Links a column to the primary key of another table and enforces it",
          },
          {
            id: "rel-many-q",
            question:
              "In a one-to-many relation, which table stores the foreign key?",
            answertype: "multiple",
            alternatives: [
              "The 'many' side",
              "The 'one' side",
              "Both",
              "Neither",
            ],
            answer: "The 'many' side",
          },
          {
            id: "rel-cascade-q",
            question:
              "Which option deletes a customer's orders automatically when the customer is deleted?",
            answertype: "text",
            answer: "ON DELETE CASCADE",
          },
        ],
      },

      // ───────────────────────── 6. Many-to-many ─────────────────────────
      {
        id: "many-to-many",
        title: "Many-to-many relations",
        info: "An order can contain many products and a product can appear in many orders. This needs a junction table in between.",
        steps: [
          {
            id: "products-table",
            title: "Create products",
            text: "First create a table for the things that can be ordered.",
            code: `CREATE TABLE products (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  name  VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);`,
          },
          {
            id: "junction",
            title: "Create the junction table",
            text: "The junction table holds one row per product in an order and points to both sides.",
            code: `CREATE TABLE order_items (
  order_id   INT NOT NULL,
  product_id INT NOT NULL,
  quantity   INT NOT NULL DEFAULT 1,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id)   REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id)
);`,
            important:
              "The primary key is made of both columns (a composite key), so the same product cannot be added to the same order twice.",
          },
          {
            id: "fill-junction",
            title: "Add data",
            text: "Insert a few products and an order, then link them in the junction table.",
            code: `INSERT INTO products (name, price) VALUES
  ('Coffee beans 500g', 89.00),
  ('Ceramic mug',       129.00);
 
INSERT INTO orders (customer_id, total) VALUES (1, 307.00);
 
INSERT INTO order_items (order_id, product_id, quantity) VALUES
  (1, 1, 2),
  (1, 2, 1);`,
          },
          {
            id: "extra-columns",
            title: "Store data about the relation",
            text: "The junction table is the right place for facts about the link itself, such as quantity. Prices are often copied here too (unit_price) so old orders keep their price if the product price changes later.",
          },
        ],
        questions: [
          {
            id: "m2m-q1",
            question: "What do you need to model a many-to-many relation?",
            answertype: "multiple",
            alternatives: [
              "A junction table",
              "A bigger primary key",
              "A VARCHAR column with comma-separated ids",
              "A view",
            ],
            answer: "A junction table",
          },
          {
            id: "m2m-q2",
            question: "What is a primary key made from two columns called?",
            answertype: "text",
            answer: "Composite key",
          },
        ],
      },

      // ───────────────────────── 7. Joins ─────────────────────────
      {
        id: "joins",
        title: "Joining tables",
        info: "Joins combine rows from several tables into one result using the relations you defined.",
        steps: [
          {
            id: "inner-join",
            title: "INNER JOIN",
            text: "Returns only customers that have at least one order.",
            code: `SELECT c.name, o.id AS order_id, o.total
FROM customers c
INNER JOIN orders o ON o.customer_id = c.id;`,
          },
          {
            id: "left-join",
            title: "LEFT JOIN",
            text: "Keeps every customer, even those without orders. The missing order columns are NULL. Add a WHERE on the right table's id to find customers that have never ordered.",
            code: `-- all customers, with their orders if any
SELECT c.name, o.id AS order_id
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id;
 
-- only customers with no orders
SELECT c.name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
WHERE o.id IS NULL;`,
          },
          {
            id: "multi-join",
            title: "Join three tables",
            text: "Chain joins to follow the relations all the way from customer to product.",
            code: `SELECT c.name, p.name AS product, oi.quantity
FROM customers c
JOIN orders o       ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id   = o.id
JOIN products p     ON p.id          = oi.product_id;`,
          },
          {
            id: "aggregate-join",
            title: "Combine with GROUP BY",
            text: "Show how much each customer has spent, best customers first.",
            code: `SELECT c.name, SUM(o.total) AS spent
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY spent DESC;`,
          },
        ],
        questions: [
          {
            id: "join-left-q",
            question:
              "Which join keeps all rows from the left table even when there is no match?",
            answertype: "multiple",
            alternatives: [
              "LEFT JOIN",
              "INNER JOIN",
              "CROSS JOIN",
              "SELF JOIN",
            ],
            answer: "LEFT JOIN",
          },
          {
            id: "join-on-q",
            question:
              "Which keyword defines how two tables are matched in a join?",
            answertype: "text",
            answer: "ON",
          },
          {
            id: "join-null-q",
            question: "What value do unmatched columns get in a LEFT JOIN?",
            answertype: "text",
            answer: "NULL",
          },
        ],
      },

      // ───────────────────────── 8. Indexes ─────────────────────────
      {
        id: "indexes",
        title: "Indexes and performance",
        info: "Indexes make lookups fast. EXPLAIN shows whether the database is using them.",
        steps: [
          {
            id: "what-index",
            title: "What is an index?",
            text: "An index works like the index of a book: instead of reading every row, the database jumps straight to the matching ones. Primary keys, UNIQUE columns and foreign keys are indexed automatically.",
          },
          {
            id: "create-index",
            title: "Create an index",
            text: "Add an index on a column you often filter or join on.",
            code: `CREATE INDEX idx_customers_country ON customers (country);`,
            important:
              "Indexes speed up reads but slow down writes and use disk space. Add them where you actually filter or join.",
          },
          {
            id: "explain",
            title: "Check with EXPLAIN",
            text: "Put EXPLAIN in front of a query. Look at the 'key' column to see which index was used. NULL means a full table scan.",
            code: `EXPLAIN SELECT * FROM customers WHERE country = 'NO';`,
          },
          {
            id: "drop-index",
            title: "Remove an index",
            text: "Drop an index you no longer need.",
            code: `DROP INDEX idx_customers_country ON customers;`,
          },
        ],
        questions: [
          {
            id: "idx-q1",
            question: "Which of these speeds up lookups?",
            answertype: "multiple",
            alternatives: ["An index", "A comment", "A trigger", "A view"],
            answer: "An index",
          },
          {
            id: "idx-q2",
            question: "Which keyword shows the query plan?",
            answertype: "text",
            answer: "EXPLAIN",
          },
        ],
      },

      // ───────────────────────── 9. Transactions ─────────────────────────
      {
        id: "transactions",
        title: "Transactions",
        info: "A transaction groups several statements so they either all succeed or none do.",
        steps: [
          {
            id: "why-transactions",
            title: "Why you need them",
            text: "Placing an order means inserting into orders and order_items. If the second insert fails, you do not want a half-finished order left behind.",
          },
          {
            id: "start-commit",
            title: "START TRANSACTION and COMMIT",
            text: "Start a transaction, run your statements, then COMMIT to save everything at once.",
            code: `START TRANSACTION;
 
INSERT INTO orders (customer_id, total) VALUES (2, 89.00);
INSERT INTO order_items (order_id, product_id, quantity)
VALUES (LAST_INSERT_ID(), 1, 1);
 
COMMIT;`,
          },
          {
            id: "rollback",
            title: "ROLLBACK",
            text: "If something goes wrong, ROLLBACK undoes every change since START TRANSACTION.",
            code: `START TRANSACTION;
DELETE FROM orders;   -- oops
ROLLBACK;             -- nothing was deleted`,
            important: "Transactions only work on InnoDB tables.",
          },
          {
            id: "acid",
            title: "ACID",
            text: "InnoDB follows ACID: Atomic (all or nothing), Consistent (rules are respected), Isolated (transactions do not disturb each other) and Durable (committed data survives a crash).",
          },
        ],
        questions: [
          {
            id: "tx-q1",
            question:
              "Which statement undoes all changes since the transaction started?",
            answertype: "text",
            answer: "ROLLBACK",
          },
          {
            id: "tx-q2",
            question: "What does the A in ACID stand for?",
            answertype: "multiple",
            alternatives: [
              "Atomicity",
              "Authentication",
              "Availability",
              "Automation",
            ],
            answer: "Atomicity",
          },
        ],
      },

      // ───────────────────────── 10. Users & security ─────────────────────────
      {
        id: "users-security",
        title: "Users and security",
        info: "Do not run your applications as root. Create a dedicated user with only the permissions it needs.",
        steps: [
          {
            id: "create-user",
            title: "Create a user",
            text: "Create a user that can only connect from the same machine.",
            code: `CREATE USER 'shopapp'@'localhost' IDENTIFIED BY 'a-long-random-password';`,
            important:
              "Never commit passwords to Git. Keep them in environment variables or a secrets manager.",
          },
          {
            id: "grant",
            title: "Grant permissions",
            text: "Give the user only what the application needs, and only on the shop database.",
            code: `GRANT SELECT, INSERT, UPDATE, DELETE ON shop.* TO 'shopapp'@'localhost';`,
          },
          {
            id: "show-grants",
            title: "Review permissions",
            text: "List exactly what the user may do.",
            code: `SHOW GRANTS FOR 'shopapp'@'localhost';`,
          },
          {
            id: "revoke",
            title: "Remove access",
            text: "Take away a single permission, or remove the user entirely.",
            code: `REVOKE DELETE ON shop.* FROM 'shopapp'@'localhost';
 
DROP USER 'shopapp'@'localhost';`,
          },
          {
            id: "injection",
            title: "Beware of SQL injection",
            text: "Never build queries by gluing user input into a string. Use prepared statements (parameterized queries) in your application code.",
            code: `-- bad: user input is part of the SQL text
"SELECT * FROM customers WHERE email = '" + email + "'"
 
-- good: the value is sent separately from the query
"SELECT * FROM customers WHERE email = ?"`,
          },
        ],
        questions: [
          {
            id: "sec-q1",
            question: "Why should an application not connect as root?",
            answertype: "multiple",
            alternatives: [
              "A bug or attack could then do anything to the whole server",
              "Root is slower",
              "Root cannot use SELECT",
            ],
            answer:
              "A bug or attack could then do anything to the whole server",
          },
          {
            id: "sec-q2",
            question:
              "Which statement gives a user permission to read a database?",
            answertype: "text",
            answer: "GRANT",
          },
        ],
      },

      // ───────────────────────── 11. Backup & restore ─────────────────────────
      {
        id: "backup-restore",
        title: "Backup and restore",
        info: "Hardware fails and mistakes happen. Make backups before you need them, and test restoring them.",
        steps: [
          {
            id: "dump",
            title: "Back up with mariadb-dump",
            text: "Run this from a normal terminal, not inside the mariadb client. It writes the whole database to a .sql file.",
            code: `mariadb-dump -u root -p shop > shop-backup.sql`,
            important: "On older versions the tool is called mysqldump.",
          },
          {
            id: "restore",
            title: "Restore a backup",
            text: "Create an empty database, then feed the file back in.",
            code: `mariadb -u root -p -e "CREATE DATABASE shop_restored;"
mariadb -u root -p shop_restored < shop-backup.sql`,
          },
          {
            id: "schedule",
            title: "Automate it",
            text: "Run the dump on a schedule (cron on Linux, Task Scheduler on Windows) and keep copies somewhere other than the same machine.",
            code: `# crontab: every night at 02:30
30 2 * * * mariadb-dump -u backup -p'secret' shop > /backups/shop-$(date +\\%F).sql`,
          },
          {
            id: "test-restore",
            title: "Test your backups",
            text: "A backup you have never restored is only a hope. Try restoring into a test database now and then.",
          },
        ],
        questions: [
          {
            id: "bk-q1",
            question: "Which tool creates a logical backup of a database?",
            answertype: "multiple",
            alternatives: [
              "mariadb-dump",
              "mariadb-clean",
              "mariadb-copy",
              "mariadb-save",
            ],
            answer: "mariadb-dump",
          },
          {
            id: "bk-q2",
            question: "What file format does a dump normally contain?",
            answertype: "text",
            answer: "SQL",
          },
        ],
      },
    ],
  },
];

export default dataBases;
