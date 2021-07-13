import 'package:flutter/material.dart';
import 'package:sqflite_demo/db/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  DbHelper dbHelper = DbHelper();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtImage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtName,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: txtPrice,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: txtImage,
              decoration: InputDecoration(labelText: 'ImageUrl'),
            ),
            TextField(
              controller: txtDescription,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                save();
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.pinkAccent[100]),
            )
          ],
        ),
      ),
    );
  }

  void save() async {
    int result = await dbHelper.insert(
      Product(txtName.text, txtDescription.text, double.tryParse(txtPrice.text),
          txtImage.text),
    );
    if (result != 0) {
      Navigator.pop(context, true);
    }
  }
}
