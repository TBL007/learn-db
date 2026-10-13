import dataBases from "@/exampleData";

import Category from "@/app/components/Category";

export default async function Page({
  params,
}: {
  params: Promise<{ id: string; catId: string }>;
}) {
  const { id, catId } = await params;
  const category = dataBases
    .find((db) => db.id === id)
    ?.categories.find((cat) => cat.id === catId);
  if (!category) return <h1>Not found</h1>;

  return <Category {...category} dbId={id} />;
}
