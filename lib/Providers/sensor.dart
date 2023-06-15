import 'package:flutter/foundation.dart';

class Sensor with ChangeNotifier {
  String id;//id es la caracteristica definida por un uuid
  String value;// value es el valor de esa caracteristica

  Sensor({required this.id, required this.value}) {
    // Si prefieres inicializar el mapa vac¨ªo por defecto, puedes usar:
    // this.characteristics = {};
  }

  // Getter methods
  String get getId => this.id;
  String get getValue => this.value;

  // Setter methods
  void setId(String id) {
    this.id = id;
    notifyListeners();
  }

  void setValue(String value) {
    this.value = value;
    notifyListeners();
  }
}

