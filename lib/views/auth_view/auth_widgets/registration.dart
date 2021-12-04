import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/social_signin_button.dart';
import 'package:flutter/material.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to ",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "BUTEX NOTEBOT",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.withOpacity(.3),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: TextField(
                  controller: null,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      hintText: "Student ID"),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: SocialSignInButton(
            text: 'Sign Up with Google',
            assetName: googleLogo,
            buttonColor: Colors.white,
            textColor: Colors.black87,
            onTap: () {
              authController.googleLogin();
            },
          ),
        )
      ],
    );
  }
}
