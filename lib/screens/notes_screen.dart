import 'package:butex_notebot/provider/theme_provider.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/drawer_widget.dart';
import 'package:butex_notebot/widgets/top_Container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

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
              imagePath: "assets/images/notes.png",
              isDarkTheme: isDarkTheme,
              title: "Notes",
            ),
            Divider(
              color: isDarkTheme ? Colors.white : Colors.black,
              thickness: 2,
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  _levelList(
                    title: "Level 1",
                    isDarkTheme: isDarkTheme,
                    onPress: () {},
                  ),
                  _levelList(
                    title: "Level 2",
                    isDarkTheme: isDarkTheme,
                    onPress: () {},
                  ),
                  _levelList(
                    title: "Level 3",
                    isDarkTheme: isDarkTheme,
                    onPress: () {},
                  ),
                  _levelList(
                    title: "Level 4",
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

  Widget _levelList({
    required String title,
    required bool isDarkTheme,
    required Function onPress,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {
          onPress();
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: isDarkTheme ? Colors.blueGrey : Colors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isDarkTheme ? Colors.blueGrey.shade900 : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
