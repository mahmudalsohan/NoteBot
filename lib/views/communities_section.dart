import 'package:butex_notebot/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CommunitiesHomeView extends StatelessWidget {
  const CommunitiesHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Communities"),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.grey,
              size: 50,
            ),
            Text("Not Available Yet"),
          ],
        ),
      ),
    );
  }
}
