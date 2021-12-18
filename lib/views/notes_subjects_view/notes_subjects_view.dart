import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/notes_topics_view/notes_topics_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'notes_subjects_view_widgets/slidable_list_tile.dart';

class NotesSubjectsView extends StatelessWidget {
  final int level;
  const NotesSubjectsView({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Level: $level",
      ),
      body: Container(
        child: FutureBuilder<List<Subject>>(
          future: HttpService().getSubjects(level: level),
          builder: (BuildContext context, subjects) {
            if (subjects.hasData) {
              var subjectList = subjects.data;
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: subjectList!.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  var subjectData = subjectList[index];
                  return SlidableListTile(
                      route: subjectData.route,
                      title: subjectData.subName,
                      trailer: subjectData.url == null
                          ? Icon(Icons.arrow_forward_ios_sharp)
                          : Icon(Icons.launch),
                      onTap: () async {
                        await networkController.checkConnectivity();
                        if (networkController.isConnected.value) {
                          if (subjectData.url == null) {
                            Get.to(() => TopicsView(
                                  subjectRoute: subjectData.route,
                                  subjectName: subjectData.subName,
                                ));
                          } else {
                            UrlLauncher.openUrl(url: subjectData.url);
                          }
                        } else {
                          customSnackBar(
                            context,
                            message: "No Network !",
                            bg: Color(0xffaf2031),
                          );
                        }
                      });
                },
              );
            } else {
              return SkeletonLoading();
            }
          },
        ),
      ),
    );
  }
}
