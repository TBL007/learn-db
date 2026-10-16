import dataBases from "@/exampleData";
import DataBaseCard from "./components/DataBaseCard";
import Category from "./components/Category";

export default function Home() {
  return (
    <div>
      <h1>Lorem ipsum</h1>
      <div>
        {dataBases.map((db) => (
          <DataBaseCard {...db} />
        ))}
      </div>
    </div>
  );
}
