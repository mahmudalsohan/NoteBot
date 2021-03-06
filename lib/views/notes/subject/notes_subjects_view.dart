import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/views/notes/topic/notes_topics_view.dart';
import 'package:butex_notebot/views/notes/subject/subject_controller.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../widgets/slidable_list_tile.dart';

class NotesSubjectsView extends GetView<NotesSubjectController> {
  final int level;
  const NotesSubjectsView({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<NotesSubjectController>(NotesSubjectController(level));
    return Scaffold(
      appBar: AppBar(
        title: Text("Level $level"),
        actions: [
          IconButton(
              onPressed: () {
                EasyLoading.show(status: "Loading...");
                controller.reload();
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () => Get.offAll(() => HomeView()),
              icon: Icon(Icons.home))
        ],
      ),
      body: Obx(() => Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 30,
                  width: Get.width,
                  color: Color(0xffff6600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Your score didn't appear? "),
                      InkWell(
                        onTap: () {
                          UrlLauncher.openUrl(
                              url: "https://m.me/tripto.afsin",
                              context: context);
                        },
                        child: Text(
                          "Contact Support",
                          style: TextStyle(
                            //color: Color(0xff7F34D9),
                            //color: Color(0xff7F34D9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 30,
                ),
                child: Container(
                  child: FutureBuilder<List<Subject>>(
                    future: controller.subject.value,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        var subjectList = snapshot.data;
                        return RefreshIndicator(
                          onRefresh: () {
                            EasyLoading.show(status: "Loading...");
                            return controller.reload();
                          },
                          child: ListView.separated(
                            itemCount: subjectList!.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    Divider(color: Colors.grey),
                            itemBuilder: (context, index) {
                              var subjectData = subjectList[index];
                              return SlidableListTile(
                                  route: subjectData.route,
                                  title: subjectData.subName,
                                  trailer: subjectData.url == null
                                      ? Icon(Icons.arrow_forward_ios_sharp)
                                      : IconButton(
                                          onPressed: () {
                                            Share.share("${subjectData.url}");
                                          },
                                          icon: Icon(Icons.share),
                                        ),
                                  onTap: () {
                                    if (subjectData.url == null) {
                                      Get.to(() => TopicsView(
                                            subjectRoute: subjectData.route,
                                            subjectName: subjectData.subName,
                                          ));
                                    } else {
                                      UrlLauncher.openUrl(
                                        url: subjectData.url,
                                        context: context,
                                      );
                                    }
                                  });
                            },
                          ),
                        );
                      }
                      //
                      //
                      else if (snapshot.hasError) {
                        return RefreshIndicator(
                          onRefresh: () {
                            EasyLoading.show(status: "Loading...");
                            return controller.reload();
                          },
                          child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            child: ErrorScreen(
                              errMsg: "Not Available",
                            ),
                          ),
                        );
                        //
                        //
                      } else {
                        return RefreshIndicator(
                            onRefresh: () {
                              EasyLoading.show(status: "Loading...");
                              return controller.reload();
                            },
                            child: SkeletonLoading());
                      }
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
