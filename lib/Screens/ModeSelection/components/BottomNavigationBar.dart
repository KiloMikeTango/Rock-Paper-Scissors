import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNavBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int)? onTabChange;

  const MyNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.purple.shade900,
      tabBorderRadius: 15,
      rippleColor: Colors.deepPurple.shade300,
      mainAxisAlignment: MainAxisAlignment.center,
      textStyle: const TextStyle(fontSize: 18.5, color: Colors.white),
      iconSize: 37,
      gap: 5,
      selectedIndex: widget.currentIndex,
      onTabChange: widget.onTabChange,
      tabs: [
        GButton(
          icon: Icons.gamepad_outlined,
          iconActiveColor: Colors.deepPurple.shade200,
          iconColor: Colors.deepPurple.shade100,
          text: 'Game Modes',
        ),
        GButton(
          icon: Icons.history,
          iconActiveColor: Colors.deepPurple.shade200,
          iconColor: Colors.deepPurple.shade100,
          text: 'Game Records',
        ),
      ],
    );
  }
}
