import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/top_container.dart';
import 'package:butex_notebot/views/entertainment_views/notebird/notebird_home.dart';
import 'package:butex_notebot/views/onboarding_view/onboarding_view.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/carousel_loading.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
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
                        UrlLauncher.openUrl(
                          url: tool.url,
                          webView: true,
                          context: context,
                        );
                      },
                      title: tool.title,
                      imagePath: logoNotebot,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
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
