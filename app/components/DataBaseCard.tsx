import Link from "next/link";
import "./component.css";

export default function DataBaseCard({
  id,
  info,
  title,
  logo,
  categories,
}: LearnDB.DataBase) {
  return (
    <Link
      id={id}
      href={`/${id}/${categories[0].id}`}
      className="db-card"
      aria-label={`Start learning ${title}`}
      title={title}
    >
      <span className="db-card-logo">
        <img src={logo} alt={`${title} logo`} />
      </span>
      <ul className="">
        {info.map((item, i) => (
          <li key={i}>{item}</li>
        ))}
      </ul>
      <span className="db-card-cta" aria-hidden="true">
        Start learning <span aria-hidden="true">→</span>
      </span>
    </Link>
  );
}
