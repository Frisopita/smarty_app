import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:smarty_app/variables.dart';
import 'widgets.dart';

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
  const FindDevicesScreen({Key? key}) : super(key: key);

  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  @override
  //Este initstate permite la b��squeda de dispositivos Bluetooth una vez construido el widget 
  void initState() {
    super.initState();
    startScan();
  }
  //actualiza cada 4 s la busqueda
  Future<void> startScan() async {
    await FlutterBluePlus.instance.startScan(timeout: const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/logopage.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => FlutterBluePlus.instance.startScan(timeout: const Duration(seconds: 3)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<BluetoothDevice>>(
                //lista de dispositivos Bluetooth conectados y muestra informaci��n sobre cada dispositivo en forma de ListTile.
                stream: Stream.periodic(const Duration(seconds: 2)).asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
                initialData: const [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!.map((d) => ListTile(
                    title: Text(d.name),
                    trailing: StreamBuilder<BluetoothDeviceState>(
                      stream: d.state,
                      initialData: BluetoothDeviceState.disconnected,
                      builder: (c, snapshot) {
                        if (snapshot.data == BluetoothDeviceState.connected) {
                          return ElevatedButton(
                            child: const Text('OPEN'),
                            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeviceScreen(device: d))),
                          );
                        }
                        return Text(snapshot.data.toString());
                      },
                    ),
                  )).toList(),
                ),
              ),
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBluePlus.instance.scanResults,
                initialData: const [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!.map((r) => ScanResultTile(
                    result: r,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      r.device.connect();
                      return DeviceScreen(device: r.device);
                    })),
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeviceScreen extends StatefulWidget {
  // representa la pantalla de un dispositivo Bluetooth espec��fico
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
List<Widget> _buildServiceTiles(List<BluetoothService> services) {

  return services.map( //Se utiliza el m��todo map para recorrer cada servicio en la lista de servicios y generar un ServiceTile correspondiente.
    (s) {
      return ServiceTile(
      //Cada ServiceTile se construye con el servicio actual y una lista de characteristicTiles, 
      //que se construye mapeando las caracter��sticas del servicio y creando instancias de CharacteristicTile.
        service: s,
      );
    },
  ).toList();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/logopage.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: widget.device.state, //recibe el estado state del dispositovo Bluetooth
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              if (snapshot.data == BluetoothDeviceState.connected) {
                widget.device.discoverServices();
              }
              return ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      snapshot.data == BluetoothDeviceState.connected
                          ? const Icon(Icons.bluetooth_connected)
                          : const Icon(Icons.bluetooth_disabled),
                    ],
                  ),
                  title: Text(
                      'Device is ${snapshot.data.toString().split('.')[1]}.'),
                  trailing: SizedBox(
                    width: 30,
                    child: StreamBuilder<bool>(
                      stream: widget.device.isDiscoveringServices,
                      initialData: false,
                      builder: (c, snapshot) => IndexedStack(
                        index: snapshot.data! ? 1 : 0,
                      ),
                    ),
                  ));
            },
          ),
          StreamBuilder<List<BluetoothService>>(
            //recibe la lista de servicios (services) del dispositivo
            stream: widget.device.services,
            initialData: const [],
            builder: (c, snapshot) {
              return Column(
                children: _buildServiceTiles(snapshot.data!), //muestra los ServiceTile generados por el m��todo _buildServiceTiles.
              );
            },
            //Los ServiceTile y CharacteristicTile se generan din��micamente en funci��n de los datos recibidos.
          ),
        ],
      ),
    );
  }
}
