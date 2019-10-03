import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
   
  



  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Country Demo'),
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
  List<DropdownMenuItem<String>> listOfCountries=[];
  

  Widget build(BuildContext context) {

    listOfCountries.add(DropdownMenuItem(
      value: '+48',
   child:Container(
     child:Row(
       children: <Widget>[ 
         Container(
           width:30.0, 
           height:30.0,
           decoration: new BoxDecoration(
             shape: BoxShape.circle,
             image:  new DecorationImage(
               fit: BoxFit.fill,
               image: AssetImage("assets/images/pl.png"),
             )
           )
            ,),
            SizedBox(width: 5.0),
          new Text('+48')],
     ))));

    listOfCountries.add(DropdownMenuItem(
      value: '+44',
   child:Container(
     child:Row(
       children: <Widget>[ 
         Container(
           width:30.0, 
           height:30.0,
           decoration: new BoxDecoration(
             shape: BoxShape.circle,
             image:  new DecorationImage(
               fit: BoxFit.fill,
               image: AssetImage("assets/images/gb.png"),
             )
           )
            ,),
            SizedBox(width: 5.0),
          new Text('+44')],
     ))));

    listOfCountries.add(DropdownMenuItem(
  value: '+49',
   child:Container(
     child:Row(
       children: <Widget>[ 
         Container(
           width:30.0, 
           height:30.0,
           decoration: new BoxDecoration(
             shape: BoxShape.circle,
             image:  new DecorationImage(
               fit: BoxFit.fill,
               image: AssetImage("assets/images/de.png"),
             )
           )
            ,),
            SizedBox(width: 5.0),
          new Text('+49')],
     ))));
    listOfCountries.add(DropdownMenuItem(
      value: '+1',
   child:Container(
     child:Row(
       children: <Widget>[ 
         Container(
           width:30.0, 
           height:30.0,
           decoration: new BoxDecoration(
             shape: BoxShape.circle,
             image:  new DecorationImage(
               fit: BoxFit.fill,
               image: AssetImage("assets/images/us.png"),
             )
           )
            ,),
            SizedBox(width: 5.0),
          new Text('+1')],
     ))));

    
  String dropdownvalue;
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        child: DropdownButton(
          items:listOfCountries,
          value: dropdownvalue,
          onChanged: (value) {
            setState(() {
              dropdownvalue = value;
              print(value.toString());
            }); 
          },
        )
      )
    );
  }
}
