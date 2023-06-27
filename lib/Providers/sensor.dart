import 'package:flutter/foundation.dart';

class Sensor with ChangeNotifier {
  /// **CUIDADO** Si la variable es publica esta puede cambiarse desde afuera 
  /// sin darnos cuenta (Y posiblemente no es lo que queremos)
  String _id; //id es la caracteristica definida por un uuid
  String _value; // value es el valor de esa caracteristica

  Sensor({String id = '', String value = ''})
      : _id = id,
        _value = value;

  /// Los getters y setters se usan más cuando los valores o estados internos
  /// del objeto no son publicos (la variable inicia con _) en caso contrario es
  /// innecesario y redundante
  // Getter methods
  String get id => _id;
  String get value => _value;

  /// Los setters empiezan con set y se usan cuando las variables son privadas o
  /// requieren hacer más de un solo cambio sin que la llamada lo sepa

  // Setter methods
  set id(String id) {
    _id = id;
    notifyListeners();
  }

  set value(String value) {
    _value = value;
    notifyListeners();
  }
}
