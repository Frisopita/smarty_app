import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/Providers/sensor.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LabelsTem(),
      ),
    );
  }
}

class LabelsTem extends StatefulWidget {
  const LabelsTem({super.key});

  @override
  State<LabelsTem> createState() => _LabelsTemState();
}

class _LabelsTemState extends State<LabelsTem> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Color _getColor(double colorval) {
    //Funci��n que setea un color dependiendo el valor de value
    if (colorval <= 33) {
      // Rango del 1 al 33: Verde a Amarillo
      final red = (255 * colorval / 33).round();
      const green = 255;
      return Color.fromARGB(255, red, green, 0);
    } else if (colorval <= 67) {
      // Rango del 34 al 66: Amarillo a Rojo
      const red = 255;
      final green = (255 * (100 - colorval) / 33).round();
      return Color.fromARGB(255, red, green, 0);
    } else {
      // Rango del 67 al 100: Rojo
      return Colors.red;
    }
  }

  @override
  void initState() {
    super.initState();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    void showNotification() async {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'your_channel_id',
        'your_channel_name',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.show(
        0,
        'Valor fuera de rango',
        'El valor ha pasado el rango especificado.',
        platformChannelSpecifics,
        payload: 'valueOutOfRange',
      );
    }

    String s1 = "S1";
    String s2 = "S2";
    String s3 = "S3";
    String s4 = "S4";
    String s5 = "S5";
    String s6 = "S6";
    String s7 = "S7";
    String s8 = "S8";
    String s9 = "S9";
    String s10 = "S10";
    String s11 = "S11";
    String s12 = "S12";
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Images/piecitosedit4.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Consumer<List<BLE>>(builder: (context, sensors, _) {
              //Color circleColor = Colors.pink.shade200;
              Color? circleColor1;
              Color? circleColor2;
              Color? circleColor3;
              Color? circleColor4;
              Color? circleColor5;
              Color? circleColor6;
              Color? circleColor7;
              Color? circleColor8;
              Color? circleColor9;
              Color? circleColor10;
              Color? circleColor11;
              Color? circleColor12;

              /// Lo más probable es que se llame showNotification muchas veces
              /// (1 por sensor) lo cual puede no ser ideal
              print('print $sensors');
              loopCallback(BLE sensor) {
                String value = sensor.data;
                switch (sensor.id) {
                  case 'S1':
                    {
                      s1 = value;
                      double value1 = double.tryParse(value) ?? 0.0;
                      circleColor1 = _getColor(value1);
                      
                      print(value1);
                      if (value1 > 150.0 || value1 < 0.0) {
                        showNotification();
                      }
                    }
                    break;

                  case 'S2':
                    {
                      s2 = value;
                      double value2 = double.tryParse(value) ?? 0.0;
                      circleColor2 = _getColor(value2);
                      if (value2 > 150.0 || value2 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S3':
                    {
                      s3 = value;
                      double value3 = double.tryParse(value) ?? 0.0;
                      circleColor3 = _getColor(value3);
                      if (value3 > 100.0 || value3 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S4':
                    {
                      s4 = value;
                      double value4 = double.tryParse(value) ?? 0.0;
                      circleColor4 = _getColor(value4);
                      if (value4 > 100.0 || value4 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S5':
                    {
                      s5 = value;
                      double value5 = double.tryParse(value) ?? 0.0;
                      circleColor5 = _getColor(value5);
                      if (value5 > 100.0 || value5 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S6':
                    {
                      s6 = value;
                      double value6 = double.tryParse(value) ?? 0.0;
                      circleColor6 = _getColor(value6);
                      if (value6 > 100.0 || value6 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S7':
                    {
                      s7 = value;
                      double value7 = double.tryParse(value) ?? 0.0;
                      circleColor7 = _getColor(value7);
                      if (value7 > 100.0 || value7 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S8':
                    {
                      s8 = value;
                      double value8 = double.tryParse(value) ?? 0.0;
                      circleColor8 = _getColor(value8);
                      if (value8 > 100.0 || value8 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S9':
                    {
                      s9 = value;
                      double value9 = double.tryParse(value) ?? 0.0;
                      circleColor9 = _getColor(value9);
                      if (value9 > 100.0 || value9 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S10':
                    {
                      s10 = value;
                      double value10 = double.tryParse(value) ?? 0.0;
                      circleColor10 = _getColor(value10);
                      if (value10 > 100.0 || value10 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S11':
                    {
                      s11 = value;
                      double value11 = double.tryParse(value) ?? 0.0;
                      circleColor11 = _getColor(value11);
                      if (value11 > 100.0 || value11 < 0.0) {
                        showNotification();
                      }
                    }
                    break;
                  case 'S12':
                    {
                      s12 = value.replaceFirst(RegExp('0\$'), '');
                      double value12 = double.tryParse(value) ?? 0.0;
                      circleColor12 = _getColor(value12);
                      if (value12 > 100.0 || value12 < 0.0) {
                        showNotification();
                      }
                    }
                    break;

                  default:
                    {
                      //statements;
                    }
                    break;
                }
              }

              /// Entra una vez por valor en la lista:
              /// BLE(S1, valor)
              /// BLE(S2, valor)
              /// BLE(S3, valor)
              /// BLE(S4, valor)
              /// BLE(S5, valor)
              /// etc
              /// Actualiza cada color circleColor(N) pero lo ideal sería reducir esto de otra manera
              /// hay un valor por color, debeiaa ser mas facil regresar una lista de colores
              sensors.forEach(loopCallback);

              return Column(
                children: [
                  //Container 1
                  Container(
                    height: MediaQuery.of(context).size.height * .17,
                    color: null,
                  ),
                  //Container 2
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .57,
                    height: MediaQuery.of(context).size.height * .065,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 25),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor1,
                            ),
                            child: Center(child: Text(s1)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor2,
                            ),
                            child: Center(child: Text(s2)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Container 3
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.red.shade400,
                    child: Row(
                      children: [
                        Expanded(
                          //S7
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor7,
                            ),
                            child: Center(child: Text(s7)),
                          ),
                        ),
                        Expanded(
                          //S5
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor5,
                            ),
                            child: Center(child: Text(s5)),
                          ),
                        ),
                        Expanded(
                          //S3
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor3,
                            ),
                            child: Center(child: Text(s3)),
                          ),
                        ),
                        const SizedBox(
                          width: 44,
                          height: 70,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(""),
                          ),
                        ),
                        Expanded(
                          //S4
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor4,
                            ),
                            child: Center(child: Text(s4)),
                          ),
                        ),
                        Expanded(
                          //S6
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor6,
                            ),
                            child: Center(child: Text(s6)),
                          ),
                        ),
                        Expanded(
                          //S8
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor8,
                            ),
                            child: Center(child: Text(s8)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Container 4
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    color: null,
                    child: Row(
                      children: [
                        Expanded(
                          //S9
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor9,
                            ),
                            child: Center(child: Text(s9)),
                          ),
                        ),
                        Expanded(
                          //S10
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor10,
                            ),
                            child: Center(child: Text(s10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Container 5
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.height * 0.9,
                    color: null,
                  ),
                  //Container 6
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
                    //color: Colors.red,
                    child: Row(
                      children: [
                        Expanded(
                          //S11
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor11,
                            ),
                            child: Center(child: Text(s11)),
                          ),
                        ),
                        Expanded(
                          //S12
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor12,
                            ),
                            child: Center(child: Text(s12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Container 6
                  /*Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width,
                    color:Colors.amber,
                  ),
                  //Container 7
                  Expanded(
                    child: Column(
                      children: [
                        IconButton(
                          icon:
                              Icon(Icons.refresh, color: Colors.pink.shade200),
                          onPressed: () {},
                        ),
                        const Text('Refresh'),
                      ],
                    ),
                  ),*/
                ],
              );
            },
          ),
          ),
        ],
      ),
    ),
    );
  }
}
