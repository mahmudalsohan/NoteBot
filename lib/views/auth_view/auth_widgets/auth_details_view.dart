import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/user_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/auth_user_data.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AuthDetailsView extends StatelessWidget {
  const AuthDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Center(
                      child: Image.asset(
                        logoNotebot,
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Choose Your Institute",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Column(
                  children: [
                    DropdownButton(
                        //dropdownColor: Colors.white70,
                        value: authController.dropdownValue.value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: authController.universities.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          authController.dropdownValue.value = newValue!;
                        }),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (authController.dropdownValue.value == "BUTEX") {
                          Get.to(() => AuthUserData());
                        } else if (authController.dropdownValue.value ==
                            "BUTEX Affiliate Colleges") {
                          final String? email =
                              FirebaseAuth.instance.currentUser!.email;
                          UserModel? userModel =
                              await HttpService().sendUserData(
                            dept: "BUTEX Affiliate",
                            id: authController.uni_id.value,
                            batch: authController.batch.value,
                            email: email,
                          );
                          //
                          print("email: ${userModel?.user.email}");
                          print("uni_id: ${userModel?.user.uniId}");
                          print("batch: ${userModel?.user.batch}");
                          print("dept: ${userModel?.user.dept}");
                          print("status: ${userModel?.status}");
                          Get.offAll(() => HomeView());
                        } else {
                          final String? email =
                              FirebaseAuth.instance.currentUser!.email;
                          UserModel? userModel =
                              await HttpService().sendUserData(
                            dept: authController.dept.value,
                            id: authController.uni_id.value,
                            batch: authController.batch.value,
                            email: email,
                          );
                          //
                          print("email: ${userModel?.user.email}");
                          print("uni_id: ${userModel?.user.uniId}");
                          print("batch: ${userModel?.user.batch}");
                          print("dept: ${userModel?.user.dept}");
                          print("status: ${userModel?.status}");
                          Get.offAll(() => HomeView());
                        }
                      },
                      child: Text("Next"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
