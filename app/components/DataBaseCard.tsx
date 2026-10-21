import Link from "next/link";
import "./component.css";

export default function DataBaseCard({
  id,
  info,
  title,
  logo,
  categories,
}: LearnDB.DataBase) {
  const chapterCount = categories.length;

  return (
    <Link
      id={id}
      href={`/${id}/${categories[0].id}`}
      className="db-card"
      aria-label={`Start learning ${title}`}
    >
      <span className="db-card-logo">
        <img src={logo} alt={`${title} logo`} />
      </span>

      <div className="db-card-copy">
        <span className="db-card-kicker">
          {chapterCount} {chapterCount === 1 ? "chapter" : "chapters"}
        </span>

        <h2 className="db-card-title">{title}</h2>

        <p className="db-card-desc">{info[0]}</p>

        <span className="db-card-cta">
          <span>Start learning</span>
          <span className="db-card-arrow" aria-hidden="true">
            <svg
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
            >
              <path d="M5 12h14" />
              <path d="m13 6 6 6-6 6" />
            </svg>
          </span>
        </span>
      </div>
    </Link>
  );
}
