import 'package:get_storage/get_storage.dart';

import 'get_storage_key.dart';

initializeGetStorage() async {
  await GetStorage.init();
  final _getStorage = GetStorage();

  //Theme
  /* bool isDarkMode = _getStorage.read(GetStorageKey.IS_DARK_MODE) ?? false;
  _getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode);*/

  //Subject Shortcuts
}
