import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/models/syllabus_batch.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/lab_reports/lab_subject/lab_subjects_view.dart';
import 'package:butex_notebot/views/syllabus/syllabus_dept_view.dart';
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
        title: "Select Batch",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Text(
                    "📝 Choose Your Batch for Syllabus -",
                    style: AppTextStyles().kLevelsViewTitleTextStyle,
                  ),
                ),
                SizedBox(height: 50),
                FutureBuilder<List<SyllabusBatch>>(
                    future: HttpService().getSyllabusBatches("app/syllabus"),
                    builder: (context, batches) {
                      if (batches.hasData) {
                        var batchList = batches.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: batchList!.length,
                          itemBuilder: (context, index) {
                            var batchData = batchList[index];
                            return LevelSelectionTile(
                              title: "Batch ${batchData.batch}",
                              onTap: () {
                                Get.to(() => SyllabusDeptView(
                                      route: batchData.route,
                                    ));
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
            Positioned(
              right: 20,
              bottom: 10,
              child: Image(
                height: 150,
                width: 150,
                image: AssetImage(imageSyllabusSection),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
