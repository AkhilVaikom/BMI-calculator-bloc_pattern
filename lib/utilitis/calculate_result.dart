import 'dart:math';

class CalculateResult{
  CalculateResult({required this.height,required this.weight});
  final int height;
  final int weight;
  double _bmi=0;

  String calculateBMI(){
    _bmi= weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return "Over Weight";
    }
    else if(_bmi>18.5){
      return "Normal";
    }
    else{
      return "Under Weight";
    }
  }

  String getComments(){
     if(_bmi>=25){
      return "You have higher than normal body weight. Try to exercise more!";
    }
    else if(_bmi>18.5){
      return "You have normal body weight. Keep it up!";
    }
    else{
      return "Your have lower than normal body weight. you should eat more!";
    }
  }
}