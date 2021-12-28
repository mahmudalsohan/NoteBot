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
        title: Text("Latest Routines"),
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
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: InkWell(
                          onTap: () {
                            UrlLauncher.openUrl(
                                url: routine.url, context: context);
                          },
                          child: Card(
                              elevation: 2,
                              color: themeController.isDarkMode.value
                                  ? Color(0xff1a2d3d)
                                  : Theme.of(context).colorScheme.background,
                              child: Stack(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${routine.title}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Date: ${routine.date}"),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 8,
                                  bottom: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 2,
                                          spreadRadius: 0.001,
                                          color: AppColors()
                                              .kFunctionTileShadowColor,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      child: Text(
                                        routine.type,
                                        style: AppTextStyles()
                                            .kShortcutChipTextStyle,
                                      ),
                                    ),
                                  ),
                                )
                              ])),
                        ),
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
