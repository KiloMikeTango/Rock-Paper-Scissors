import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rock_paper_scissors/components/Score_Bar.dart';
import 'package:rock_paper_scissors/components/computer.dart';
import 'package:rock_paper_scissors/components/player.dart';
import 'package:rock_paper_scissors/components/player_menu.dart';
import 'package:rock_paper_scissors/constants/constant.dart';
import 'package:rock_paper_scissors/game/game.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Game game = Game();
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
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: ScoreBar(
                    playerScore: game.playerScore,
                    computerScore: game.computerScore,
                  ),
                ),
                SizedBox(height: 35),

                //Computer's pick
                Computer(
                  color: Colors.red.shade500,
                  flipX: game.computerChoice == IMAGE_NOTHING ? false : true,
                  flipY: game.computerChoice == IMAGE_NOTHING ? false : true,
                  angle: game.computerChoice == IMAGE_NOTHING ? 0 : 55,
                  choice: game.computerChoice,
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
                  choice: game.playerChoice,
                  fontsize: 35,
                  color: Colors.blueAccent,
                  leftMargin: 15,
                  flipX: game.playerChoice == IMAGE_NOTHING ? false : true,
                  angle: game.playerChoice == IMAGE_NOTHING ? 0 : 55,
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Scissors
                    AnimatedScale(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeOutBack,
                      scale: game.playerIndex == 0 ? 1.4 : 1.1,
                      child: Menu(
                        image: IMAGE_ROCK,
                        isSelected: game.playerIndex == 0,
                        onTap: () {
                          setState(() {
                            game.playerIndex = 0;
                            game.playerChoice = IMAGE_ROCK;
                            game.computerPick();
                            game.check(
                              context,
                              onPressed: () {
                                setState(() {
                                  game.resetState();
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
                      scale: game.playerIndex == 1 ? 1.4 : 1.1,
                      child: Menu(
                        image: IMAGE_PAPER,
                        isSelected: game.playerIndex == 1,
                        onTap: () {
                          setState(() {
                            game.playerIndex = 1;
                            game.playerChoice = IMAGE_PAPER;
                            game.computerPick();
                            game.check(
                              context,
                              onPressed: () {
                                setState(() {
                                  game.resetState();
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
                      scale: game.playerIndex == 2 ? 1.4 : 1.1,
                      child: Menu(
                        image: IMAGE_SCISSORS,
                        isSelected: game.playerIndex == 2,
                        onTap: () {
                          setState(() {
                            game.playerIndex = 2;
                            game.playerChoice = IMAGE_SCISSORS;
                            game.computerPick();
                            game.check(
                              context,
                              onPressed: () {
                                setState(() {
                                  game.resetState();
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
          ),
        ),
      ),
    );
  }
}
