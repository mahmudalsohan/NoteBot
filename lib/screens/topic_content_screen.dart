import 'package:butex_notebot/models/topic_content_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/utils/open_url.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:flutter/material.dart';

class TopicContentScreen extends StatelessWidget {
  const TopicContentScreen({
    Key? key,
    required this.topicName,
    required this.topicRoute,
  }) : super(key: key);

  final String? topicRoute;
  final String topicName;

  @override
  Widget build(BuildContext context) {
    print(topicRoute);
    print(topicName);
    return Scaffold(
      appBar: AppBar(
        title: Text(topicName),
      ),
      body: Container(
        child: FutureBuilder<List<TopicContent>>(
          future: HttpService().getTopicContent(topicRoute!),
          builder: (context, topicContent) {
            if (topicContent.hasData) {
              var topicContentList = topicContent.data;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: topicContentList!.length,
                itemBuilder: (context, index) {
                  var topicContentData = topicContentList[index];
                  return reusableListTile(
                    subjectName: topicContentData.title,
                    onTap: () {
                      UrlLauncher.openUrl(url: topicContentData.url);
                    },
                    trailer: Icon(Icons.launch),
                  );
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
    );
  }
}
