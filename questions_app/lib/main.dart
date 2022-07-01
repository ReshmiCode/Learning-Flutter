import 'package:flutter/material.dart';
import './question.dart';
import "./answer.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': "What's your favorite color?",
        'answers': ["Black", "Green", "White", "Red"]
      },
      {
        'questionText': "What's your favorite animal?",
        'answers': ["Bunny", "Elephant", "Lion", "Snake"]
      },
      {
        'questionText': "What's your favorite day of the week?",
        'answers': ["Sunday", "Wednesday", "Friday", "Saturday"]
      }
    ];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My First App"),
            ),
            body: Column(
              children: [
                Question(questions[_questionIndex]['questionText'] as String),
                ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList()
              ],
            )));
  }
}
