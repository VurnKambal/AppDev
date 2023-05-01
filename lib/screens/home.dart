import 'package:flutter/material.dart';
// import 'dart:math';
import 'package:think_fast/screens/custom_page.dart';
import 'package:think_fast/screens/play/play_page.dart';
import 'package:think_fast/objects/questions.dart';

class Home extends StatelessWidget {
  const Home({super.key});
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
      color: Colors.blueGrey,
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 90.0,
          width: 800.0,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: const Text("Think Fast",
              style: TextStyle(fontSize: 40.0, color: Colors.black)),
        ),
        Container(
            height: 75.0,
            width: 300.0,
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: goToPlayPage,
              child: const Text("Play",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            )),
        Container(
            height: 75.0,
            width: 300.0,
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: goToCustomPage,
              child: const Text("Customize",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            )),
        const Text(
          "Developed By: Batiller, Verneil Kent S.  CS - 202",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic),
        )
      ])),
    ));
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
