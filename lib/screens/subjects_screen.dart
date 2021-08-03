import 'package:butex_notebot/provider/subjects_provider.dart';
import 'package:butex_notebot/screens/topics_screen.dart';
import 'package:flutter/material.dart';

class SubjectsScreen extends StatelessWidget {
  final int level;
  const SubjectsScreen({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Level $level"),
      ),
      body: Container(
        child: FutureBuilder<dynamic>(
          future: SubjectsProvider().getSubjects(level),
          builder: (context, subjects) {
            if (subjects.hasData) {
              var subjectList = subjects.data;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: subjectList!.length,
                itemBuilder: (context, index) {
                  var subjectData = subjectList[index];
                  return InkWell(
                    onTap: () {
                      if (subjectData.route != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopicsScreen(
                              subjectRoute: subjectData.route,
                              subjectName: subjectData.subName,
                            ),
                          ),
                        );
                      }
                    },
                    child: ListTile(
                      title: Text(subjectData.subName),
                      subtitle: Text(subjectData.route ?? subjectData.url),
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