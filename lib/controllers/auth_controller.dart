import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/user_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:butex_notebot/views/auth_view/auth_view.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/auth_institute_selection_view.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/auth_user_data.dart';
import 'package:butex_notebot/views/home_view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  final RxBool isLoading = false.obs;
  final RxBool noId = false.obs;
  //final RxBool isNewUser = false.obs;

  //

  Future googleAuthentication() async {
    authController.isLoading.value = true;
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        authController.isLoading.value = false;
        return;
      }
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
        authController.isLoading.value = false;
        Get.to(() => AuthInstituteSelectionView());
      }

      //

    } catch (e) {
      authController.isLoading.value = false;
      await HttpService().logErr(e.toString());
      print(e.toString());
    }
  }

  Future logout() async {
    isLoading.value = true;
    try {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
      Get.offAll(() => AuthView());
    } on Exception catch (e) {
      print(e.toString());
    }
    isLoading.value = false;
  }

//
  final RxString batch = "null".obs;
  final RxString uni_id = "null".obs;
  final RxString dept = "null".obs;
  final RxBool idIsValid = true.obs;

  bool _checkIdValidity(String idText) {
    if (idText.contains('.') ||
        idText.contains(',') ||
        idText.contains(' ') ||
        idText.contains('-') ||
        idText.isEmpty ||
        idText.startsWith('0')) {
      print("Invalid");
      return false;
    } else {
      if (idText.length == 10 || idText.length == 9) {
        int year;
        int deptSerial;
        int id;
        List parts;

        parts = [
          idText.substring(0, 4), //year of admission
          idText.substring(5, 6), //department serial number
          idText.substring(0), //departmental student id
        ];

        if (idText.length == 10) {
          parts = [
            idText.substring(0, 4),
            idText.substring(5, 7),
            idText.substring(0),
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
        return false;
      } else {
        print("Invalid");

        return false;
      }
    }
  }

  //
  List<String> universities = [
    "BUTEX",
    "BUTEX Affiliate Colleges",
    "Others",
  ].obs;

  RxString dropdownValue = "BUTEX".obs;

  redirectFromInstitute() async {
    isLoading.value = true;
    final String? email = FirebaseAuth.instance.currentUser!.email;
    UserModel? userModel;

    if (dropdownValue.value == "BUTEX") {
      Get.to(() => AuthUserData());
      isLoading.value = false;
    } else if (dropdownValue.value == "BUTEX Affiliate Colleges") {
      userModel = await HttpService().sendUserData(
        dept: "BUTEX Affiliate",
        id: uni_id.value,
        batch: batch.value,
        email: email,
      );

      Get.offAll(() => HomeView());
      isLoading.value = false;
      print(userModel!.status);
    } else {
      userModel = await HttpService().sendUserData(
        dept: authController.dept.value,
        id: authController.uni_id.value,
        batch: authController.batch.value,
        email: email,
      );

      Get.offAll(() => HomeView());
      isLoading.value = false;
      print(userModel!.status);
    }
  }

  redirectButexian(String id) async {
    isLoading.value = true;
    final String? email = FirebaseAuth.instance.currentUser!.email;
    UserModel? userModel;

    //butexian has no id
    if (noId.value) {
      userModel = await HttpService().sendUserData(
        dept: dept.value,
        id: uni_id.value,
        batch: batch.value,
        email: email,
      );
      Get.offAll(() => HomeView());
      isLoading.value = false;
    }
    //
    //
    //butexian has an id
    else {
      //
      //
      //if given id is valid
      if (_checkIdValidity(id)) {
        //
        userModel = await HttpService().sendUserData(
          dept: dept.value,
          id: uni_id.value,
          batch: batch.value,
          email: email,
        );
        Get.offAll(() => HomeView());
        isLoading.value = false;

        print(userModel!.status);
        print(userModel.user.email);
        print(userModel.user.dept);
        print(userModel.user.uniId);
      }
      //
      //
      //if id is not valid
      else {
        isLoading.value = false;
        idIsValid.value = false;
      }
    }

    /* print(userModel!.status);
    print(userModel.user.email);
    print(userModel.user.dept);
    print(userModel.user.uniId);*/
  }
}
