import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/views/academic_views/levels_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/chips_container.dart';
import 'package:butex_notebot/views/home_view/home_view_widgets/carousel.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../entertainment_views/entertainment_home.dart';
import 'home_view_widgets/drawer_items.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Notebot"),
      drawer: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: drawerItems,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Carousel(),
              //
              //
              //Shortcut Chips Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      //color: Colors.blueAccent,
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("📌 Pinned"),
                      SizedBox(height: 10),
                      ChipsContainer(),
                    ],
                  ),
                ),
              ),
              //
              //
              //Grid Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: Get.height,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 40,
                    children: [
                      FunctionTile(
                        title: "Notes",
                        imagePath: notesSectionImage,
                        onPress: () {
                          Get.to(() => LevelsScreen());
                        },
                      ),
                      FunctionTile(
                        title: "Lab Reports",
                        imagePath: labReportSectionImage,
                        onPress: () {},
                      ),
                      FunctionTile(
                        title: "Notice",
                        imagePath: noticeSectionImage,
                        onPress: () {},
                      ),
                      FunctionTile(
                        title: "Syllabus",
                        imagePath: syllabusSectionImage,
                        onPress: () {},
                      ),
                      FunctionTile(
                        title: "Tools",
                        imagePath: toolsSectionImage,
                        onPress: () {},
                      ),
                      FunctionTile(
                        title: "Entertainment",
                        imagePath: entertainmentSectionImage,
                        onPress: () {
                          Get.to(() => EntertainmentHomeScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
