import 'package:flutter/material.dart';

class SubHeading extends StatefulWidget {
  final String text;
  SubHeading({@required this.text});
  @override
  _SubHeadingState createState() => _SubHeadingState();
}

class _SubHeadingState extends State<SubHeading> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(fontFamily: "Nunito Sans Bold", fontSize: 16.0, color: Colors.white),
    );
  }
}
