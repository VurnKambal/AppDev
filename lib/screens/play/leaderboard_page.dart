import 'package:flutter/material.dart';
import 'package:think_fast/screens/login.dart';
import 'package:think_fast/screens/home.dart';
import 'package:think_fast/assets/player.dart';
import 'package:think_fast/assets/variables.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Think Fast",
        home: LeaderboardPageApp());
  }
}

class LeaderboardPageApp extends StatefulWidget {
  const LeaderboardPageApp({Key? key}) : super(key: key);

  @override
  State<LeaderboardPageApp> createState() => _LeaderboardPageAppState();
}

class _LeaderboardPageAppState extends State<LeaderboardPageApp> {
  @override
  initState() {
    super.initState();
    if (!leaderboard.getPlayers.contains(currentPlayer)) {
      leaderboard.addPlayer(currentPlayer);
    }
    leaderboard.sortPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          color: backgroundColor,
          child: Column(children: [
            const Text("Leaderboard",
                style: TextStyle(
                    fontFamily: "Airbeat",
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Expanded(
                child: ListView.builder(
                    itemCount: leaderboard.getPlayers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          color: Colors.blue,
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            maxHeight: 80.0,
                            maxWidth: 120.0,
                          ),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  leaderboard.getPlayers[index].playerName,
                                  style: const TextStyle(
                                      fontFamily: "Tommy",
                                      color: Colors.white,
                                      fontSize: 30.0),
                                ),
                                Text(
                                  leaderboard.getPlayers[index].playerHighScore
                                      .toString(),
                                  style: const TextStyle(
                                      fontFamily: "Airbeat",
                                      color: Colors.white,
                                      fontSize: 30.0),
                                )
                              ]));
                    })),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Icon(Icons.home),
            )
          ])),
    );
  }
}
