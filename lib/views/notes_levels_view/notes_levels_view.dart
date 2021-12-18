import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/views/notes_subjects_view/notes_subjects_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/level_selection_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class NotesLevelsView extends StatelessWidget {
  const NotesLevelsView({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Text(
                    "📖 Choose Level for Notes -",
                    style: AppTextStyles().kLevelsViewTitleTextStyle,
                  ),
                ),
                SizedBox(height: 40),
                LevelSelectionTile(
                  title: "Level 1",
                  onTap: () async {
                    await networkController.checkConnectivity();
                    if (networkController.isConnected.value)
                      Get.to(() => NotesSubjectsView(level: 1));
                    else
                      customSnackBar(
                        context,
                        message: "No Network !",
                        bg: Color(0xffaf2031),
                      );
                  },
                ),
                LevelSelectionTile(
                  title: "Level 2",
                  onTap: () async {
                    await networkController.checkConnectivity();
                    if (networkController.isConnected.value) {
                      Get.to(() => NotesSubjectsView(level: 2));
                    } else {
                      customSnackBar(
                        context,
                        message: "No Network !",
                        bg: Color(0xffaf2031),
                      );
                    }
                  },
                ),
                LevelSelectionTile(
                  title: "Level 3",
                  onTap: () async {
                    await networkController.checkConnectivity();
                    if (networkController.isConnected.value)
                      Get.to(() => NotesSubjectsView(level: 3));
                    else
                      customSnackBar(
                        context,
                        message: "No Network !",
                        bg: Color(0xffaf2031),
                      );
                  },
                ),
                LevelSelectionTile(
                  title: "Level 4",
                  onTap: () async {
                    await networkController.checkConnectivity();
                    if (networkController.isConnected.value)
                      Get.to(() => NotesSubjectsView(level: 4));
                    else
                      customSnackBar(
                        context,
                        message: "No Network !",
                        bg: Color(0xffaf2031),
                      );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Image(
              height: 150,
              width: 150,
              image: AssetImage(imageNotesSection),
            ),
          ],
        ),
      ),
    );
  }
}
