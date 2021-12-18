import 'package:butex_notebot/constants/asset_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_banner.dart';

class AboutAppSection extends StatelessWidget {
  final String apiStatus;
  const AboutAppSection({Key? key, required this.apiStatus}) : super(key: key);

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
                  Text("App Version : 1.0.1"),
                  SizedBox(height: 10),
                  Text("API Status :  $apiStatus"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
