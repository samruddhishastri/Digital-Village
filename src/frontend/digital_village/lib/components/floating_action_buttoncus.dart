import 'package:flutter/material.dart';
import '../constants.dart';

class FloatingActionButtonCus extends StatelessWidget {
  // final String text;
  // final Function press;
  final Color color, textColor;
  final IconData icon;
  const FloatingActionButtonCus({
    Key key,
    // this.text,
    // this.press,
    this.color = kPrimaryColor,
    this.icon, 
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Icon(icon),
      color: color,
    );
  }
}