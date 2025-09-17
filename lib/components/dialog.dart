import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rock_paper_scissors/Screens/HomePage/home_page.dart';

class DialogBox extends StatefulWidget {
  final String? title;
  final Function()? onContinue;
  const DialogBox({super.key, required this.title, required this.onContinue});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  LinearGradient _getGradient() {
    if (widget.title == "You Win!") {
      return LinearGradient(
        colors: [Colors.greenAccent, Colors.teal],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );
    } else if (widget.title == "You Lose!") {
      return LinearGradient(
        colors: [Colors.redAccent, Colors.deepOrange],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );
    } else {
      return LinearGradient(
        colors: [Colors.deepPurpleAccent, Colors.indigo],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );
    }
  }

  String _getEmoji() {
    if (widget.title == "YOU WON!") return "🎉";
    if (widget.title == "YOU LOSE!") return "😢";
    return "🤝";
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation, // smooth pop-in effect
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          height: 210,
          width: 400,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: _getGradient(),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_getEmoji(), style: TextStyle(fontSize: 40)),
              SizedBox(height: 10),
              Text(
                widget.title ?? "",
                textAlign: TextAlign.center,
                style: GoogleFonts.shareTech(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white, // better contrast
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                    icon: Icon(Icons.exit_to_app, color: Colors.white),
                    label: Text(
                      'Exit',
                      style: GoogleFonts.shareTech(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    onPressed: widget.onContinue,
                    icon: Icon(Icons.replay, color: Colors.blueAccent),
                    label: Text(
                      'Continue',
                      style: GoogleFonts.shareTech(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.all(0.0),
      ),
    );
  }
}
