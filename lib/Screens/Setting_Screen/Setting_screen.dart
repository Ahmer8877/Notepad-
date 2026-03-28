import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/Providers/Themes_provider/themes_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {

    //root of this screen

    return Scaffold(

      //app bar

      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.settings),
            Text('System Settings',style: TextStyle(color: CupertinoColors.inactiveGray),),
          ],
        ),
      ),

      // body ,the main object
      
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Row(
              children: [

                //text
                
                Text('Themes',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                SizedBox(width: 60,),

                Text('- - - - - - - - - - - -'),

                SizedBox(width: 65,),

                //drop down buttons
                
                Consumer<ThemesProvider>(
                  builder: (context,provider,child) {
                    return DropdownButton(
                      value: provider.themeMode,
                        onChanged: (value){
                        provider.switchTheme(value!);
                        },

                        items: [

                          //item1
                          DropdownMenuItem(
                            value: ThemeMode.system,
                            child: Text('System'),
                          ),
                          //item2

                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text('Light'),
                          ),
                          //item3

                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text('Dark'),
                          ),
                        ],
                    );
                  }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
