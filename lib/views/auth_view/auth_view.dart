import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_widgets/auth_view_builder.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return HomeView();
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Something went wrong. Try again."),
              );
            } else {
              return AuthViewBuilder();
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
