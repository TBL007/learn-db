"use client";

import dataBases from "@/exampleData";
import { useState } from "react";
import Step from "./Step";

interface CategoryProps extends LearnDB.Category {
  dbId: string;
}

export default function Category({ id, title, info, dbId }: CategoryProps) {
  const [selection, setSelection] = useState({ id, selectedId: id });
  if (selection.id !== id) {
    setSelection({ id, selectedId: id });
  }

  const categories = dataBases.find((db) => db.id === dbId)?.categories;
  if (!categories) return;

  return (
    <div className="category">
      <div className="category-stage">
        {categories.map((category) => (
          <button
            type="button"
            key={category.id}
            className={`category-tab ${category.id === id ? "active" : ""}`}
            aria-pressed={category.id === id}
            onClick={() => {
              setSelection({ id, selectedId: category.id });
            }}
          >
            {category.title}
          </button>
        ))}
      </div>

      <div className="category-content">
        <h2>{title}</h2>
        <p>{info}</p>

        <Step dbId={dbId} categoryId={id} />
      </div>
    </div>
  );
}
