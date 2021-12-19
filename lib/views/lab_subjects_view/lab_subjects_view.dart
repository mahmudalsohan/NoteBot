import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/lab_subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/lab_topics_view//lab_topics_view.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LabSubjectsView extends StatelessWidget {
  final int level;
  const LabSubjectsView({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<LabSubject>> _labSubjectList =
        HttpService().getLabSubjects(level);
    _getSubjectList() async {
      _labSubjectList = HttpService().getLabSubjects(level);
    }

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
            future: _labSubjectList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var subjectList = snapshot.data;
                return RefreshIndicator(
                  onRefresh: _getSubjectList,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: subjectList!.length,
                    itemBuilder: (context, index) {
                      var subjectData = subjectList[index];
                      return reusableListTile(
                        context: context,
                        title: subjectData.subName,
                        onTap: () async {
                          await networkController.checkConnectivity();
                          if (networkController.isConnected.value) {
                            Get.to(
                              () => LabTopicsView(
                                subName: subjectData.subName,
                                route: subjectData.route,
                              ),
                            );
                          }
                        },
                        trailer: Icon(Icons.arrow_forward_ios_sharp),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(color: Colors.grey),
                  ),
                );
              } else if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: _getSubjectList,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Container(
                      height: Get.height,
                      width: Get.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.grey,
                            size: 50,
                          ),
                          Text("Not Available Yet"),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SkeletonLoading();
              }
            },
          ),
        ),
      ),
    );
  }
}
