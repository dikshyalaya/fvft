import 'package:flutter/material.dart';

ThemeProvider appTheme = ThemeProvider() ; 

class ThemeProvider with ChangeNotifier {
  //VARS
  ThemeMode _themeMode = ThemeMode.light;

  // ---------------- Getter Method ---------------
  ThemeMode get themeMode => _themeMode;

  // --------------- Setter Method ----------------
  void setThemeModel(ThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    notifyListeners();
  }

  bool isLightTheme() {
    return _themeMode == ThemeMode.light ? true : false;
  }
}
