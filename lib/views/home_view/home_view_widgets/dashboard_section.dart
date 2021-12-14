import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/lab_levels_view/lab_levels_view.dart';
import 'package:butex_notebot/views/notes_levels_view/notes_levels_view.dart';
import 'package:butex_notebot/views/entertainment_views/entertainment_home.dart';
import 'package:butex_notebot/views/notice_view/notice_view.dart';
import 'package:butex_notebot/views/syllabus_batch_view/syllabus_batch_view.dart';
import 'package:butex_notebot/views/tools_home_view/tools_home_view.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "🏠 Dashboard",
            style: AppTextStyles().kHomeViewTitleTextStyle,
          ),
          SizedBox(height: 15),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
            children: [
              FunctionTile(
                title: "Notes",
                imagePath: imageNotesSection,
                onPress: () {
                  Get.to(() => NotesLevelsView());
                },
              ),
              FunctionTile(
                title: "Lab Reports",
                imagePath: imageLabReportSection,
                onPress: () {
                  Get.to(() => LabLevelsView());
                },
              ),
              FunctionTile(
                title: "Notice",
                imagePath: imageNoticeSection,
                onPress: () {
                  Get.to(() => NoticeView());
                },
              ),
              FunctionTile(
                title: "Syllabus",
                imagePath: imageSyllabusSection,
                onPress: () async {
                  await networkController.checkConnectivity();
                  if (networkController.isConnected.value)
                    Get.to(() => SyllabusBatchView());
                  else
                    customSnackBar(context, message: "No Network !");
                },
              ),
              FunctionTile(
                title: "Tools",
                imagePath: imageToolsSection,
                onPress: () {
                  Get.to(() => ToolsHomeView());
                },
              ),
              FunctionTile(
                title: "Entertainment",
                imagePath: imageEntertainmentSection,
                onPress: () {
                  Get.to(() => EntertainmentHomeScreen());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
