import 'package:flutter/cupertino.dart';

class ColorChange extends ChangeNotifier {
  bool _isColorChange = false;

  bool get isColorChange {
    return _isColorChange;
  }

  void changeColor() {
    if (_isColorChange) {
      _isColorChange = false;
    } else {
      _isColorChange = true;
    }
    notifyListeners();
  }
}
