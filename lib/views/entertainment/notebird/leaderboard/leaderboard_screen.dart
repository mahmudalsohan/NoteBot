import 'package:butex_notebot/models/notebird_hof.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/services/open_url.dart';
import 'package:butex_notebot/views/entertainment/notebird/leaderboard/leaderboard_controller.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:butex_notebot/widgets/skeleton_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class LeaderBoardScreen extends GetView<LeaderBoardController> {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    Get.put<LeaderBoardController>(LeaderBoardController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Hall of Fame"),
        centerTitle: true,
      ),
      body: Stack(children: [
        Positioned(
          top: 0,
          child: Container(
            height: 30,
            width: Get.width,
            color: Color(0xffff6600),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your score didn't appear? "),
                InkWell(
                  onTap: () {
                    UrlLauncher.openUrl(
                        url: "https://m.me/tripto.afsin", context: context);
                  },
                  child: Text(
                    "Contact Support",
                    style: TextStyle(
                      //color: Color(0xff7F34D9),
                      //color: Color(0xff7F34D9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 30,
          ),
          child: Obx(
            () => Container(
              child: FutureBuilder<NoteBirdHof>(
                future: controller.hof.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var hofData = snapshot.data;
                    return RefreshIndicator(
                      onRefresh: () {
                        EasyLoading.show(status: "Loading...");
                        return controller.reload();
                      },
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: hofData!.hof.length,
                        itemBuilder: (context, index) {
                          var hofPlayer = hofData.hof[index];
                          String num;
                          if (index == 0)
                            num = "👑";
                          else if (index == 1)
                            num = "🥈";
                          else if (index == 2)
                            num = "🥉";
                          else
                            num = "${index + 1}.";
                          return ListTile(
                            leading: Text(num, style: TextStyle(fontSize: 20)),
                            title: Text(hofPlayer.userName),
                            trailing: Text("${hofPlayer.score}"),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(color: Colors.grey),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
