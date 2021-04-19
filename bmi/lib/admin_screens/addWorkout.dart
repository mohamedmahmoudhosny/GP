import 'package:bmi/models/Workout.dart';
import 'package:flutter/material.dart';
import 'package:bmi/CustomTextField.dart';
import 'package:bmi/services/store.dart';

class AddWorkout extends StatelessWidget {
  static String id = 'AddWorkout';
  String _name , _setsNum , _day ,_plan ,_gif;
  final _store = store();
  static final GlobalKey<FormState> globalKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: globalKey2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              hint: 'Workout Name',
              onClick: (value){
                _name = value;
              },
            ),
            SizedBox(height: 10,),

            CustomTextField(
              hint: 'Workout Sets Number',
              onClick: (value){
                _setsNum = value;
              },
            ),
            SizedBox(height: 10,),

            CustomTextField(
              hint: 'Workout Day',
              onClick: (value){
                _day = value;
              },
            ),
            SizedBox(height: 10,),

            CustomTextField(
              hint: 'Workout Plan',
              onClick: (value){
                _plan = value;
              },
            ),
            SizedBox(height: 10,),

            CustomTextField(
              hint: 'Workout Gif',
              onClick: (value){
                _gif = value;
              },
            ),
            SizedBox(height: 30,),
              RaisedButton(
                onPressed: (){
                  if(globalKey2.currentState.validate())
                  {
                   globalKey2.currentState.save();
                   _store.addWorkout(Workout(
                     wName: _name,
                     wSetsNum: _setsNum,
                     wDay: _day,
                     wPlan: _plan,
                     wGif: _gif,
                   ));
                  }

                },
                child: Text('Add Workout'),
              ),
          ],



        ),
      ),


    );
  }
}
