/*
Main del proyecto de SmartyApp
*/

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as flutter_blue;
import 'package:smarty_app/bluetooth.dart';
import 'Pages/history.dart';
import 'Pages/home.dart';
import 'Pages/perfil.dart';
import 'Pages/settings.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/Providers/sensor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Providers/profile.dart';

//prueba para ver si rama funciona correctamente


void main() {
  runApp(const MySmartApp());
  // Inicializaci��n del widget raiz de la aplicaci��n
}

class MySmartApp extends StatefulWidget {
  const MySmartApp({Key? key}) : super(key: key);

  @override
  State<MySmartApp> createState() => _MySmartAppState();
}

class _MySmartAppState extends State<MySmartApp> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<List<String?>> texts;

  @override
  void initState() {
    super.initState();
    texts = _prefs.then((SharedPreferences prefs) {
      final List<String?> storedTexts = prefs.getStringList('texts') ?? [
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
  }

  List<List<int>> allCharacteristicValues = [];
  //lista que almacena los valores de caracteristicas (characteristics) de Bluetooth

  @override
  Widget build(BuildContext context) {
    /// MultiProvider permite incializar multiples providers en cascada en una lista.
    /// El 2do provider puede llamar al primero y el 3ro a los primeros 2 y asi sucesivamente
    ///
    /// Si el widget abajo de Multiprovider no requiere llamar a ninguno de los providers puede usarse child
    /// en caso contrario se recomienda build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Sensor>(
          /// lazy se usa para incializar un provider antes de tiempo:
          /// true: se incializa desde que se inserta en el Widget Tree
          /// false: se inicializa hasta que se utiliza por 1ra vez
          /// null: mismo que false
          lazy: null,
          //Se encarga de la notificacion de los cambios de provider
          create: (BuildContext context) => Sensor(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileData(),
        ),
        /// Puedes iniciar el stream dentro de un provider y usarlo en toda la app.
        /// Lo ideal seria usar un wrapper y meter el stream dentro de un objeto o servicio que nosotros
        /// escribieramos
        StreamProvider<flutter_blue.BluetoothState>.value(
          value: flutter_blue.FlutterBluePlus.instance.state,
          initialData: flutter_blue.BluetoothState.unknown,
        ),
      ],
      child: MaterialApp(
        // Quita el banner de debug en la parte superior derecha de la pantalla
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Crimson_Text',
        ),

        home: Builder(
          builder: (context) {
            final blState = context.watch<flutter_blue.BluetoothState>();
            if (blState == flutter_blue.BluetoothState.on) {
              // Pasa los datos aqui
              return DataPage(texts: texts);
            }
            return DataPage(texts: texts);
            // Si el estado de Bluetooth no este encendido, muestra la pantalla BluetoothOffScreen con el estado actual
          },
        ),
      ),
      builder: (context, child) {
        /// select es un caso especial que solo observa un estado dentro del objeto (Sensor)
        /// y solo actualiza el widget cuando ese valor cambia, sin importar si notifylistener() cambio otros datos de nuestro objeto
        /// ver [Selector]
        final stream = context.select<Sensor, Stream<List<BLE>>>(
          (s) => s.stream,
        );
        return StreamProvider<List<BLE>>.value(
          value: stream,
          catchError: (context, error) {

            return [];
          },
          initialData: const [],
          child: child,
        );
      },
    );
  }
}

/*/
DataPage es la mainscreen de la aplicacion, 
muestra diferentes pantallas segun el indice seleccionado con ButtonsNavigationBar
*/

class DataPage extends StatefulWidget {
  final Future<List<String?>> texts;
  DataPage({Key? key, required this.texts}) : super(key: key);
  @override
  
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  int currentIndex = 0;
  // Constructor que recibe 'texts'

  

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
    const Home(), //Screen donde se muestra las temperaturas del pie
    const History(), //Historial de cambios de temperatura
    FutureBuilder<List<String?>>(
        future: widget.texts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final dataList = snapshot.data ?? ['', ''];
            return Perfil(texts: dataList);
          }
        },
      ),
  ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/logopage.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
        leading: null,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bluetooth,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const FindDevicesScreen(),
              ));
            },
          ),
        ],
      ),
      body: _widgetOptions[currentIndex],
      //Botones de Navegaci��n
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
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
        ],
        selectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
