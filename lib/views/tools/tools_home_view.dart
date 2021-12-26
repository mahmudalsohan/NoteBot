import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:butex_notebot/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ToolsHomeView extends StatelessWidget {
  const ToolsHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Tools"),
      body: Obx(
        () => Container(
          child: networkController.toolList.length > 0
              ? GridView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: networkController.toolList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var tool = networkController.toolList[index];
                    return FunctionTile(
                      onPress: () {
                        if (appController.inAppWebView.value) {
                          Get.to(
                            () => OpenWebView(
                              title: tool.title,
                              url: tool.url,
                            ),
                          );
                        } else {
                          UrlLauncher.openUrl(
                            url: tool.url,
                            context: context,
                          );
                        }
                      },
                      title: tool.title,
                      image: NetworkImage(tool.imgUrl),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
