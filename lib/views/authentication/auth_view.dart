import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/home/home_view.dart';
import 'package:butex_notebot/widgets/error_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_widgets/registration.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              authController.isLoading.value = false;
              return HomeView();
            } else if (snapshot.hasError) {
              authController.isLoading.value = false;
              return ErrorScreen(errMsg: "Error! Please Try Again");
            } else {
              authController.isLoading.value = false;
              return RegistrationView();
            }
          }),
    );
  }
}

/*Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          logo,
                          height: 160,
                          width: 160,
                        ),
                        SocialSignInButton(
                          text: 'Sign Up with Google',
                          assetName: googleLogo,
                          buttonColor: Colors.white,
                          textColor: Colors.black87,
                          onTap: () {
                            authController.googleLogin();
                          },
                        ),
                      ],
                    ),
                  ),
                )*/
