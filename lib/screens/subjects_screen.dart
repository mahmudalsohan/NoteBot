import 'package:butex_notebot/provider/subjects_provider.dart';
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
                itemCount: subjectList!.length,
                itemBuilder: (context, index) {
                  var subjectData = subjectList[index];
                  return ListTile(
                    title: Text(subjectData.subName ?? ""),
                    subtitle: subjectData.route == null
                        ? Text(subjectData.url)
                        : Text(subjectData.route),
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
