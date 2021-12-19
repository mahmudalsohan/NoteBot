import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/about_us_view/about_us_view.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

PreferredSizeWidget customAppBar(
    {required BuildContext context, required String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            await networkController.checkConnectivity();
            if (networkController.isConnected.value) {
              Get.to(() => AboutUsView());
            } else {
              customSnackBar(
                context,
                message: "No Network !!!",
              );
            }
          },
          icon: Icon(
            Icons.help,
            color: Colors.white,
          )),
    ],
  );
}
