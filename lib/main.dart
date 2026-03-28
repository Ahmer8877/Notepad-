import 'package:flutter/material.dart';
import 'package:notepad/Providers/Note_Provider/Note_Provider.dart';
import 'package:notepad/Providers/Themes_provider/themes_provider.dart';
import 'package:notepad/utiles/routes_helper.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //set provider to whole application

    return MultiProvider(
      //Material app ,Multi provide way to interact scaffold

    providers: [
      // set lazy to call direct contractor

      ChangeNotifierProvider(lazy : false,create: (context) => NoteProvider()),
          ChangeNotifierProvider(create: (context) => ThemesProvider()),
        ],
            child: Consumer<ThemesProvider>(
              builder: (context,provider,child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  themeMode: provider.themeMode,
                  darkTheme: ThemeData.dark(),
                  routes: RoutesHelper.routes(),
                );
              }
            ),
    );
}
}
