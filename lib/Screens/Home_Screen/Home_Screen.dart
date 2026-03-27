import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/utiles/routes_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
      ),

      //floating action btn

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.pushNamed(context, RoutesHelper.addNoteScreen);
        },
        child: Icon(CupertinoIcons.add,color: CupertinoColors.systemYellow,fontWeight: FontWeight.bold,size: 35,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('',style: TextStyle(overflow: TextOverflow.ellipsis),),
                subtitle: Text('',style: TextStyle(overflow: TextOverflow.ellipsis)),
                trailing: IconButton(
                    onPressed: (){}
                    , icon: Icon(CupertinoIcons.delete,color: Colors.black,),
                ),
                leading: Icon(CupertinoIcons.book_fill),
              ),

              ),

          ],
        ),
      ),
    );
  }
}
