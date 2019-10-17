import 'model/bottle.dart';

class Bottles{

  static List<Bottle> _bottles = [
    Bottle(1,'Soda','assets/images/buttons/001-sodabottle.png','assets/images/bottles/sodabottle.png',false),
    Bottle(2,'Glass','assets/images/buttons/002-glassbottle.png','assets/images/bottles/glassbottle.png',false),
    Bottle(3,'Water','assets/images/buttons/003-waterbottle.png','assets/images/bottles/waterbottle.png',false),
  ];

  static Bottle _defaultBottle = _bottles[0];

  static Bottle _actualBottle = _defaultBottle; 


  List<Bottle> getBottles(){
    return _bottles;
  }

  void selectBottle(Bottle bottle){
    _actualBottle = bottle;
  }

  Bottle getActualBottle(){
    return _actualBottle;
  }
}