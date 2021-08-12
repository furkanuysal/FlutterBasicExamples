import 'package:flutter/material.dart';
import 'package:note_list/constants/constants.dart';
import 'package:note_list/helpers/database_helper.dart';
import 'package:note_list/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> allCategories = <Category>[];
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        body: ListView.builder(
            itemCount: allCategories.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(allCategories[index].category_Name),
                trailing: InkWell(
                    child: Icon(Icons.delete, size: 30),
                    onTap: () => allCategories.length == 2
                        ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('You must have at least 2 categories.')))
                        : _deleteCategory(allCategories[index].category_ID!)),
                onTap: () => _editCategoryDialog(context, allCategories[index]),
              );
            }));
  }

  void _getCategories() {
    databaseHelper.getCategoryList().then((value) {
      setState(() {
        allCategories = value;
      });
    });
  }

  _deleteCategory(int categoryID) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Category'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "If you delete this category, all notes contained in this category will be deleted. Are you sure?"),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      child: Text("Cancel"),
                      style: ElevatedButton.styleFrom(
                          primary: Constants.cancelButtonColor),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                        child: Text("Delete"),
                        onPressed: () {
                          databaseHelper
                              .deleteCategory(categoryID)
                              .then((value) {
                            if (value != 0) {
                              setState(() {
                                _getCategories();
                              });
                            }
                          });
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Category has been deleted.")));
                        })
                  ],
                )
              ],
            ),
          );
        });
  }

  Future<dynamic> _editCategoryDialog(BuildContext context, Category category) {
    var formKey = GlobalKey<FormState>();
    late String editableCategoryName;

    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'Edit Category',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: category.category_Name,
                    onSaved: (newValue) {
                      editableCategoryName = newValue!;
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
                        databaseHelper
                            .updateCategory(Category.withID(
                                category.category_ID, editableCategoryName))
                            .then(
                                (category_ID) // ignore: non_constant_identifier_names
                                {
                          if (category_ID != 0) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Category "$editableCategoryName" has been edited.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        });
                      }
                    },
                    child: Text("Save"),
                    style: ElevatedButton.styleFrom(
                        primary: Constants.primarySwatch),
                  )
                ],
              )
            ],
          );
        });
  }
}
