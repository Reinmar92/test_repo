import 'package:bottle_game/main.dart';
import 'package:bottle_game/model/bottle.dart';
import 'package:flutter/material.dart';

class CustomizeBottle extends StatefulWidget {
  CustomizeBottle({Key key}) : super(key: key);

  _CustomizeBottleState createState() => _CustomizeBottleState();
}

class _CustomizeBottleState extends State<CustomizeBottle> {
  static List<Bottle> bottles = [
    Bottle(
        id: 1,
        name: 'Soda',
        btnImage: 'assets/images/buttons/001-sodabottle.png',
        bottleImage: 'assets/images/bottles/sodabottle.png'),
    Bottle(
        id: 2,
        name: 'Glass',
        btnImage: 'assets/images/buttons/002-glassbottle.png',
        bottleImage: 'assets/images/bottles/glassbottle.png'),
    Bottle(
        id: 3,
        name: 'Water',
        btnImage: 'assets/images/buttons/003-waterbottle.png',
        bottleImage: 'assets/images/bottles/waterbottle.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: ()=>Navigator.of(context).pushReplacementNamed('/homepage'),),
                SizedBox(width: 40.0,),
                Text(
                  'CUSTOMIZE',
                  style: TextStyle(fontFamily: 'Mansalva', fontSize: 30, color: Colors.blueAccent),
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>MyHomePage(
                            bottle: bottles[0],
                          )
                        ));
                        print(bottles[0].bottleImage);
                      },
                      child: Container(
                          height: 100.0,
                          width: 50.0,
                          child: Image.asset(bottles[0].btnImage)),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Container(
                          height: 100.0,
                          width: 50.0,
                          child: Image.asset(bottles[1].btnImage)),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Container(
                          height: 100.0,
                          width: 50.0,
                          child: Image.asset(bottles[2].btnImage)),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[],
                ),
                Row(
                  children: <Widget>[],
                ),
                Row(
                  children: <Widget>[],
                ),
                Row(
                  children: <Widget>[],
                ),
                Row(
                  children: <Widget>[],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
