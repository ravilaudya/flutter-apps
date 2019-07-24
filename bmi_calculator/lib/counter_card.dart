import "package:flutter/material.dart";

class _CounterCardState extends State<CounterCard> {
  int valueSelected = 0;
  final Function onValueSelected;
  final int defaultValue;
  final String title;

  _CounterCardState({@required this.title, this.onValueSelected, this.defaultValue}) {
    valueSelected = this.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          valueSelected.toString(),
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              child: Text(
                "-",
                style: TextStyle(fontSize: 40.0),
              ),
              onPressed: () {
                setState(() {
                  valueSelected = valueSelected - 1;
                });
                onValueSelected(valueSelected);
              },
            ),
            SizedBox(
              width: 20.0,
            ),
            FloatingActionButton(
              child: Text(
                "+",
                style: TextStyle(fontSize: 40.0),
              ),
              onPressed: () {
                setState(() {
                  valueSelected = valueSelected + 1;
                });
                onValueSelected(valueSelected);
              },
            ),
          ],
        )
      ],
    );
  }
}

class CounterCard extends StatefulWidget {
  final Function onValueSelected;
  final int defaultValue;
  final String title;

  CounterCard({@required this.title, this.onValueSelected, this.defaultValue});

  @override
  _CounterCardState createState() => _CounterCardState(title: title, onValueSelected: onValueSelected, defaultValue: defaultValue);
}
