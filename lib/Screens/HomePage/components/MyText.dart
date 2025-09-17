import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  FontWeight fontweight;
  MyText({
    super.key,
    required this.text,
    required this.color,
    required this.fontsize,
    this.fontweight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
    );
  }
}
