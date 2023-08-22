import 'package:flutter/material.dart';

class ProfileData extends ChangeNotifier {
  List<String?> texts = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void updateTexts(List<String?> newValues) {
    texts = newValues;
    notifyListeners();
  }
}
