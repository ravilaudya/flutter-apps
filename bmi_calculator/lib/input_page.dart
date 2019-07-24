import 'package:bmi_calculator/bmi_page.dart';
import 'package:bmi_calculator/counter_card.dart';
import "package:flutter/material.dart";
import "./box_card.dart";
import "./gender_card.dart";
import "./height_card.dart";

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  Male,
  Female,
}

final activeColor = Colors.blue.shade900;
final inactiveColor = Color(0xFF1D1F32);
final int defaultHeight = 165;
final int defaultWeight = 60;
final int defaultAge = 20;

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.Male;
  Color maleColor = activeColor;
  Color femaleColor = inactiveColor;
  int height = defaultHeight;
  int weight = defaultWeight;
  int age = defaultAge;

  void setGender(Gender gender) {
    setState(() {
      //print("Selected: $gender");
      selectedGender = gender;
      maleColor = (selectedGender == Gender.Male) ? activeColor : inactiveColor;
      femaleColor =
          (selectedGender == Gender.Female) ? activeColor : inactiveColor;
    });
  }

  void setHeight(int selectedHeight) {
    setState(() {
      height = selectedHeight;
    });
  }

  void setWeight(int selectedWeight) {
    setState(() {
      weight = selectedWeight;
      //print("Selected weight: $weight");
    });
  }

  void setAge(int selectedAge) {
    setState(() {
      age = selectedAge;
      //print("Selected age: $age");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: BoxCard(
                      onPress: () {
                        setGender(Gender.Male);
                      },
                      child: GenderCard(gender: "MALE"),
                      color: maleColor,
                    ),
                  ),
                  Expanded(
                    child: BoxCard(
                      onPress: () {
                        setGender(Gender.Female);
                      },
                      child: GenderCard(gender: "FEMALE"),
                      color: femaleColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BoxCard(
                child: HeightCard(
                  defaultHeight: defaultHeight,
                  onValueSelected: (h) {
                    setHeight(h);
                  },
                ),
                color: Color(0xFF1D1E33),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: BoxCard(
                      child: CounterCard(
                        title: "Weight",
                        defaultValue: defaultWeight,
                        onValueSelected: (w) {
                          setWeight(w);
                        },
                      ),
                      color: Color(0xFF1D1E33),
                    ),
                  ),
                  Expanded(
                    child: new BoxCard(
                      child: CounterCard(
                        title: "Age",
                        defaultValue: defaultAge,
                        onValueSelected: (a) {
                          setAge(a);
                        },
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
                  'CALCULATE YOUR BMI',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                color: Colors.red,
              ),
              onTap: () {
                //print("clicked on calculate...");
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    returnBMIPage(height: height, weight: weight);
                  }
                ));
              },
            ),
          ],
        ));
  }
}
