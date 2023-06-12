import 'package:flutter/material.dart';
import 'package:smarty_app/bluetooth.dart';
import 'package:provider/provider.dart';
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
import 'package:smarty_app/sensor.dart';

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
                          builder: (context, id, _) {
                            double value = double.tryParse(id.id) ??
                                0.0; // Obtener el valor del Consumer
                            Color circleColor = _getColor(
                                value); // Obtener el color seg¨²n el valor

                            return Container(
                              margin: const EdgeInsets.only(right: 30),
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
                        child: Consumer<S2Provider>(
                          builder: (context, s2, _) {
                            double value = double.tryParse(s2.s2) ??
                                0.0; // Obtener el valor del Consumer
                            Color circleColor = _getColor(
                                value); // Obtener el color seg¨²n el valor

                            return Container(
                              margin: const EdgeInsets.only(left: 25),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: circleColor,
                              ),
                              child: Center(child: Text(s2.s2)),
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
                        child: Consumer<S7Provider>(builder: (context, s7, _) {
                          double value = double.tryParse(s7.s7) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s7.s7)),
                          );
                        }),
                      ),
                      Expanded(
                        //S5
                        child: Consumer<S5Provider>(builder: (context, s5, _) {
                          double value = double.tryParse(s5.s5) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s5.s5)),
                          );
                        }),
                      ),
                      Expanded(
                        //S3
                        child: Consumer<S3Provider>(builder: (context, s3, _) {
                          double value = double.tryParse(s3.s3) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s3.s3)),
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
                        child: Consumer<S4Provider>(builder: (context, s4, _) {
                          double value = double.tryParse(s4.s4) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s4.s4)),
                          );
                        }),
                      ),
                      Expanded(
                        //S6
                        child: Consumer<S6Provider>(builder: (context, s6, _) {
                          double value = double.tryParse(s6.s6) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s6.s6)),
                          );
                        }),
                      ),
                      Expanded(
                        //S8
                        child: Consumer<S8Provider>(builder: (context, s8, _) {
                          double value = double.tryParse(s8.s8) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s8.s8)),
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
                        child: Consumer<S9Provider>(builder: (context, s9, _) {
                          double value = double.tryParse(s9.s9) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s9.s9)),
                          );
                        }),
                      ),
                      Expanded(
                        //S10
                        child:
                            Consumer<S10Provider>(builder: (context, s10, _) {
                          double value = double.tryParse(s10.s10) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s10.s10)),
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
                        child:
                            Consumer<S11Provider>(builder: (context, s11, _) {
                          double value = double.tryParse(s11.s11) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s11.s11)),
                          );
                        }),
                      ),
                      Expanded(
                        //S12
                        child:
                            Consumer<S12Provider>(builder: (context, s12, _) {
                          double value = double.tryParse(s12.s12) ??
                              0.0; // Obtener el valor del Consumer
                          Color circleColor = _getColor(
                              value); // Obtener el color seg¨²n el valor

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circleColor,
                            ),
                            child: Center(child: Text(s12.s12)),
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
