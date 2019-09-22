import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
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
      'questionText':'Jakiego koloru jest czerwony maluch?',
      'answers':[
          {'text':'Zielony','score':5},
          {'text':'Czerwony','score':500},
          {'text':'Biały','score':2},
          {'text':'Czarny','score':1}
        ],
      },
      {
        'questionText':'Ile to jest pół litra na dwóch?',
        'answers':[
          {'text':'Mało','score':500},
          {'text':'Dużo','score':0},
          {'text':'Średnio','score':50}, 
          {'text':'W sam raz','score':100}
          ],
      },
      {
        'questionText':'Co przed sobą widzisz?',
        'answers':[
          {'text':'Ciemność widzę','score':0},
          {'text':'Loda','score':50},
          {'text':'Ekran','score':500}, 
          {'text':'Nagą Panią','score':100}
          ]
      },
    ];
  var _questionIndex =0;
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {
      _questionIndex =0;
      _totalScore=0;
    });
  }

  void _answerQuestion(int score){
    
    _totalScore+=score;

    setState(() {
      _questionIndex=_questionIndex+1;
    });
    print(_questionIndex);
        if (_questionIndex<_questions.length) {
          print('we have more questions!');
    } else{
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex<_questions.length 
        ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions:_questions)
        :Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
