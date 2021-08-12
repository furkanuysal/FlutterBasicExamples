import 'package:flutter/material.dart';
import 'package:note_list/constants/constants.dart';
import 'package:note_list/helpers/database_helper.dart';
import 'package:note_list/models/category.dart';
import 'package:note_list/pages/categories_screen.dart';
import 'package:note_list/pages/note_detail.dart';
import 'package:note_list/widgets/note_list.dart';

class NotePad extends StatefulWidget {
  NotePad({Key? key}) : super(key: key);

  @override
  _NotePadState createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Constants.title,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: ListTile(
                leading: Icon(Icons.category),
                title: Text("Categories"),
                onTap: () {
                  Navigator.pop(context);
                  _goToCategoriesPage();
                },
              ))
            ];
          })
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showAddCategory(context);
            },
            heroTag: "AddCategory",
            tooltip: "Add Category",
            child: Icon(Icons.add_circle),
            mini: true,
          ),
          FloatingActionButton(
            heroTag: "AddNote",
            onPressed: () => _goToDetailPage(context),
            tooltip: "Add Note",
            child: Icon(Icons.add),
          )
        ],
      ),
      body: NoteList(),
    );
  }

  Future<dynamic> showAddCategory(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    // ignore: unused_local_variable
    late String newCategoryName;

    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'Add Category',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (newValue) {
                      newCategoryName = newValue!;
                    },
                    decoration: InputDecoration(
                        labelText: "Category Name",
                        border: OutlineInputBorder()),
                    validator: (categoryName) {
                      if (categoryName!.length < 2) {
                        return "At least enter 2 letters.";
                      }
                    },
                  ),
                ),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                    style: ElevatedButton.styleFrom(
                        primary: Constants.cancelButtonColor),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        databaseHelper.addCategory(Category(newCategoryName)).then(
                            (category_ID) // ignore: non_constant_identifier_names
                            {
                          if (category_ID > 0) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Category "$newCategoryName" has been added.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            debugPrint("Category added: $category_ID");
                          }
                        });
                      }
                    },
                    child: Text("Save"),
                    style:
                        ElevatedButton.styleFrom(primary: Constants.primarySwatch),
                  )
                ],
              )
            ],
          );
        });
  }

  _goToDetailPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NoteDetailPage(
                  pageTitle: 'New Note',
                ))).then((value) => setState(() {}));
  }

  _goToCategoriesPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CategoriesScreen()))
        .then((value) => setState(() {}));
  }
}
