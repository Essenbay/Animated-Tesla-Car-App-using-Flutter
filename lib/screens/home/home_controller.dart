import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool _isRightDoorLock = true;
  bool get isRightDoorLock => _isRightDoorLock;
  void updateRightDoorLock() {
    _isRightDoorLock = !_isRightDoorLock;
    notifyListeners();
  }
}
