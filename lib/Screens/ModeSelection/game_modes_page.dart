import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/Screens/GamePage/game_page.dart';

class GameModePage extends StatelessWidget {
  const GameModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple.shade900, Colors.deepPurple.shade600],
            ),
          ),
          child: DefaultTabController(
            length: 2,
            animationDuration: Duration(milliseconds: 650),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Choose Your Difficulty',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const TabBar(
                  labelStyle: TextStyle(fontSize: 17),
                  indicatorColor: Colors.white,
                  indicatorWeight: 2.0,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white54,
                  tabs: [
                    Tab(text: 'Easy'),
                    Tab(text: 'Impossible'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Easy Game Mode Details
                      _GameDetailsStateful(
                        icon: Icons.filter_vintage_outlined,
                        title: 'Easy Mode',
                        description: 'The program picks randomly in this mode!',
                        onPlay: (rounds) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GamePage(),
                            ),
                          );
                          print('Playing Easy mode with $rounds rounds.');
                          mode = 'Easy';
                        },
                      ),
                    
                      // Hard Game Mode Details
                      _GameDetailsStateful(
                        icon: Icons.local_fire_department_outlined,
                        title: 'Impossible Mode',
                        description:
                            'You have 0% chance of winning in this mode!',
                        onPlay: (rounds) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => GamePage()),
                          );
                          print('Playing Hard mode with $rounds rounds.');
                          mode = 'Impossible';
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// A new StatefulWidget to manage the state of round selection
class _GameDetailsStateful extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final void Function(int rounds) onPlay;

  const _GameDetailsStateful({
    required this.icon,
    required this.title,
    required this.description,
    required this.onPlay,
  });

  @override
  _GameDetailsStatefulState createState() => _GameDetailsStatefulState();
}

class _GameDetailsStatefulState extends State<_GameDetailsStateful> {
  int _selectedRounds = 3; // Default selection

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(widget.icon, size: 100, color: Colors.white),
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 40),
          // Label for round selection
          const Text(
            'Number of rounds',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          // Round Selection Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRoundButton(3),
              const SizedBox(width: 15),
              _buildRoundButton(5),
              const SizedBox(width: 15),
              _buildRoundButton(10),
            ],
          ),
          const SizedBox(height: 40),
          // Play Button
          ElevatedButton(
            onPressed: () => widget.onPlay(_selectedRounds),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.purple.shade900,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
            ),
            child: const Text(
              'Play Now',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundButton(int rounds) {
    final bool isSelected = _selectedRounds == rounds;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedRounds = rounds;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Colors.deepPurple.shade200
            : Colors.white.withOpacity(0.2),
        foregroundColor: isSelected ? Colors.purple.shade900 : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      ),
      child: Text(
        '$rounds',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
