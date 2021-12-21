import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/lab_topics.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:butex_notebot/views/lab_topic_content_view/lab_topic_content_view.dart';
import 'package:butex_notebot/views/notes_topic_content_view/notes_topic_content_view.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
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
    Future<List<LabTopics>> _labTopics = HttpService().getLabTopics(route);
    _getLabTopics() async {
      _labTopics = HttpService().getLabTopics(route);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("$subName"),
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => HomeView()),
              icon: Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: FutureBuilder<List<LabTopics>>(
            future: _labTopics,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var topicList = snapshot.data;
                return RefreshIndicator(
                  onRefresh: _getLabTopics,
                  child: ListView.separated(
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
                  ),
                );
              } else if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: _getLabTopics,
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
                  onRefresh: _getLabTopics,
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
