"use client";

import dataBases from "@/exampleData";
import { useEffect, useState } from "react";
import Step from "./Step";
import Link from "next/link";
import "./component.css";

interface CategoryProps extends LearnDB.Category {
  dbId: string;
}

export default function Category({ id, title, info, dbId }: CategoryProps) {
  const categories = dataBases.find((db) => db.id === dbId)?.categories;
  if (!categories) return;

  return (
    <div className="category">
      <div className="category-stage">
        {categories.map((category) => (
          <Link
            type="button"
            key={category.id}
            href={`/${dbId}/${category.id}`}
            className={`category-tab ${category.id === id ? "active" : ""}`}
            aria-pressed={category.id === id}
          >
            {category.title}
          </Link>
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
