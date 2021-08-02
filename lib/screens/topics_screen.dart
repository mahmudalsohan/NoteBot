import 'package:butex_notebot/provider/topicsProvider.dart';
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
        child: FutureBuilder<dynamic>(
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
                    onTap: () {},
                    child: ListTile(
                      title: Text(topicData.topic),
                      subtitle: Text(topicData.route ?? topicData.url),
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
