import 'package:flutter/material.dart';
import 'package:think_fast/main.dart';
import 'package:think_fast/assets/player.dart';
import 'package:think_fast/screens/home.dart';
import 'package:think_fast/assets/variables.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Think Fast",
        home: LoginApp());
  }
}

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});
  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  String _username = "";
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Material(
      color: backgroundColor,
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "?Fast",
          style: TextStyle(
              fontFamily: "Fast", fontSize: 120, color: Color(0xFFB65750)),
        ),
        Container(
          height: 100.0,
          width: 350.0,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (String value) {
              setState(() {
                _username = value;
              });
            },
            maxLines: 1,
            style: const TextStyle(
                fontFamily: "Tommy",
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 0, 0, 0),
              hintText: 'Username',
              hintStyle: TextStyle(
                  fontFamily: "Airbeat",
                  color: Color.fromARGB(255, 90, 82, 86),
                  fontSize: 30.0),
            ),
          ),
        ),
        Container(
            height: 75.0,
            width: 300.0,
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: _loginPlayer,
              child: const Text("Login", style: buttonTextStyle),
            )),
      ])),
    ));
  }

  void _loginPlayer() {
    currentPlayer = Player();
    if (_username == "") {
      return;
    }
    if (!leaderboard.getPlayerNames.contains(_username)) {
      currentPlayer.playerName = _username;
    } else {
      currentPlayer = leaderboard.getPlayer(_username);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
