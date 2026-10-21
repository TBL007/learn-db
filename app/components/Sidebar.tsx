"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import dataBases from "@/exampleData";
import "./component.css";

function Squirrel() {
  return (
    <svg
      className="sidebar-squirrel"
      viewBox="0 0 48 48"
      aria-hidden="true"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path d="M11 41c-4-2-6-6-4-10 2-4 7-6 11-4" />
      <path d="M12 28c-5-6-5-15 2-19 5-3 11-2 13 2 2 3 1 6-2 7-2 1-4 0-5-2" />
      <path d="M29 11c5 1 8 5 7 10-1 6-7 10-12 14-3 2-4 5-2 7" />
      <path d="M34 10c1-2 3-3 5-2 2 1 2 4 1 6" />
      <circle cx="21" cy="21" r="1.1" fill="currentColor" stroke="none" />
    </svg>
  );
}

function DatabaseStack() {
  return (
    <svg
      className="sidebar-icon"
      viewBox="0 0 32 32"
      aria-hidden="true"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.6"
      strokeLinecap="round"
    >
      <ellipse cx="16" cy="8" rx="9" ry="3.5" />
      <path d="M7 8v7c0 2 4 3.5 9 3.5s9-1.5 9-3.5V8" />
      <path d="M7 15v7c0 2 4 3.5 9 3.5s9-1.5 9-3.5v-7" />
      <path d="M7 22c0 2 4 3.5 9 3.5s9-1.5 9-3.5" />
    </svg>
  );
}

export default function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className="sidebar">
      <Link href="/" className="sidebar-brand" aria-label="LearnDB home">
        <span className="sidebar-brand-text">LearnDB</span>
        <Squirrel />
      </Link>

      <nav className="sidebar-nav" aria-label="Databases">
        <p className="sidebar-section-label">database</p>
        <ul className="sidebar-list">
          {dataBases.map((db) => {
            const isActive =
              pathname === `/${db.id}` || pathname.startsWith(`/${db.id}/`);

            return (
              <li key={db.id}>
                <Link
                  href={`/${db.id}/${db.categories[0].id}`}
                  className={`sidebar-link${isActive ? " active" : ""}`}
                  aria-current={isActive ? "page" : undefined}
                >
                  <DatabaseStack />
                  <span>{db.title}</span>
                </Link>
              </li>
            );
          })}
        </ul>
      </nav>
    </aside>
  );
}
