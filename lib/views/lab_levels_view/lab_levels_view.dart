import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/views/lab_subjects_view/lab_subjects_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/level_selection_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LabLevelsView extends StatelessWidget {
  const LabLevelsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Select Level",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📒 Choose Level for Lab Reports -",
              style: AppTextStyles().kLevelsViewTitleTextStyle,
            ),
            SizedBox(height: 50),
            levelSelectionTile(
              title: "Level 1",
              onTap: () async {
                await networkController.checkConnectivity();
                if (networkController.isConnected.value)
                  Get.to(() => LabSubjectsView(level: 1));
                else
                  customSnackBar(context, message: "No Network !");
              },
            ),
            levelSelectionTile(
              title: "Level 2",
              onTap: () async {
                await networkController.checkConnectivity();
                if (networkController.isConnected.value) {
                  Get.to(() => LabSubjectsView(level: 2));
                } else {
                  customSnackBar(context, message: "No Network !");
                }
              },
            ),
            levelSelectionTile(
              title: "Level 3",
              onTap: () async {
                await networkController.checkConnectivity();
                if (networkController.isConnected.value)
                  Get.to(() => LabSubjectsView(level: 3));
                else
                  customSnackBar(context, message: "No Network !");
              },
            ),
          ],
        ),
      ),
    );
  }
}
