import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/user_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/social_signin_button.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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
              SocialSignInButton(
                text: 'Continue with Google',
                assetName: iconGoogle,
                buttonColor: Colors.white,
                textColor: Colors.black87,
                onTap: () async {
                  await networkController.checkConnectivity();
                  if (networkController.isConnected.value) {
                    authController.googleAuthentication();
                  } else {
                    customSnackBar(
                      context,
                      message: "No Network !!!",
                      bg: Color(0xffaf2031),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
