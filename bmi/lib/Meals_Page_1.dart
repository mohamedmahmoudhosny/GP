import 'package:flutter/material.dart';
import 'Reusable_Card.dart';
import 'package:bmi/Constants.dart';
import 'day_details_page.dart';
import 'BottomNavBar.dart';


class Meals_Page_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Meals'),
      ),

      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            SizedBox(height: 20,),

          Stack(
            children: <Widget>[


              Container(
                width: 320.0,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('images/meal.jpg')),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),



            SizedBox(height: 20,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RoundExcerButton(
                  text: "Day 1",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 2",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 3",
                  onPressed: (){},
                ),
              ],
            ),


            SizedBox(
              height: 15,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RoundExcerButton(
                  text: "Day 4",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 5",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 6",
                  onPressed: (){},
                ),
              ],
            ),


            SizedBox(
              height: 15,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RoundExcerButton(
                  text: "Day 7",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 8",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 9",
                  onPressed: (){},
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RoundExcerButton(
                  text: "Day 7",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 8",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 9",
                  onPressed: (){},
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RoundExcerButton(
                  text: "Day 7",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 8",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 9",
                  onPressed: (){},
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RoundExcerButton(
                  text: "Day 7",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 8",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 9",
                  onPressed: (){},
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RoundExcerButton(
                  text: "Day 7",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 8",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 9",
                  onPressed: (){},
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                RoundExcerButton(
                  text: "Day 7",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 8",
                  onPressed: (){

                  },
                ),

                RoundExcerButton(
                  text: "Day 9",
                  onPressed: (){},
                ),
              ],
            ),



          ],
        ),
      ),
      bottomNavigationBar: MyNavBar(),
    );
  }
}









class RoundExcerButton extends StatelessWidget {
  RoundExcerButton({@required this.onPressed , @required this.text ,});
  final String text;
  final Function onPressed;

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
                padding: const EdgeInsets.only(top: 26 , left: 30 ,bottom: 3),
                child: Text(text , style:NewlabelTextStyle,),
              ),
            ],
          ),
        ],
      ),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 100,
        height: 70.0,
      ),

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: bottomContainerButton)
      ),
      fillColor:cardColor ,
    );
  }
}
































