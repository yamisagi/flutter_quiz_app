// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';
import 'package:flutter_quiz_app/result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// We will use list of questions to create a quiz.
  /// 05/08/2022 -- We will change our list to lists of Map
  /// To make AnswerButton work with our list.
  ///
  ///* 05/09/2022 -- We changed 'answers' list to list of Maps,
  ///? Those each hold the scores of the questions.
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': "Black", 'score': 10},
        {'text': "Red", 'score': 5},
        {'text': "Green", 'score': 3},
        {'text': "White", 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': "Rabbit", 'score': 10},
        {'text': "Snake", 'score': 5},
        {'text': "Elephant", 'score': 3},
        {'text': "Lion", 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': "Pizza", 'score': 10},
        {'text': "Burger", 'score': 5},
        {'text': "Pasta", 'score': 3},
        {'text': "Sushi", 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s your favorite sport?',
      'answers': [
        {'text': "Football", 'score': 1},
        {'text': "Basketball", 'score': 10},
        {'text': "Tennis", 'score': 3},
        {'text': "Baseball", 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s your favorite movie?',
      'answers': [
        {'text': "The Godfather", 'score': 10},
        {'text': "The Shawshank Redemption", 'score': 5},
        {'text': "The Dark Knight", 'score': 3},
        {'text': "The Matrix", 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite book?',
      'answers': [
        {'text': "Harry Potter", 'score': 10},
        {'text': "The Lord of the Rings", 'score': 5},
        {'text': "The Hobbit", 'score': 3},
        {'text': "The Alchemist", 'score': 0},
      ]
    },
  ];

  /// We set the current question to 0 for tracking [_questions].
  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    // And when press the button we will change question.
    // We have to control index of question.
    // If index is equal to the length of questions, we will reset [questionIndex] to 0.
    // If index is less than the length of questions, we will increment it.
    /*
    * We can use ternary operator to control the index of question.
    * Or we can use if-else statement. Totally up to you. 
    ** questionIndex = questionIndex < questions.length -1
    **    ? questionIndex + 1
    **    : 0;
     */
    // *************************************************************************
    // setState() UPDATE FOR THE STATE OF THE WIDGET
    // If we want to change the index of question, we can use setState method.
    // And we were build logic for [out of array].
    // Now we used setState() inside of it.
    // If element is out of array, we will reset it to 0.

    ///* I UPDATED CODE WITH TERNARY.
    ///! Depracated code.
    // if (_questionIndex < _questions.length - 1) {
    //   setState(() {
    //     _questionIndex++;
    //   });
    //   print('We have more questions!');
    // } else {
    //   setState(() {
    //     _questionIndex = 0;
    //   });
    //   print('No more questions! Reset to the first question.');
    // }

    ///* We set the if statement for looping over the questions.
    ///* If we remove -1, it will be return to [ResultScreen].
    //* Because of ternary operator.

    _totalScore += score;

    if (_questionIndex == _questions.length) {
      _questionIndex = 0;
    }
    setState(() {
      print(_totalScore);
      _questionIndex++;
    });
  }

  ///* We set now method to reset the quiz.
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Test App',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          title: const Text(
            'Quiz Test App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
          ),
        ),
        //* 09/05/22: We will seperate our widgets to control more easily.
        //* Look for more info [QuizScreen] & [ResultScreen].
        ///* Now we added ternary operator to control the index of question.
        ///* Basically if _q
        body: _questionIndex < _questions.length
            ? QuizScreen(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : ResulScreen(resultScore: _totalScore, resetQuiz: _resetQuiz),

        ///? We are passing [_totalScore] to [ResultScreen].
      ),
    );
  }
}
