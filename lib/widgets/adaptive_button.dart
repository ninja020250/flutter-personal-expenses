import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  AdaptiveButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
            ),
            onPressed: onPressed)
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
            ));
  }
}
