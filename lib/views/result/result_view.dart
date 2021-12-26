import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    refresh() async {
      networkController.checkConnectivity();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Obx(
        () => Container(
          child: networkController.resultList.length > 0
              ? RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                    itemCount: networkController.resultList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final result = networkController.resultList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: contentListTile(
                            title: result.title,
                            context: context,
                            onTap: () {
                              UrlLauncher.openUrl(
                                url: result.url,
                                context: context,
                              );
                            },
                            subtitle: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text("Date: ${result.date}\n"),
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
