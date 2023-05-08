import 'package:flutter/material.dart';
import 'package:think_fast/assets/player.dart';

Color backgroundColor = Color.fromARGB(255, 224, 185, 241);

bool isQuestionAvailable = true;

Player currentPlayer = Player();

int countDownNumber = 3;

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: Color(0xFFB65750),
);

const TextStyle hint = TextStyle(
    color: Color.fromARGB(255, 110, 108, 108),
    fontSize: 20,
    fontFamily: "Airbeat");

const TextStyle buttonTextStyle =
    TextStyle(fontFamily: "Airbeat", fontSize: 30, fontWeight: FontWeight.bold);

const TextStyle buttonTextStylelogout =
    TextStyle(fontFamily: "Airbeat", fontSize: 25, fontWeight: FontWeight.bold);

const TextStyle buttonTextStyleTom =
    TextStyle(fontFamily: "Tommy", fontSize: 35, fontWeight: FontWeight.bold);
const Color boxdefault = Color.fromARGB(255, 101, 180, 245);
