import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who is the first president of the United States?',
      'answers': [
        {'text': 'Benjamin Franklin', 'score': 0},
        {'text': 'George Washington', 'score': 1},
        {'text': 'John Adams', 'score': 0},
        {'text': 'Thomas Jefferson', 'score': 0},
      ],
    },
    {
      'questionText': 'What happens when you multiply a number by zero?',
      'answers': [
        {'text': 'The answer is always one', 'score': 0},
        {'text': 'Undefine number', 'score': 0},
        {'text': 'The answer is always zero', 'score': 1},
        {'text': 'The answer does not exist', 'score': 0},
      ],
    },
    {
      'questionText':
          'How many days are in the month of february during a leap year?',
      'answers': [
        {'text': '30', 'score': 0},
        {'text': '31', 'score': 0},
        {'text': '28', 'score': 0},
        {'text': '29', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questionnaire'),
          backgroundColor: Colors.purple,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _reset),
      ),
    );
  }
}
