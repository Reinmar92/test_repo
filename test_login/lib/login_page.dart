import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage  extends StatefulWidget {
  const LoginPage ({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String uid='';
  getUid(){}

  @override
  void initState(){
    this.uid='';
    FirebaseAuth.instance.currentUser().then((val){
      setState(() {
       this.uid=val.uid; 
      });
    }).catchError((e){
      print(e);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text ("Login Page"),
        
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Zalogowano użytkownika $uid'),
              SizedBox(height: 15.0,
              ),
              new OutlineButton(
                borderSide: BorderSide(color: Colors.red, style: BorderStyle.solid, width: 3.0),
                child: Text('Wyloguj'),
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((action){
                    Navigator.of(context).pushReplacementNamed('/landingpage');
                  }).catchError((e){
                    print(e);
                  });
                },
              )
            ],
          ),
        ),),
    );
  }
}