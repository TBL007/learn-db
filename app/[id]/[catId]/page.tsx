import Category from "@/app/components/Category";
import { getCategory } from "@/lib/getCategory";

export default async function Page({
  params,
}: {
  params: Promise<{ id: string; catId: string }>;
}) {
  const { id, catId } = await params;
  const category = await getCategory(catId);

  return <Category {...category} dbId={id} />;
}
