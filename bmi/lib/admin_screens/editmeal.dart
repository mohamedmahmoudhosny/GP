import 'package:bmi/Constants.dart';
import 'package:bmi/models/Meals.dart';
import 'package:bmi/models/Workout.dart';
import 'package:bmi/services/store.dart';
import 'package:flutter/material.dart';
import 'package:bmi/CustomTextField.dart';
import 'package:bmi/admin_screens/ManageMeal.dart';

class EditMeal extends StatelessWidget {
  static String id= 'EditMeal';

  String _name , _type , _day ,_plan ;
  final _store = store();
  static final GlobalKey<FormState> globalKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  Meal meal =ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Form(
        key: globalKey2,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height *.2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomTextField(
                  hint: 'Meal Name',
                  onClick: (value){
                    _name = value;
                  },
                ),
                SizedBox(height: 10,),

                CustomTextField(
                  hint: 'Meal type',
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
              /*  SizedBox(height: 10,),

                CustomTextField(
                  hint: 'Workout Gif',
                  onClick: (value){
                    _gif = value;
                  },
                ),*/
                SizedBox(height: 30,),
                RaisedButton(
                  onPressed: (){
                    if(globalKey2.currentState.validate()){
                      globalKey2.currentState.save();
                      _store.editMeal({
                        kmealname: _name,
                        kmealtype: _type,
                        kmealDay:_day,
                        kmealPlan:_plan,

                      }
                          , meal.mId);
                    }
                  },
                  child: Text('Add Meal'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
