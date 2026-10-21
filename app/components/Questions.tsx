"use client";

import { FormEvent, useState } from "react";
import styles from "@styles/question.module.css";

interface QuestionProps {
  questions: Array<LearnDB.Question>;
}

export default function Question({ questions }: QuestionProps) {
  const [value, setValue] = useState("");
  const [message, setMessage] = useState<"correct" | "false" | undefined>();
  const [index, setIndex] = useState(0);

  if (!questions.length) return null;
  const selected: LearnDB.Question = questions[index];
  const goTo = (next: number) => {
    if (next < 0 || next >= questions.length) return;
    setIndex(next);
    setValue("");
    setMessage(undefined);
  };

  const handleSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    if (value === selected.answer) {
      setMessage("correct");
      window.setTimeout(() => {
        setValue("");
        setMessage(undefined);
        setIndex((previous) => Math.min(previous + 1, questions.length - 1));
      }, 900);
      return;
    }

    setMessage("false");
  };

  return (
    <section id={selected.id} className={styles.main}>
      <h3 className={styles.question}>{selected.question}</h3>

      <form onSubmit={handleSubmit} className={styles.form}>
        {selected.answertype === "text" ? (
          <textarea
            className={styles.textAnswer}
            rows={3}
            value={value}
            onChange={(event) => setValue(event.target.value)}
            placeholder="Your answer"
            aria-label="Your answer"
          />
        ) : (
          <div className={styles.options}>
            {selected.alternatives?.map((alternative, alternativeIndex) => (
              <label key={alternativeIndex} className={styles.option}>
                <input
                  type="radio"
                  name={selected.id}
                  checked={alternative === value}
                  onChange={() => setValue(alternative)}
                  className={styles.radio}
                />
                <span>{alternative}</span>
              </label>
            ))}
          </div>
        )}

        {message === "correct" && (
          <p className={`${styles.message} ${styles.correct}`}>Good job!</p>
        )}
        {message === "false" && (
          <p className={`${styles.message} ${styles.false}`}>
            Not quite — try again.
          </p>
        )}

        <div className={styles.footer}>
          <button
            type="button"
            onClick={() => goTo(index - 1)}
            disabled={index === 0}
            className={styles.arrow}
            aria-label="Previous question"
          >
            ‹
          </button>

          <div className={styles.dots} aria-hidden="true">
            {Array.from({ length: questions.length }).map((_, dotIndex) => (
              <span
                key={dotIndex}
                className={`${styles.dot} ${
                  dotIndex === index ? styles.dotActive : ""
                }`}
              />
            ))}
          </div>

          <button
            type="submit"
            className={styles.arrow}
            aria-label="Next question"
          >
            ›
          </button>
        </div>
      </form>
    </section>
  );
}
