import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/Screens/HomePage/components/Heading.dart';
import 'package:rock_paper_scissors/Screens/HomePage/components/ImageRow.dart';
import 'package:rock_paper_scissors/Screens/HomePage/components/PlayNowButton.dart';
import 'package:rock_paper_scissors/Screens/HomePage/texts.dart';
import '../../constants/constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple],
              stops: [0.0, 1.0],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 140),

              Heading(), // Heading texts

              SizedBox(height: 100),

              ImageRow(
                // Rock, Paper, Scissors images
                image1: IMAGE_ROCK,
                image2: IMAGE_PAPER,
                image3: IMAGE_SCISSORS,
              ),

              SizedBox(height: 100),

              PlayNow(buttontext: BUTTON_TEXT), // Play Now
            ],
          ),
        ),
      ),
    );
  }
}
