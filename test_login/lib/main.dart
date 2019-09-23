import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_login/login_page.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter SMS LOGIN DEMO'),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => LoginPage(),
        '/landingpage': (BuildContext context) => MyHomePage()
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

class _MyHomePageState extends State<MyHomePage> {
  String phoneNmbr;
  String smsCode;
  String verificationId;

  Future<void> checkPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRet = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) {
        print('Zalogowano');
      });
    };
    final PhoneVerificationCompleted verSucess =
        (AuthCredential phoneAuthCredential) {
      print('Weryfikacja zakończona!');
    };

    final PhoneVerificationFailed verFailed = (AuthException exception) {
      print('${exception.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNmbr,
        codeAutoRetrievalTimeout: autoRet,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verSucess,
        verificationFailed: verFailed);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Wpisz kod SMS'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text('OK'),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SMS Login Demo'),
        ),
        body: Center(child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Podaj numer telefonu'),
                 onChanged: (value){
                   this.phoneNmbr=value;
                },
                ),
                SizedBox(height: 10.0),
                RaisedButton(onPressed: checkPhone,
                child: Text('OK'),
                textColor: Colors.white,
                elevation: 5.0,
                color: Colors.purple)

          ],),
        )));
  }
}
