import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/components/dialog.dart';
import 'package:rock_paper_scissors/constants/constant.dart';
import 'package:rock_paper_scissors/game/game.dart';

class ImpossibleMode implements Game {
  @override
  int computerScore = 0;
  @override
  int playerScore = 0;
  @override
  int? playerIndex = 4;
  @override
  int? random;

  @override
  String? computerChoice = IMAGE_NOTHING;
  @override
  String? playerChoice = IMAGE_NOTHING;

  @override
  void computerPick() {
    if (playerChoice == IMAGE_ROCK) {
      computerChoice = IMAGE_PAPER;
      computerScore++;
    } else if (playerChoice == IMAGE_PAPER) {
      computerChoice = IMAGE_SCISSORS;
      computerScore++;
    } else if (playerChoice == IMAGE_SCISSORS) {
      computerChoice = IMAGE_ROCK;
      computerScore++;
    }
  }

  @override
  void check(context, {onPressed}) {
    stateDialog(context, 'YOU LOSE!', onPressed);
  }

  @override
  void resetState() {
    computerChoice = IMAGE_NOTHING;
    playerChoice = IMAGE_NOTHING;
    playerIndex = 4;
  }

  @override
  Future<void> stateDialog(
    context,
    String title,
    Function()? onContinue,
  ) async {
    Future.delayed(
      Duration(milliseconds: 600),
      () => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return DialogBox(title: title, onContinue: onContinue);
        },
      ),
    );
  }
}
