import dataBases from "@/exampleData";
import DataBaseCard from "./components/DataBaseCard";

export default function Home() {
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
