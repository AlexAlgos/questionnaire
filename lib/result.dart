import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  //Constructor
  Result(this.resultScore, this.resetHandler);

  //Getter
  String get resultPhrase {
    String resultText;
    if (resultScore == 1) {
      resultText = 'Good try, try again!';
    } else if (resultScore == 2) {
      resultText = 'Almost perfect score, try again!';
    } else if (resultScore == 3) {
      resultText = 'You are a genius!';
    } else {
      resultText = 'Try harder!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart!',
            ),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
