import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class GenderCard extends StatelessWidget {
  final String gender;
  const GenderCard({
    @required this.gender,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IconData icon = (gender == "MALE")? FontAwesomeIcons.mars : FontAwesomeIcons.venus;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0),
        SizedBox(
          height: 15.0,
        ),
        Text(gender),
      ],
    );
  }
}
