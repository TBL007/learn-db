import { getCategories } from "@/lib/getCategories";
import { getDatabases } from "@/lib/getDatabases";
import { NextResponse } from "next/server";

export async function GET() {
  const databases = await getDatabases();

  const response = await Promise.all(
    databases.map(async (db) => {
      const categories = await getCategories(db.id);
      return { ...db, categories };
    }),
  );

  return NextResponse.json(response);
}
