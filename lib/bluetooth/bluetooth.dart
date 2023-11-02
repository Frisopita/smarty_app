import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarty_app/Providers/device_provider.dart';
import 'package:smarty_app/bluetooth/bleconnect.dart';
import 'package:smarty_app/main.dart';
import 'package:smarty_app/variables.dart';
import 'widgets.dart';
import 'package:collection/collection.dart';

enum _ErrorType { connection, notFound }

class BluetoothScreenOffOn extends StatelessWidget {
  const BluetoothScreenOffOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 150.0,
                    color: Colors.lightBlue.shade500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Bluetooth apagado,',
                    style: blueText,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'es necesario prenderlo',
                    style: blueText,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue.shade500,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Activar Bluetooth'),
                  onPressed: () {
                    FlutterBluePlus.instance.turnOn();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatefulWidget {
  const FindDevicesScreen({Key? key, required this.qrText}) : super(key: key);

  final String qrText;

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  late final StreamSubscription<BluetoothDevice?> stream;
  BluetoothDevice? lastScan;
  bool isLoading = false;
  _ErrorType? errorType;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<List<String?>> texts;

  @override
  //Este initstate permite la busqueda de dispositivos Bluetooth una vez construido el widget
  void initState() {
    super.initState();
        texts = _prefs.then((SharedPreferences prefs) {
      final List<String?> storedTexts = prefs.getStringList('texts') ??
          [
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
      return storedTexts;
    });
    stream = FlutterBluePlus.instance.scanResults
        .map(
          (event) => widget.qrText.isEmpty
              ? null
              : event
                  .firstWhereOrNull((scan) => scan.device.name == widget.qrText)
                  ?.device,
        )
        .distinct((prev, curr) => prev?.name == curr?.name)
        .listen((device) {
      lastScan = device;
      if (device != null) {
        _connectToDevice(device).catchError((_) => _showErrorIfAny());
      } else {
        _clear();
      }
    });
    Future.microtask(startScan);
  }

  void _showErrorIfAny() {
    setState(() {
      isLoading = false;
      errorType = lastScan != null ? _ErrorType.connection : null;
    });
  }

  void _clear() {
    setState(() {
      isLoading = false;
      if (errorType != _ErrorType.notFound) {
        errorType = null;
      }
    });
  }

  //actualiza cada 10s la busqueda
  Future<void> startScan() async {
    await FlutterBluePlus.instance
        .startScan(timeout: const Duration(seconds: 10));
    if (mounted && !isLoading && errorType == null) {
      setState(() => errorType = _ErrorType.notFound);
    }
  }

  void _retry() {
    final device = lastScan;
    if (device != null) {
      _connectToDevice(device).catchError((_) => _showErrorIfAny());
    } else if (errorType == _ErrorType.notFound) {
      _showErrorIfAny();
      startScan().ignore();
    } else {
      _clear();
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    if (isLoading || errorType != null) return;
    isLoading = true;
    await device.connect();
    await device.discoverServices();

    if (!mounted) return;
    context.read<DeviceProvider>().setDevice(device);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DataPage(texts: texts),
      ),
    );
  }

  @override
  void dispose() {
    FlutterBluePlus.instance.stopScan().ignore();
    stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (errorType != null) {
      switch (errorType) {
        case _ErrorType.notFound:
          body = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: _retry,
                icon:  const Icon(Icons.refresh_rounded, color: Colors.blue,),
                label: const Text('Reintentar conectarse', style: TextStyle(color: Colors.black),),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrboardPage(),
                  ),
                ),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Cambiar ID'),
              ),
            ],
          );
          break;
        default:
          body = ElevatedButton.icon(
            onPressed: _retry,
            icon: const Icon(Icons.refresh_rounded, color: Colors.indigo,),
            label: const Text('Reintentar conectarse', style: TextStyle(color: Colors.indigo),),
          );
          break;
      }
    } else {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueGrey.shade100,
                strokeWidth: 7,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Conectando a ${widget.qrText}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ],
      );
    }
    return Scaffold(body: Center(child: body));
  }
}
