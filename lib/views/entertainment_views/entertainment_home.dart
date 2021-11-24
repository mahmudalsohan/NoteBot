import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:butex_notebot/widgets/function_tile_widget.dart';
import 'package:butex_notebot/widgets/top_Container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_core/src/get_main.dart';

import 'notebird/notebird_home.dart';

class EntertainmentHomeScreen extends StatelessWidget {
  const EntertainmentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Entertainment"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            TopContainer(
              imagePath: entertainmentImage,
              title: "Entertainment",
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  FunctionTile(
                    title: "Note Bird",
                    imagePath: logo,
                    onPress: () {
                      Get.to(() => NotebirdHomePage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
