import 'package:flutter/cupertino.dart';
import 'package:notepad/Screens/Home_Screen/Home_Screen.dart';
import 'package:notepad/Screens/Setting_Screen/Setting_screen.dart';
import 'package:notepad/Screens/Splash_Screen/Splash_Screen.dart';

import '../Screens/NoteMain_Screen/NoteMain_Screen.dart';

//Route helper class ,initialize all screen with route name

 class RoutesHelper {

  static String initial='/';
  static String homeScreen='/homeRoute';
  static String addNoteScreen='/noteRoute';
  static String settingScreen='/settingRoute';



  static Map<String,WidgetBuilder> routes() =>{

    initial : (_) => SplashScreen(),
    homeScreen : (_) => HomeScreen(),
    addNoteScreen : (_) => NotemainScreen(),
    settingScreen : (_) => SettingScreen(),
  };
}
