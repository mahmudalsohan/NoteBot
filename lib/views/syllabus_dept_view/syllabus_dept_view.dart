import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/departments.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:butex_notebot/views/syllabus_level_term_view/syllabus_level_term_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/level_selection_tile.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SyllabusDeptView extends StatelessWidget {
  final String route;
  const SyllabusDeptView({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    Future<List<Departments>> _departments =
        HttpService().getDepartments(route);
    //
    _getDepartments() async {
      _departments = HttpService().getDepartments(route);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Department"),
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => HomeView()),
              icon: Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: FutureBuilder<List<Departments>>(
              future: _departments,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var deptsList = snapshot.data;
                  return RefreshIndicator(
                    onRefresh: _getDepartments,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: deptsList!.length,
                      itemBuilder: (context, index) {
                        var deptData = deptsList[index];
                        return reusableListTile(
                          title: "${deptData.dept}",
                          trailer: Icon(Icons.arrow_forward_ios_sharp),
                          onTap: () async {
                            await networkController.checkConnectivity();
                            if (networkController.isConnected.value)
                              Get.to(() => SyllabusLevelTermView(
                                  dept: deptData.dept, route: deptData.route));
                            else
                              customSnackBar(context, message: "No Network !");
                          },
                          context: context,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(color: Colors.grey),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return RefreshIndicator(
                    onRefresh: _getDepartments,
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
                    onRefresh: _getDepartments,
                    child: SkeletonLoading(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
