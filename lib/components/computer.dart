import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Computer extends StatelessWidget {
  final String choice;
  final double? topMargin;
  final double? bottomMargin;
  final double? leftMargin;
  final double? rightMargin;
  final double? fontsize;
  final Color? color;
  bool? flipX;
  bool? flipY;
  double? angle;
  Computer({
    super.key,
    required this.choice,
    required this.flipX,
    required this.flipY,
    required this.angle,
    this.topMargin,
    this.bottomMargin,
    this.leftMargin,
    this.rightMargin,
    required this.fontsize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(
              top: topMargin ?? 0,
              bottom: bottomMargin ?? 0,
              left: leftMargin ?? 0,
              right: rightMargin ?? 0,
            ),

            child: Transform.flip(
              flipY: flipY!,
              flipX: flipX!,

              child: Transform.rotate(
                angle: angle!,
                child: Image.asset(choice, scale: 2),
              ),
            ),
          ),
          Text('Computer', style: GoogleFonts.shareTech(fontSize: fontsize)),
        ],
      ),
    );
  }
}
