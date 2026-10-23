import dataBases from "@/exampleData";
import fs from "node:fs";
import path from "node:path";
import StepImage from "./StepImage";
import "./component.css";

interface StepProps {
  dbId: string;
  categoryId: string;
}

function imageExists(src?: string) {
  if (!src) return false;
  return fs.existsSync(
    path.join(process.cwd(), "public", src.replace(/^\//, "")),
  );
}
function CheckIcon() {
  return (
    <svg
      viewBox="0 0 24 24"
      aria-hidden="true"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.6"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path d="M4 12.5 9.5 18 20 6" />
    </svg>
  );
}

export default function Step({ categoryId, dbId }: StepProps) {
  const steps = dataBases
    .find((db) => db.id === dbId)
    ?.categories.find((category) => category.id === categoryId)?.steps;
  if (!steps) return null;

  return (
    <div className="steps-container">
      {steps.map((step, index) => (
        <section key={step.id} className="step" aria-labelledby={step.id}>
          <div className="step-body">
            <p className="step-eyebrow">Step {index + 1}</p>
            <h3 id={step.id} className="step-title">
              {step.title}
            </h3>
            <p
              className="step-text"
              dangerouslySetInnerHTML={{ __html: step.text }}
            ></p>

            {step.code && (
              <pre className="step-code">
                <code className="code">{step.code}</code>
              </pre>
            )}

            {step.image && (
              <StepImage
                src={imageExists(step.image) ? step.image : undefined}
                alt={step.title}
              />
            )}
          </div>

          {step.important && (
            <aside className="step-important">
              <h4>Viktig!</h4>
              <p>{step.important}</p>
            </aside>
          )}
        </section>
      ))}
    </div>
  );
}
