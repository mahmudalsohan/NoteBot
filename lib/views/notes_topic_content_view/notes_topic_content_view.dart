import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/topic_content_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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
    //
    Future<List<TopicContent>> _notesTopicContentList =
        HttpService().getTopicContent(topicRoute!);
    //
    _getNotesTopicContentList() async {
      _notesTopicContentList = HttpService().getTopicContent(topicRoute!);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("$topicName"),
        actions: [
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
            future: _notesTopicContentList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var topicContentList = snapshot.data;
                return RefreshIndicator(
                  onRefresh: _getNotesTopicContentList,
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
                            webView: true,
                          );
                        },
                        trailer: Icon(Icons.launch),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: _getNotesTopicContentList,
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
                  onRefresh: _getNotesTopicContentList,
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
