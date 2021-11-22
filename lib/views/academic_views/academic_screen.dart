import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/views/academic_views/levels_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({Key? key}) : super(key: key);

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
              title: "Notes",
              imagePath: noteSectionImage,
              onPress: () {
                Get.to(() => LevelsScreen());
              },
            ),
            FunctionTile(
              title: "Lab Reports",
              imagePath: labReportSectionImage,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
