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

  Color _getColor(double value) {
    if (value <= 33) {
      // Rango del 1 al 33: Verde a Amarillo
      final red = (255 * value / 33).round();
      const green = 255;
      return Color.fromARGB(255, red, green, 0);
    } else if (value <= 67) {
      // Rango del 34 al 66: Amarillo a Rojo
      const  red = 255;
      final green = (255 * (100 - value) / 33).round();
      return Color.fromARGB(255, red, green, 0);
    } else {
      // Rango del 67 al 100: Rojo
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
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
        children: [
          Expanded(
            child: Consumer<Sensor>(builder: (context, sensor, _) {
              String idValue = sensor.value;
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
              switch (sensor.id) {
                case 'S1':
                  {
                    s1 = idValue;
                    double value1 = double.tryParse(idValue) ?? 0.0;
                    circleColor1 = _getColor(value1);
                  }
                  break;

                case 'S2':
                  {
                    s2 = idValue;
                    double value2 = double.tryParse(idValue) ?? 0.0;
                    circleColor2 = _getColor(value2);
                  }
                  break;
                case 'S3':
                  {
                    s3 = idValue;
                    double value3 = double.tryParse(idValue) ?? 0.0;
                    circleColor3 = _getColor(value3);
                  }
                  break;
                case 'S4':
                  {
                    s4 = idValue;
                    double value4 = double.tryParse(idValue) ?? 0.0;
                    circleColor4 = _getColor(value4);
                  }
                  break;
                case 'S5':
                  {
                    s5 = idValue;
                    double value5 = double.tryParse(idValue) ?? 0.0;
                    circleColor5 = _getColor(value5);
                  }
                  break;
                case 'S6':
                  {
                    s6 = idValue;
                    double value6 = double.tryParse(idValue) ?? 0.0;
                    circleColor6 = _getColor(value6);
                  }
                  break;
                case 'S7':
                  {
                    s7 = idValue;
                    double value7 = double.tryParse(idValue) ?? 0.0;
                    circleColor7 = _getColor(value7);
                  }
                  break;
                case 'S8':
                  {
                    s8 = idValue;
                    double value8 = double.tryParse(idValue) ?? 0.0;
                    circleColor8 = _getColor(value8);
                  }
                  break;
                case 'S9':
                  {
                    s9 = idValue;
                    double value9 = double.tryParse(idValue) ?? 0.0;
                    circleColor9 = _getColor(value9);
                  }
                  break;
                case 'S10':
                  {
                    s10 = idValue;
                    double value10 = double.tryParse(idValue) ?? 0.0;
                    circleColor10 = _getColor(value10);
                  }
                  break;
                case 'S11':
                  {
                    s11 = idValue;
                    double value11 = double.tryParse(idValue) ?? 0.0;
                    circleColor11 = _getColor(value11);
                  }
                  break;
                case 'S12':
                  {
                    s12 = idValue;
                    double value12 = double.tryParse(idValue) ?? 0.0;
                    circleColor12 = _getColor(value12);
                  }
                  break;

                default:
                  {
                    //statements;
                  }
                  break;
              }

              return Column(
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
                  Container(
                    height: 140,
                    width: 350,
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
                    height: 50,
                    width: 350,
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
                  Container(
                    height: 35,
                    width: 250,
                  ),
                  //Container 7
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
              );
            }),
          ),
        ],
      ),
    ));
  }
}
