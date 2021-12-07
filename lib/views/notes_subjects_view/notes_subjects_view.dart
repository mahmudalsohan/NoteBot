import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/academic_views/topics_screen.dart';
import 'package:butex_notebot/utils/open_url.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Container(
          child: FutureBuilder<List<Subject>>(
            future: HttpService().getSubjects(level: level),
            builder: (BuildContext context, subjects) {
              if (subjects.hasData) {
                var subjectList = subjects.data;
                return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: subjectList!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(thickness: 2),
                  itemBuilder: (context, index) {
                    var subjectData = subjectList[index];
                    return SlidableListTile(
                        route: subjectData.route,
                        title: subjectData.subName,
                        trailer: subjectData.url == null
                            ? Icon(Icons.arrow_forward_ios_sharp)
                            : Icon(Icons.launch),
                        onTap: () {
                          if (subjectData.url == null) {
                            Get.to(() => TopicsScreen(
                                  subjectRoute: subjectData.route,
                                  subjectName: subjectData.subName,
                                ));
                          } else {
                            UrlLauncher.openUrl(url: subjectData.url);
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
