"use client";

import { useState } from "react";

interface CategoryProps extends LearnDB.Category {
  dbId: string;
  categories: LearnDB.Category[];
  onSelect: (id: string) => void;
}

export default function Category({
  id,
  title,
  info,
  steps,
  categories,
  onSelect,
}: CategoryProps) {
  const [selection, setSelection] = useState({ id, selectedId: id });
  if (selection.id !== id) {
    setSelection({ id, selectedId: id });
  }

  const selectedId =
    selection.id === id ? selection.selectedId : id;
  const selectedCategory = categories.find(
    (category) => category.id === selectedId,
  );
  const activeCategory = selectedCategory ?? { id, title, info, steps };

  return (
    <div className="category">
      <div className="category-stage">
        {categories.map((category) => (
          <button
            type="button"
            key={category.id}
            className={`category-tab ${
              category.id === activeCategory.id ? "active" : ""
            }`}
            aria-pressed={category.id === activeCategory.id}
            onClick={() => {
              setSelection({ id, selectedId: category.id });
              onSelect(category.id);
            }}
          >
            {category.title}
          </button>
        ))}
      </div>

      <div className="category-content">
        <h2>{activeCategory.title}</h2>
        <p>{activeCategory.info}</p>

        {activeCategory.steps.map((step) => (
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
