import 'package:flutter/material.dart';
import 'package:think_fast/screens/home.dart';
import 'package:think_fast/objects/questions.dart';

class EndPage extends StatelessWidget {
  const EndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Think Fast",
        home: EndPageApp());
  }
}

class EndPageApp extends StatefulWidget {
  const EndPageApp({Key? key}) : super(key: key);

  @override
  State<EndPageApp> createState() => _EndPageAppState();
}

class _EndPageAppState extends State<EndPageApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(persistentFooterButtons: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
          child: const Text("Home"),
        )
      ])
    ]);
  }
}
