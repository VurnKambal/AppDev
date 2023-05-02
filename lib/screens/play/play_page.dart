import 'package:flutter/material.dart';
import 'package:think_fast/screens/login.dart';

import 'package:think_fast/objects/questions.dart';
import 'package:think_fast/screens/play/leaderboard_page.dart';

int countDownNumber = 3;

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Think Fast",
        home: PlayPageApp());
  }
}

class PlayPageApp extends StatefulWidget {
  const PlayPageApp({Key? key}) : super(key: key);

  @override
  State<PlayPageApp> createState() => _PlayPageAppState();
}

class _PlayPageAppState extends State<PlayPageApp> {
  final stopwatchTimer = Stopwatch();

  String _countDownText = "";
  double _countDownTextSize = 0;
  bool _finishedCountDown = false;
  bool answered = false;
  bool correct = false;

  QuestionItem _currentQuestion = QuestionItem("", {true: [], false: []});
  String _currentQuestionString = "";
  String choice1 = "";
  String choice2 = "";
  String choice3 = "";
  String choice4 = "";
  double _questionFontSize = 20;
  double _choice1FontSize = 20;
  double _choice2FontSize = 20;
  double _choice3FontSize = 20;
  double _choice4FontSize = 20;

  Color boxColorDefault = Colors.blue;
  Color boxColorChoice1 = Colors.blue;
  Color boxColorChoice2 = Colors.blue;
  Color boxColorChoice3 = Colors.blue;
  Color boxColorChoice4 = Colors.blue;
  Color boxColorCorrect = Colors.green;
  Color boxColorIncorrect = Colors.red;

  int _timer = 60;

  @override
  initState() {
    super.initState();
    if (!isQuestionAvailable) {
      isQuestionAvailable = true;
      questions = questionList.getQuestions;
    }
    _shuffleQuestions();
    _currentQuestion = questions[0];
    _currentQuestionString = _currentQuestion.question;

    _shuffleChoices();

    _startGame();
  }

  @override
  Widget build(BuildContext context) {
    if (_finishedCountDown) {
      return playScaffold();
    } else {
      return countDownScaffold();
    }
  }

  Widget countDownScaffold() {
    return Scaffold(
        body: Material(
      color: Colors.blueGrey,
      child: Center(
        child: Text(_countDownText,
            style:
                TextStyle(fontSize: _countDownTextSize, color: Colors.white)),
      ),
    ));
  }

  Widget playScaffold() {
    return Scaffold(
        body: Material(
            color: Colors.blueGrey,
            child: Center(
              child: IntrinsicHeight(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    IntrinsicWidth(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(
                            child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 80.0,
                                  maxHeight: 160.0,
                                  maxWidth: 120.0,
                                ),
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                    left: 10.0,
                                    right: 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0)),
                                margin: const EdgeInsets.only(
                                    top: 30.0,
                                    bottom: 40.0,
                                    left: 10.0,
                                    right: 10.0),
                                width: 1000000.0, // Max Width
                                height: 800.0,
                                child: Text(
                                  _currentQuestionString,
                                  style: TextStyle(
                                    fontSize: _questionFontSize,
                                  ),
                                )),
                          ),
                          Container(
                            width: 50.0,
                            margin: const EdgeInsets.all(10.0),
                            child: Text("$_timer",
                                style: const TextStyle(
                                    fontSize: 40.0, color: Colors.white)),
                          ),
                        ])),
                    Expanded(
                        child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 30.0,
                                right: 30.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: boxColorChoice1),
                              onPressed: _checkAnswerChoice1,
                              child: Text(choice1,
                                  style: TextStyle(
                                      fontSize: _choice1FontSize,
                                      fontWeight: FontWeight.bold)),
                            ))),
                    Expanded(
                        child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 30.0,
                                right: 30.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: boxColorChoice2),
                              onPressed: _checkAnswerChoice2,
                              child: Text(choice2,
                                  style: TextStyle(
                                      fontSize: _choice2FontSize,
                                      fontWeight: FontWeight.bold)),
                            ))),
                    Expanded(
                        child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 30.0,
                                right: 30.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: boxColorChoice3),
                              onPressed: _checkAnswerChoice3,
                              child: Text(choice3,
                                  style: TextStyle(
                                      fontSize: _choice3FontSize,
                                      fontWeight: FontWeight.bold)),
                            ))),
                    Expanded(
                        child: Container(
                            height: 100,
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 30.0,
                                right: 30.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: boxColorChoice4),
                              onPressed: _checkAnswerChoice4,
                              child: Text(choice4,
                                  style: TextStyle(
                                      fontSize: _choice4FontSize,
                                      fontWeight: FontWeight.bold)),
                            ))),
                  ])),
            )));
  }

  void _startGame() async {
    _finishedCountDown = false;
    for (int i = 3; i > 0; i--) {
      setState(() {
        _countDownText = "$i";
        _countDownTextSize = 150.0;
      });
      await Future.delayed(const Duration(seconds: 1));
    }
    setState(() {
      _countDownText = "Good\nLuck!";
      _countDownTextSize = 100.0;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      currentPlayer.playerScore = 0;
      _finishedCountDown = true; // Count Down Finished and Game Started
    });
    startTimer();
  }

  void _shuffleQuestions() {
    questionList.shuffleQuestions();
  }

  void _shuffleChoices() {
    _currentQuestion.shuffleChoices();
    choice1 = _currentQuestion.getChoices[0];
    _choice1FontSize = choice1.length > 18
        ? 10 + choice1.length / 2.1
        : 20 + choice1.length / 1.8;
    choice2 = _currentQuestion.getChoices[1];
    _choice2FontSize = choice2.length > 18
        ? 10 + choice2.length / 2.1
        : 20 + choice2.length / 1.8;
    choice3 = _currentQuestion.getChoices[2];
    _choice3FontSize = choice3.length > 18
        ? 10 + choice3.length / 2.1
        : 20 + choice3.length / 1.8;
    choice4 = _currentQuestion.getChoices[3];
    _choice4FontSize = choice4.length > 18
        ? 10 + choice4.length / 2.1
        : 20 + choice4.length / 1.8;
  }

  void _checkAnswerChoice1() {
    setState(() {
      _checkAnswer(choice1);
    });
  }

  void _checkAnswerChoice2() {
    setState(() {
      _checkAnswer(choice2);
    });
  }

  void _checkAnswerChoice3() {
    setState(() {
      _checkAnswer(choice3);
    });
  }

  void _checkAnswerChoice4() {
    setState(() {
      _checkAnswer(choice4);
    });
  }

  void _checkAnswer(String answer) {
    stopwatchTimer.stop();

    answered = true;
    if (_currentQuestion.correctAnswer.contains(answer)) {
      correct = true;
      // point +1, time +5
    }

    boxColorChoice1 = _currentQuestion.correctAnswer.contains(choice1)
        ? boxColorCorrect
        : boxColorIncorrect;
    boxColorChoice2 = _currentQuestion.correctAnswer.contains(choice2)
        ? boxColorCorrect
        : boxColorIncorrect;
    boxColorChoice3 = _currentQuestion.correctAnswer.contains(choice3)
        ? boxColorCorrect
        : boxColorIncorrect;
    boxColorChoice4 = _currentQuestion.correctAnswer.contains(choice4)
        ? boxColorCorrect
        : boxColorIncorrect;
  }

  void resetBoxColor() {
    boxColorChoice1 = boxColorDefault;
    boxColorChoice2 = boxColorDefault;
    boxColorChoice3 = boxColorDefault;
    boxColorChoice4 = boxColorDefault;
  }

  void startTimer() async {
    stopwatchTimer.start();
    Stopwatch itemStopwatch = Stopwatch()..start();

    int maxTime = 60;
    int totalTime = maxTime - 1;
    _timer = totalTime - stopwatchTimer.elapsed.inSeconds;
    while (_timer > 0) {
      setState(() {
        _timer = totalTime - stopwatchTimer.elapsed.inSeconds;
        _timer = _timer <= 0 ? 0 : _timer;
      });

      if (!isQuestionAvailable) {
        break;
      }
      if (answered) {
        answered = false;
        if (correct) {
          // if answer is correct then add score
          int scoreAdd = 15 - itemStopwatch.elapsedMilliseconds ~/ 600;
          currentPlayer.playerScore += scoreAdd > 1 ? scoreAdd : 1;
        } else {
          // if answer is incorrect then subtract score
          currentPlayer.playerScore -= currentPlayer.playerScore <= 5 ? 0 : 5;
        }
        itemStopwatch.reset();

        await Future.delayed(const Duration(milliseconds: 500));
        stopwatchTimer.start();

        if (correct) {
          // if answer is correct then add time
          setState(() {
            totalTime += 2;
          });
          correct = false;
        } else {
          // if answer is incorrect then subtract time
          setState(() {
            totalTime -= 6;
          });
        }
        questions.remove(_currentQuestion);
        if (questions.isEmpty) {
          goToLeaderboardPage();
          isQuestionAvailable = false;
          break;
        } else {
          _currentQuestion = questions[0];
          _currentQuestionString = _currentQuestion.question;
          _shuffleChoices();
          if (_currentQuestionString.length > 80) {
            _questionFontSize = _currentQuestionString.length / 8;
          } else if (_currentQuestionString.length > 40) {
            _questionFontSize = 5 + _currentQuestionString.length / 5;
          } else if (_currentQuestionString.length > 30) {
            _questionFontSize = 10 + _currentQuestionString.length / 4;
          } else {
            _questionFontSize = 20 + _currentQuestionString.length / 2;
          }
        }
        resetBoxColor();
      }
      await Future.delayed(const Duration(seconds: 1));
    }
    stopwatchTimer.stop();
    if (questions.isNotEmpty) {
      goToLeaderboardPage();
    }
  }

  void goToLeaderboardPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LeaderboardPage()),
    );
  }
}
