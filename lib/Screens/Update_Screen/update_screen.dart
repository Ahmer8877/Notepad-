import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/Models/NoteModel.dart';
import 'package:notepad/Providers/Note_Provider/Note_Provider.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {

  final NoteModel note;
  const UpdateScreen({super.key, required this.note});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  TextEditingController title=TextEditingController();
  TextEditingController detail=TextEditingController();

  @override
  void initState() {
    title.text=widget.note.title;
    detail.text=widget.note.detail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //root of update screen

    return Scaffold(

      //app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: Image.asset('assets/icons/note.png')),
        ),
        title: Row(
          children: [
            Text('Update',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
            Text('Note',style: TextStyle(fontWeight: FontWeight.bold,color: CupertinoColors.systemYellow),),
          ],
        ),
        actions: [
          Consumer<NoteProvider>(
              builder: (context,provider,child) {
                return IconButton(
                  onPressed: () {
                    NoteModel note=NoteModel(id: widget.note.id,title: title.text.trim(),detail: detail.text.trim());
                    provider.updateNote(note);
                    Navigator.pop(context);
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(Icons.check,fontWeight: FontWeight.bold,size: 45,),
                  ),
                );
              }
          )
        ],
      ),

      //body with objects

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              color: CupertinoColors.white,
              shadowColor: CupertinoColors.inactiveGray,

              // list tile

              child: ListTile(

                //title

                title: TextFormField(
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                  controller: title,
                  maxLines: 2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.pencil,color: Colors.black,),
                    hint: Text('Enter Title',style: TextStyle(color: CupertinoColors.inactiveGray),),
                  ),
                ),

                //subtitle

                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: detail,
                    maxLines: 1000,
                    decoration: InputDecoration(
                      hint: Text('Enter details',style: TextStyle(color: CupertinoColors.inactiveGray),),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
