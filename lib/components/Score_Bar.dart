import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rock_paper_scissors/game/game.dart';

class ScoreBar extends StatefulWidget {
  int playerScore;
  int computerScore;
  ScoreBar({super.key, required this.playerScore, required this.computerScore});

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.black.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: Colors.blueAccent, size: 28),
              SizedBox(width: 8),
              Text(
                //Player's score
                "You: ${widget.playerScore}",
                style: GoogleFonts.shareTech(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          Row(
            children: [
              //Computer's score
              Text(
                "Computer: ${widget.computerScore}",
                style: GoogleFonts.shareTech(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.smart_toy, color: Colors.redAccent, size: 28),
            ],
          ),
        ],
      ),
    );
  }
}
