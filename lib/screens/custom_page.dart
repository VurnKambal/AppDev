import 'package:flutter/material.dart';
import 'package:think_fast/objects/questions.dart';
import 'package:think_fast/screens/home.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Think Fast",
        home: CustomPageApp());
  }
}

class CustomPageApp extends StatefulWidget {
  const CustomPageApp({Key? key}) : super(key: key);

  @override
  State<CustomPageApp> createState() => _CustomPageAppState();
}

class _CustomPageAppState extends State<CustomPageApp> {
  String _questionString = "";
  String _correctChoice = "";
  String _incorrectChoice1 = "";
  String _incorrectChoice2 = "";
  String _incorrectChoice3 = "";
  Color boxColorChoice1 = Colors.blue;
  Color boxColorChoice2 = Colors.blue;
  Color boxColorChoice3 = Colors.blue;
  Color boxColorChoice4 = Colors.blue;
  Color boxColorCorrect = Colors.green;
  Color boxColorIncorrect = Colors.red;

  final questionFieldController = TextEditingController();
  final correctChoiceFieldController = TextEditingController();
  final incorrectChoice1FieldController = TextEditingController();
  final incorrectChoice2FieldController = TextEditingController();
  final incorrectChoice3FieldController = TextEditingController();

  void clearSubmission() {
    questionFieldController.clear();
    correctChoiceFieldController.clear();
    incorrectChoice1FieldController.clear();
    incorrectChoice2FieldController.clear();
    incorrectChoice3FieldController.clear();
    _questionString = "";
    _correctChoice = "";
    _incorrectChoice1 = "";
    _incorrectChoice2 = "";
    _incorrectChoice3 = "";
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return customizeScaffold();
  }

  Widget customizeScaffold() {
    return Scaffold(
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  child: const Text("Home")),
              ElevatedButton(
                  onPressed: _saveQuestion, child: const Text("Save")),
            ],
          )
        ],
        body: Material(
          color: Colors.blueGrey,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                IntrinsicHeight(
                    child: IntrinsicHeight(
                        child: Container(
                            margin: const EdgeInsets.only(
                                top: 30.0,
                                bottom: 20.0,
                                left: 10.0,
                                right: 10.0),
                            width: 1000000.0, // Max Width
                            height: 120.0,
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              onChanged: (String value) {
                                setState(() {
                                  _questionString = value;
                                });
                              },
                              minLines: null,
                              maxLines: null,
                              expands: true,
                              style: const TextStyle(fontSize: 20.0),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.lightBlue,
                                isDense: true,
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(),
                                labelText: 'Question',
                                hintText: 'What is the question?',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              controller: questionFieldController,
                            )))),
                Expanded(
                    child: Container(
                        height: 100.0,
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextField(
                          onChanged: (String value) {
                            setState(() {
                              _correctChoice = value;
                            });
                          },
                          controller: correctChoiceFieldController,
                          style: const TextStyle(fontSize: 20.0),
                          minLines: null,
                          maxLines: null,
                          expands: true,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            isDense: true,
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(),
                            labelText: 'Correct Choice',
                            hintText: 'Answer 1',
                          ),
                        ))),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Expanded(
                    child: Container(
                        height: 100.0,
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextField(
                          onChanged: (String value) {
                            setState(() {
                              _incorrectChoice1 = value;
                            });
                          },
                          controller: incorrectChoice1FieldController,
                          style: const TextStyle(fontSize: 20.0),
                          minLines: null,
                          maxLines: null,
                          expands: true,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              isDense: true,
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              labelText: 'Incorrect Choice',
                              hintText: 'Answer 2'),
                        ))),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Expanded(
                    child: Container(
                        height: 100.0,
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextField(
                          onChanged: (String value) {
                            setState(() {
                              _incorrectChoice2 = value;
                            });
                          },
                          controller: incorrectChoice2FieldController,
                          style: const TextStyle(fontSize: 20.0),
                          minLines: null,
                          maxLines: null,
                          expands: true,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              isDense: true,
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              labelText: 'Incorrect Choice',
                              hintText: 'Answer 3'),
                        ))),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Expanded(
                    child: Container(
                        height: 100.0,
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextField(
                          onChanged: (String value) {
                            setState(() {
                              _incorrectChoice3 = value;
                            });
                          },
                          controller: incorrectChoice3FieldController,
                          style: const TextStyle(fontSize: 20.0),
                          minLines: null,
                          maxLines: null,
                          expands: true,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              isDense: true,
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              labelText: 'Incorrect Choice',
                              hintText: 'Answer 4'),
                        ))),
                const Padding(padding: EdgeInsets.all(5.0))
              ])),
        ));
  }

  void _saveQuestion() {
    List<String> incorrectChoices = [
      _incorrectChoice1,
      _incorrectChoice2,
      _incorrectChoice3
    ];

    if (_questionString == "" || incorrectChoices.contains("")) {
      return;
    }

    QuestionItem question = QuestionItem(_questionString, {
      true: [_correctChoice],
      false: [_incorrectChoice1, _incorrectChoice2, _incorrectChoice3]
    });
    setState(() {
      clearSubmission();
      questionList.addQuestion(question);
    });
  }
}
