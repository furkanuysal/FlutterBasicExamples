class Category {
  int? category_ID; // ignore: non_constant_identifier_names
  late String category_Name; // ignore: non_constant_identifier_names

  Category(this.category_Name);
  Category.withID(this.category_ID, this.category_Name);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["category_ID"] = category_ID;
    map["category_Name"] = category_Name;
    return map;
  }

  Category.fromMap(Map<String, dynamic> map) {
    this.category_ID = map["category_ID"];
    this.category_Name = map["category_Name"];
  }
}
