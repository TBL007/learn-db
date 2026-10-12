const dataBases: Array<LearnDB.DataBase> = [
  {
    id: "db-1",
    title: "Lorem Database",
    info: [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
    ],
    logo: "/logos/lorem.svg",
    categories: [
      {
        id: "db-1-cat-1",
        title: "Getting Started",
        info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
        steps: [
          {
            id: "db-1-cat-1-step-1",
            title: "Install Lorem",
            text: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            image: "/images/lorem-install.png",
            important: "Excepteur sint occaecat cupidatat non proident.",
          },
          {
            id: "db-1-cat-1-step-2",
            title: "Create your first table",
            text: "Sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet.",
          },
          {
            id: "db-1-cat-1-step-3",
            title: "Insert some rows",
            text: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
            image: "/images/lorem-insert.png",
          },
        ],
        questions: [
          {
            id: "db-1-cat-1-q-1",
            question: "Lorem ipsum dolor sit amet, what comes next?",
            answertype: "multiple",
            alternatives: ["Consectetur", "Adipiscing", "Tempor", "Magna"],
            answer: "Consectetur",
          },
          {
            id: "db-1-cat-1-q-2",
            question: "Which step creates the first table?",
            answertype: "text",
            answer: "Create your first table",
          },
        ],
      },
      {
        id: "db-1-cat-2",
        title: "Querying Data",
        info: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit.",
        steps: [
          {
            id: "db-1-cat-2-step-1",
            title: "Select with filters",
            text: "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae.",
            important: "At vero eos et accusamus et iusto odio dignissimos.",
          },
          {
            id: "db-1-cat-2-step-2",
            title: "Sorting and limiting",
            text: "Et harum quidem rerum facilis est et expedita distinctio nam libero tempore.",
            image: "/images/lorem-sort.png",
          },
        ],
        questions: [
          {
            id: "db-1-cat-2-q-1",
            question: "Nemo enim ipsam voluptatem quia voluptas sit?",
            answertype: "multiple",
            alternatives: ["Aspernatur", "Aut odit", "Fugit", "Sed quia"],
            answer: "Aspernatur",
          },
          {
            id: "db-1-cat-2-q-2",
            question: "Name the keyword used to limit results.",
            answertype: "text",
            answer: "LIMIT",
          },
        ],
      },
    ],
  },
  {
    id: "db-2",
    title: "Ipsum Database",
    info: [
      "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.",
      "Consectetur, adipisci velit, sed quia non numquam eius modi tempora.",
    ],
    logo: "/logos/ipsum.svg",
    categories: [
      {
        id: "db-2-cat-1",
        title: "Data Modeling",
        info: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus.",
        steps: [
          {
            id: "db-2-cat-1-step-1",
            title: "Identify entities",
            text: "Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores.",
            image: "/images/ipsum-entities.png",
          },
          {
            id: "db-2-cat-1-step-2",
            title: "Define relationships",
            text: "Alias consequatur aut perferendis doloribus asperiores repellat.",
            important:
              "Nam libero tempore, cum soluta nobis est eligendi optio.",
          },
          {
            id: "db-2-cat-1-step-3",
            title: "Normalize the schema",
            text: "Cumque nihil impedit quo minus id quod maxime placeat facere possimus.",
          },
        ],
        questions: [
          {
            id: "db-2-cat-1-q-1",
            question: "Neque porro quisquam est, qui dolorem?",
            answertype: "multiple",
            alternatives: ["Ipsum", "Lorem", "Dolor", "Amet"],
            answer: "Ipsum",
          },
          {
            id: "db-2-cat-1-q-2",
            question: "What do you define after identifying entities?",
            answertype: "text",
            answer: "Relationships",
          },
        ],
      },
      {
        id: "db-2-cat-2",
        title: "Indexes and Performance",
        info: "Omnis voluptas assumenda est, omnis dolor repellendus.",
        steps: [
          {
            id: "db-2-cat-2-step-1",
            title: "Create an index",
            text: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet.",
            important: "Ut enim ad minima veniam, quis nostrum exercitationem.",
          },
          {
            id: "db-2-cat-2-step-2",
            title: "Read the query plan",
            text: "Quis autem vel eum iure reprehenderit qui in ea voluptate.",
            image: "/images/ipsum-plan.png",
          },
        ],
        questions: [
          {
            id: "db-2-cat-2-q-1",
            question: "Which of these speeds up lookups?",
            answertype: "multiple",
            alternatives: ["An index", "A comment", "A trigger", "A view"],
            answer: "An index",
          },
          {
            id: "db-2-cat-2-q-2",
            question: "What keyword shows a query plan in MySQL?",
            answertype: "text",
            answer: "EXPLAIN",
          },
        ],
      },
    ],
  },
];

export default dataBases;
