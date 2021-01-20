import 'package:flutter_music/constant/constant_app.dart';
import 'package:flutter/material.dart';

class SideRoundedButton extends StatelessWidget {
  final String text;
  final double radius;
  final Function press;
  const SideRoundedButton({
    Key key,
    this.text,
    this.radius = 30.0,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: blackSoftColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
