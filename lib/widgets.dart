// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/Providers/sensor.dart';
import 'main.dart';

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
  const ScanResultTile({
  Key? key, 
  required this.result, 
  this.onTap}):
  super(key: key);

  final ScanResult result; //Resultado de Scanear bluetooth
  final VoidCallback? onTap; //Es una callback cuando se toca un elemento

  Widget _buildTitle(BuildContext context) {
    // _buildTitle devuelve un wisget que representa el t��tulo del elemento ScanResultTile 
    //en funci��n del resultado del escaneo. Si el nombre del dispositivo no est�� vac��o, 
    //se muestra el nombre y el ID del dispositivo en dos Text widgets en una columna. 
    //De lo contrario, solo se muestra el ID del dispositivo.
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
        // Alinea los elementos de la fila en la parte superior
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
              // Permite que el texto se envuelva en m��ltiples l��neas si es necesario
            ),
          ),
        ],
      ),
    );
  }

  /*
  El m��todo getNiceHexArray toma una lista de enteros (bytes) y devuelve una representaci��n en forma de cadena de los bytes en formato hexadecimal.
  Los bytes se convierten a cadenas hexadecimales usando i.toRadixString(16), se ajusta la longitud a 2 d��gitos utilizando padLeft(2, '0') y se unen con comas usando join(', ').
  Luego, se envuelve entre corchetes ([]) y se convierte a may��sculas usando toUpperCase() antes de devolver la cadena resultante.
  */
  String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  /*
  El m��todo getNiceManufacturerData toma un mapa de enteros a listas de enteros (data) y devuelve una representaci��n en forma de cadena de los datos del fabricante.
  Si el mapa est�� vac��o, devuelve 'N/A'. En caso contrario, itera sobre el mapa utilizando forEach y para cada par clave-valor, agrega una cadena al resultado (res).
  La cadena consiste en la clave convertida a una cadena hexadecimal en may��sculas (id.toRadixString(16).toUpperCase()) seguida de ': ' 
  y la representaci��n en forma de cadena de los bytes utilizando el m��todo getNiceHexArray. Luego, se une el resultado con comas usando join(', ') y se devuelve la cadena resultante.
  */
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

  /*
  El m��todo getNiceServiceData es similar al m��todo getNiceManufacturerData, pero se aplica a los datos del servicio en lugar de los datos del fabricante.
  Tambi��n toma un mapa de cadenas a listas de enteros (data) y devuelve una representaci��n en forma de cadena de los datos del servicio. Si el mapa est�� vac��o,
  devuelve 'N/A'. En caso contrario, itera sobre el mapa utilizando forEach y para cada par clave-valor, agrega una cadena al resultado (res). 
  La cadena consiste en la clave en may��sculas (id.toUpperCase()) seguida de ': ' y la representaci��n en forma de cadena de los bytes utilizando el m��todo getNiceHexArray. 
  Luego, se une el resultado con comas usando join(', ') y se devuelve la cadena resultante.
  */
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
    if (result.advertisementData.connectable){
      return     ExpansionTile(
      title: _buildTitle(context),
      leading: Text(result.rssi.toString()), //El leading es un widget Text que muestra la intensidad de la se?al (result.rssi) en forma de cadena.
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: (result.advertisementData.connectable) ? onTap : null,
        child: const Text('CONNECT'),
        //El trailing es un ElevatedButton que muestra un bot��n "CONNECT". 
        //Su estado habilitado (onPressed) depende de si el dispositivo es conectable (result.advertisementData.connectable). 
        //Si es conectable, se asigna la funci��n onTap al bot��n; de lo contrario, se asigna null
      ),
      children: <Widget>[
        //Los children son una lista de widgets que se mostrar��n cuando el ExpansionTile se expanda. 
        //Cada uno de estos widgets se construye llamando al m��todo _buildAdvRow, 
        //que crea una fila de informaci��n con un t��tulo y un valor.
        //Las filas contienen informaci��n como "Complete Local Name", "Tx Power Level", 
        //"Manufacturer Data", "Service UUIDs" y "Service Data". Se utilizan m��todos adicionales como getNiceManufacturerData
        //y getNiceServiceData para formatear los datos del fabricante y del servicio de manera legible.
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
    } else {
  return Container(); // Puedes devolver un widget vac��o o cualquier otro widget que desees mostrar en lugar del ExpansionTile
}

  }
}

class ServiceTile extends StatelessWidget {
  //La clase ServiceTile Tiene dos propiedades: service (el objeto de servicio Bluetooth) 
  //y characteristicTiles (una lista de caracter��sticas asociadas al servicio).
  final BluetoothService service;
  final List<CharacteristicTile> characteristicTiles;

  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (characteristicTiles.isNotEmpty) {
    // Verifica si hay alguna caracter��stica
      if (excludedServiceUUIDs.contains(service.uuid.toString())) {
        //Oculta las uuid que no quiero
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
      // Muestra el UUID del servicio si no hay caracter��sticas presentes

    }
  }
}

class CharacteristicTile extends StatefulWidget {
  //CharacteristicTile es un widget de StatefulWidget que representa un mosaico de caracter��stica Bluetooth.
  final BluetoothCharacteristic characteristic; 
  //Characteristica asociada a un title 
  final List<List<BluetoothCharacteristic>> characteristicLists;
  //Lista de caracteristicas de bluetooth
  final VoidCallback? onReadPressed;
  //funci��n que se encarga de leeer valores
  final VoidCallback? onNotificationPressed;
  //Funci��n que se envarga de notificar o dar retroalimentaci��n 

  const CharacteristicTile(
      {Key? key,
      required this.characteristic,
      required this.characteristicLists,
      this.onReadPressed,
      this.onNotificationPressed})
      : super(key: key);

  @override
  State<CharacteristicTile> createState() => _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile> {
  List<List<int>> allCharacteristicValues = [];
  //es una lista que almacenar�� los valores de la caracter��stica.

  @override
  Widget build(BuildContext context) {
    final sensorVal = Provider.of<Sensor>(context); //Provedor

    //funci��n que realiza una serie de acciones relacionadas con la caracter��stica Bluetooth.
    void performActions() async {
      //se obtiene el contexto actual y se realizan acciones como establecer la notificaci��n, 
      //leer el valor y escuchar los cambios en el valor de la caracter��stica.
      final currentContext = context;
      await widget.characteristic
          .setNotifyValue(!widget.characteristic.isNotifying);
      await widget.characteristic.read();
      widget.characteristic.value.listen((value) async {
        List<int> readValues = await widget.characteristic.value.first;
        allCharacteristicValues.add(readValues);
        String value = String.fromCharCodes(readValues);
        sensorVal.setValue(value);
        sensorVal.setId(
          '${characteristicNames[widget.characteristic.uuid.toString().toLowerCase()] ?? widget.characteristic.uuid.toString().toUpperCase()}',
        );
      });
      //Regresa a la DataPage con los valores de allCharacteristicValues
      Navigator.push(
        currentContext,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              DataPage(data: allCharacteristicValues),
        ),
      ).then((values) {
        Navigator.pop(currentContext);
      });
    }

// Llamar a la funci��n en el c��digo principal

    return SingleChildScrollView(
      //Permitir el desplazamiento si es necesario
      child: Column(children: <Widget>[
        StreamBuilder<List<int>>(
          stream: widget.characteristic.value, //Stream que escucha el flujo de datos
          initialData: widget.characteristic.lastValue, //representa los datos iniciales del flujo
          builder: (c, snapshot) {
            return const ListTile(
              //Lista con una columna vacia centrada
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            );
          },
        ),
        ElevatedButton(
          //Boton que ejecuta la fuci��n performActios
          onPressed: ()
          {
            performActions();
          },

          child: Text('Inicio'),
          )
      ]),
    );
  }
}
