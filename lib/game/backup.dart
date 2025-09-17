// import 'package:flutter/material.dart';

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:rock_paper_scissors/components/dialog.dart';
// import 'package:rock_paper_scissors/constants/constant.dart';

// abstract class Game {
//   int _computerScore = 0;
//   int _playerScore = 0;
//   int? random;
//   int playerIndex = 4; 

//   String computerChoice = IMAGE_NOTHING;
//   String playerChoice = IMAGE_NOTHING;

//   int get computerScore => _computerScore;
//   int get playerScore => _playerScore;

//   void computerPick() {
//     random = Random().nextInt(3);
//     if (random == 0) {
//       computerChoice = IMAGE_ROCK;
//     } else if (random == 1) {
//       computerChoice = IMAGE_PAPER;
//     } else if (random == 2) {
//       computerChoice = IMAGE_SCISSORS;
//     }
//   }

//   void resetState() {
//     computerChoice = IMAGE_NOTHING;
//     playerChoice = IMAGE_NOTHING;
//     playerIndex = 4;
//   }

//   void check(context, {onPressed}) {
//     if (playerIndex == 0 && random == 0 ||
//         playerIndex == 1 && random == 1 ||
//         playerIndex == 2 && random == 2) {
//       stateDialog(context, 'DRAW!', onPressed);
//     } else if (playerIndex == 0 && random == 1 ||
//         playerIndex == 1 && random == 2 ||
//         playerIndex == 2 && random == 0) {
//       _computerScore++;
//       stateDialog(context, 'YOU LOSE!', onPressed);
//     } else {
//       _playerScore++;
//       stateDialog(context, 'YOU WON!', onPressed);
//     }
//   }

//   Future<void> stateDialog(
//     context,
//     String title,
//     Function()? onPlayAgain,
//   ) async {
//     Future.delayed(
//       Duration(milliseconds: 600),
//       () => showDialog(
//         barrierDismissible: false,
//         context: context,
//         builder: (context) {
//           return DialogBox(title: title, onPlayAgain: onPlayAgain);
//         },
//       ),
//     );
//   }
// }
