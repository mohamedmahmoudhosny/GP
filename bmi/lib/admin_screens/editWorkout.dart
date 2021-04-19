import 'package:bmi/Constants.dart';
import 'package:bmi/models/Workout.dart';
import 'package:bmi/services/store.dart';
import 'package:flutter/material.dart';
import 'package:bmi/CustomTextField.dart';

class EditWorkout extends StatelessWidget {
  static String id= 'EditWorkout';

  String _name , _setsNum , _day ,_plan ,_gif;
  final _store = store();
  static final GlobalKey<FormState> globalKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Workout workout =ModalRoute.of(context).settings.arguments;
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
                    if(globalKey2.currentState.validate()){
                      globalKey2.currentState.save();
                      _store.editWorkout({
                        kWorkoutName: _name,
                        kWorkoutSetsNumber: _setsNum,
                        kWorkoutDay:_day,
                        kWorkoutPlan:_plan,
                        kWorkoutGif:_gif,
                      }
                          , workout.wId);
                    }
                  },
                  child: Text('Add Workout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
