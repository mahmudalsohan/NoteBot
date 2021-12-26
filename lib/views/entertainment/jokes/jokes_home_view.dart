import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/authentication/auth_widgets/social_signin_button.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/widgets/content_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'jokes_controller.dart';

class JokesHomeView extends GetView<JokesController> {
  const JokesHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<JokesController>(JokesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => HomeView()),
              icon: Icon(Icons.home))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Stack(
            children: [
              Obx(
                () => Column(
                  children: [
                    Card(
                      elevation: 3,
                      color: themeController.isDarkMode.value
                          ? Color(0xff1a2d3d)
                          : Theme.of(context).colorScheme.background,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 10),
                              child: Text(
                                controller.joke.value,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.share_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                Share.share(
                                  controller.joke.value +
                                      "\n\n-Sharing from our NoteBOT App",
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SocialSignInButton(
                        iconVisible: false,
                        text: controller.isLoading.value
                            ? Center(child: CupertinoActivityIndicator())
                            : Text("Once More !"),
                        buttonColor: Theme.of(context).colorScheme.primary,
                        onTap: () {
                          controller.getJoke();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                child: Image.asset(
                  imageJokeSection,
                  height: 150,
                  width: 150,
                ),
              ),
            ],
          )),
    );
  }
}
