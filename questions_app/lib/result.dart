import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final VoidCallback resetScore;

  Result(this.finalScore, this.resetScore);

  String get resultPhrase {
    return "Thanks for answering! Your final score is ${finalScore}";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        FlatButton(
            onPressed: resetScore,
            textColor: Colors.blue,
            child: Text("Restart Quiz"))
      ],
    ));
  }
}
