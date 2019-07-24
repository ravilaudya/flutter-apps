import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;
  double _bmi = 0.0;

  BMICalculator({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "Overweight";
    }
    else if (_bmi <= 18.5) {
      return "Underweight";
    }
    return "Normal";
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return "You are overweight. You got to do excercise.";
    }
    else if (_bmi <= 18.5) {
      return "You are underweight. You have to eat more.";
    }
    return "Good Job. You have normal body weight.";
  }

}