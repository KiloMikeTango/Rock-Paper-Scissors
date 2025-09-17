import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rock_paper_scissors/components/Score_Bar.dart';
import 'package:rock_paper_scissors/components/computer.dart';
import 'package:rock_paper_scissors/components/player.dart';
import 'package:rock_paper_scissors/components/player_menu.dart';
import 'package:rock_paper_scissors/constants/constant.dart';
import 'package:rock_paper_scissors/game/modes/normal.dart';

class EasyMode extends StatefulWidget {
  const EasyMode({super.key});

  @override
  State<EasyMode> createState() => _NomalGameModeState();
}

class _NomalGameModeState extends State<EasyMode> {
  NormalMode normalMode = NormalMode();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ScoreBar(
              playerScore: normalMode.playerScore,
              computerScore: normalMode.computerScore,
            ),
          ),
          SizedBox(height: 35),

          //Computer's pick
          Computer(
            color: Colors.red.shade500,
            flipX: normalMode.computerChoice == IMAGE_NOTHING ? false : true,
            flipY: normalMode.computerChoice == IMAGE_NOTHING ? false : true,
            angle: normalMode.computerChoice == IMAGE_NOTHING ? 0 : 55,
            choice: normalMode.computerChoice!,
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
            choice: normalMode.playerChoice!,
            fontsize: 35,
            color: Colors.blueAccent,
            leftMargin: 15,
            flipX: normalMode.playerChoice == IMAGE_NOTHING ? false : true,
            angle: normalMode.playerChoice == IMAGE_NOTHING ? 0 : 55,
          ),
          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Rock
              AnimatedScale(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                scale: normalMode.playerIndex == 0 ? 1.4 : 1.1,
                child: Menu(
                  image: IMAGE_ROCK,
                  isSelected: normalMode.playerIndex == 0,
                  onTap: () {
                    setState(() {
                      normalMode.playerIndex = 0;
                      normalMode.playerChoice = IMAGE_ROCK;
                      normalMode.computerPick();
                      normalMode.check(
                        context,
                        onPressed: () {
                          setState(() {
                            normalMode.resetState();
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
                scale: normalMode.playerIndex == 1 ? 1.4 : 1.1,
                child: Menu(
                  image: IMAGE_PAPER,
                  isSelected: normalMode.playerIndex == 1,
                  onTap: () {
                    setState(() {
                      normalMode.playerIndex = 1;
                      normalMode.playerChoice = IMAGE_PAPER;
                      normalMode.computerPick();
                      normalMode.check(
                        context,
                        onPressed: () {
                          setState(() {
                            normalMode.resetState();
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
                scale: normalMode.playerIndex == 2 ? 1.4 : 1.1,
                child: Menu(
                  image: IMAGE_SCISSORS,
                  isSelected: normalMode.playerIndex == 2,
                  onTap: () {
                    setState(() {
                      normalMode.playerIndex = 2;
                      normalMode.playerChoice = IMAGE_SCISSORS;
                      normalMode.computerPick();
                      normalMode.check(
                        context,
                        onPressed: () {
                          setState(() {
                            normalMode.resetState();
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
