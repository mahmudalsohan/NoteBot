import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/lab_topic_content.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';

class LabTopicContentView extends StatelessWidget {
  final String topicName;
  final String? route;
  const LabTopicContentView({
    Key? key,
    required this.route,
    required this.topicName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$topicName"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Container(
          child: FutureBuilder<List<LabTopicContent>>(
            future: HttpService().getLabTopicContent(route!),
            builder: (context, topicContents) {
              if (topicContents.hasData) {
                var topicContentList = topicContents.data;
                return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: topicContentList!.length,
                  itemBuilder: (context, index) {
                    var topicContentData = topicContentList[index];
                    return reusableListTile(
                      context: context,
                      title: topicContentData.title,
                      onTap: () async {
                        await networkController.checkConnectivity();
                        if (networkController.isConnected.value) {
                          UrlLauncher.openUrl(url: topicContentData.url);
                        } else {
                          customSnackBar(context, message: "No Internet !");
                        }
                      },
                      trailer: Icon(Icons.launch),
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
