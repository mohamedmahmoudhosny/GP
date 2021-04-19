import 'package:bmi/login_screen.dart';
import 'package:bmi/provider/modalHud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bmi/Constants.dart';
import 'package:flutter/services.dart';
import 'CustomTextField.dart';
import 'package:bmi/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatelessWidget {
  static final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String  id = 'SignUpScreen';
  String _email ,_password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: Provider.of<ModalHud> (context).isLoading,
            child: Form(
            key: _globalKey,
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
                   },
                    hint: 'Enter Your Name',
                    icon: Icons.perm_identity,
                  ),
                  SizedBox(
                    height: height*.02,
                  ),
                  CustomTextField(
                    onClick: (value){
                      _email =value;},
                    hint: 'Enter Your Email',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: height*.02,
                  ),
                  CustomTextField(
                    onClick: (value){
                      _password =value;},
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
                        onPressed: ()
                        async{
                          final modelhud =Provider.of<ModalHud>(context,listen: false);
                          modelhud.changeisLoading(true);
                          if(_globalKey.currentState.validate())
                          {

                            try {
                              _globalKey.currentState.save();
                              final authResult = await _auth.signUp(
                                  _email, _password);
                              modelhud.changeisLoading(false);
                              Navigator.pop(context);
                            }on PlatformException catch(e){
                              modelhud.changeisLoading(false);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  e.message,
                                ),
                              ));
                            }
                          }
                          modelhud.changeisLoading(false);
                        },
                        color: KNewMainColor,
                        child: Text('Sign Up',
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
                        'Already have account ?',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              color: KNewSecondColor,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      );
  }
}







