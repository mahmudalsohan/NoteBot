import 'package:butex_notebot/constants/asset_path.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/auth_details_view.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/social_signin_button.dart';
import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  //final RxBool isNewUser = false.obs;

  //

  Future googleAuthentication() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.additionalUserInfo!.isNewUser) {
        print("New User");
        Get.to(() => AuthDetailsView());
      }

      //

    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

//
  final RxString batch = "null".obs;
  final RxString uni_id = "null".obs;
  final RxString dept = "null".obs;
  final RxBool idIsValid = true.obs;

  bool checkValidID(String idControllerText) {
    if (idControllerText.contains('.') ||
        idControllerText.contains(',') ||
        idControllerText.contains(' ') ||
        idControllerText.contains('-') ||
        idControllerText.isEmpty ||
        idControllerText.startsWith('0')) {
      print("Invalid");
      idIsValid.value = false;
      return false;
    } else {
      if (idControllerText.length == 10 || idControllerText.length == 9) {
        int year;
        int deptSerial;
        int id;
        List parts;

        parts = [
          idControllerText.substring(0, 4), //year of admission
          idControllerText.substring(5, 6), //department serial number
          idControllerText.substring(0), //departmental student id
        ];

        if (idControllerText.length == 10) {
          parts = [
            idControllerText.substring(0, 4),
            idControllerText.substring(5, 7),
            idControllerText.substring(0),
          ];
        }

        year = int.parse(parts[0]);
        deptSerial = int.parse(parts[1]);
        id = int.parse(parts[2]);
        //

        if ((year > 1974) && (deptSerial >= 1 && deptSerial <= 10)) {
          batch.value = (year - 1974).toString();
          uni_id.value = id.toString();

          switch (deptSerial) {
            case 1:
              dept.value = "YE";
              break;
            case 2:
              dept.value = "FE";
              break;
            case 3:
              dept.value = "WPE";
              break;
            case 4:
              dept.value = "AE";
              break;
            case 5:
              dept.value = "TEM";
              break;
            case 6:
              dept.value = "TFD";
              break;
            case 7:
              dept.value = "IPE";
              break;
            case 8:
              dept.value = "TMDM";
              break;
            case 9:
              dept.value = "DCE";
              break;
            case 10:
              dept.value = "ESE";
              break;
          }
          idIsValid.value = true;
          return true;
        }

        print("Invalid");
        idIsValid.value = false;
        return false;
      } else {
        print("Invalid");
        idIsValid.value = false;
        return false;
      }
    }
  }
}
