import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/topic_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:butex_notebot/views/notes_topic_content_view/notes_topic_content_view.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class TopicsView extends StatelessWidget {
  final String? subjectRoute;
  final String? subjectName;
  const TopicsView({
    Key? key,
    required this.subjectName,
    required this.subjectRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    Future<List<Topic>> _notesTopicList =
        HttpService().getTopics(subjectRoute: subjectRoute!);

    //
    _getNotesTopicList() async {
      _notesTopicList = HttpService().getTopics(subjectRoute: subjectRoute!);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("$subjectName"),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => HomeView());
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Container(
          child: FutureBuilder<List<Topic>>(
            future: _notesTopicList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var topicList = snapshot.data;
                return RefreshIndicator(
                  onRefresh: _getNotesTopicList,
                  child: ListView.separated(
                    itemCount: topicList!.length,
                    itemBuilder: (context, index) {
                      var topicData = topicList[index];
                      return reusableListTile(
                          context: context,
                          title: topicData.topic,
                          trailer: topicData.url == null
                              ? Icon(Icons.arrow_forward_ios_sharp)
                              : Icon(Icons.launch),
                          onTap: () async {
                            await networkController.checkConnectivity();
                            if (networkController.isConnected.value) {
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
                            } else {
                              customSnackBar(
                                context,
                                message: "No Internet !",
                                bg: Color(0xffaf2031),
                              );
                            }
                          });
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: Colors.grey,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: _getNotesTopicList,
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
                  onRefresh: _getNotesTopicList,
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
