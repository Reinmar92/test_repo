import 'dart:async';
import 'dart:math';
 
import 'package:bottle_game/bottles.dart';
import 'package:bottle_game/screens/customize_bottle.dart';
import 'package:bottle_game/size_config.dart';
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
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => MyHomePage()
      },
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  final StreamController _dividerController = StreamController<int>();
  String title;
  Bottles bottles;
  Bottle bottle;
  double bottleWidth;
  double bottleHeight;
  @override
  void initState() {
    print('init...');
    bottles = Bottles();
    bottle = bottles.getActualBottle();
    super.initState();
  }
  //_MyHomePageState(this.bottle);
 
  @override
  Widget build(BuildContext context) {
    bottleWidth = MediaQuery.of(context).size.height / 100 * 60;
    bottleHeight = MediaQuery.of(context).size.height / 100 * 60;
    return Scaffold(backgroundColor: Colors.white, body: _showBody(context));
  }
 
  @override
  void dispose() {
    _dividerController.close();
    super.dispose();
  }
 
  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
 
  Widget _showBody(BuildContext context) {
    SizeConfig.init(context);
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _showIcons(context),
            _showBottle(context),
            _showButton(context)
          ]),
    );
  }
 
  Widget _showIcons(BuildContext context) {
    return Row(
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
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => CustomizeBottle(bottles),
                  ),
                ))
      ],
    );
  }
 
  Widget _showBottle(BuildContext context) {
    return Container(
      child: SpinningWheel(
        Image.asset(
          bottle.bottleImage.toString(),
          width: bottleWidth,
          height: bottleHeight,
          scale: 0.5,
        ),
 
        width: bottleWidth,
        height: bottleHeight,
        dividers: 6,
        initialSpinAngle: _generateRandomAngle(),
        spinResistance: 0.2,
        onUpdate: _dividerController.add,
        onEnd: _dividerController.add,
      ),
    );
  }
 
  Widget _showButton(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: SizeConfig.screenWidth*0.1,
          height: SizeConfig.screenHeight*0.06,
          child: Image.asset('assets/images/pointing.png'),
        ),
        Text(
          "SWIPE TO PLAY",
          style: TextStyle(fontFamily: 'Mansalva',fontSize: SizeConfig.defaultFontSize),
        )
      ],
    );
  }
}