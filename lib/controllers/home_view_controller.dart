import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:butex_notebot/views/auth_view/auth_widgets/auth_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeViewController extends GetxController {
  static HomeViewController instance = Get.find();

  late final GetStorage _getStorage;

  final RxList chipTitles = [].obs;

  //final RxString errText = "".obs;

  @override
  void onInit() {
    super.onInit();
    //Initialize Get Storage
    _getStorage = GetStorage();

    //Get the saved shortcut chips from storage
    getShortcutChips();

    //show Auth Dialog if ID is not given yet
    /*if (authController.isNewUser.value) {
      WidgetsBinding.instance?.addPostFrameCallback((_) async {
        await authDialog(Get.context);
      });
    }*/
  }

  getShortcutChips() {
    if (_getStorage.read(GetStorageKey.SHORTCUT_CHIPS) != null) {
      chipTitles.value = _getStorage.read(GetStorageKey.SHORTCUT_CHIPS);
    }
  }

  updateChipsStorage() {
    _getStorage.write(GetStorageKey.SHORTCUT_CHIPS, chipTitles);
  }
}
