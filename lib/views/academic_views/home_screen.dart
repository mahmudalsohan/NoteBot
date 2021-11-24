import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/views/academic_views/academic_screen.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/carousel.dart';
import 'package:butex_notebot/widgets/chips_container.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../entertainment_views/entertainment_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: "NoteBot",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Carousel(),
                ChipsContainer(),
                Container(
                  height: Get.height,
                  width: Get.width,
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      FunctionTile(
                        title: "Academic",
                        imagePath: academicImage,
                        onPress: () {
                          Get.to(() => AcademicScreen());
                        },
                      ),
                      FunctionTile(
                        title: "Notice",
                        imagePath: noticeImage,
                        onPress: () {},
                      ),
                      FunctionTile(
                        title: "Tools",
                        imagePath: toolsImage,
                        onPress: () {},
                      ),
                      FunctionTile(
                        title: "Entertainment",
                        imagePath: entertainmentImage,
                        onPress: () {
                          Get.to(() => EntertainmentHomeScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
