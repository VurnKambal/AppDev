import 'package:flutter/material.dart';
// import 'dart:math';
import 'package:think_fast/screens/custom_page.dart';
import 'package:think_fast/screens/login.dart';
import 'package:think_fast/screens/play/play_page.dart';
import 'package:think_fast/assets/questions.dart';
import 'package:think_fast/assets/player.dart';
import 'package:think_fast/assets/variables.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Think Fast",
        home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  initState() {
    super.initState();

    // Not used
    // if (!isQuestionAvailable) {
    //   questionList = QuestionList();
    //   isQuestionAvailable = true;
    // }
    questions = questionList.getQuestions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: backgroundColor,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 75.0,
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: goToPlayPage,
                child: const Text("Play", style: buttonTextStyle),
              )),
          Container(
              height: 75.0,
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: goToCustomPage,
                child: const Text("Customize", style: buttonTextStyle),
              )),
          Container(
              height: 50.0,
              width: 200.0,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text("Log out", style: buttonTextStylelogout),
              )),
        ])),
      ),
    );
  }

  void goToCustomPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CustomPage()));
  }

  void goToPlayPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PlayPage()));
  }
}

/*return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Counter Application",
        home: Scaffold(
            appBar: AppBar(title: const Text("Counter Application")),
            body: Material(child)));*/
