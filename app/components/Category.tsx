import dataBases from "@/exampleData";
import Step from "./Step";
import Link from "next/link";
import "./component.css";
import Questions from "./Questions";

interface CategoryProps extends LearnDB.Category {
  dbId: string;
}

export default function Category({
  id,
  title,
  info,
  dbId,
  questions,
}: CategoryProps) {
  const db = dataBases.find((database) => database.id === dbId);
  if (!db) return null;

  const pageTitle = title.includes(db.title) ? title : `${db.title} - ${title}`;

  return (
    <div className="category">
      <h1 className="category-title">{pageTitle}</h1>

      <nav className="category-stage" aria-label="Categories">
        {db.categories.map((category) => (
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

        <Step dbId={dbId} categoryId={id} />

        <Questions questions={questions} />
      </div>
    </div>
  );
}
