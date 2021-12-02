import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 9},
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your favorite fruit?',
      'answers': [
        {'text': 'Strawberry', 'score': 6},
        {'text': 'Watermelon', 'score': 2},
        {'text': 'Mango', 'score': 8},
        {'text': 'Apple', 'score': 1},
        {'text': 'Orange', 'score': 4}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override // decorator provided by Dart, make code clearer
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
