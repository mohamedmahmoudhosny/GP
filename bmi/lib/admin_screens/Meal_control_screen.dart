import 'package:bmi/admin_screens/Addmeal.dart';
import 'package:bmi/admin_screens/ManageMeal.dart';
import 'package:bmi/admin_screens/addWorkout.dart';
import 'package:bmi/admin_screens/manageWorkout.dart';
import 'package:flutter/material.dart';

class MealControlScreen extends StatelessWidget {
  static String  id = 'MealControlScreen';
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
              Navigator.pushNamed(context, AddMeal.id);

            },
            child: Text('Add Meals'),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, ManageMeal.id);
            },
            child: Text('Manage Meals'),
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
