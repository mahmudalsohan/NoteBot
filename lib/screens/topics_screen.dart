import 'package:butex_notebot/provider/topics_provider.dart';
import 'package:butex_notebot/screens/topic_content_screen.dart';
import 'package:butex_notebot/utils/open_url.dart';
import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {
  final String subjectRoute;
  final String subjectName;
  const TopicsScreen({
    Key? key,
    required this.subjectName,
    required this.subjectRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: TopicsProvider().getTopics(subjectRoute),
          builder: (context, topics) {
            if (topics.hasData) {
              var topicList = topics.data;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: topicList!.length,
                itemBuilder: (context, index) {
                  var topicData = topicList[index];
                  return InkWell(
                    onTap: () {
                      if (topicData.url == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopicContentScreen(
                              topicName: topicData.topic,
                              topicRoute: topicData.route,
                            ),
                          ),
                        );
                      } else {
                        UrlLauncher.openUrl(url: topicData.url);
                      }
                    },
                    child: ListTile(
                      title: Text(topicData.topic),
                      subtitle: Text(
                        topicData.route ?? topicData.url,
                      ),
                    ),
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
