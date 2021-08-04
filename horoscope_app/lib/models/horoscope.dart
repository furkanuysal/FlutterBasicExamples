class Horoscope {
  final String _name;
  final String _date;
  final String _description;
  final String _miniPic;
  final String _bigPic;

  get name => this._name;
  get date => this._date;
  get description => this._description;
  get miniPic => this._miniPic;
  get bigPic => this._bigPic;

  Horoscope(
      this._name, this._date, this._description, this._miniPic, this._bigPic);

  @override
  String toString() {
    return '$_name - $_date';
  }
}
