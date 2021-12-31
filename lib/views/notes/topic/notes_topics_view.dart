import 'package:butex_notebot/models/topic_model.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/views/notes/topic/topic_controller.dart';
import 'package:butex_notebot/views/notes/topic_content/notes_topic_content_view.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class TopicsView extends GetView<NotesTopicController> {
  final String? subjectRoute;
  final String? subjectName;
  const TopicsView({
    Key? key,
    required this.subjectName,
    required this.subjectRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<NotesTopicController>(NotesTopicController(subjectRoute));

    return Scaffold(
      appBar: AppBar(
        title: Text("$subjectName"),
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
          child: FutureBuilder<List<Topic>>(
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
                                  Get.to(() => NotesTopicContentView(
                                        topicName: topicData.topic,
                                        topicRoute: topicData.route,
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
                                  Get.to(() => NotesTopicContentView(
                                        topicName: topicData.topic,
                                        topicRoute: topicData.route,
                                      ));
                                } else {
                                  UrlLauncher.openUrl(
                                    url: topicData.url,
                                    context: context,
                                  );
                                }
                              });
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
