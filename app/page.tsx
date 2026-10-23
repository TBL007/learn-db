import { getDatabases } from "../lib/getDatabases";
import DataBaseCard from "./components/DataBaseCard";

export default async function Home() {
  const dataBases = await getDatabases();
  return (
    <div className="home">
      <h1 className="home-title">Get started with databases</h1>
      <div className="db-grid">
        {dataBases.map((db) => (
          <DataBaseCard {...db} key={db.id} />
        ))}
      </div>
    </div>
  );
}
