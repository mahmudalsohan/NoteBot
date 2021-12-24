import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_core/src/get_main.dart';

import 'notebird/notebird_home_screen.dart';

class EntertainmentHomeScreen extends StatelessWidget {
  const EntertainmentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Entertainment"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                FunctionTile(
                  title: "Note Bird",
                  imagePath: logoNoteBird,
                  onPress: () {
                    Get.to(() => NotebirdHomeScreen());
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: Image.asset(
                imageEntertainmentSection,
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
