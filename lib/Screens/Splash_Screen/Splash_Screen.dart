import 'package:flutter/material.dart';
import 'package:notepad/utiles/routes_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


//initializer for run the first screen if user application open

 void nextScreen() async{

   await Future.delayed(Duration(seconds: 3));
   Navigator.pushReplacementNamed(context, RoutesHelper.homeScreen);
 }

 //init state

  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   //root of splash screen

    return Scaffold(

      //body,set the logo in splash screen

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //container

            Container(
              height: 150,
              width: 150,

              decoration:BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage('assets/logo/logo.png'))
              ),
            )
          ],
        ),
      )
    );
  }
}
