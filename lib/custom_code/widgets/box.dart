// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:animated_text_kit/animated_text_kit.dart';

class Box extends StatefulWidget {
  const Box({
    super.key,
    this.width,
    this.height,
    this.word1,
    this.word2,
    this.word3,
  });

  final double? width;
  final double? height;
  final String? word1;
  final String? word2;
  final String? word3;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  Color boxColor = Color.fromARGB(255, 195, 125, 155);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 20.0, height: 100.0),
        const Text(
          'Be',
          style: TextStyle(fontSize: 43.0, color: Colors.pink),
        ),
        const SizedBox(width: 20.0, height: 100.0),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
            fontFamily: 'Horizon',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText(widget.word1 ?? ''),
              RotateAnimatedText(widget.word2 ?? ''),
              RotateAnimatedText(widget.word3 ?? ''),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ],
    );
  }
}
