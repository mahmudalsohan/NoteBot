import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/about_us_view/widgets/about_app_section.dart';
import 'package:butex_notebot/views/about_us_view/widgets/about_us_section.dart';
import 'package:butex_notebot/views/about_us_view/widgets/memorial_section.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    refresh() async {
      await networkController.checkConnectivity();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("About Us"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics:
              ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              //About App Container
              AboutAppSection(),
              SizedBox(height: 20),
              //
              //About Us Section
              AboutUsSection(),
              SizedBox(height: 40),
              //
              //Memorial Section
              MemorialSection(),
              //SizedBox(height: 20),
              Image.asset(
                logoHawkersBlack,
                height: 20,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
