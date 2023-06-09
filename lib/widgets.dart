// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'Providers/s1_provider.dart';
import 'Providers/s2_provider.dart';
import 'Providers/s3_provider.dart';
import 'Providers/s4_provider.dart';
import 'Providers/s5_provider.dart';
import 'Providers/s6_provider.dart';
import 'Providers/s7_provider.dart';
import 'Providers/s8_provider.dart';
import 'Providers/s9_provider.dart';
import 'Providers/s10_provider.dart';
import 'Providers/s11_provider.dart';
import 'Providers/s12_provider.dart';


final Map<String, String> characteristicNames = {
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

final List<String> excludedServiceUUIDs = [
  '00001800-0000-1000-8000-00805f9b34fb',
  '00001801-0000-1000-8000-00805f9b34fb'
];

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result, this.onTap})
      : super(key: key);

  final ScanResult result;
  final VoidCallback? onTap;

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            result.device.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            result.device.id.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      );
    } else {
      return Text(result.device.id.toString());
    }
  }

  Widget _buildAdvRow(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.apply(color: Colors.black),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  String getNiceServiceData(Map<String, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: _buildTitle(context),
      leading: Text(result.rssi.toString()),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: (result.advertisementData.connectable) ? onTap : null,
        child: const Text('CONNECT'),
      ),
      children: <Widget>[
        _buildAdvRow(
            context, 'Complete Local Name', result.advertisementData.localName),
        _buildAdvRow(context, 'Tx Power Level',
            '${result.advertisementData.txPowerLevel ?? 'N/A'}'),
        _buildAdvRow(context, 'Manufacturer Data',
            getNiceManufacturerData(result.advertisementData.manufacturerData)),
        _buildAdvRow(
            context,
            'Service UUIDs',
            (result.advertisementData.serviceUuids.isNotEmpty)
                ? result.advertisementData.serviceUuids.join(', ').toUpperCase()
                : 'N/A'),
        _buildAdvRow(context, 'Service Data',
            getNiceServiceData(result.advertisementData.serviceData)),
      ],
    );
  }
}

class ServiceTile extends StatelessWidget {
  final BluetoothService service;
  final List<CharacteristicTile> characteristicTiles;

  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (characteristicTiles.isNotEmpty) {
      if (excludedServiceUUIDs.contains(service.uuid.toString())) {
        return Container(); // Oculta el servicio
      } else {
        return Column(
          children: <Widget>[
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,            
            ),
            ...characteristicTiles,
          ],
        );
      }
    } else {
      return Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}');
    }
  }
}

class CharacteristicTile extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  final VoidCallback? onReadPressed;
  final ValueChanged<List<int>>? onWritePressed;
  final VoidCallback? onNotificationPressed;

  const CharacteristicTile(
      {Key? key,
      required this.characteristic,
      this.onReadPressed,
      this.onWritePressed,
      this.onNotificationPressed})
      : super(key: key);

  @override
  State<CharacteristicTile> createState() => _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile> {
  List<List<int>> allCharacteristicValues = [];
  @override
  Widget build(BuildContext context) {
    final providerS1 = Provider.of<S1Provider>(context);
    final providerS2 = Provider.of<S2Provider>(context);
    final providerS3 = Provider.of<S3Provider>(context);
    final providerS4 = Provider.of<S4Provider>(context);
    final providerS5 = Provider.of<S5Provider>(context);
    final providerS6 = Provider.of<S6Provider>(context);
    final providerS7 = Provider.of<S7Provider>(context);
    final providerS8 = Provider.of<S8Provider>(context);
    final providerS9 = Provider.of<S9Provider>(context);
    final providerS10 = Provider.of<S10Provider>(context);
    final providerS11 = Provider.of<S11Provider>(context);
    final providerS12 = Provider.of<S12Provider>(context);
    return  SingleChildScrollView(
      child: Column(children: <Widget>[
        StreamBuilder<List<int>>(
          stream: widget.characteristic.value,
          initialData: widget.characteristic.lastValue,
          builder: (c, snapshot) {
            final value = snapshot.data;
            String asciiString = value != null ? String.fromCharCodes(value) : '';
            return const ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(220, 222, 18, 164),
            foregroundColor: Colors.white,
          ),
          onPressed: () async {
            final currentContext = context;
    
            widget.characteristic.read();
            List<int> readValues = await widget.characteristic.value.first;
            allCharacteristicValues.add(readValues);
            providerS1.s1 = String.fromCharCodes(readValues);
            providerS2.s2 = String.fromCharCodes(readValues);
            providerS3.s3 = String.fromCharCodes(readValues);
            providerS4.s4 = String.fromCharCodes(readValues);
            providerS5.s5 = String.fromCharCodes(readValues);
            providerS6.s6 = String.fromCharCodes(readValues);
            providerS7.s7 = String.fromCharCodes(readValues);
            providerS8.s8 = String.fromCharCodes(readValues);
            providerS9.s9 = String.fromCharCodes(readValues);
            providerS10.s10 = String.fromCharCodes(readValues);
            providerS11.s11 = String.fromCharCodes(readValues);
            providerS12.s12 = String.fromCharCodes(readValues);
            
            Navigator.of(currentContext).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    DataPage(data: allCharacteristicValues),
              ),
            );
          },
          child: const Text('Enviar datos'),
        ),
      ]),
    );
  }
}

class AdapterStateTile extends StatelessWidget {
  const AdapterStateTile({Key? key, required this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: ListTile(
        title: Text(
          'Bluetooth adapter is ${state.toString().substring(15)}',
          style: Theme.of(context).primaryTextTheme.titleSmall,
        ),
        trailing: Icon(
          Icons.error,
          color: Theme.of(context).primaryTextTheme.titleSmall?.color,
        ),
      ),
    );
  }
}

