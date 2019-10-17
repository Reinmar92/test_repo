import 'dart:async';
import 'dart:math';

import 'package:bottle_game/screens/customize_bottle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

import 'model/bottle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottle Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bottle Game Page'),
       routes: <String, WidgetBuilder>{
        '/custompage': (BuildContext context) => CustomizeBottle(),
        '/homepage': (BuildContext context) => MyHomePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.bottle}) : super(key: key);

  final String title;
  final Bottle bottle; 
  

  @override
  _MyHomePageState createState() => _MyHomePageState(this.bottle);
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController _dividerController = StreamController<int>();
  Bottle bottle; 
  _MyHomePageState(this.bottle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  tooltip: 'Buy Premium',
                  icon: Image.asset('assets/images/premium.png'),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  tooltip: 'Customize Bottle',
                  icon: Image.asset('assets/images/customize.png'),
                  onPressed:()=> Navigator.of(context).pushReplacementNamed('/custompage'),
                ),
              ],
            ),
            Container(
              child: SpinningWheel(
                Image.asset(bottle.bottleImage==null?'assets/images/bottles/waterbottle.png':bottle.bottleImage.toString()),
                height: 330.0,
                width: 330.0,
                dividers: 6,
                initialSpinAngle: _generateRandomAngle(),
                spinResistance: 0.2,
                onUpdate: _dividerController.add,
                onEnd: _dividerController.add,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 30.0,
              height: 60.0,
              child: Image.asset('assets/images/pointing.png'),
            ),
            Text(
              "SWIPE TO PLAY",
              style: TextStyle(fontFamily: 'Mansalva'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dividerController.close();
    super.dispose();
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}
