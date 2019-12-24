import 'package:flutter/material.dart';

class CategoryList with ChangeNotifier {
  List currentBxMallSubDto = [];

  changeSubDto(List changeSubList) {
    currentBxMallSubDto = changeSubList;
    notifyListeners();
  }
}
