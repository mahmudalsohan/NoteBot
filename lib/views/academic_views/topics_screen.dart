import 'package:butex_notebot/models/topic_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/academic_views/topic_content_screen.dart';
import 'package:butex_notebot/utils/open_url.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class TopicsScreen extends StatelessWidget {
  final String? subjectRoute;
  final String? subjectName;
  const TopicsScreen({
    Key? key,
    required this.subjectName,
    required this.subjectRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Container(
          child: FutureBuilder<List<Topic>>(
            future: HttpService().getTopics(subjectRoute: subjectRoute!),
            builder: (context, topics) {
              if (topics.hasData) {
                var topicList = topics.data;
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: topicList!.length,
                  itemBuilder: (context, index) {
                    var topicData = topicList[index];
                    return reusableListTile(
                        title: topicData.topic,
                        trailer: topicData.url == null
                            ? Icon(Icons.arrow_forward_ios_sharp)
                            : Icon(Icons.launch),
                        onTap: () {
                          if (topicData.url == null) {
                            Get.to(TopicContentScreen(
                              topicName: topicData.topic,
                              topicRoute: topicData.route,
                            ));
                          } else {
                            UrlLauncher.openUrl(url: topicData.url);
                          }
                        });
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
