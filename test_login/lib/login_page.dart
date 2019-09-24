import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  var currentLocation = LocationData;
  var location = new Location();

  GoogleMapController mapController;

  static const LatLng _center = const LatLng(45.521563, -122.677433);
    

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final Set<Marker> _markers = {};

  LatLng _lastPosition = _center;

  void _addMarkerButton() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastPosition.toString()),
        position: _lastPosition,
        infoWindow: InfoWindow(
          title: 'Użytkownik',
          snippet: uid,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastPosition = position.target;
  }

  //sms auth controlling
  String uid = '';
  getUid() {}

  @override
  void initState() {

    this.uid = '';
    FirebaseAuth.instance.currentUser().then((val) {
      setState(() {
        this.uid = val.uid;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Map Page"),
        actions: <Widget>[
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(
              'Wyloguj',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((action) {
                Navigator.of(context).pushReplacementNamed('/landingpage');
              }).catchError((e) {
                print(e);
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(children: <Widget>[
                FloatingActionButton(
                  onPressed: _addMarkerButton,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.add_location, size: 35.0),)
              ],),
            ),
          ),
        ],
      ),
    );
  }
}
