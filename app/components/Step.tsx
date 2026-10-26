import fs from "node:fs";
import path from "node:path";
import StepImage from "./StepImage";
import "./component.css";

function imageExists(src?: string) {
  if (!src) return false;
  return fs.existsSync(
    path.join(process.cwd(), "public", src.replace(/^\//, "")),
  );
}

interface stepProps {
  steps: Array<LearnDB.Step>;
}

export default function Step({ steps }: stepProps) {
  if (!steps) return null;
  console.log(steps);
  return (
    <div className="steps-container">
      {steps.map((step, index) => (
        <section key={step.id} className="step" aria-labelledby={step.id}>
          <div className="step-body">
            <h3 id={step.id} className="step-title">
              {index + 1}. {step.title}
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
