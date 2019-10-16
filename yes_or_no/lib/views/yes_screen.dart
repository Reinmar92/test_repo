import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class YesScreen extends StatefulWidget {
  YesScreen({Key key}) : super(key: key);

  _YesScreenState createState() => _YesScreenState();
}

class _YesScreenState extends State<YesScreen> with TickerProviderStateMixin {
  String animationName = 'Rotation';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      FirebaseAdMob.instance
          .initialize(appId: 'ca-app-pub-8347410643233932~5895169796')
          .then((response) {});
    }
    if (Platform.isIOS) {
      FirebaseAdMob.instance
          .initialize(appId: 'ca-app-pub-8347410643233932~9297328379')
          .then((response) {});
    }

    return Scaffold(
      backgroundColor: Colors.green[900],
      body: SafeArea(
              child: Stack(
          children: <Widget>[
            FlareActor(
              'assets/animations/YesAnimation.flr',
              fit: BoxFit.none,
              animation: animationName,
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 4,
              right: MediaQuery.of(context).size.width / 4,
              top: MediaQuery.of(context).size.height / 4,
              bottom: MediaQuery.of(context).size.height / 4,
              child: FlatButton(
                  child: Image.asset('assets/images/yes_button.png'),
                  onPressed: () {
                    setState(() {
                      myInterstitial
                        ..load()
                        ..show();
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    });
                  }),
            ),
          ],
        ),
      ),
      //   ],
      // ),
    );
  }

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    gender:
        MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );

  InterstitialAd myInterstitial = InterstitialAd(
    // Replace the testAdUnitId with an ad unit id from the AdMob dash.
    // https://developers.google.com/admob/android/test-ads
    // https://developers.google.com/admob/ios/test-ads
    adUnitId: InterstitialAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  @override
  void dispose() {
    myInterstitial.dispose();
    super.dispose();
  }
}
