class Product {
  int? _id;
  String? _name;
  String? _description;
  String? _imageUrl;
  double? _price;

  Product(this._name, this._description, this._price, this._imageUrl);
  Product.withId(
      this._id, this._name, this._description, this._imageUrl, this._price);

  int? get id => _id;
  String get name => _name!;
  String get description => _description!;
  String? get imageUrl => _imageUrl;
  double get price => _price!;

  set name(String value) {
    if (value.length >= 2) {
      _name = value;
    }
  }

  set description(String value) {
    if (value.length >= 8) {
      _description = value;
    }
  }

  set price(double value) {
    if (value > 0) {
      _price = value;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["Name"] = _name;
    map["Description"] = _description;
    map["ImageUrl"] = _imageUrl;
    map["Price"] = _price;
    if (_id != null) {
      map["Id"] = _id;
    }

    return map;
  }

  Product.fromObject(dynamic o) {
    this._id = o["Id"];
    this._name = o["Name"];
    this._description = o["Description"];
    this._imageUrl = o["ImageUrl"];
    this._price = double.tryParse(o["Price"].toString());
  }
  


}
