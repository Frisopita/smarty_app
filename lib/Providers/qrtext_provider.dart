import 'package:flutter/material.dart';

class QrTextProvider extends ChangeNotifier {
  String? text = '';
  TextEditingController textEditingController = TextEditingController();

  void updateText(String? newValue) {
    if (newValue == text) return;
    text = newValue;
    if (newValue == null) {
      textEditingController.text = '';
    } else {
      textEditingController.value = TextEditingValue(
        text: newValue,
        selection: TextSelection.fromPosition(
          TextPosition(
            offset: newValue.length,
            affinity: TextAffinity.downstream,
          ),
        ),
        composing: TextRange.empty,
      );
    }
    notifyListeners();
  }
}
