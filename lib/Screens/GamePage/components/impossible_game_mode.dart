import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rock_paper_scissors/components/Score_Bar.dart';
import 'package:rock_paper_scissors/components/computer.dart';
import 'package:rock_paper_scissors/components/player.dart';
import 'package:rock_paper_scissors/components/player_menu.dart';
import 'package:rock_paper_scissors/constants/constant.dart';
import 'package:rock_paper_scissors/game/modes/impossible.dart';

class ImpossibleGameMode extends StatefulWidget {
  const ImpossibleGameMode({super.key});

  @override
  State<ImpossibleGameMode> createState() => _ImpossibleGameModeState();
}

class _ImpossibleGameModeState extends State<ImpossibleGameMode> {
  ImpossibleMode impossibleMode = ImpossibleMode();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ScoreBar(
              playerScore: impossibleMode.playerScore,
              computerScore: impossibleMode.computerScore,
            ),
          ),
          SizedBox(height: 35),

          //Computer's pick
          Computer(
            color: Colors.red.shade500,
            flipX: impossibleMode.computerChoice == IMAGE_NOTHING ? false : true,
            flipY: impossibleMode.computerChoice == IMAGE_NOTHING ? false : true,
            angle: impossibleMode.computerChoice == IMAGE_NOTHING ? 0 : 55,
            choice: impossibleMode.computerChoice!,
            rightMargin: 15,
            fontsize: 35,
          ),

          Center(
            child: Text(
              'Vs',
              style: GoogleFonts.shareTech(
                fontSize: 60,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          //Player's pick
          Player(
            choice: impossibleMode.playerChoice!,
            fontsize: 35,
            color: Colors.blueAccent,
            leftMargin: 15,
            flipX: impossibleMode.playerChoice == IMAGE_NOTHING ? false : true,
            angle: impossibleMode.playerChoice == IMAGE_NOTHING ? 0 : 55,
          ),
          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Rock
              AnimatedScale(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                scale: impossibleMode.playerIndex == 0 ? 1.4 : 1.1,
                child: Menu(
                  image: IMAGE_ROCK,
                  isSelected: impossibleMode.playerIndex == 0,
                  onTap: () {
                    setState(() {
                      impossibleMode.playerIndex = 0;
                      impossibleMode.playerChoice = IMAGE_ROCK;
                      impossibleMode.computerPick();
                      impossibleMode.check(
                        context,
                        onPressed: () {
                          setState(() {
                            impossibleMode.resetState();
                            Navigator.pop(context);
                          });
                        },
                      );
                    });
                  },
                ),
              ),
              //Paper
              AnimatedScale(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                scale: impossibleMode.playerIndex == 1 ? 1.4 : 1.1,
                child: Menu(
                  image: IMAGE_PAPER,
                  isSelected: impossibleMode.playerIndex == 1,
                  onTap: () {
                    setState(() {
                      impossibleMode.playerIndex = 1;
                      impossibleMode.playerChoice = IMAGE_PAPER;
                      impossibleMode.computerPick();
                      impossibleMode.check(
                        context,
                        onPressed: () {
                          setState(() {
                            impossibleMode.resetState();
                            Navigator.pop(context);
                          });
                        },
                      );
                    });
                  },
                ),
              ),

              //Scissors
              AnimatedScale(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                scale: impossibleMode.playerIndex == 2 ? 1.4 : 1.1,
                child: Menu(
                  image: IMAGE_SCISSORS,
                  isSelected: impossibleMode.playerIndex == 2,
                  onTap: () {
                    setState(() {
                      impossibleMode.playerIndex = 2;
                      impossibleMode.playerChoice = IMAGE_SCISSORS;
                      impossibleMode.computerPick();
                      impossibleMode.check(
                        context,
                        onPressed: () {
                          setState(() {
                            impossibleMode.resetState();
                            Navigator.pop(context);
                          });
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
