abstract class Prototype {
  Prototype clone();
  @override
  String toString();
}

class NumberContent implements Prototype {
  final int _number;

  NumberContent(this._number);

  @override
  Prototype clone() {
    return NumberContent(_number + 1);
  }

  @override
  String toString() {
    return "$_number";
  }
}

class StringContent implements Prototype {
  final String _content;

  StringContent(this._content);

  @override
  Prototype clone() {
    return StringContent("$_content +1");
  }

  @override
  String toString() {
    return _content;
  }
}
