import db from "@/lib/db";
import { RowDataPacket } from "mysql2";

export async function getCategory(id: string) {
  const [rows] = await db.query<RowDataPacket[]>(
    "select * from categories where id = ?",
    [id],
  );

  const [steps] = await db.query<RowDataPacket[]>(
    "select * from steps where category_id = ?",
    [id],
  );
  const [questions] = await db.query<RowDataPacket[]>(
    "select * from questions where category_id = ?",
    [id],
  );

  return {
    id: rows[0].id,
    title: rows[0].title,
    info: rows[0].info,
    steps: steps,
    questions: questions,
  } as LearnDB.Category;
}
