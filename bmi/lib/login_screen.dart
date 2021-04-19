import 'package:bmi/admin_screens/admin_control_screen.dart';
import 'package:bmi/input_page.dart';
import 'package:bmi/provider/adminMode.dart';
import 'package:bmi/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/Constants.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'CustomTextField.dart';
import 'package:bmi/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:bmi/provider/modalHud.dart';
import 'package:bmi/services/keys.dart';
import 'package:bmi/admin_screens/Home_choose.dart';

class LoginScreen extends StatelessWidget {
   static String  id = 'LoginScreen';
   String _email,_password;
   final _auth = Auth();
   final adminPassword = 'admin1234';
    static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
   bool isAdmin =false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud> (context).isLoading,
        child: Form(
          key: globalKey ,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.28,
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/fitness.png' ),
                        width: 150,
                        height: 150,
                      ),
                         SizedBox(height: 5,),
                         Text(
                          'Shape In Home',
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height*.1,
              ),

              CustomTextField(
                onClick: (value){
                  _email = value;
                },
                hint: 'Enter Your Email',
                icon: Icons.email,
              ),
              SizedBox(
                height: height*.02,
              ),

              CustomTextField(
                onClick: (value){
                  _password = value;
                },
                hint: 'Enter Your Password',
                icon: Icons.lock,
              ),
              SizedBox(
                height: height*.05,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: Builder(
                  builder:(context)=> FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: (){
                      _validate(context);
                    },
                    color: KNewMainColor,
                    child: Text('Login',
                    style: TextStyle(
                      color: Colors.white70
                    ),),

                  ),
                ),
              ),
              SizedBox(
                height: height*.05,
              ),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t Have account ?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                    child: Text(
                        'Sign In',
                      style: TextStyle(
                      color: KNewSecondColor,
                      fontSize: 16
                    ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:30 ,vertical:  10),
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Provider.of<AdminMode> (context ,listen: false).changeIsAdmin(false);
                        },
                        child: Text(
                          'I\'am User', textAlign: TextAlign.center, style:
                          TextStyle(
                          color: Provider.of<AdminMode> (context).isAdmin? KNewSecondColor: Color (0xFF0A0E21)
                          ),),
                      ),),

                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Provider.of<AdminMode> (context , listen: false).changeIsAdmin(true);

                        },
                        child: Text(
                          'I\'am a Trainer', textAlign: TextAlign.center,
                        style:
                        TextStyle(
                            color: Provider.of<AdminMode> (context).isAdmin? Color (0xFF0A0E21): KNewSecondColor
                        ),),
                      ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void _validate(BuildContext context) async{
    final modalhud= Provider.of<ModalHud>(context ,listen: false);
    modalhud.changeisLoading(true);
   if( globalKey.currentState.validate() )
   {
     globalKey.currentState.save();
     if(Provider.of<AdminMode>(context ,listen: false).isAdmin)
     {
       if (_password == adminPassword ){
         try {
        await _auth.signIn(_email, _password);
           Navigator.pushNamed(context, homechoose.id);
         }catch(e){
           modalhud.changeisLoading(false);
           Scaffold.of(context).showSnackBar(SnackBar(
             content: Text(
               e.message,
             ) ,
           ),);
         }

       }else{
         modalhud.changeisLoading(false);
         Scaffold.of(context).showSnackBar(SnackBar(
           content: Text(
             'Something went wrong',
           ) ,
         ),);

       }

     }else{
       try {
       await  _auth.signIn(_email, _password);
         Navigator.pushNamed(context, InputPage.id);
       }catch(e){
         Scaffold.of(context).showSnackBar(SnackBar(
           content: Text(
             e.message,
           ) ,
         ),);
       }
     }

   }
    modalhud.changeisLoading(false);



  }
}
