import 'package:flutter/material.dart';

class ThemesProvider with ChangeNotifier{

  ThemeMode themeMode=ThemeMode.system;

  void switchTheme(ThemeMode value){

    themeMode=value;
    notifyListeners();
  }
}