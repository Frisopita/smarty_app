import 'package:flutter/material.dart';
import 'package:smarty_app/bluetooth.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/Providers/sensor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('Images/logopage.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
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
      body: const Center(
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
  double _value = 50.0; // Valor inicial

  Color _getColor(double value) {
    if (value <= 33) {
      // Rango del 1 al 33: Verde a Amarillo
      final red = (255 * value / 33).round();
      final green = 255;
      return Color.fromARGB(255, red, green, 0);
    } else if (value <= 67) {
      // Rango del 34 al 66: Amarillo a Rojo
      final red = 255;
      final green = (255 * (100 - value) / 33).round();
      return Color.fromARGB(255, red, green, 0);
    } else {
      // Rango del 67 al 100: Rojo
      return Colors.red;
    }
  }

  final Sensor sensor1 = Sensor(
    id: 'S1',
    characteristics: {
      'beb5483e-36e1-4688-b7f5-ea07361b26a8': 'Caracter¨ªstica 1',
    },
  );

  final Sensor sensor2 = Sensor(
    id: 'S2',
    characteristics: {
      '8bdf0a1a-a48e-4dc3-8bab-ad0c1f7ed218': 'Caracter¨ªstica 2',
    },
  );

  @override
  Widget build(BuildContext context) {
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
        children: [
          Expanded(
            child: Column(
              children: [
                //Container 1
                Container(
                  height: 75,
                  color: null,
                ),
                //Container 2
                Container(
                  width: 170,
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: Consumer<Sensor>(
                          builder: (context, sensor, _) {
                            String characteristic = sensor.getCharacteristic(
                                'beb5483e-36e1-4688-b7f5-ea07361b26a8');
                            String idValue = sensor.getId;

                            double value = double.tryParse(idValue) ?? 0.0;
                            Color circleColor = _getColor(value);

                            return Container(
                              margin: const EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: circleColor,
                              ),
                              child: Center(child: Text(idValue)),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Consumer<Sensor>(
                          builder: (context, sensor, _) {
                            String characteristic = sensor.getCharacteristic(
                                '8bdf0a1a-a48e-4dc3-8bab-ad0c1f7ed218');
                            String idValue = sensor.getId;

                            double value = double.tryParse(idValue) ?? 0.0;
                            Color circleColor = _getColor(value);

                            return Container(
                              margin: const EdgeInsets.only(right: 25),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: circleColor,
                              ),
                              child: Center(child: Text(idValue)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //Container 3
                Container(
                  height: 140,
                  width: 350,
                  //color: Colors.red.shade400,
                  child: Row(
                    children: [
                      Expanded(
                        //S7
                        child: Consumer<Sensor>(
                          builder: (context, id, _) {
                            double value = double.tryParse(id.id) ??
                                0.0; // Obtener el valor del Consumer
                            Color circleColor = _getColor(
                                value); // Obtener el color seg¨²n el valor

                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: circleColor,
                              ),
                              child: Center(child: Text(id.id)),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        //S5
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
                      ),
                      Expanded(
                        //S3
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
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
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
                      ),
                      Expanded(
                        //S6
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
                      ),
                      Expanded(
                        //S8
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                //Container 4
                Container(
                  height: 50,
                  width: 350,
                  color: null,
                  child: Row(
                    children: [
                      Expanded(
                        //S9
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
                      ),
                      Expanded(
                        //S10
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                //Container 5
                Container(
                  height: 60,
                  width: 250,
                ),
                //Container 6
                Container(
                  height: 50,
                  width: 250,
                  //color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        //S11
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
                      ),
                      Expanded(
                        //S12
                        child: Consumer<Sensor>(builder: (context, id, _) {
                          double value = double.tryParse(id.id) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(id.id)),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                //Container 6
                Expanded(
                    child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.refresh, color: Colors.pink.shade200),
                      onPressed: () {},
                    ),
                    const Text('Refresh'),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
