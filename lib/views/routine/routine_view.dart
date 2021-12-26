import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:butex_notebot/widgets/reusable_list_tile.dart';
import 'package:butex_notebot/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    refresh() async {
      networkController.checkConnectivity();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Routine"),
      ),
      body: Obx(
        () => Container(
          child: networkController.routineList.length > 0
              ? RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                    itemCount: networkController.routineList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final routine = networkController.routineList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: contentListTile(
                            title: routine.title,
                            context: context,
                            onTap: () {
                              UrlLauncher.openUrl(
                                url: routine.url,
                                context: context,
                              );
                            },
                            subtitle: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  "Date: ${routine.date}\n\nType: ${routine.type}"),
                            )),
                      );
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
