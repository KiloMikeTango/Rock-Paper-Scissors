import 'package:flutter/material.dart';

import 'package:rock_paper_scissors/Screens/GamePage/components/easy_game_mode.dart';
import 'package:rock_paper_scissors/Screens/GamePage/components/impossible_game_mode.dart';

// import 'package:rock_paper_scissors/normalMode/modes/normalMode.dart';
String? mode; 

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent.shade400, Colors.deepPurple.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: mode == 'Easy' ?  EasyMode() : ImpossibleGameMode() 
        ),
      ),
    );
  }
}
