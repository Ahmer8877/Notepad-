import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/Providers/Note_Provider/Note_Provider.dart';
import 'package:notepad/Screens/Update_Screen/update_screen.dart';
import 'package:notepad/utiles/routes_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    //root of screen

    return Scaffold(

      //app bar

      appBar: AppBar(
        title: Row(
          children: [
            Text('Note',style:TextStyle(fontWeight: FontWeight.bold,color: CupertinoColors.systemYellow) ,),
            Text('Pad',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue) ,),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset('assets/icons/note.png'),
        ),

        actions: [

          //popUpMenuButton

          PopupMenuButton(
              itemBuilder:(context) => [

                //item 1
                PopupMenuItem(child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesHelper.settingScreen);
                  },
                  child: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold)),
                )),

                //item 2

                PopupMenuItem(child: Column(children: [
                  Text('About',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Version 1.2v',style: TextStyle(color: CupertinoColors.inactiveGray),)
                ],
                )
                )
              ]
          )
        ],
      ),

      //floating action btn

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.pushNamed(context, RoutesHelper.addNoteScreen);
        },
        child: Icon(CupertinoIcons.add,color: CupertinoColors.systemYellow,fontWeight: FontWeight.bold,size: 35,),
      ),

      // body and wrap with consumer

      body: Consumer<NoteProvider>(
        builder: (context,provider,child) {
          return provider.notes.isEmpty? Center(child: Text('Empty'),) :
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                for(var note in provider.notes)
                Card(

                  //List tile

                  child: ListTile(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => UpdateScreen(note: note,)
                          )
                      );
                    },
                    title: Text(note.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    subtitle: Text(note.detail),
                    trailing: IconButton(
                        onPressed: (){
                          provider.deleteNote(note);
                        }
                        , icon: Icon(CupertinoIcons.delete),
                    ),
                    leading: Icon(CupertinoIcons.book_fill,color: CupertinoColors.activeOrange,),
                  ),

                  ),

              ],
            ),
          );
        }
      ),
    );
  }
}
