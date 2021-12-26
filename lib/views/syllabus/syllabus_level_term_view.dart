import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/level_and_term.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SyllabusLevelTermView extends StatelessWidget {
  final String dept;
  final String route;
  const SyllabusLevelTermView({
    Key? key,
    required this.dept,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    Future<List<LevelAndTerm>> _syllabus = HttpService().getSyllabus(route);
    //
    _getSyllabus() async {
      _syllabus = HttpService().getSyllabus(route);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Term"),
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => HomeView()),
              icon: Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          child: FutureBuilder<List<LevelAndTerm>>(
            future: _syllabus,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var termsList = snapshot.data;
                return RefreshIndicator(
                  onRefresh: _getSyllabus,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: termsList!.length,
                    itemBuilder: (context, index) {
                      var termsData = termsList[index];
                      return reusableListTile(
                        trailer: Icon(Icons.launch),
                        title: "${termsData.topic}",
                        onTap: () async {
                          await networkController.checkConnectivity();
                          if (networkController.isConnected.value)
                            UrlLauncher.openUrl(
                              url: termsData.url,
                              context: context,
                            );
                          else
                            customSnackBar(context, message: "No Network !");
                        },
                        context: context,
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: _getSyllabus,
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
                  onRefresh: _getSyllabus,
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
