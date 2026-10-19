const dataBases: Array<LearnDB.DataBase> = [
  {
    id: "db-1",
    title: "Lorem Database",
    info: [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
    ],
    logo: "/logos/lorem.svg",
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
      "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.",
      "Consectetur, adipisci velit, sed quia non numquam eius modi tempora.",
    ],
    logo: "/logos/ipsum.svg",
    categories: [
      {
        id: "mariadb-getting-started",
        title: "Getting started",
        info: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus.",
        steps: [
          {
            id: "download",
            title: "Downloading MariaDB",
            text: "Head over to the <a href='https://mariadb.com/downloads/' style='color:cyan;'>mariadb download's page</a>",
          },
          {
            id: "install",
            title: "Installing mariaDB",
            text: "Open the installer you downloaded and walk through the steps",
            important:
              "Remember the root password you set. maybe even write it down",
          },
          {
            id: "cmd line",
            title: "Open cmd",
            text: "To establish a connection to mariaDB you first need to open the command line interface",
            image: "/images/mariacmd.png",
          },
          {
            id: "connect",
            title: "Connect",
            text: "Type the command mariadb -p it will establish a connection to localhost:3306 with the root user.",

            important: "-p makes it ask you for the password",
          },
          {
            id: "login",
            title: "Login",
            text: "Type your password when prompted and you now have a connection to your database",
            image: "/images/mariaconnect.png",
          },
        ],
        questions: [
          {
            id: "first-table",
            question: "Creating your first table",
            answertype: "multiple",
            alternatives: ["Ipsum", "Lorem", "Dolor", "Amet"],
            answer: "Ipsum",
          },
          {
            id: "db-2-cat-1-q-2",
            question: "What do you define after identifying entities?",
            answertype: "text",
            answer: "Relationships",
          },
        ],
      },
      {
        id: "first-table",
        title: "Creating your first table",
        info: "This will be covering the basics of creating tables in mariadb",
        steps: [
          {
            id: "create-db",
            title: "Creating you first db schema",
            text: "To create your first databse schema run the command 'create database mydb;'",
          },
          {
            id: "open-db",
            title: "Now enter it",
            text: "Enter your database 'USE mydb'",
            important:
              "you can check if the database has been made by running 'show databases;'",
          },
          {
            id: "create-table",
            title: "Create a table",
            text: "Create a table with columns id and text by running 'create table mytable (id INT AUTO_INCREMENT PRIMARY KEY, text VARCHAR(255) NOT NULL);'",
            important:
              "you can check if the table has been made by running 'show tables;'",
            image: "/images/mariatablecreated.png",
          },
        ],
        questions: [
          {
            id: "db-2-cat-2-q-1",
            question: "Which of these speeds up lookups?",
            answertype: "multiple",
            alternatives: ["An index", "A comment", "A trigger", "A view"],
            answer: "An index",
          },
          {
            id: "db-2-cat-2-q-2",
            question: "What keyword shows a query plan in MySQL?",
            answertype: "text",
            answer: "EXPLAIN",
          },
        ],
      },
      {
        id: "data",
        title: "manipulating-data",
        info: "MariaDB is a sql based service. This will cover the basics of manipulating data with sql",
        steps: [
          {
            id: "insert-data",
            title: "Insert data",
            text: `Insert data into your table by running 'INSERT INTO mytable (text) VALUES ("hello world");'`,
          },
          {
            id: "read-data",
            title: "Read data",
            text: `Run 'select * from mytable' to see the data you have inserted`,
          },
          {
            id: "change-data",
            title: "Changing data",
            text: `if you have data with values you would like to change you run 'UPDATE mytable SET text="Hello cruel world!" WHERE id = 1;'`,
            important:
              "It's recommended to always use to primary key when swapping data as to not accidentaly overwrite data unintended",
          },
        ],
        questions: [
          {
            id: "insert-data-q",
            question: "How do you add data to a table?",
            answertype: "multiple",
            alternatives: [
              "ADD TO mytable text = 'Hello world'",
              "INSERT INTO mytable (text) VALUES ('Hello world')",
              "PUT 'Hello world' IN mytable",
            ],
            answer: "INSERT INTO mytable (text) VALUES ('Hello world')",
          },
          {
            id: "read-data-q",
            question: "How do you see all the data in a table?",
            answertype: "multiple",
            alternatives: [
              "SELECT * FROM mytable",
              "SHOW DATA mytable",
              "READ ALL FROM mytable",
            ],
            answer: "SELECT * FROM mytable",
          },
          {
            id: "change-data-q",
            question: "How do you change the text of the row with id 1?",
            answertype: "multiple",
            alternatives: [
              "CHANGE mytable SET text = 'Hi' WHERE id = 1",
              "UPDATE mytable SET text = 'Hi' WHERE id = 1",
              "UPDATE mytable text = 'Hi' IF id = 1",
            ],
            answer: "UPDATE mytable SET text = 'Hi' WHERE id = 1",
          },
        ],
      },
    ],
  },
];

export default dataBases;
