import 'package:flutter/cupertino.dart';
import 'package:notepad/Screens/Home_Screen/Home_Screen.dart';
import 'package:notepad/Screens/Splash_Screen/Splash_Screen.dart';

import '../Screens/NoteMain_Screen/NoteMain_Screen.dart';

 class RoutesHelper {

  static String initial='/';
  static String homeScreen='/homeRoute';
  static String addNoteScreen='/noteRoute';



  static Map<String,WidgetBuilder> routes() =>{

    initial : (_) => SplashScreen(),
    homeScreen : (_) => HomeScreen(),
    addNoteScreen : (_) => NotemainScreen(),
  };
}
