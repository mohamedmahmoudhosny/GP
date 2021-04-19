import 'package:bmi/models/Meals.dart';
import 'package:bmi/models/Workout.dart';
import 'package:flutter/material.dart';
import 'package:bmi/CustomTextField.dart';
import 'package:bmi/services/store.dart';

class AddMeal extends StatelessWidget {
  static String id = 'Addmeal';
  String _name , _type , _day ,_plan;
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
              hint: 'Meal',
              onClick: (value){
                _name = value;
              },
            ),
            SizedBox(height: 10,),



            CustomTextField(
              hint: 'Meal Type',
              onClick: (value){
                _type = value;
              },
            ),
            SizedBox(height: 10,),



            CustomTextField(
              hint: 'Meal Day',
              onClick: (value){
                _day = value;
              },
            ),
            SizedBox(height: 10,),

            CustomTextField(
              hint: 'Meal Plan',
              onClick: (value){
                _plan = value;
              },
            ),
            SizedBox(height: 30,),

           /* CustomTextField(
              hint: 'Workout Gif',
              onClick: (value){
                _gif = value;
              },
            ),
            SizedBox(height: 30,),*/
            RaisedButton(
              onPressed: (){
                if(globalKey2.currentState.validate())
                {
                  globalKey2.currentState.save();
                  _store.addMeal(Meal(
                    mName: _name,
                    mType: _type,
                    mDay: _day,
                    mPlan: _plan,

                  ));
                }

              },
              child: Text('Add Meals'),
            ),
          ],



        ),
      ),


    );
  }
}
