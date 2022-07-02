import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

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
  final _questions = const [
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

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My First App"),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                  )
                : Result()));
  }
}
