import dataBases from "@/exampleData";
import Category from "@/app/components/Category";
import { notFound } from "next/navigation";

export function generateStaticParams() {
  return dataBases.flatMap((db) =>
    db.categories.map((cat) => ({ id: db.id, catId: cat.id })),
  );
}

export default async function Page({
  params,
}: {
  params: Promise<{ id: string; catId: string }>;
}) {
  const { id, catId } = await params;
  const category = dataBases
    .find((db) => db.id === id)
    ?.categories.find((cat) => cat.id === catId);
  if (!category) notFound();

  return <Category {...category} dbId={id} />;
}
