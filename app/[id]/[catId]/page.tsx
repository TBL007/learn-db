import dataBases from "@/exampleData";
import Category from "@/app/components/Category";
import { getCategory } from "@/lib/getCategory";

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
  const category = await getCategory(catId);

  return <Category {...category} dbId={id} />;
}
