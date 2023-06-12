import 'package:flutter/foundation.dart';

class Sensor with ChangeNotifier {
  String id;
  Map<String, String> characteristics;

  Sensor({required this.id, required this.characteristics}) {
    // Si prefieres inicializar el mapa vac¨ªo por defecto, puedes usar:
    // this.characteristics = {};
  }

  // Getter methods
  String get getId => this.id;
  String getCharacteristic(String key) => this.characteristics[key] ?? '';

  // Setter methods
  void setId(String id) {
    this.id = id;
    notifyListeners();
  }

  void setCharacteristic(String key, String value) {
    this.characteristics[key] = value;
    notifyListeners();
  }
}
