import 'package:butex_notebot/models/lab_subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:flutter/material.dart';

class LabSubjectsView extends StatelessWidget {
  final int level;
  const LabSubjectsView({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Level $level"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Container(
          child: FutureBuilder<List<LabSubject>>(
            future: HttpService().getLabSubjects(level),
            builder: (context, subjects) {
              if (subjects.hasData) {
                var subjectList = subjects.data;
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: subjectList!.length,
                  itemBuilder: (context, index) {
                    var subjectData = subjectList[index];
                    return reusableListTile(
                      context: context,
                      title: subjectData.subName,
                      onTap: () {
                        print("Route: ${subjectData.route}");
                      },
                      trailer: Icon(Icons.arrow_forward_ios_sharp),
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
