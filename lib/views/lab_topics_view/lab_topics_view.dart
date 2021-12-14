import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/lab_topics.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/lab_topic_content_view/lab_topic_content_view.dart';
import 'package:butex_notebot/views/notes_topic_content_view/topic_content_view.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LabTopicsView extends StatelessWidget {
  final String route;
  final String subName;
  const LabTopicsView({
    Key? key,
    required this.route,
    required this.subName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$subName"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Container(
          child: FutureBuilder<List<LabTopics>>(
            future: HttpService().getLabTopics(route),
            builder: (context, topics) {
              if (topics.hasData) {
                var topicList = topics.data;
                return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: topicList!.length,
                  itemBuilder: (context, index) {
                    var topicData = topicList[index];
                    return reusableListTile(
                      context: context,
                      title: topicData.topic,
                      onTap: () async {
                        await networkController.checkConnectivity();
                        if (networkController.isConnected.value) {
                          if (topicData.url == null) {
                            Get.to(() => LabTopicContentView(
                                route: topicData.route,
                                topicName: topicData.topic));
                          } else {
                            UrlLauncher.openUrl(url: topicData.url);
                          }
                        } else {
                          customSnackBar(context, message: "No Internet !");
                        }
                      },
                      trailer: topicData.route == null
                          ? Icon(Icons.launch)
                          : Icon(Icons.arrow_forward_ios_sharp),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: Colors.grey,
                  ),
                );
              } else {
                return SkeletonLoading();
              }
            },
          ),
        ),
      ),
    );
  }
}
