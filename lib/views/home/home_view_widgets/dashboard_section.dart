import 'dart:developer';

import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/entertainment/entertainment_home.dart';
import 'package:butex_notebot/views/lab_reports/lab_levels_view.dart';
import 'package:butex_notebot/views/notes/notes_levels_view.dart';
import 'package:butex_notebot/views/notice/notice_view.dart';
import 'package:butex_notebot/views/result/result_view.dart';
import 'package:butex_notebot/views/routine/routine_view.dart';
import 'package:butex_notebot/views/syllabus/syllabus_batch_view.dart';
import 'package:butex_notebot/views/tools/tools_home_view.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "🏠 Dashboard",
            style: AppTextStyles().kHomeViewTitleTextStyle,
          ),
        ),
        Obx(
          () => GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: homeViewController.CAC.value,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: homeViewController.CAS.value,
            mainAxisSpacing: homeViewController.MAS.value,
            children: [
              FunctionTile(
                title: "Notes",
                image: AssetImage(imageNotesSection),
                onPress: () {
                  Get.to(() => NotesLevelsView());
                },
              ),
              FunctionTile(
                title: "Lab Reports",
                image: AssetImage(imageLabReportSection),
                onPress: () {
                  Get.to(() => LabLevelsView());
                },
              ),
              FunctionTile(
                title: "Notice",
                image: AssetImage(imageNoticeSection),
                onPress: () {
                  Get.to(() => NoticeView());
                },
              ),
              FunctionTile(
                title: "Syllabus",
                image: AssetImage(imageSyllabusSection),
                onPress: () {
                  Get.to(() => SyllabusBatchView());
                },
              ),
              FunctionTile(
                title: "Routine",
                image: AssetImage(imageRoutineSection),
                onPress: () {
                  Get.to(() => RoutineView());
                },
              ),
              FunctionTile(
                title: "Result",
                image: AssetImage(imageResultSection),
                onPress: () {
                  Get.to(() => ResultView());
                },
              ),
              FunctionTile(
                title: "Tools",
                image: AssetImage(imageToolsSection),
                onPress: () {
                  Get.to(() => ToolsHomeView());
                },
              ),
              FunctionTile(
                title: "Fun",
                image: AssetImage(imageEntertainmentSection),
                onPress: () {
                  Get.to(() => EntertainmentHomeScreen());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
