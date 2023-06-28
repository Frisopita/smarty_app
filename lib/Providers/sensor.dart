import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

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

class ProviderSensor extends ChangeNotifier {
  final List<Uint8List> list = List.filled(12, Uint8List(0));
  void add(int index, Uint8List list){
    this.list[index] = list;
    notifyListeners();
  }
  Future <void> addService(BluetoothService s) async {
    List<BluetoothCharacteristic> characteristics = s.characteristics.toList();
  }
}


