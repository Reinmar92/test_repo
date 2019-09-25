import 'package:flutter/material.dart';
import 'package:loc_demo/models/UserLocation.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Center(
      child: Text('Lokalizacja: Lat${userLocation?.latitude}, Long${userLocation?.longitude}' 

      ),);
  }
}