//Test de kabanta UX

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as FlutterBlue;
import 'package:smarty_app/bluetooth.dart';
import 'package:smarty_app/Providers/s1_provider.dart';
import 'package:smarty_app/Providers/s2_provider.dart';
import 'package:smarty_app/Providers/s3_provider.dart';
import 'package:smarty_app/Providers/s4_provider.dart';
import 'package:smarty_app/Providers/s5_provider.dart';
import 'package:smarty_app/Providers/s6_provider.dart';
import 'package:smarty_app/Providers/s7_provider.dart';
import 'package:smarty_app/Providers/s8_provider.dart';
import 'package:smarty_app/Providers/s9_provider.dart';
import 'package:smarty_app/Providers/s10_provider.dart';
import 'package:smarty_app/Providers/s11_provider.dart';
import 'package:smarty_app/Providers/s12_provider.dart';
import 'Pages/history.dart';
import 'Pages/home.dart';
import 'Pages/perfil.dart';
import 'Pages/settings.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/sensor.dart';

void main() {
  runApp(const MySmartApp());
}

// Inicializaci¨®n de la APP
class MySmartApp extends StatefulWidget {
  const MySmartApp({Key? key}) : super(key: key);

  @override
  _MySmartAppState createState() => _MySmartAppState();
}

class _MySmartAppState extends State<MySmartApp> {
  List<List<int>> allCharacteristicValues = []; // Define la lista aqu¨ª

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => S12Provider(),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => S11Provider(),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => S10Provider(),
          child: ChangeNotifierProvider(
            create: (BuildContext context) => S9Provider(),
            child: ChangeNotifierProvider(
              create: (BuildContext context) => S8Provider(),
              child: ChangeNotifierProvider(
                create: (BuildContext context) => S7Provider(),
                child: ChangeNotifierProvider(
                  create: (BuildContext context) => S6Provider(),
                  child: ChangeNotifierProvider(
                    create: (BuildContext context) => S5Provider(),
                    child: ChangeNotifierProvider(
                      create: (BuildContext context) => S4Provider(),
                      child: ChangeNotifierProvider(
                        create: (BuildContext context) => S3Provider(),
                        child: ChangeNotifierProvider(
                          create: (BuildContext context) => S2Provider(),
                          child: ChangeNotifierProvider(
                            create: (BuildContext context) => Sensor(id: '', characteristics: {}),
                            child: MaterialApp(
                              debugShowCheckedModeBanner: false,
                              home: StreamBuilder<FlutterBlue.BluetoothState>(
                                stream: FlutterBlue.FlutterBluePlus.instance.state,
                                initialData: FlutterBlue.BluetoothState.unknown,
                                builder: (c, snapshot) {
                                  final state = snapshot.data;
                                  if (state == FlutterBlue.BluetoothState.on) {
                                    return DataPage(data: allCharacteristicValues); // Pasa los datos aqu¨ª
                                  }
                                  return BluetoothOffScreen(state: state);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Data main screen

class DataPage extends StatefulWidget {
  final List<List<int>> data;

  const DataPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  int currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const History(),
    const Perfil(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[currentIndex],
      //Botones de Navegaci¨®n
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

