import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rock_paper_scissors/Screens/GamePage/game_page.dart';
import 'package:rock_paper_scissors/Screens/ModeSelection/mode_selection.dart';

class PlayNow extends StatelessWidget {
  final String buttontext;
  const PlayNow({super.key, required this.buttontext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ModeSelectionPage()),
        );
      },
      child: Container(
        width: 200,
        height: 55,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            buttontext,
            style: GoogleFonts.getFont(
              'Poppins',
              textStyle: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
