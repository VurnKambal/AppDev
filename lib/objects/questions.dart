class QuestionItem {
  Map<bool, List<String>> answerMap = {true: [], false: []};
  String questionString = "";
  List<String> _choices = [];

  QuestionItem(this.questionString, this.answerMap) {
    _choices = answerMap[true]! + answerMap[false]!;
  }

  String get question {
    return questionString;
  }

  set question(String questionString) {
    this.questionString = questionString;
  }

  List<String> get getChoices {
    return _choices;
  }

  void shuffleChoices() {
    _choices.shuffle();
  }

  set answers(Map<bool, List<String>> answerMap) {
    this.answerMap = answerMap;
  }

  List<String> get correctAnswer {
    return answerMap[true]!;
  }

  set correctAnswer(List<String> correctAnswers) {
    answerMap[true] = correctAnswers;
  }
}

class QuestionList {
  List<QuestionItem> _questions = [];

  QuestionList() {
    _questions = defaultQuestions();
  }

  QuestionList.custom(this._questions);

  get getQuestions {
    return _questions.toList();
  }

  set setQuestions(List<QuestionItem> questions) {
    _questions = questions;
  }

  void addQuestion(QuestionItem question) {
    _questions.add(question);
  }

  void removeQuestion(QuestionItem question) {
    _questions.remove(question);
  }

  void shuffleQuestions() {
    _questions.shuffle();
  }

  List<QuestionItem> defaultQuestions() {
    QuestionItem question1 = QuestionItem("What does HTML stand for?", {
      true: ["HyperText Markup Language"],
      false: [
        "HyperType Machine Language",
        "Hyperspace Text Markup Language",
        "HyperText Machine Logger"
      ]
    });

    QuestionItem question2 = QuestionItem("What does CSS stand for?", {
      true: ["Cascading Style Sheets"],
      false: [
        "Cascading Style System",
        "Cascading Style Syntax",
        "Cascading Style Script"
      ]
    });

    QuestionItem question3 = QuestionItem("What does JS stand for?", {
      true: ["JavaScript"],
      false: [
        "JavaStyle",
        "JavaSyntax",
        "JavaScripter",
      ]
    });

    QuestionItem question4 = QuestionItem("What does PHP stand for?", {
      true: ["PHP: Hypertext Preprocessor"],
      false: [
        "Personal Home Page",
        "Personal Hypertext Processor",
        "Pretext Hypertext Processor"
      ]
    });

    QuestionItem question5 = QuestionItem("What does SQL stand for?", {
      true: ["Structured Query Language"],
      false: [
        "Structured Question Language",
        "Style Query Language",
        "Style Question Language"
      ]
    });

    QuestionItem question6 =
        QuestionItem("Loops having another loop inside its body is called?", {
      true: ["Nested Loop"],
      false: ["Branched Loop", "Scope", "Recursive Loop"]
    });

    QuestionItem question7 = QuestionItem(
        "Who created the \"ILoveYou\" malware that infected over ten million Windows users on and after May 5, 2000?",
        {
          true: ["Onel de Guzman"],
          false: ["David L. Smith", "Michael Calce", "Sven Jaschan"]
        });

    QuestionItem question8 = QuestionItem(
        "The first computers were programmed using what type of language?", {
      true: ["Machine Language"],
      false: ["Assembly Language", "Source Code", "Mathematical Language"]
    });

    QuestionItem question9 = QuestionItem("""\
What is the output of this Dart main() snippet?
randomList = [42, "Flutter", "202", "CS"]
print(randomList[2]);
      """, {
      true: ["Compiler Error"],
      false: ["Flutter", "\"CS\"", "42"]
    });

    QuestionItem question10 = QuestionItem(
        "Programming paradigm that involves objects with closely linked methods (functions) and  data encapsulation?",
        {
          true: ["Object Oriented Programming"],
          false: [
            "Procedural Programming",
            "Functional Programming",
            "Imperative Programming"
          ]
        });

    return [
      question1,
      question2,
      question3,
      question4,
      question5,
      question6,
      question7,
      question8,
      question9,
      question10
    ];
  }
}

QuestionList questionList = QuestionList();
List<QuestionItem> questions = questionList.getQuestions;
bool isQuestionAvailable = true;
