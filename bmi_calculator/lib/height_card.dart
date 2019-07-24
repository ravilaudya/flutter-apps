import "package:flutter/material.dart";

class _HeightCardState extends State<HeightCard> {
  final Function onValueSelected;
  final int defaultHeight;
  int valueSelected = 165;

  _HeightCardState({this.onValueSelected, this.defaultHeight}) {
    valueSelected = this.defaultHeight;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "HEIGHT",
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              valueSelected.toString(),
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "cm",
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbColor: Colors.pink,
            activeTrackColor: Colors.white,
            overlayColor: Colors.white,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            inactiveTrackColor: Colors.grey,
          ),
          child: Slider(
            min: 1.0,
            max: 300.0,
            value: valueSelected.toDouble(),
            onChanged: (v) {
              setState(() {
                valueSelected = v.toInt();
              });
              onValueSelected(valueSelected);
            },
          ),
        )
      ],
    );
  }
}

class HeightCard extends StatefulWidget {
  final Function onValueSelected;
  final int defaultHeight;

  HeightCard({this.onValueSelected, this.defaultHeight});

  @override
  _HeightCardState createState() => _HeightCardState(onValueSelected: onValueSelected, defaultHeight: defaultHeight);
}
