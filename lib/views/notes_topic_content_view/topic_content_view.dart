import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/topic_content_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';

class NotesTopicContentView extends StatelessWidget {
  const NotesTopicContentView({
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Container(
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
                    return contentListTile(
                      context: context,
                      title: topicContentData.title,
                      onTap: () async {
                        await networkController.checkConnectivity();
                        if (networkController.isConnected.value) {
                          UrlLauncher.openUrl(url: topicContentData.url);
                        } else {
                          customSnackBar(
                            context,
                            message: "No Network !",
                            bg: Color(0xffaf2031),
                          );
                        }
                      },
                      trailer: Icon(Icons.launch),
                    );
                  },
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
