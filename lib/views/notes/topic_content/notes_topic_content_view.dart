import 'package:butex_notebot/models/topic_content_model.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/views/notes/topic_content/topic_content_controller.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class NotesTopicContentView extends GetView<NotesTopicContentController> {
  const NotesTopicContentView({
    Key? key,
    required this.topicName,
    required this.topicRoute,
  }) : super(key: key);

  final String? topicRoute;
  final String topicName;

  @override
  Widget build(BuildContext context) {
    //
    Get.put<NotesTopicContentController>(
        NotesTopicContentController(topicRoute));
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("$topicName"),
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
          vertical: 10,
        ),
        child: Container(
          child: FutureBuilder<List<TopicContent>>(
            future: controller.topicContents.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var topicContentList = snapshot.data;
                return RefreshIndicator(
                  onRefresh: () {
                    EasyLoading.show(status: "Loading...");
                    return controller.reload();
                  },
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: topicContentList!.length,
                    itemBuilder: (context, index) {
                      var topicContentData = topicContentList[index];
                      return contentListTile(
                        context: context,
                        title: topicContentData.title,
                        onTap: () {
                          UrlLauncher.openUrl(
                            url: topicContentData.url,
                            context: context,
                          );
                        },
                        trailer: Icon(Icons.launch),
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
