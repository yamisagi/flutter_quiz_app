import 'package:flutter/material.dart';

// When we create our own Widget generally we need to attend just one Widget per file.
// If we dont need Widget to use anywhere or if widgets working together we can set them in one file.

class Question extends StatelessWidget {
  final String questionText;
  final double? fontSize;
  const Question({Key? key, required this.questionText, this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      questionText,
      style: TextStyle(fontSize: fontSize),
      
    );
  }
}
