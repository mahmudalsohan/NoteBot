import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/about_us_view/about_us_view.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/dashboard_section.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/pin_section.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'home_view_widgets/drawer_items.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "NoteBOT",
          style: TextStyle(
            color: Colors.white,
          ),
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
