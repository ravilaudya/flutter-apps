import "package:flutter/material.dart";

class BoxCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;

  BoxCard({@required this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: color,
        ),
      ),
    );
  }
}
