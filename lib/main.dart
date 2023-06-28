/*
Main del proyecto de SmartyApp
*/

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as FlutterBlue;
import 'package:smarty_app/bluetooth.dart';
import 'Pages/history.dart';
import 'Pages/home.dart';
import 'Pages/perfil.dart';
import 'Pages/settings.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/Providers/sensor.dart';

void main() {
  runApp(const MySmartApp()); // Inicializaci車n del widget raiz de la aplicaci車n
}

class MySmartApp extends StatefulWidget {
  const MySmartApp({Key? key}) : super(key: key);

  @override
  _MySmartAppState createState() => _MySmartAppState();
}

class _MySmartAppState extends State<MySmartApp> {
  List<List<int>> allCharacteristicValues =
      []; //lista que almacena los valores de caracter赤sticas (characteristics) de Bluetooth

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderSensor(),
      child: ChangeNotifierProvider(
        //Se encarga de la notificaci車n de los cambios de provider
        create: (BuildContext context) => Sensor(id: '', value: ''),
        // Crea una instancia del Provider para el modelo 'Sensor'
        //donde id es el uuid y value el valor que lee del uuid
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // Quita el banner de debug en la parte superior derecha de la pantalla
          home: StreamBuilder<FlutterBlue.BluetoothState>(
            //El StreamBuilder escucha el estado de Bluetooth y devuelve la pantalla correspondiente en funci車n del estado.
            stream: FlutterBlue.FlutterBluePlus.instance.state,
            // El stream a seguir es el estado de Bluetooth proporcionado por el paquete 'flutter_blue_plus'
            initialData: FlutterBlue.BluetoothState.unknown,
            // Establece el estado inicial como desconocido
            builder: (c, snapshot) {
              final state = snapshot.data;
              if (state == FlutterBlue.BluetoothState.on) {
                return DataPage(
                    data: allCharacteristicValues); // Pasa los datos aqu赤
              }
              return BluetoothOffScreen(state: state);
              // Si el estado de Bluetooth no est芍 encendido, muestra la pantalla BluetoothOffScreen con el estado actual
            },
          ),
        ),
      ),
    );
  }
}

/*/
DataPage es la mainscreen de la aplicaci車n, 
muestra diferentes pantallas seg迆n el indice seleccionado con ButtonsNavigationBar
*/

class DataPage extends StatefulWidget {
  final List<List<int>> data;

  const DataPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  int currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Home(), //Screen donde se muestra las temperaturas del pie
    const History(), //Historial de cambios de temperatura
    const Perfil(), //Perfil de la persona
    const Settings(), //Configuraci車n
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[currentIndex],
      //Botones de Navegaci車n
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          //Home Button
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(Icons.home,
                color: currentIndex == 0 ? Colors.blueGrey : Colors.black),
          ),
          //History Button
          BottomNavigationBarItem(
            label: 'Historial',
            icon: Icon(Icons.history,
                color: currentIndex == 1 ? Colors.blueGrey : Colors.black),
          ),
          //Account Button
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(Icons.person,
                color: currentIndex == 2 ? Colors.blueGrey : Colors.black),
          ),
          // Settings Button
          BottomNavigationBarItem(
            label: ("Configuraci\u00F3n"),
            icon: Icon(Icons.settings,
                color: currentIndex == 3 ? Colors.blueGrey : Colors.black),
          ),
        ],
        selectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
