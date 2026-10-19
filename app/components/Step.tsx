import dataBases from "@/exampleData";
import "./component.css";

interface StepProps {
  dbId: string;
  categoryId: string;
}

export default function Step({ categoryId, dbId }: StepProps) {
  const steps = dataBases
    .find((db) => db.id === dbId)
    ?.categories.find((category) => category.id === categoryId)?.steps;
  if (!steps) return null;
  return (
    <div className="steps-container">
      {steps.map((step) => (
        <div key={step.id} className="step">
          <h3>{step.title}</h3>
          <p dangerouslySetInnerHTML={{ __html: step.text }}></p>
          {step.important && <p className="important">{step.important}</p>}
          {step.image && <img src={step.image} alt={step.title} />}
        </div>
      ))}
    </div>
  );
}
