import 'dart:math';

class Calculator{

  final int height;
  final int weight;
  double _bmi;

  Calculator({this.weight,this.height});

  String CalculateBMI()
  {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult()
  {
    if(_bmi>=25)
      {
        return 'OVERWEIGHT';
      }
    else if (_bmi >18.5)
      {
        return 'NORMAL';
      }
    else
      {
        return 'UNDERWEIGHT';
      }
  }
}
