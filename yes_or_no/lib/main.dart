import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yes_or_no/views/yes_screen.dart';
import 'package:yes_or_no/views/no_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes Or No',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/yespage': (BuildContext context) => YesScreen(),
        '/nopage': (BuildContext context) => NoScreen(),
        '/homepage': (BuildContext context) => MyHomePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
    AnimationController animationController, animationControllerSecond;
    
   

  @override
  void initState() { 
    super.initState();
    animationController=new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 800),
    );
    animationControllerSecond= new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 800)
    );

   // animationController.forward();
    animationController.addListener((){
      setState(() {
        if (animationController.status==AnimationStatus.completed) {
          animationController.repeat();
        } 
      });
    });

    animationControllerSecond.addListener((){
      setState((){
        if (animationControllerSecond.status==AnimationStatus.completed) {
          animationControllerSecond.repeat();
        }
      });

    });
    
  }
  
  void yesOrNo() {
    setState(() {
      animationController.forward();
      Timer(Duration(milliseconds: 1000),(){
        animationControllerSecond.forward();
      });
      Timer(Duration(seconds: 10),(){
        animationController.stop();
        var rng = new Random();
        if (rng.nextInt(10) <= 5) {
          Navigator.of(context).pushReplacementNamed('/yespage');
        } else if (rng.nextInt(10) >= 5) {
          Navigator.of(context).pushReplacementNamed('/nopage');
        }
      });
        
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/yesno.png'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    
                    FadeTransition(
                      opacity: animationController,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/blank_yes.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: animationControllerSecond,              
                                          child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/blank_no.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 - 50.0,
                  child: Image.asset('assets/images/white_space.png'),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  bottom: MediaQuery.of(context).size.height / 4,
                  left: MediaQuery.of(context).size.width / 4,
                  right: MediaQuery.of(context).size.width / 4,
                  child: FlatButton(
                    onPressed: yesOrNo,
                    child: Image.asset('assets/images/spin.png'),
                  ),
                ),
              ],
            ),
            // Container(
            //   child: FlatButton(
            //     onPressed: yes_or_no,
            //     child: Image.asset('assets/images/spin.png'),
            //   ),
            // ),
          ],
        ),
      ),
    );
    
  }
  @override
    void dispose() {
    animationController.dispose();
    animationControllerSecond.dispose();
    super.dispose();
  }
}
