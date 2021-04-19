import 'package:bmi/Constants.dart';
import 'package:bmi/excercise_page.dart';
import 'package:bmi/input_page.dart';
import 'package:bmi/input_page.dart' as prefix0;
import 'package:bmi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Reusable_Card.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.inter,@required this.bmiResult,@required this.resultText});
  final String bmiResult;
  final  String resultText;
  final String inter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Your Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(
            flex: 5,
            child:ReusableCard(colour: cardColor, cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resultText.toUpperCase(), style: resultStyle,),
                Text(bmiResult, style: resultTextStyle,),
                Text(inter ,style: bmiResultStyle, textAlign: TextAlign.center,),
              ],
            ),) ,
          ),


          BottomButton(buttonText: "Show My Plan", onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>excersicePage()));
          },)
        ],
      ),
    );
  }
}
