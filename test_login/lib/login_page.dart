import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoginPage  extends StatefulWidget {
  const LoginPage ({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  
 //sms auth controlling
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
        title: new Text ("Login Map Page"),
        actions: <Widget>[
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
                child: Text('Wyloguj', style: TextStyle(fontSize: 20),),
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((action){
                    Navigator.of(context).pushReplacementNamed('/landingpage');
                  }).catchError((e){
                    print(e);
                  });
                },
              ),

        ],
        
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Zalogowano użytkownika $uid'),
              SizedBox(height: 15.0,
              ),
              GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
              ),
            ],
          ),
        ),),
    );
  }
}