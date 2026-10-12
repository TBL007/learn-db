declare global {
  namespace LearnDB {
    interface Step {
      id: string;
      title: string;
      text: string;
      image?: string;
      important?: string;
    }
    interface Question {
      id: string;
      question: string;
      answertype: "multiple" | "text";
      alternatives?: Array<string>;
      answer: string;
    }
    interface Category {
      id: string;
      title: string;
      info: string;
      steps: Array<Step>;
      questions: Array<Question>;
    }
    interface DataBase {
      id: string;
      title: string;
      info: Array<string>;
      logo: string;
      categories: Array<Category>;
    }
  }
}

export {};
