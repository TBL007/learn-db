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
    <Link id={id} href={`/${id}/${categories[0].id}`}>
      <img src={`/logos/${logo}`} />
      <div>
        <h2>{title}</h2>
        <ul>
          {info.map((item, i) => (
            <li key={i}>- {item}</li>
          ))}
        </ul>
      </div>
    </Link>
  );
}
