import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/box_card.dart';
import "package:flutter/material.dart";

class BMIPage extends StatelessWidget {
  final int height;
  final int weight;
  String _bmiResult = "";
  String _bmiValue = "";
  String _bmiInterpretation = "";

  BMIPage({@required this.height, @required this.weight}) {
    BMICalculator bmiCalc = BMICalculator(height: this.height, weight: this.weight);
    _bmiValue = bmiCalc.calculateBMI();
    _bmiResult = bmiCalc.getResult();
    _bmiInterpretation = bmiCalc.getInterpretation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Text(
                      'Your Result',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: BoxCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _bmiResult,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _bmiValue,
                          style: TextStyle(
                            fontSize: 100.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _bmiInterpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                    color: Color(0xFF1D1E33),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              height: 80.0,
              child: Center(
                  child: Text(
                'RE-CALCULATE YOUR BMI',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
              color: Colors.red,
            ),
            onTap: () {
              print("clicked on re-calculate...");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
