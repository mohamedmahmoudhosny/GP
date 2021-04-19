import 'package:bmi/admin_screens/addWorkout.dart';
import 'package:bmi/admin_screens/manageWorkout.dart';
import 'package:flutter/material.dart';
import 'package:bmi/admin_screens/admin_control_screen.dart';
import 'package:bmi/admin_screens/Meal_control_screen.dart';

class homechoose extends StatelessWidget {
  static String  id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, MealControlScreen.id);

            },
            child: Text('Meals'),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, AdminPage.id);
            },
            child: Text('Workouts'),
          ),
          /* RaisedButton(
            onPressed: (){

            },
            child: Text('Delete Workout'),
          ),*/

        ],
      ),
    );
  }
}
