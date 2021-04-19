import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }



  String getString(){
    if (_bmi >= 25){
      return 'OverWeight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return
          'UnderWeight';
    }
  }



String getFeedBack (){
  if (_bmi >= 25){
    return 'Do some Excersice';
  }else if(_bmi>18.5){
    return 'Good Job';
  }else{
    return
      'You Need To Eat More';
  }
}
}