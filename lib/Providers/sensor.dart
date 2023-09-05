import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:async/async.dart';

/// Objeto que mantiene el valor y su id
class BLE {
  final String id;
  final String data;

  const BLE(this.id, this.data);
}

class Sensor extends ChangeNotifier {
  BluetoothService? _service;

  Stream<List<BLE>> _stream = const Stream.empty();

  Stream<List<BLE>> get stream => _stream;

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
    '6743b155-5778-4756-b31f-34e9e8e53a9d': 'S13'
    // Add more characteristic UUIDs here
  };
  
  /// No importan, pero da error en el widget que dejamos de usar y no lo borre
  set id(String id) {}
  void setValue(Uint8List readValues) {}

  Future <void> initService(BluetoothService service) async {
    //if (service.uuid == _service?.uuid) return;
    
    _service = service;
    List<BluetoothCharacteristic> listBle = service.characteristics
        .where((c) => _allowedUUIDs.containsKey(c.uuid.toString())).toList();
    //await Future.forEach(listBle, (element) => element.setNotifyValue(true).timeout(Duration(seconds: 5)));
    await service.characteristics[0].setNotifyValue(true);
    await service.characteristics[1].setNotifyValue(true);
    await service.characteristics[2].setNotifyValue(true);
    await service.characteristics[3].setNotifyValue(true);
    await service.characteristics[4].setNotifyValue(true);
    await service.characteristics[5].setNotifyValue(true);
    await service.characteristics[6].setNotifyValue(true);
    await service.characteristics[7].setNotifyValue(true);
    await service.characteristics[8].setNotifyValue(true);
    await service.characteristics[9].setNotifyValue(true);
    await service.characteristics[10].setNotifyValue(true);
    await service.characteristics[11].setNotifyValue(true);
    await service.characteristics[12].setNotifyValue(true);
    service.characteristics[0].onValueChangedStream.listen((value) async{
    });
    service.characteristics[1].onValueChangedStream.listen((value) async{
    });
    service.characteristics[3].onValueChangedStream.listen((value) async{
    });
    service.characteristics[4].onValueChangedStream.listen((value) async{
    });
    service.characteristics[5].onValueChangedStream.listen((value) async{
    });
    service.characteristics[6].onValueChangedStream.listen((value) async{
    });
    service.characteristics[7].onValueChangedStream.listen((value) async{
    });
    service.characteristics[8].onValueChangedStream.listen((value) async{
    });
    service.characteristics[9].onValueChangedStream.listen((value) async{
    });
    service.characteristics[10].onValueChangedStream.listen((value) async{
    });
    service.characteristics[11].onValueChangedStream.listen((value) async{
    });
    service.characteristics[12].onValueChangedStream.listen((value) async{
    });

    listBle.removeLast();
    Iterable<Stream<BLE>> streams = listBle
        .map(
          (c) => c.value.map((event) {
            //print (event);
            String value = String.fromCharCodes(event);
            String uuid = c.uuid.toString();
            return BLE(_allowedUUIDs[uuid]!, value);
          }),
        );
    _stream = StreamZip(streams);
    
    notifyListeners();

  }

  String get debug {
    return '''

    ''';
  }
  
}
