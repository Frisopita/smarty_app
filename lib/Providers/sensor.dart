import 'package:flutter/foundation.dart';

class Sensor with ChangeNotifier {
  /// **CUIDADO** Si la variable es publica esta puede cambiarse desde afuera
  /// sin darnos cuenta (Y posiblemente no es lo que queremos)
  String _id; //id es la caracteristica definida por un uuid
  String _value; // value es el valor de esa caracteristica

  /// Internal Services UUID allowed (whitelist)
  static const Map<String, String> _allowedUUIDs = {
    'beb5483e-36e1-4688-b7f5-ea07361b26a8': 'S1',
    '8bdf0a1a-a48e-4dc3-8bab-ad0c1f7ed218': 'S2',
    '411fcc1c-e7a5-4a61-82fe-0004993dd1f4': 'S3',
    'c608f523-aa19-40d1-8359-ad43409c34d7': 'S4',
    '52294b4d-d66e-4d68-9782-1e5bb8f7ba14': 'S5',
    '7533653f-6f0e-41fa-8fa6-9892a1904db1': 'S6',
    '607a2edc-007d-4d51-a3a6-58fad0db3c37': 'S7',
    'f663c0e7-d78d-466f-9b0c-408e3cc4c3d3': 'S8',
    '778a30f8-943b-4375-b261-fb264772063c': 'S9',
    'a8f2dbc3-c562-42d9-a094-33e4cca73118': 'S10',
    '3c21b038-85a3-4c47-aa78-446f301dd61c': 'S11',
    '1b0724f2-156b-41a6-8bb6-22be491731fc': 'S12',
    // Add more characteristic UUIDs here
  };

  final List<Uint8List> _allCharacteristicValues = [];

  Sensor({String id = '', String value = ''})
      : _id = id,
        _value = value;

  /// Los getters y setters se usan más cuando los valores o estados internos
  /// del objeto no son publicos (la variable inicia con _) en caso contrario es
  /// innecesario y redundante
  // Getter methods
  String get id => _id;
  String get value => _value;
  List<Uint8List> get historyValues => _allCharacteristicValues;

  /// Los setters empiezan con set y se usan cuando las variables son privadas o
  /// requieren hacer más de un solo cambio sin que la llamada lo sepa

  // Setter method
  set id(String id) {
    final String value = _allowedUUIDs[id.toLowerCase()] ?? id.toUpperCase();
    if (value == _id) return;
    _id = value;
    notifyListeners();
  }

  void setValue(Uint8List readValues) {
    String value = String.fromCharCodes(readValues);
    if (value == _value) return;
    _allCharacteristicValues..clear()..add(readValues);

    _value = value;
    notifyListeners();
  }
}
