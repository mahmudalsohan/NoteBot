import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/user_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/authentication/auth_widgets/social_signin_button.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
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
                    "Welcome to ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "BUTEX NoteBOT",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Obx(
                    () => SocialSignInButton(
                      text: Row(
                        children: [
                          Visibility(
                              visible: authController.isLoading.value,
                              child: CupertinoActivityIndicator()),
                          SizedBox(width: 10),
                          Text(
                            authController.isLoading.value
                                ? 'Processing...'
                                : 'Continue With Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      assetName: iconGoogle,
                      buttonColor: Colors.white,
                      onTap: () async {
                        authController.isLoading.value = true;
                        await networkController.checkConnectivity();
                        if (networkController.isConnected.value) {
                          authController.googleAuthentication();
                        }
                        //
                        else {
                          authController.isLoading.value = false;
                          customSnackBar(
                            context,
                            message: "No Network !!!",
                            bg: Color(0xffaf2031),
                          );
                        }
                        //authController.isLoading.value = false;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "*By continuing, I agree to the 'Terms and Conditions' and 'Privacy Policy' of BUTEX NoteBOT App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
