import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatefulWidget {
  final int level;
  const SubjectScreen({Key? key, required this.level}) : super(key: key);

  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  late HttpService http;
  late List<Subject> subjects;

  Future<List<dynamic>> getSubjects() async {
    Response response;

    response = await http.getRequest("/app/notes/${widget.level}");
    List<dynamic> subjects =
        response.data.map((data) => Subject.fromJson(data)).toList();
    return subjects;
  }

  @override
  void initState() {
    http = HttpService();
    getSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Level ${widget.level}"),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: getSubjects(),
          builder: (context, data) {
            if (data.hasData) {
              var subjectList = data.data;
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
