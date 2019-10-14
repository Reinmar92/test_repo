import 'dart:math';

import 'package:flutter/material.dart';

class NoScreen extends StatefulWidget {
  NoScreen({Key key}) : super(key: key);

  _NoScreenState createState() => _NoScreenState();
}

class _NoScreenState extends State<NoScreen> with TickerProviderStateMixin{

  AnimationController animationController;

  @override
  void initState() { 
    super.initState();
    animationController=new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 5000),
      upperBound: pi*2,
    );
    animationController.forward();
    animationController.addListener((){
      setState(() {
        if (animationController.status==AnimationStatus.completed) {
          animationController.repeat();
          
        } 
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.red[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Stack(
              children: <Widget>[
                ClipOval(
                                  child: Container(
                    child: new AnimatedBuilder(
                      animation: animationController,
                      child: Container(
                        width: 1000.0,
                        height: 500.0,
                        child: Image.asset('assets/images/sun.png')
                      ),
                      builder: (BuildContext context, Widget _widget) {
                        return  new Transform.rotate(
                          angle: animationController.value,
                          child: _widget,
                        );
                      },
                    ),
                    
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width/4,
                  right: MediaQuery.of(context).size.width/4,
                  top: MediaQuery.of(context).size.height/4,
                  bottom: MediaQuery.of(context).size.height/4,
                                  child: FlatButton(
                    child: Image.asset('assets/images/no_button.png'),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pushReplacementNamed('/homepage');
                      });
                    }),
                ),
              ],
            ),
          ],
          
        ),
      ),
    );
  }
  @override
    void dispose() {
    animationController.dispose();
    super.dispose();
  }
}