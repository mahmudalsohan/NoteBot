import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/widgets/reusabe_button.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends ReusableButton {
  SocialSignInButton({
    bool iconVisible = true,
    required Widget text,
    String assetName = "assets/images/google-logo.png",
    required Color buttonColor,
    required Function onTap,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(visible: iconVisible, child: Image.asset(assetName)),
              text,
              Opacity(
                opacity: 0.0,
                child: Image.asset(assetName),
              ),
            ],
          ),
          buttonColor: buttonColor,
          onTap: onTap,
        );
}
