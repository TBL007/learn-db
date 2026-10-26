import mysql from "mysql2/promise";

const db = mysql.createPool({
  host: process.env.DB_HOST ?? "localhost",
  user: process.env.DB_USER ?? "root",
  password: process.env.DB_PASSWORD ?? "",
  database: process.env.DB_NAME ?? "learndb",
  waitForConnections: true,
  connectionLimit: 10,
  maxIdle: 10,
  idleTimeout: 60000,
  queueLimit: 0,
});

export async function initDb(): Promise<void> {
  const statements = [
    `CREATE TABLE IF NOT EXISTS courses (
      id VARCHAR(255) PRIMARY KEY,
      title VARCHAR(255) NOT NULL,
      info JSON NOT NULL,
      logo VARCHAR(512) NOT NULL
    ) ENGINE=InnoDB`,

    `CREATE TABLE IF NOT EXISTS categories (
      id VARCHAR(255) PRIMARY KEY,
      course_id VARCHAR(255) NOT NULL,
      title VARCHAR(255) NOT NULL,
      info TEXT NOT NULL,
      position INT NOT NULL DEFAULT 0,
      FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
      INDEX idx_categories_course (course_id, position)
    ) ENGINE=InnoDB`,

    `CREATE TABLE IF NOT EXISTS steps (
      id VARCHAR(255) PRIMARY KEY,
      category_id VARCHAR(255) NOT NULL,
      title VARCHAR(255) NOT NULL,
      text TEXT NOT NULL,
      image VARCHAR(512) NULL,
      important TEXT NULL,
      code MEDIUMTEXT NULL,
      position INT NOT NULL DEFAULT 0,
      FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
      INDEX idx_steps_category (category_id, position)
    ) ENGINE=InnoDB`,

    `CREATE TABLE IF NOT EXISTS questions (
      id VARCHAR(255) PRIMARY KEY,
      category_id VARCHAR(255) NOT NULL,
      question TEXT NOT NULL,
      answertype ENUM('multiple', 'text') NOT NULL,
      alternatives JSON NULL,
      answer TEXT NOT NULL,
      position INT NOT NULL DEFAULT 0,
      FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
      INDEX idx_questions_category (category_id, position)
    ) ENGINE=InnoDB`,
  ];

  for (const sql of statements) {
    await db.query(sql);
  }
}
export default db;
