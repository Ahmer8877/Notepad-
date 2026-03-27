import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotemainScreen extends StatefulWidget {
  const NotemainScreen({super.key});

  @override
  State<NotemainScreen> createState() => _NotemainScreenState();
}

class _NotemainScreenState extends State<NotemainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Add',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
            Text('Note',style: TextStyle(fontWeight: FontWeight.bold,color: CupertinoColors.systemYellow),),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: (){},
                icon: Image.asset('assets/icons/note.png'),
            ),
          ),
        ],
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              color: CupertinoColors.white,
              shadowColor: CupertinoColors.inactiveGray,
              child: ListTile(

                //title

                title: TextFormField(
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
