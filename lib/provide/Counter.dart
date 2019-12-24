import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int value = 10;

  increaseNum() {
    value++;
    notifyListeners();
  }
}
