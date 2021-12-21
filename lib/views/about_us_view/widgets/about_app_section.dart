import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'about_banner.dart';

class AboutAppSection extends StatelessWidget {
  const AboutAppSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutBanner(
            bannerColor: Colors.green,
            title: "About App",
            textColor: Colors.white,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 30, 30),
                child: Image.asset(logoNotebot, height: 120),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("App Version : ${appController.appVersion.value}"),
                  SizedBox(height: 10),
                  Obx(() {
                    final String apiStatus = networkController.isApiLive.value
                        ? "🟢 Okay"
                        : "🔴 Under Maintenance";
                    return Text("API Status : $apiStatus");
                  }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
