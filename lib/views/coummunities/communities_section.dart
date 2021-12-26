import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CommunitiesHomeView extends StatelessWidget {
  const CommunitiesHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    refresh() async {
      networkController.checkConnectivity();
    }

    return Scaffold(
      appBar: customAppBar(context: context, title: "Communities"),
      body: Obx(
        () => Container(
          child: networkController.communityList.length > 0
              ? RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                    itemCount: networkController.communityList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final comm = networkController.communityList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            if (appController.inAppWebView.value) {
                              Get.to(
                                () => OpenWebView(
                                  title: comm.title,
                                  url: comm.url,
                                ),
                              );
                            } else {
                              UrlLauncher.openUrl(
                                url: comm.url,
                                context: context,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: themeController.isDarkMode.value
                                    ? Color(0xff1a2d3d)
                                    : Theme.of(context).colorScheme.background,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(5.0, 12.0),
                                    blurRadius: 5,
                                    spreadRadius: 0,
                                    color: Colors.black12,
                                  ),
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                  ),
                                  child: Image.network(comm.imgUrl),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Text(
                                    comm.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                  child: Text(
                                    comm.description,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10),
                                  child: Wrap(
                                    children: comm.category
                                        .map(
                                          (cat) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4, vertical: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                                borderRadius:
                                                    BorderRadius.circular(15),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 8,
                                                ),
                                                child: Text(
                                                  cat,
                                                  style: AppTextStyles()
                                                      .kShortcutChipTextStyle,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
