import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/Screens/ModeSelection/components/BottomNavigationBar.dart';
import 'package:rock_paper_scissors/Screens/ModeSelection/game_modes_page.dart';
import 'package:rock_paper_scissors/Screens/ModeSelection/game_record_page.dart';

class ModeSelectionPage extends StatefulWidget {
  const ModeSelectionPage({super.key});

  @override
  State<ModeSelectionPage> createState() => _ModeSelectionPageState();
}

class _ModeSelectionPageState extends State<ModeSelectionPage> {
  int index = 0;

  List<Widget> pages = [GameModePage(), GameRecordPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavBar(
        currentIndex: index,
        onTabChange: (value) {
          setState(() {
            index = value;
          });
        },
      ),

      body: pages[index],
    );
  }
}
