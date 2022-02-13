import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:butex_notebot/views/about_us/about_us_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'home_view_widgets/carousel.dart';
import 'home_view_widgets/dashboard_section.dart';
import 'home_view_widgets/drawer_items.dart';
import 'home_view_widgets/pin_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
/*
    WidgetsBinding.instance?.addPostFrameCallback((_) {

      print(networkController.apiAppVersion.value);
      print(appController.appVersion.value);
      //
      if (networkController.apiAppVersion.value ==
          appController.appVersion.value) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Update Available🎉"),
                content: Text(
                    "Update your favourite NoteBOT App and enjoy new features and improved performance"),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Update Now"),
                  ),
                ],
              );
            });
      }
    });
*/
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "NoteBOT",
          style: AppTextStyles().kAppBarTitleTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                Get.to(() => AboutUsView());
              },
              icon: Icon(
                Icons.help,
                color: Colors.white,
              )),
        ],
      ),
      drawer: NavigationDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          await networkController.checkConnectivity();
        },
        child: SingleChildScrollView(
          physics:
              ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              SizedBox(height: 15),
              //
              Carousel(),
              //
              //
              SizedBox(height: 20),
              //
              //Shortcut Chips Container
              PinSection(),
              //
              //
              SizedBox(height: 40),
              //
              //
              //Grid Container
              DashboardSection(),
            ],
          ),
        ),
      ),
    );
  }
}
