"use client";
import { useState } from "react";
import styles from "@styles/question.module.css";

interface QuestionProps extends LearnDB.Question {
  setIndex: any;
  maxIndex: number;
}
export default function Question({
  id,
  question,
  answertype,
  alternatives,
  answer,
  setIndex,
  maxIndex,
}: QuestionProps) {
  const [Answer, setAnswer] = useState("");
  const [message, setMessage] = useState<"correct" | "false" | undefined>();
  const handleSubmit = (e: any) => {
    e.preventDefault();
    if (Answer === answer) {
      setMessage("correct");
      setTimeout(() => {
        setIndex((prev: number) => {
          if (prev + 1 <= maxIndex) return prev + 1;
          return prev;
        });
        setAnswer("");
        setMessage(undefined);
      }, 1000);

      return;
    }
    setMessage("false");
  };
  return (
    <div id={id} className={styles.main}>
      <h3 className={styles.question}>{question}</h3>
      <form onSubmit={handleSubmit} className="form">
        |
        {answertype === "text" ? (
          <input
            type="text"
            value={Answer}
            onChange={(e) => setAnswer(e.target.value)}
          />
        ) : (
          <>
            {alternatives?.map((alt, i) => (
              <div key={i}>
                <input
                  type="radio"
                  checked={alt === Answer}
                  onChange={() => setAnswer(alt)}
                />
                <label>{alt}</label>
              </div>
            ))}
          </>
        )}
        <div>
          {message === "correct" && <p style={{ color: "green" }}>Good job</p>}
          {message === "false" && (
            <p style={{ color: "red" }}>Fuck you you fat fucking chud</p>
          )}
          <div>
            <button
              type="button"
              onClick={() =>
                setIndex((prev: number) => {
                  if (prev - 1 >= 0) return prev - 1;
                  return prev;
                })
              }
            >
              Back
            </button>
            <button>Next</button>
          </div>
        </div>
      </form>
    </div>
  );
}
