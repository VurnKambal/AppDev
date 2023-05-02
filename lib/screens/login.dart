import 'package:flutter/material.dart';
import 'package:think_fast/objects/player.dart';
import 'package:think_fast/screens/home.dart';

Player currentPlayer = Player();

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
      color: Colors.blueGrey,
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 90.0,
          width: 800.0,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (String value) {
              setState(() {
                _username = value;
              });
            },
            maxLines: 1,
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black,
              isDense: true,
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              labelText: 'Username',
              hintText: 'Enter username',
              hintStyle: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          ),
        ),
        Container(
            height: 75.0,
            width: 300.0,
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: _loginPlayer,
              child: const Text("Login",
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
