import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/components/dialog.dart';
import 'package:rock_paper_scissors/constants/constant.dart';
import 'package:rock_paper_scissors/game/game.dart';

class NormalMode implements Game {
  
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
    random = Random().nextInt(3);
    if (random == 0) {
      computerChoice = IMAGE_ROCK;
    } else if (random == 1) {
      computerChoice = IMAGE_PAPER;
    } else if (random == 2) {
      computerChoice = IMAGE_SCISSORS;
    }
  }

  @override
  void check(context, {onPressed}) {
    if (playerIndex == 0 && random == 0 ||
        playerIndex == 1 && random == 1 ||
        playerIndex == 2 && random == 2) {
      stateDialog(context, 'DRAW!', onPressed);
    } else if (playerIndex == 0 && random == 1 ||
        playerIndex == 1 && random == 2 ||
        playerIndex == 2 && random == 0) {
      computerScore++;
      stateDialog(context, 'YOU LOSE!', onPressed);
    } else {
      playerScore++;
      stateDialog(context, 'YOU WON!', onPressed);
    }
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
