import 'package:flutter/material.dart';

// In this class we created buttons
// And when [onTap] it is calling by VoidCallback.
// VoidCallback is a function that doesn't return anything. This is not a Regular Function.
// This is the way in main file to call our function.
class AnswerButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const AnswerButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ElevatedButton(
      style: ButtonStyle(
        enableFeedback: false,
        fixedSize: MaterialStateProperty.all<Size>(const Size(300,40)),
        backgroundColor: MaterialStateProperty.all(Colors.redAccent),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
      ),
      child: Text(text, style: const TextStyle(fontSize: 20)),
      onPressed: () {
        onTap?.call();
      },
    ));
  }
}
