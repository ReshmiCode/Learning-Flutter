import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
          child: Text(answerText),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: selectHandler,
        ),
        width: double.infinity);
  }
}
