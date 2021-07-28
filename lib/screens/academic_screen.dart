import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/screens/notes_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/drawer_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:butex_notebot/widgets/top_Container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Provider.of<ThemeProvider>(context).isDarkTheme;
    return Scaffold(
      drawer: drawer(isDarkTheme),
      appBar: appBar(isDarkTheme),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            TopContainer(
              imagePath: "assets/images/academic.png",
              isDarkTheme: isDarkTheme,
              title: "Academic",
            ),
            Divider(
              color: isDarkTheme ? Colors.white : Colors.black,
              thickness: 2,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  FunctionTile(
                    title: "Notes",
                    imagePath: "assets/images/notes.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NotesScreen(),
                        ),
                      );
                    },
                  ),
                  FunctionTile(
                    title: "Lab Reports",
                    imagePath: "assets/images/lab_reports.png",
                    isDarkTheme: isDarkTheme,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
