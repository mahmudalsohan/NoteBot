import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeViewController extends GetxController {
  static HomeViewController instance = Get.find();

  late final GetStorage _getStorage;

  final RxList chipTitles = [].obs;

  @override
  void onInit() {
    super.onInit();
    //Initialize Get Storage
    _getStorage = GetStorage();

    //Get the saved shortcut chips from storage
    getShortcutChips();
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
