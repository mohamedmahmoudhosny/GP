import 'package:bmi/admin_screens/addWorkout.dart';
import 'package:bmi/admin_screens/manageWorkout.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  static String  id = 'AdminScreen';
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
              Navigator.pushNamed(context, AddWorkout.id);

            },
            child: Text('Add Workout'),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, ManageWorkout.id);
            },
            child: Text('Manage Workout'),
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
