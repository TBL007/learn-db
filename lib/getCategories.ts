import db from "@/lib/db";
import { RowDataPacket } from "mysql2";

export async function getCategories(dbId: string): Promise<LearnDB.Category[]> {
  const [rows] = await db.query<RowDataPacket[]>(
    "select * from categories where course_id = ?",
    [dbId],
  );

  return rows as Array<LearnDB.Category>;
}
