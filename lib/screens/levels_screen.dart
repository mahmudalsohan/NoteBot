import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/screens/subjects_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Provider.of<ThemeProvider>(context).isDarkTheme;

    return Scaffold(
      appBar: customAppBar(isDarkTheme),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            FunctionTile(
              title: "Level 1",
              imagePath: "assets/images/l1.png",
              isDarkTheme: isDarkTheme,
              onPress: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: SubjectsScreen(level: 1),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            FunctionTile(
              title: "Level 2",
              imagePath: "assets/images/l2.png",
              isDarkTheme: isDarkTheme,
              onPress: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: SubjectsScreen(level: 2),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            FunctionTile(
              title: "Level 3",
              imagePath: "assets/images/l3.png",
              isDarkTheme: isDarkTheme,
              onPress: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: SubjectsScreen(level: 3),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            FunctionTile(
              title: "Level 4",
              imagePath: "assets/images/l4.png",
              isDarkTheme: isDarkTheme,
              onPress: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: SubjectsScreen(level: 4),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
