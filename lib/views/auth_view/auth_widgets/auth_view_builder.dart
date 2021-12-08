import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'bottom_text_widget.dart';
import 'login.dart';

class AuthViewBuilder extends StatelessWidget {
  const AuthViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                Image.asset(
                  logoNotebot,
                  width: 140,
                ),
                //
                const SizedBox(height: 60),
                //
                //Login Widget
                Visibility(
                  visible: authController.isLoginWidgetDisplayed.value,
                  child: const LoginWidget(),
                ),
                //
                //Registration Widget
                Visibility(
                  visible: !authController.isLoginWidgetDisplayed.value,
                  child: const RegistrationWidget(),
                ),
                //
                const SizedBox(height: 10),
                //
                //BottomTextWidget: SignIn
                Visibility(
                  visible: !authController.isLoginWidgetDisplayed.value,
                  child: BottomTextWidget(
                    onTap: () {
                      authController.changeDisplayedAuthWidget();
                    },
                    text1: "Already have an account?",
                    text2: "Sign In !",
                  ),
                ),
                //
                //BottomTextWidget: Create Account
                Visibility(
                  visible: authController.isLoginWidgetDisplayed.value,
                  child: BottomTextWidget(
                    onTap: () {
                      authController.changeDisplayedAuthWidget();
                    },
                    text1: "Don't have an account?",
                    text2: "Create account !",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
