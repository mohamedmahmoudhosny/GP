import 'package:bmi/admin_screens/addWorkout.dart';
import 'package:bmi/admin_screens/editWorkout.dart';
import 'package:bmi/admin_screens/manageWorkout.dart';
import 'package:bmi/login_screen.dart';
import 'package:bmi/provider/adminMode.dart';
import 'package:bmi/provider/modalHud.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'input_page.dart';
import 'signup_screen.dart';
import 'input_page.dart';
import 'package:bmi/admin_screens/admin_control_screen.dart';
import 'package:bmi/admin_screens/Addmeal.dart';
import 'package:bmi/admin_screens/Meal_control_screen.dart';
import 'package:bmi/admin_screens/ManageMeal.dart';
import 'package:bmi/admin_screens/editmeal.dart';
import 'package:bmi/admin_screens/Home_choose.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers:
      [
       ChangeNotifierProvider<ModalHud>(create: (context)=>ModalHud(),
       ),

        ChangeNotifierProvider<AdminMode>(create: (context)=>AdminMode(),
        ),


      ],
      child: MaterialApp(
          theme: ThemeData.dark().copyWith(

              primaryColor :Color (0xFF0A0E21),
              scaffoldBackgroundColor: Color (0xFF0A0E21),
              textTheme: TextTheme(body1: TextStyle(color: Colors.white),),

          ),
          initialRoute:  LoginScreen.id,
          routes: {
            EditWorkout.id : (context)=> EditWorkout(),
            LoginScreen.id  : (context)=> LoginScreen(),
            SignUpScreen.id : (context) => SignUpScreen(),
            InputPage.id :(context)=>InputPage(),
            AdminPage.id :(context)=>AdminPage(),
            AddWorkout.id:(context)=>AddWorkout(),
            ManageWorkout.id:(context)=>ManageWorkout(),
            AddMeal.id : (context)=> AddMeal(),
            MealControlScreen.id: (context)=> MealControlScreen(),
            ManageMeal.id:(context)=>ManageMeal(),
            EditMeal.id : (context)=> EditMeal(),
            homechoose.id : (context)=> homechoose(),
          },

        ),
    );
  }
}

