import 'dart:io';
import 'package:flutter/material.dart';
import 'package:note_list/constants/constants.dart';
import 'package:note_list/helpers/database_helper.dart';
import 'package:note_list/models/notes.dart';
import 'package:note_list/pages/note_detail.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<Note> allNotes = <Note>[];
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    databaseHelper.getNotes().then((mapList) async {
      for (Map<String, dynamic> readMap in mapList) {
        allNotes.add(Note.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: databaseHelper.getNoteList(),
      builder: (context, AsyncSnapshot<List<Note>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          allNotes = snapshot.data!;
          sleep(Duration(milliseconds: 500));
          return ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  leading: _priorityCircle(allNotes[index].note_Priority),
                  title: Text(
                    allNotes[index].note_Title,
                    style: Constants.textStyleDesc,
                  ),
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Category:",
                                    style: Constants.textStyleProp),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  allNotes[index].category_Name,
                                  style: Constants.textStyleNormal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Creation Date: ",
                                    style: Constants.textStyleProp),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  databaseHelper.dateFormat(DateTime.parse(
                                      allNotes[index].note_Date)),
                                  style: Constants.textStyleNormal,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Description",
                              style: Constants.textStyleProp,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Text(
                                allNotes[index].note_Desc,
                                style: Constants.textStyleDesc,
                              ),
                            ),
                          ),
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    _deleteNote(allNotes[index].note_ID!),
                                child: Text('Delete'),
                                style: ElevatedButton.styleFrom(
                                    primary: Constants.cancelButtonColor),
                              ),
                              ElevatedButton(
                                  onPressed: () =>
                                      _goToDetailPage(context, allNotes[index]),
                                  child: Text("Update")),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              });
        } else {
          return Center(child: Text('Loading...'));
        }
      },
    );
  }

  _priorityCircle(int notePriority) {
    switch (notePriority) {
      case 0:
        return CircleAvatar(
            child: Text("LOW"), backgroundColor: Colors.red[50]);
      case 1:
        return CircleAvatar(
            child: Text(
              "MED",
              style: Constants.priorityStyle,
            ),
            backgroundColor: Colors.red[400]);
      case 2:
        return CircleAvatar(
            child: Text(
              "HIGH",
              style: Constants.priorityStyle,
            ),
            backgroundColor: Colors.red[900]);
    }
  }

  _deleteNote(int noteID) {
    databaseHelper.deleteNote(noteID).then((deletedID) {
      if (deletedID != 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Deleted')));
      }
    });
    setState(() {});
  }

  _goToDetailPage(BuildContext context, Note note) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NoteDetailPage(
                  pageTitle: 'Edit Note',
                  editableNote: note,
                ))).then((value) => setState(() {}));
  }
}
