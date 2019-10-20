import 'package:flutter/material.dart';

class WeightOnPlanet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WeightOnPlanetState();
  }
}

class WeightOnPlanetState extends State {

  final TextEditingController _userController = new TextEditingController();

int radioValue = 0;
double _finalResult = 0.0;
String _planetName = "Please Enter a Weight";

void handleRadioValueChanged(int value){
  setState(() {
   radioValue = value;

   switch(radioValue){
     case 0: 
     _finalResult = calculateWeight(_userController.text, 0.06);
     _planetName = "Your weight on Pluto would be ";
     break;
     case 1: 
     _finalResult = calculateWeight(_userController.text, 0.38);
     _planetName = "Your weight on Mars would be";
     break;
     case 2: 
     _finalResult = calculateWeight(_userController.text, 0.91);
     _planetName = "Your weight on Venus would  be ";
          break;
        }
       });
     }
     
       @override
       Widget build(BuildContext context) {
         return new Scaffold(
           appBar: new AppBar(
             title: new Text("Weight On Planet X"),
             centerTitle: true,
           ),
           backgroundColor: Colors.blueGrey,
           body: new Container(
               margin: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0.0),
               alignment: Alignment.topCenter,
               child: new ListView(
                 children: <Widget>[
                   // paddng
                   new Padding(
                     padding: EdgeInsets.all(10.0),
                   ),
                   new Image.asset(
                     "assets/images/planet.png",
                     width: 90.0,
                     height: 110.0,
                   ),
     
                   //form
     
                   new Container(
                     margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                     child: new Column(
                       children: <Widget>[
                         new TextField(
                           controller: _userController,
                           keyboardType: TextInputType.number,
                           decoration: new InputDecoration(
                              labelText: "Your weight on earth",
                               hintText: "In Kilogram",
                               icon: new Icon(Icons.person)),
                         ),
     
                         new Padding (padding: EdgeInsets.all(10.0)),
     
     
                         //Radio buttons
                         new Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                               new Radio<int>(value:0, groupValue: radioValue, onChanged: handleRadioValueChanged,),
                               new Text("Pluto"),
                               new Radio<int>(value:1, groupValue: radioValue, onChanged: handleRadioValueChanged,),
                               new Text("Mars"),
                               new Radio<int>(value:2, groupValue: radioValue, onChanged: handleRadioValueChanged,),
                               new Text("Venus"),  
                           ],
                         ),
     
                         new Container(
                             // child: radio,
                             )
                       ],
                     ),
                   ), 
                   new Padding(
                     padding: EdgeInsets.only (top: 60.0),
                   ),
                   new Center(
                     child: new Text( _userController.text.isEmpty ? "Please enter a value": "$_planetName $_finalResult pounds",
                      textAlign: TextAlign.center,
                         style: new TextStyle(
                           fontSize: 30.0,
                           fontWeight: FontWeight.w700,
                           color: Colors.white,
                          
                         )),
                   )
                 ],
               )),
         );
       }
     
       double calculateWeight(String weight, double multiplier) {
         if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
           return int.parse(weight) * multiplier;
         }else{
           return int.parse("180") * 0.98;
         }
       }
}
