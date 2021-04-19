import 'package:bmi/Constants.dart';
import 'package:flutter/material.dart';
import 'Meals_Page_1.dart';



class MyNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.only(top: 5 , bottom:  3),
      color: cardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.restaurant, size: 25, color: Colors.pinkAccent,) , onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Meals_Page_1()));
              }),
              Padding(
                padding: const EdgeInsets.only(bottom:0),
                child: Text("Meals" , style:  TextStyle(fontSize: 8 , color:  Colors.white70),),
              )
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.explore , size: 25,color: Colors.pinkAccent) , onPressed: (){}),
              Text("Discover" , style:  TextStyle(fontSize: 8 , color:  Colors.white70),)

            ],
          ),
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.flag ,size: 35,color: Colors.pinkAccent) , onPressed: (){}),
              Text("Plan" , style:  TextStyle(fontSize: 10 , color:  Colors.white70),)

            ],
          ),
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.timeline ,size:  25,color: Colors.pinkAccent) , onPressed: (){}),
              Text("Reports" , style:  TextStyle(fontSize: 8 , color:  Colors.white70),)

            ],
          ),
          Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.person , size:  25,color: Colors.pinkAccent) , onPressed: (){}),
              Text("Me" , style:  TextStyle(fontSize: 8 , color:  Colors.white70),)

            ],
          ),





        ],
      ),
    );
  }
}
