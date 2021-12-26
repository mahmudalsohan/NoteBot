import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/get_storage_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeViewController extends GetxController {
  static HomeViewController instance = Get.find();

  final RxInt CAC = 2.obs; //do not touch this value
  final RxDouble CAS = 40.0.obs; //do not touch this value
  final RxDouble MAS = 40.0.obs; //do not touch this value
  final RxString selectedGrid = "Column: 2".obs; //do not touch this value
  List<String> gridLayout = [
    "Column: 2",
    "Column: 3",
  ].obs; //do not touch this values

  late final GetStorage _getStorage;

  final RxList chipTitles = [].obs;

  gridInit() {
    if (_getStorage.read(GetStorageKey.GRID_COUNT) == null) {
      selectedGrid.value = "Column: 2";
    } else {
      selectedGrid.value = _getStorage.read(GetStorageKey.GRID_COUNT);
    }
    updateGrid();
  }

  updateGrid() {
    if (selectedGrid.value == "Column: 3") {
      CAC.value = 3;
      CAS.value = 20;
      MAS.value = 20;
      _getStorage.write(GetStorageKey.GRID_COUNT, "Column: 3");
    } else if (selectedGrid.value == "Column: 2") {
      CAC.value = 2;
      CAS.value = 40;
      MAS.value = 40;
      _getStorage.write(GetStorageKey.GRID_COUNT, "Column: 2");
    }
  }

  @override
  void onInit() {
    super.onInit();
    //Initialize Get Storage
    _getStorage = GetStorage();

    //Get the saved shortcut chips from storage
    getShortcutChips();

    gridInit();
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
