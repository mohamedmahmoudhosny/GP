import 'package:flutter/material.dart';
import 'package:bmi/Constants.dart';
import 'BottomNavBar.dart';


class dayDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Day 1'),
      ),

      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundExcerButton(
                text: "Squat",
                text2: "4 sets",
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
                text: "Crunches",
                text2: "8 sets",
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
                text: "Push Up",
                text2: "4 Sets",
                onPressed: (){},
              ),
            ],
          ),






        ],
      ),
      bottomNavigationBar:MyNavBar() ,
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
