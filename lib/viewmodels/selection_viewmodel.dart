import 'package:flutter/material.dart';

class SelectionViewModel extends ChangeNotifier {
  String? _severity;
  String? _category;

  String? get severity => _severity;
  String? get category => _category;

  void setSeverity(String value) {
    _severity = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }
}
