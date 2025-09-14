import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Player extends StatelessWidget {
  final String choice;
  final double? topMargin;
  final double? bottomMargin;
  final double? leftMargin;
  final double? rightMargin;
  final double? fontsize;
  final Color? color;
  bool? flipX;

  double? angle;
  Player({
    super.key,
    required this.choice,
    this.topMargin,
    this.bottomMargin,
    this.leftMargin,
    this.rightMargin,
    required this.fontsize,
    required this.color,
    required this.flipX,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You', style: GoogleFonts.shareTech(fontSize: fontsize)),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(
              top: topMargin ?? 0,
              bottom: bottomMargin ?? 0,
              left: leftMargin ?? 0,
              right: rightMargin ?? 0,
            ),

            child: Transform.rotate(
              angle: angle!,
              child: Transform.flip(
                flipX: flipX!,
                child: Image.asset(choice, scale: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
