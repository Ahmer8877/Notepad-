import 'package:flutter/material.dart';
import 'package:notepad/Providers/Note_Provider/Note_Provider.dart';
import 'package:notepad/utiles/routes_helper.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesHelper.routes(),
      ),
    );
  }
}
