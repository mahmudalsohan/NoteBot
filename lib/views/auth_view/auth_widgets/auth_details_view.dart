import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/user_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/social_signin_button.dart';
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
    TextEditingController _idController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          logoNotebot,
                          width: 200,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        "One Last Thing... ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.withOpacity(.3),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _idController,
                            decoration: InputDecoration(
                              errorText: authController.idIsValid.value
                                  ? null
                                  : "Invalid ID",
                              errorStyle: TextStyle(color: Colors.red),
                              icon: Icon(Icons.person),
                              fillColor: Colors.transparent,
                              border: InputBorder.none,
                              hintText: "Student ID",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Please Provide Your Student ID. If You don't have one, select \"NOT APPLICABLE\" ",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => HomeView());
                        },
                        child: Text(
                          "I don't have one",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (authController.checkValidID(_idController.text)) {
                            //
                            final String? email =
                                FirebaseAuth.instance.currentUser!.email;
                            //
                            final UserModel? userModel =
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
                            print("dept: ${userModel?.status}");
                            Get.offAll(() => HomeView());
                          }
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
