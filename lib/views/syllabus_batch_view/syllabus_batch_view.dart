import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/models/syllabus_batch.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/lab_subjects_view/lab_subjects_view.dart';
import 'package:butex_notebot/views/syllabus_dept_view/syllabus_dept_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:butex_notebot/widgets/level_selection_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SyllabusBatchView extends StatelessWidget {
  const SyllabusBatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: "Select Level",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📝 Choose Your Batch for Syllabus -",
              style: AppTextStyles().kLevelsViewTitleTextStyle,
            ),
            SizedBox(height: 50),
            FutureBuilder<List<SyllabusBatch>>(
                future: HttpService().getSyllabusBatches("app/syllabus"),
                builder: (context, batches) {
                  if (batches.hasData) {
                    var batchList = batches.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: batchList!.length,
                      itemBuilder: (context, index) {
                        var batchData = batchList[index];
                        return levelSelectionTile(
                          title: "Batch ${batchData.batch}",
                          onTap: () async {
                            await networkController.checkConnectivity();
                            if (networkController.isConnected.value)
                              Get.to(() => SyllabusDeptView(
                                    route: batchData.route,
                                  ));
                            else
                              customSnackBar(context, message: "No Network !");
                          },
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
