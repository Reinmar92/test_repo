import 'package:bottle_game/bottles.dart';
import 'package:bottle_game/main.dart';
import 'package:bottle_game/model/bottle.dart';
import 'package:flutter/material.dart';

class CustomizeBottle extends StatefulWidget {
  Bottles bottles;
  CustomizeBottle(this.bottles);

  _CustomizeBottleState createState() => _CustomizeBottleState();
}

class _CustomizeBottleState extends State<CustomizeBottle> {
  Bottles bottles;

  @override
  void initState() {
    bottles = widget.bottles;
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
                        bottles.selectBottle(bottles.getBottles()[0]);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>MyHomePage()
                        ));
                        //print(bottles[0].bottleImage);
                      },
                      child: Container(
                          height: 100.0,
                          width: 50.0,
                          child: Image.asset(bottles.getBottles()[0].btnImage)),
                    ),
                    RaisedButton(
                      onPressed: () {
                        bottles.selectBottle(bottles.getBottles()[1]);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>MyHomePage()
                        ));
                      },
                      child: Container(
                          height: 100.0,
                          width: 50.0,
                          child: Image.asset(bottles.getBottles()[1].btnImage)),
                    ),
                    RaisedButton(
                      onPressed: () {
                        bottles.selectBottle(bottles.getBottles()[2]);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>MyHomePage()
                        ));
                      },
                      child: Container(
                          height: 100.0,
                          width: 50.0,
                          child: Image.asset(bottles.getBottles()[2].btnImage)),
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
