import 'dart:ffi';

import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/views/lab_reports_levels_view/lab_reports_levels_view.dart';
import 'package:butex_notebot/views/notes_levels_view/notes_levels_view.dart';
import 'package:butex_notebot/views/entertainment_views/entertainment_home.dart';
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
          Container(
            height: 570,
            child: GridView.count(
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
                    Get.to(() => LabReportsLevelsView());
                  },
                ),
                FunctionTile(
                  title: "Notice",
                  imagePath: imageNoticeSection,
                  onPress: () {},
                ),
                FunctionTile(
                  title: "Syllabus",
                  imagePath: imageSyllabusSection,
                  onPress: () {},
                ),
                FunctionTile(
                  title: "Tools",
                  imagePath: imageToolsSection,
                  onPress: () {},
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
          ),
        ],
      ),
    );
  }
}
