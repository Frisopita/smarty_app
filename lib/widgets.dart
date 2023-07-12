// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/Pages/home.dart';
import 'package:smarty_app/Providers/sensor.dart';


final List<String> excludedServiceUUIDs = [
  '00001800-0000-1000-8000-00805f9b34fb',
  '00001801-0000-1000-8000-00805f9b34fb'
];

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result, this.onTap})
      : super(key: key);

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
              // Permite que el texto se envuelva en multiples lineas si es necesario
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (result.advertisementData.connectable) {
      return ExpansionTile(
        title: _buildTitle(context),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          onPressed: (result.advertisementData.connectable) ? onTap : null,
          child: const Text('CONNECT'),
          //El trailing es un ElevatedButton que muestra un boton "CONNECT".
          //Su estado habilitado (onPressed) depende de si el dispositivo es conectable (result.advertisementData.connectable).
          //Si es conectable, se asigna la funcion onTap al boton; de lo contrario, se asigna null
        ),
        children: <Widget>[
          _buildAdvRow(context, 'Nombre completo del dispositivo',
              result.advertisementData.localName),
        ],
      );
    } else {
      return Container(); // Puedes devolver un widget vacio o cualquier otro widget que desees mostrar en lugar del ExpansionTile
    }
  }
}

class ServiceTile extends StatelessWidget {
  //La clase ServiceTile Tiene dos propiedades: service (el objeto de servicio Bluetooth)
  //y characteristicTiles (una lista de caracteristicas asociadas al servicio).
  final BluetoothService service;

  const ServiceTile({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BluetoothCharacteristic> characteristics =
        service.characteristics.toList();
    if (characteristics.isNotEmpty) {
      // Verifica si hay alguna caracteristica
      if (excludedServiceUUIDs.contains(service.uuid.toString())) {
        //Oculta las uuid que no quiero
        return Container(); // Oculta el servicio
      } else {
        return Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
              onPressed: () {
                context.read<Sensor>().initService(service);
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Conectar'),
            ),
              ],
            ),
          ],
        );
      }
    } else {
      return Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}');
      // Muestra el UUID del servicio si no hay caracteristicas presentes
    }
  }
}