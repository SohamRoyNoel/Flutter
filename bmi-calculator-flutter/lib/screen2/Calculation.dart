import 'dart:math';

class Calculation {
  final int height;
  final int weight;

  double _bmi;

  Calculation({this.height, this.weight});
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String Prediction() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String Suggestion() {
    if (_bmi >= 25) {
      return 'You have a higher then normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body wait, Good Job!';
    } else {
      return 'Your BMI result is quite low. Eat More..!';
    }
  }
}
