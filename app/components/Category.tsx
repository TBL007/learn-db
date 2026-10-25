import Step from "./Step";
import Link from "next/link";
import "./component.css";
import Questions from "./Questions";
import { getCategories } from "../../lib/getCategories";

interface CategoryProps extends LearnDB.Category {
  dbId: string;
}

export default async function Category({
  id,
  title,
  info,
  dbId,
  questions,
  steps,
}: CategoryProps) {
  const categories = await getCategories(dbId);

  const pageTitle = title.includes(dbId) ? title : `${dbId} - ${title}`;

  return (
    <div className="category">
      <h1 className="category-title">{pageTitle}</h1>

      <nav className="category-stage" aria-label="Categories">
        {categories.map((category) => (
          <Link
            key={category.id}
            href={`/${dbId}/${category.id}`}
            className={`category-tab ${category.id === id ? "active" : ""}`}
            aria-current={category.id === id ? "page" : undefined}
          >
            {category.title}
          </Link>
        ))}
      </nav>

      <div className="category-content">
        {info && <p className="category-info">{info}</p>}

        <Step steps={steps} />

        <Questions questions={questions} />
      </div>
    </div>
  );
}
