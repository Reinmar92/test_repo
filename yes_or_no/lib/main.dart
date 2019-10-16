import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yes_or_no/views/yes_screen.dart';
import 'package:yes_or_no/views/no_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController animationController, animationControllerSecond;

 



  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500),
    );
    animationControllerSecond = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    animationController.addListener(() {
      setState(() {
        if (animationController.status == AnimationStatus.completed) {

          animationControllerSecond.forward();
          animationController.reverse();
          
        }
      });
    });

    animationControllerSecond.addListener(() {
      setState(() {
        if (animationControllerSecond.status == AnimationStatus.completed) {
          animationController.forward();
          animationControllerSecond.reverse();
          
        }
      });
    });



  }

  void yesOrNo() {
    setState(() {
      animationController.forward();
      Timer(Duration(seconds: 2), () {
        animationController.stop();
        animationControllerSecond.stop();
        Random rnd;
        int min = 1;
       int max = 10;
        rnd = new Random();
        int r = min + rnd.nextInt(max - min);
        print(r);
        if (r <= 5) {
          
          Navigator.of(context).pushReplacementNamed('/yespage');
        } else if (r > 5) {
          
          Navigator.of(context).pushReplacementNamed('/nopage');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if (Platform.isAndroid) {
       FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-8347410643233932~5895169796').then((response){
        myBanner..load()..show();
    });
    }
    if(Platform.isIOS){
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-8347410643233932~9297328379').then((response){
        myBanner..load()..show();
    });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/yesno.png'),
                fit: BoxFit.cover)),
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

 static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['games', 'courses'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

  @override
  void dispose() {
    animationController.dispose();
    animationControllerSecond.dispose();
    myBanner.dispose();
    super.dispose();
  }
}
