import 'package:butex_notebot/views/academic_views/subjects_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Select Level",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ListTile(
              title: Text("Level 1"),
              //imagePath: levelOneImage,
              onTap: () {
                Get.to(() => SubjectsScreen(level: 1));
              },
            ),
            ListTile(
              title: Text("Level 2"),
              //imagePath: levelTwoImage,
              onTap: () {
                Get.to(() => SubjectsScreen(level: 2));
              },
            ),
            ListTile(
              title: Text("Level 3"),
              //imagePath: levelThreeImage,
              onTap: () {
                Get.to(() => SubjectsScreen(level: 3));
              },
            ),
            ListTile(
              title: Text("Level 4"),
              //imagePath: levelFourImage,
              onTap: () {
                Get.to(() => SubjectsScreen(level: 4));
              },
            ),
          ],
        ),
      ),
    );
  }
}
