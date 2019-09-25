import 'package:flutter/material.dart';
import 'package:loc_demo/models/UserLocation.dart';
import 'package:loc_demo/services/location_service.dart';
import 'package:loc_demo/views/home_view.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      builder: (context)=>LocationService().locationStream,
          child: MaterialApp(
        title: 'Flutter Location Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: HomeView(),
        ),
      ),
    );
  }
}

