import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Platform.isIOS
            ? CupertinoButton(
                child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: handler,
              )
            : FlatButton(
                onPressed: handler,
                child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                textColor: Theme.of(context).primaryColor,
              ));
  }
}
