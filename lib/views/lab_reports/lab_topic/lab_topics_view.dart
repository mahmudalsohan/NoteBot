import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/lab_topics.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/views/lab_reports/lab_topic_content/lab_topic_content_view.dart';
import 'package:butex_notebot/views/notes/topic_content/notes_topic_content_view.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'lab_topic_controller.dart';

class LabTopicsView extends GetView<LabTopicController> {
  final String route;
  final String subName;
  const LabTopicsView({
    Key? key,
    required this.route,
    required this.subName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<LabTopicController>(LabTopicController(route));

    return Scaffold(
      appBar: AppBar(
        title: Text("$subName"),
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: FutureBuilder<List<LabTopics>>(
            future: controller.topics.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var topicList = snapshot.data;
                return RefreshIndicator(
                  onRefresh: () {
                    EasyLoading.show(status: "Loading...");
                    return controller.reload();
                  },
                  child: ListView.builder(
                    itemCount: topicList!.length,
                    itemBuilder: (context, index) {
                      var topicData = topicList[index];
                      bool priority = topicData.topic.length > 15 == true;
                      return priority
                          ? contentListTile(
                              title: topicData.topic,
                              context: context,
                              trailer: topicData.url == null
                                  ? Icon(Icons.arrow_forward_ios_sharp)
                                  : IconButton(
                                      onPressed: () {
                                        Share.share("${topicData.url}");
                                      },
                                      icon: Icon(Icons.share),
                                    ),
                              onTap: () {
                                if (topicData.url == null) {
                                  Get.to(() => LabTopicContentView(
                                        topicName: topicData.topic,
                                        route: topicData.route,
                                      ));
                                } else {
                                  UrlLauncher.openUrl(
                                    url: topicData.url,
                                    context: context,
                                  );
                                }
                              },
                            )
                          : reusableListTile(
                              context: context,
                              title: topicData.topic,
                              onTap: () {
                                if (topicData.url == null) {
                                  Get.to(() => LabTopicContentView(
                                      route: topicData.route,
                                      topicName: topicData.topic));
                                } else {
                                  UrlLauncher.openUrl(
                                    url: topicData.url,
                                    context: context,
                                  );
                                }
                              },
                              trailer: topicData.route == null
                                  ? Icon(Icons.launch)
                                  : Icon(Icons.arrow_forward_ios_sharp),
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
                      errMsg: "Not Available",
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
