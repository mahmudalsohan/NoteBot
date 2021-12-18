import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/departments.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/syllabus_level_term_view/syllabus_level_term_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
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
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Select Department",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          child: FutureBuilder<List<Departments>>(
              future: HttpService().getDepartments(route),
              builder: (context, depts) {
                if (depts.hasData) {
                  var deptsList = depts.data;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
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
                  );
                } else {
                  return SkeletonLoading();
                }
              }),
        ),
      ),
    );
  }
}
