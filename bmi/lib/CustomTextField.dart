import 'package:flutter/material.dart';
import 'package:bmi/Constants.dart';



class CustomTextField extends StatelessWidget {
  final String hint;
  final  IconData icon;
  final Function onClick;
  String _errorMessage (String str){
    switch(hint){

      case 'Enter Your Name' : return 'Please Enter Your Name';
      case 'Enter Your Email' : return 'Please Enter Your Email';
      case 'Enter Your Password' : return 'Please Enter Your Password';
    }


  }
  CustomTextField({@required this.onClick,@required this.hint , @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal :20.0),
      child: TextFormField(
        validator: (value)
        {
          if (value.isEmpty)
          {
            return _errorMessage(hint);
            // ignore: missing_return
          }

        },
        onSaved:onClick,
        obscureText: hint == 'Enter Your Password' ? true : false,
        cursorColor:  KNewSecondColor,
        decoration:  InputDecoration(
          hintText:  hint,
          prefixIcon: Icon(
            icon,
            color: KNewSecondColor,
          ),
          filled: true,
          fillColor: cardColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: KNewSecondColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: KNewMainColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: KNewMainColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}