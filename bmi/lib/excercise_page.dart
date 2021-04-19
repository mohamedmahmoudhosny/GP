import 'package:flutter/material.dart';
import 'Reusable_Card.dart';
import 'package:bmi/Constants.dart';
import 'day_details_page.dart';
import 'BottomNavBar.dart';


class excersicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Your 30 days plan'),
      ),

      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundExcerButton(
                text: "Day 1",
                text2: "7 Exercises",
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>dayDetailsPage()));
                },
              ),
            ],
          ),


          SizedBox(
            height: 10,
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundExcerButton(
                text: "Day 2",
                text2: "5 Exercises",
                onPressed: (){},
              ),
            ],
          ),


          SizedBox(
            height: 10,
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundExcerButton(
                text: "Day 3",
                text2: "4 Exercises",
                onPressed: (){},
              ),
            ],
          ),






        ],
      ),
      bottomNavigationBar: MyNavBar(),
    );
  }
}









class RoundExcerButton extends StatelessWidget {
  RoundExcerButton({@required this.onPressed , @required this.text , @required this.text2});
  final String text;
  final Function onPressed;
  final String text2;
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.only(top: 10 , left: 30 ,bottom: 3),
               child: Text(text , style:NewlabelTextStyle,),
             ),
           ],
         ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5 , left: 30),
                child: Text(text2 , style: NewlabelTextStyle2,),
              ),
            ],
          )
        ],
      ),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 335,
        height: 60.0,
      ),

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: bottomContainerButton)
      ),
      fillColor:cardColor ,
    );
  }
}

















