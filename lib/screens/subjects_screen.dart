import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/screens/topics_screen.dart';
import 'package:butex_notebot/utils/open_url.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SubjectsScreen extends StatelessWidget {
  final int level;
  const SubjectsScreen({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Level $level"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10,),
        child: Container(
          child: FutureBuilder<List<Subject>>(
            future: HttpService().getSubjects(level: level),
            builder: (BuildContext context, subjects) {
              print("subjects.data: ${subjects.data}");
              if (subjects.hasData) {
                var subjectList = subjects.data;
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: subjectList!.length,
                  itemBuilder: (context, index) {
                    var subjectData = subjectList[index];
                    return reusableListTile(
                        subjectName: subjectData.subName,
                        trailer: subjectData.url == null ? Icon(Icons.arrow_forward_ios_sharp) : Icon(Icons.launch),
                        onTap: (){
                          if (subjectData.url == null) {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: TopicsScreen(
                                  subjectRoute: subjectData.route,
                                  subjectName: subjectData.subName,
                                ),),);
                          } else {
                            UrlLauncher.openUrl(url: subjectData.url);
                          }
                        }
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
      ),
    );
  }
}
