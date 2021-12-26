import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/lab_subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/views/lab_reports/lab_subject/lab_subject_controller.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../lab_topic/lab_topics_view.dart';

class LabSubjectsView extends GetView<LabSubjectController> {
  final int level;
  const LabSubjectsView({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    Get.put<LabSubjectController>(LabSubjectController(level));

    return Scaffold(
      appBar: AppBar(
        title: Text("Level $level"),
        actions: [
          IconButton(
              onPressed: () {
                EasyLoading.show(status: "Loading...");
                controller.reload();
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () => Get.offAll(() => HomeView()),
              icon: Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Container(
          child: FutureBuilder<List<LabSubject>>(
            future: controller.subject.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var subjectList = snapshot.data;
                return RefreshIndicator(
                  onRefresh: () {
                    EasyLoading.show(status: "Loading...");
                    return controller.reload();
                  },
                  child: ListView.builder(
                    itemCount: subjectList!.length,
                    itemBuilder: (context, index) {
                      var subjectData = subjectList[index];
                      return reusableListTile(
                        context: context,
                        title: subjectData.subName,
                        onTap: () {
                          Get.to(
                            () => LabTopicsView(
                              subName: subjectData.subName,
                              route: subjectData.route,
                            ),
                          );
                        },
                        trailer: Icon(Icons.arrow_forward_ios_sharp),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: () {
                    EasyLoading.show(status: "Loading...");
                    return controller.reload();
                  },
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: ErrorScreen(
                      errMsg: "Not Available yet",
                    ),
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () {
                    EasyLoading.show(status: "Loading...");
                    return controller.reload();
                  },
                  child: SkeletonLoading(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
