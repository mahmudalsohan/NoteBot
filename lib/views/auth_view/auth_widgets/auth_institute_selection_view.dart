import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/user_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/auth_user_data.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/social_signin_button.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/top_container.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:butex_notebot/widgets/reusabe_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AuthInstituteSelectionView extends StatelessWidget {
  const AuthInstituteSelectionView({Key? key}) : super(key: key);

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
                TopContainer(title: "Choose Your Institute"),
                Column(
                  children: [
                    DropdownButton(
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
                    SocialSignInButton(
                      onTap: () async {
                        await authController.redirectFromInstitute();
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
                                : 'Next',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
