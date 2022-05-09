import 'package:flutter/material.dart';

class ResulScreen extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  const ResulScreen(
      {Key? key, required this.resultScore, required this.resetQuiz})
      : super(key: key);

  //*  We will use getter to get the resultScore passed from main.dart file.
  //*  We will use it to show the result.

  String? get result {
    // ignore: unused_local_variable
    //* Create a variable to show text with resultScore from main.dart file.
    final String resultPhrase = 'You scored $resultScore points.';

    if (resultScore <= 10) {
      return '$resultPhrase\n \nYou are a bad person!';
    } else if (resultScore <= 20) {
      return '$resultPhrase\n \nYou are a mediocre person!';
    } else if (resultScore <= 30) {
      return '$resultPhrase\n \nYou are a good person!';
    } else {
      return '$resultPhrase\n \nYou are a great person!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                ///? We used getter to get the resultScore from main.dart file.
                result as String,
                style: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: TextButton(
              onPressed: () {
                //? We added this line to reset the quiz.
                //? From main.dart ve executed method.
                resetQuiz();
              },
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      ],
    );
  }
}
