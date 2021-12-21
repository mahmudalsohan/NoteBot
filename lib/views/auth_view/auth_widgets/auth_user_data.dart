import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/social_signin_button.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AuthUserData extends StatelessWidget {
  const AuthUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _idController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: Get.width,
            minHeight: Get.height,
          ),
          child: IntrinsicHeight(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TopContainer(title: "Input Your Student ID"),

                      //
                      Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _idController,
                            decoration: InputDecoration(
                              fillColor: authController.idIsValid.value
                                  ? Colors.blue
                                  : Colors.red,
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon: Icon(Icons.person),
                              errorText: authController.idIsValid.value
                                  ? null
                                  : "Invalid ID",
                              errorStyle: TextStyle(color: Colors.red),
                              border: InputBorder.none,
                              hintText: "Student ID",
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                value: authController.noId.value,
                                onChanged: (newValue) {
                                  authController.noId.value = newValue!;
                                },
                              ),
                              Text(
                                "Don't Have An ID Yet ",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SocialSignInButton(
                        onTap: () async {
                          await authController
                              .redirectButexian(_idController.text);
                        },
                        buttonColor: Theme.of(context).colorScheme.primary,
                        text: Row(
                          children: [
                            Visibility(
                                visible: authController.isLoading.value,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                )),
                            SizedBox(width: 10),
                            Text(
                              authController.isLoading.value
                                  ? 'Processing...'
                                  : 'Done',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        iconVisible: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
