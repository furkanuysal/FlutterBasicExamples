import 'package:flutter/material.dart';
import 'package:note_list/constants/constants.dart';
import 'package:note_list/helpers/database_helper.dart';
import 'package:note_list/models/category.dart';
import 'package:note_list/models/notes.dart';

class NoteDetailPage extends StatefulWidget {
  final String? pageTitle;
  final Note? editableNote;

  NoteDetailPage({this.pageTitle, this.editableNote});

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  var formKey = GlobalKey<FormState>();
  List<Category> allCategories = <Category>[];
  DatabaseHelper databaseHelper = DatabaseHelper();
  int categoryID = 1;
  int chosenPriority = 0;
  late String noteTitle, noteDesc;
  static var _priorityList = ["Low", "Medium", "High"];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getData();
    });
    if (widget.editableNote != null) {
      categoryID = widget.editableNote!.category_ID;
      chosenPriority = widget.editableNote!.note_Priority;
    } else {
      categoryID = 1;
      chosenPriority = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.pageTitle!),
      ),
      body: allCategories.length <= 0
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    categoryRow(),
                    formFieldTitle(),
                    formFieldDesc(),
                    priorityRow(),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Constants.cancelButtonColor),
                        ),
                        ElevatedButton(
                            child: Text('Save'),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                if (widget.editableNote == null) {
                                  databaseHelper
                                      .addNote(Note(
                                          categoryID,
                                          noteTitle,
                                          noteDesc,
                                          DateTime.now().toString(),
                                          chosenPriority))
                                      .then((value) {
                                    if (value != 0) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Added: "$noteTitle"')));
                                    }
                                  });
                                } else {
                                  databaseHelper
                                      .updateNote(Note.withID(
                                          widget.editableNote!.note_ID,
                                          categoryID,
                                          noteTitle,
                                          noteDesc,
                                          DateTime.now().toString(),
                                          chosenPriority))
                                      .then((value) {
                                    if (value != 0) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Edited: "$noteTitle"')));
                                    }
                                  });
                                }
                              }
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Padding formFieldDesc() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue:
            widget.editableNote != null ? widget.editableNote!.note_Desc : "",
        maxLines: 4,
        onSaved: (text) {
          noteDesc = text!;
        },
        decoration: InputDecoration(
          hintText: "Please enter your note",
          labelText: "Note Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Padding formFieldTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue:
            widget.editableNote != null ? widget.editableNote!.note_Title : "",
        validator: (text) {
          if (text!.length < 3) {
            return "At least enter 3 letters.";
          }
        },
        onSaved: (text) {
          noteTitle = text!;
        },
        decoration: InputDecoration(
          hintText: "Please enter a title for your note",
          labelText: "Note Title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Row priorityRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Priority:',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              items: _priorityList.map((priority) {
                return DropdownMenuItem<int>(
                  child: Text(priority),
                  value: _priorityList.indexOf(priority),
                );
              }).toList(),
              value: chosenPriority,
              onChanged: (chosenPrio) {
                setState(() {
                  chosenPriority = chosenPrio!;
                });
              },
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: Constants.primarySwatch, width: 2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }

  Row categoryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Category:',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              items: createCategoryItems(),
              value: categoryID,
              onChanged: (chosenCategoryID) {
                setState(() {
                  categoryID = chosenCategoryID!;
                });
              },
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: Constants.primarySwatch, width: 2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }

  List<DropdownMenuItem<int>> createCategoryItems() {
    return allCategories
        .map((category) => DropdownMenuItem<int>(
              value: category.category_ID,
              child: Text(category.category_Name),
            ))
        .toList();
  }

  _getData() async {
    setState(() {
      databaseHelper.getCategories().then((mapList) {
        for (Map<String, dynamic> readMap in mapList) {
          allCategories.add(Category.fromMap(readMap));
        }
      });
    });
  }
}
