class Note {
  int? note_ID; // ignore: non_constant_identifier_names
  late int category_ID; // ignore: non_constant_identifier_names
  late String category_Name; // ignore: non_constant_identifier_names
  late String note_Title; // ignore: non_constant_identifier_names
  late String note_Desc; // ignore: non_constant_identifier_names
  late String note_Date; // ignore: non_constant_identifier_names
  late int note_Priority; // ignore: non_constant_identifier_names

  Note(this.category_ID, this.note_Title, this.note_Desc, this.note_Date,
      this.note_Priority);

  Note.withID(this.note_ID, this.category_ID, this.note_Title, this.note_Desc,
      this.note_Date, this.note_Priority);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["note_ID"] = note_ID;
    map["category_ID"] = category_ID;
    map["note_Title"] = note_Title;
    map["note_Desc"] = note_Desc;
    map["note_Date"] = note_Date;
    map["note_Priority"] = note_Priority;
    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    note_ID = map["note_ID"];
    category_ID = map["category_ID"];
    category_Name = map["category_Name"];
    note_Title = map["note_Title"];
    note_Desc = map["note_Desc"];
    note_Date = map["note_Date"];
    note_Priority = map["note_Priority"];
  }
}
