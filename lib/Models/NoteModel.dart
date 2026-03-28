
//create the NoteModel

class NoteModel{
  int? id;
  String title,detail;


  //note model constructor

  NoteModel({ this.id,required this.title,required this.detail});

  //create factory constructor to convert data maps with note model

  factory NoteModel.fromMap(dynamic map) => NoteModel(
      id: map['id'], title: map['title'], detail: map['detail']
  );

  // Map func.

  Map<String,dynamic> toMap() => {

    'id' : id,
    'title' : title,
    'detail' : detail,
  };

}