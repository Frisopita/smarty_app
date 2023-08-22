import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceProvider extends ChangeNotifier {
  late BluetoothDevice device;

  void setDevice(BluetoothDevice d) {
    device = d;
    notifyListeners();
  }
}
