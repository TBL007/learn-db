"use client";
import { useState } from "react";
import Question from "./Question";
import "./component.css";
interface QuestionsProps {
  questions: Array<LearnDB.Question>;
}
export default function Questions({ questions }: QuestionsProps) {
  const [index, setIndex] = useState(0);
  return (
    <div>
      <Question
        {...questions[index]}
        maxIndex={questions.length}
        setIndex={setIndex}
      />
    </div>
  );
}
