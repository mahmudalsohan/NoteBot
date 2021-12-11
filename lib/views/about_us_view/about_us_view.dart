import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/about_us_view/widgets/about_app_section.dart';
import 'package:butex_notebot/views/about_us_view/widgets/about_us_section.dart';
import 'package:butex_notebot/views/about_us_view/widgets/memorial_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String apiStatus =
        networkController.isApiLive.value ? "🟢 Okay" : "🔴 Under Maintenance";
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            //About App Container
            aboutAppSection(apiStatus),
            SizedBox(height: 20),
            //
            //About Us Section
            aboutUsSection(),
            SizedBox(height: 40),
            //
            //Memorial Section
            memorialSection(),
            //SizedBox(height: 20),
            Image.asset(
              logoHawkersBlack,
              height: 20,
            ),
            Text("V1.0.1"),
          ],
        ),
      ),
    );
  }
}
