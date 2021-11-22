import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/views/academic_views/subjects_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
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
              imagePath: levelOneImage,
              onPress: () {
                Get.to(() => SubjectsScreen(level: 1));
              },
            ),
            FunctionTile(
              title: "Level 2",
              imagePath: levelTwoImage,
              onPress: () {
                Get.to(() => SubjectsScreen(level: 2));
              },
            ),
            FunctionTile(
              title: "Level 3",
              imagePath: levelThreeImage,
              onPress: () {
                Get.to(() => SubjectsScreen(level: 3));
              },
            ),
            FunctionTile(
              title: "Level 4",
              imagePath: levelFourImage,
              onPress: () {
                Get.to(() => SubjectsScreen(level: 4));
              },
            ),
          ],
        ),
      ),
    );
  }
}
