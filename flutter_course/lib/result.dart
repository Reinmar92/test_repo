import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'Udało ci się!!';
    if (resultScore <= 8) {
      resultText = 'Coś nie pykło...';
    } else if (resultScore <= 60) {
      resultText = 'Nawet nieźle...';
    } else if (resultScore <= 1000) {
      resultText = 'Geniusz kurła!';
    } else {
      resultText = 'Ty dziadu!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(child: Text('Restart Quiz!'),
        onPressed: resetHandler
        ,)
      ]),
    );
  }
}
