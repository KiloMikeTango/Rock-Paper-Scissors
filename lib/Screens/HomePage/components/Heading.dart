import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/Screens/HomePage/components/MyText.dart';
import 'package:rock_paper_scissors/Screens/HomePage/texts.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          text: MAIN_HEADING_1, // 'ROCK PAPER'
          color: Colors.white,
          fontsize: 35,
          fontweight: FontWeight.w600,
        ),

        MyText(
          text: MAIN_HEADING_2, // 'SCISSORS'
          color: Colors.white,
          fontsize: 33,
          fontweight: FontWeight.w600,
        ),

        SizedBox(height: 10),

        MyText(
          text: SUB_HEADING, // 'Can you beat the computer?'
          color: Colors.grey.shade200,
          fontsize: 20,
        ),
      ],
    );
  }
}
