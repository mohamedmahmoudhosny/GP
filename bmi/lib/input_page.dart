import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_Contnet.dart';
import 'Reusable_Card.dart';
import 'package:bmi/Constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';





enum GenderType {male, female,}
class InputPage extends StatefulWidget {
  static String  id = 'HomePage';
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
GenderType selectedGender;
int height = 180;
int weight = 60;
int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(

                      child:  ReusableCard(

                        onPress: (){
                          setState(() {
                            selectedGender=GenderType.male;
                          });
                        },

                          colour: selectedGender==GenderType.male ? cardColor : inactiveCardColor,
                          cardChild: new ReusableColumn(cardICon: FontAwesomeIcons.mars,cardText: "MALE",)
                      ),
                  ),
                  Expanded(

                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender=GenderType.female;
                          });
                        },
                        colour: selectedGender==GenderType.female ? cardColor : inactiveCardColor,
                        cardChild: ReusableColumn(cardICon: FontAwesomeIcons.venus, cardText: "FEMALE",),
                      ),
                    ),

                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new ReusableCard(
                      colour: cardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('HEIGHT', style: labelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString() ,
                                style: numStyle,
                              ),
                              Text(
                                'cm',
                                style: labelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x15EB1555) ,
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max:220.0,

                              onChanged: (double newValue){
                                setState(() {
                                  height = newValue.round(); 
                                });

                              },

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: cardColor,
                      cardChild:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',style: labelTextStyle,),
                          Text(weight.toString() , style: numStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                               SizedBox(
                                 width: 10.0,
                               ),

                             RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                               setState(() {
                                 weight++;

                               });
                             },)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: cardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Age',style: labelTextStyle,),
                          Text(age.toString() , style: numStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                              SizedBox(
                                width: 10.0,
                              ),

                              RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                                setState(() {
                                  age++;

                                });
                              },)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
           BottomButton(buttonText: 'CALCULATE',
             onTap: (){
             CalculatorBrain calc =CalculatorBrain(height: height , weight: weight);

               Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                 bmiResult: calc.calculateBMI() ,
                 resultText: calc.getString(),
                 inter: calc.getFeedBack() ,
               ),),);
             }, ),
          ],
        ));
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon , @required this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor:Color(0xFF4C4F5E) ,

    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonText});
  final Function onTap;
  final String buttonText;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonText , style: bigButtonStyle,)),
        color: bottomContainerButton,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}


