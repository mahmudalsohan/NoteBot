import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//this class manage all the theme changing related task
class ThemeProvider extends ChangeNotifier {
  late bool _isDarkTheme;
  bool get isDarkTheme => _isDarkTheme;

  //SharedPreference save the user selected theme state
  //so that user can jump right into the theme they choose last time
  final String key = "theme";
  SharedPreferences? _prefs;

  //constructor ThemeProvider runs as soon as this class is constructed
  ThemeProvider() {
    //default theme set to light(false)
    // to set default to dark, make it true
    _isDarkTheme = false;
    _loadThemePrefs();
  }

  //change and save the theme
  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _saveThemePrefs();
    notifyListeners();
  }

  //checks if user have any previous saved theme or not
  //if not then SharedPreference get initiated
  _initThemePrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  //load previously set theme
  _loadThemePrefs() async {
    await _initThemePrefs();
    _isDarkTheme = _prefs!.getBool(key)!;
    notifyListeners();
  }

  //save user preferred theme
  _saveThemePrefs() async {
    await _initThemePrefs();
    _prefs!.setBool(key, _isDarkTheme);
  }
}

//this class contains both light and dark theme config
class MyThemes {
  static final lightTheme = ThemeData(
    primaryColor: Colors.lightBlue,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 18,
        )),
  );
  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.blueGrey.shade900,
    scaffoldBackgroundColor: Colors.blueGrey.shade900,
    textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )),
  );
}
