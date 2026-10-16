"use client";

import dataBases from "@/exampleData";
import { useState } from "react";

interface CategoryProps extends LearnDB.Category {
  dbId: string;
}

export default function Category({
  id,
  title,
  info,
  steps,
  dbId,
}: CategoryProps) {
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

        {steps.map((step) => (
          <div key={step.id} className="step">
            <h3>{step.title}</h3>
            <p>{step.text}</p>
            {step.important && <p className="important">{step.important}</p>}
            {step.image && <img src={step.image} alt={step.title} />}
          </div>
        ))}
      </div>
    </div>
  );
}
