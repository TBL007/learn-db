const dataBases: Array<LearnDB.DataBase> = [
  {
    id: "db-1",
    title: "MySQL",
    info: [
      "MySQL is one of the most widely used open-source relational databases in the world.",
      "Data is stored in tables of rows and columns and queried with SQL, making it a solid starting point for learning databases.",
    ],
    logo: "/mysql.png",
    categories: [
      {
        id: "db-1-cat-1",
        title: "MySQL - Getting Started",
        info: "This guide will teach you the core foundational concepts of databases using MySQL, one of the most widely used relational database management systems in the world.",
        steps: [
          {
            id: "db-1-cat-1-step-1",
            title: "Relational Databases & The Spreadsheet Analogy",
            text: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            image: "/images/lorem-install.png",
            important: "Excepteur sint occaecat cupidatat non proident.",
          },
          {
            id: "db-1-cat-1-step-2",
            title: "Create your first table",
            text: "Sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet.",
          },
          {
            id: "db-1-cat-1-step-3",
            title: "Insert some rows",
            text: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
            image: "/images/lorem-insert.png",
          },
        ],
        questions: [
          {
            id: "db-1-cat-1-q-1",
            question: "Lorem ipsum dolor sit amet, what comes next?",
            answertype: "multiple",
            alternatives: ["Consectetur", "Adipiscing", "Tempor", "Magna"],
            answer: "Consectetur",
          },
          {
            id: "db-1-cat-1-q-2",
            question: "Which step creates the first table?",
            answertype: "text",
            answer: "Create your first table",
          },
        ],
      },
      {
        id: "db-1-cat-2",
        title: "Querying Data",
        info: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit.",
        steps: [
          {
            id: "db-1-cat-2-step-1",
            title: "Select with filters",
            text: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae.",
            important: "At vero eos et accusamus et iusto odio dignissimos.",
          },
          {
            id: "db-1-cat-2-step-2",
            title: "Sorting and limiting",
            text: "Et harum quidem rerum facilis est et expedita distinctio nam libero tempore.",
            image: "/images/lorem-sort.png",
          },
        ],
        questions: [
          {
            id: "db-1-cat-2-q-1",
            question: "Nemo enim ipsam voluptatem quia voluptas sit?",
            answertype: "multiple",
            alternatives: ["Aspernatur", "Aut odit", "Fugit", "Sed quia"],
            answer: "Aspernatur",
          },
          {
            id: "db-1-cat-2-q-2",
            question: "Name the keyword used to limit results.",
            answertype: "text",
            answer: "LIMIT",
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
