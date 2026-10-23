import db from "@/lib/db";
import { RowDataPacket } from "mysql2";
import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json(await getDatabases());
}

export async function getDatabases(): Promise<LearnDB.DataBase[]> {
  const [rows] = await db.query<RowDataPacket[]>("select * from courses");
  console.log(rows);
  return rows as Array<LearnDB.DataBase>;
}
