import 'package:flutter/widgets.dart';
import 'package:notepad/Models/NoteModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


//create the database

class NoteDatabase {

  //initialise

  Future<Database> database() async{

    final database=openDatabase(
        join(await getDatabasesPath(),'note_database.db'),

      onCreate: (db,version){

          //create table with sql command

          return db.execute('CREATE TABLE note(id INTEGER PRIMARY KEY,title TEXT,detail TEXT)');
      },
      version: 1
    );
    return database;
  }

  //insert

  Future<void> insertNote(NoteModel note) async{

    final db=await database();
    await db.insert('note' , note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  //get data

  Future<List<NoteModel>> getData() async{
    List<NoteModel> notes=[];
    final db=await database();
    final data=await db.query('note');
    for(var note in data){
      NoteModel myNote=NoteModel.fromMap(note);
      notes.add(myNote);

    }
    return notes;

  }

  //update data

  Future<void> updateNote(NoteModel note)async{

    final db=await database();
    await db.update('note' , note.toMap(),
        where: 'id=?',
        whereArgs: [note.id],
    );
  }

  //delete data(note)

  Future<void> deleteNote(NoteModel note) async{

    final db=await database();
    db.delete('note',
      where: 'id=?',
      whereArgs: [note.id]
    );
  }
}

//Note provider class

class NoteProvider with ChangeNotifier{

  List<NoteModel> notes=[];
  NoteDatabase myDb=NoteDatabase();

  // noteProvider class contractor

  NoteProvider(){
    getNotes();
  }

  //get

  Future<void> getNotes()async{

    notes=await myDb.getData();
    notifyListeners();
  }

  //insert

  Future<void> insertNote(NoteModel note)async{

    await myDb.insertNote(note);
    getNotes();
  }

  //update

  Future<void> updateNote(NoteModel note) async{

    await myDb.updateNote(note);
    notifyListeners();
    getNotes();
  }

  //delete
  Future<void> deleteNote(NoteModel note) async{

    await  myDb.deleteNote(note);
    getNotes();
  }
}
