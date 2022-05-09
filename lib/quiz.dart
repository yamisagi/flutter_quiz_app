import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/question.dart';
import 'answer_buttons.dart';

///! I UPDATED THIS FILE ON 05/09/2022
///! Moved some code from main.dart to quiz.dart & result.dart.
///! I also added some comments.
///! We set constructors for connecting in main file logic. Because we need to use them in main.dart.

class QuizScreen extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const QuizScreen({
    Key? key,
    required this.answerQuestion,
    required this.questionIndex,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Card(
                  elevation: 1,
                  margin: const EdgeInsets.only(top: 22, bottom: 22),
                  color: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),

                  /// We used our designed Widget [Question] to show the question.
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Question(
                      // Basically we are passing the questionText to our Widget [Question].
                      // And because we are using [List] of [Map] we must use [key] to get the value.
                      // The key is the name of the value ['questionText'].
                      // * Here we added [as String] to prevent error.
                      questionText:
                          questions[questionIndex]['questionText'] as String,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // We initialized button upside in class.
                // In ElevatedButton we can pass a function to onPressed parameter,
                // As type of void.
                // But if we want to pass onPressed function like
                /* 
                       * onPressed: answerQuestion()
                        ** Dart will not allow us to do that.
                        ** Because if we pass function with braces, it will be executed immediately.
                        ** So we need to pass function without braces.
                       ? ** Or we can use arrow and anonymous functions if we dont need anywhere else.
                  */
                /// * We changed [ElevatedButton] to our own Widget [AnswerButton].
                /// * We used [_answerQuestion] function to call it.
                /// * We used [_questionIndex] to control the index of question.
                /// * This is the simplest way to minimalize the code.
                // AnswerButton(text: "Answer 1", onTap: _answerQuestion),
                // AnswerButton(text: "Answer 2", onTap: _answerQuestion),
                // AnswerButton(text: "Answer 3", onTap: _answerQuestion),
                //* 05/08/2022 -- We changed our code to interactive buttons with our List of Map. w/ [.map]
                //* .map() is a method that will loop through the list and return a new list.
                //* And we pass .map() a function that will return a widget for us.

                //? ALL WE DO IS :
                //? 1. Create a list of Map.
                //? 2. We use .map() to loop through the list.
                //? 3. We use .map() to return a widget for us.
                //? 4. Path of access is [_questions[_questionIndex]]['answers'] as List.
                //? So List->Map->Keyword->List.
                //? 5. And then we pass the parameter [e] to the AnswerButton widget as String.
                //? 6. And then we pass the parameter [_answerQuestion] to the AnswerButton widget as Function.
                //? Because [Column] is only accept a list of widgets.
                //? 7. Then we spread[...] the list to the AnswerButton widget. Because we create a list of widgets when we add [.toList()].

                //* IMPORTANT: The reason of using [as List] Dart is failing to infer the key ['answers'] has the List.
                //* We know it does. But for Dart we have to tell it that it has a List.

                //? We have improved our code by,
                //? [answerQuestion] is little bit more changed.
                //? We have updated our List to -> List->Map->Keyword->List->Map.
                //? The nested List-Map structure is the way we can access which answer has which score.
                //? And then we pass the parameter [e] to the AnswerButton widget as String.
                //? And then we pass the [_answerQuestion] as Void Function to onTap parameter.
                //? We set the parameter inside main.dart to keep score in [_totalScore] variable.
                //? The problem we solved is that we couldn't pass the Regular Function to the onTap parameter.
                //? So we used [ ()=> ] to return a Regular Function as a Void Function.
                //? And the point is we had parameter to pass. But if we had not either we had to use [ () ] to call the function.
                //? It is only executed when we tap the button with this way.
                ...(questions[questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((e) => AnswerButton(
                          text: e['text'] as String,
                          onTap: () => answerQuestion(e['score'] as int),
                        ))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
