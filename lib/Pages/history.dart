import 'package:flutter/material.dart';
import 'package:smarty_app/variables.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            title: const Text(
              'Anomal\u00CDa 1',
              style: exptitleText,
            ),
            subtitle: const Text('1 de enero del 2023, 10:15 hrs'),
            textColor: Colors.purple.shade500,
            collapsedIconColor: Colors.black,
            iconColor: Colors.purple.shade500,
            backgroundColor: const Color.fromARGB(255, 250, 221, 255),
            children: const [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S1 fuera de rango: 35 \u00B0C'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S2 fuera de rango: 38 \u00B0C'),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Anomal\u00CDa 2',
              style: exptitleText,
            ),
            subtitle: const Text('2 de enero del 2024, 13:07 hrs'),
            textColor: Colors.purple.shade500,
            collapsedIconColor: Colors.black,
            iconColor: Colors.purple.shade500,
            backgroundColor: const Color.fromARGB(255, 250, 221, 255),
            children: const [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S1 fuera de rango: 35 \u00B0C'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S2 fuera de rango: 38 \u00B0C'),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Anomal\u00CDa 3',
              style: exptitleText,
            ),
            subtitle: const Text('4 de enero del 2024, 17:09 hrs'),
            textColor: Colors.purple.shade500,
            collapsedIconColor: Colors.black,
            iconColor: Colors.purple.shade500,
            backgroundColor: const Color.fromARGB(255, 250, 221, 255),
            children: const [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S1 fuera de rango: 35 \u00B0C'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S2 fuera de rango: 38 \u00B0C'),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Anomal\u00CDa 4',
              style: exptitleText,
            ),
            subtitle: const Text('8 de enero del 2024, 18:15 hrs'),
            textColor: Colors.purple.shade500,
            collapsedIconColor: Colors.black,
            iconColor: Colors.purple.shade500,
            backgroundColor: const Color.fromARGB(255, 250, 221, 255),
            children: const [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S1 fuera de rango: 35 \u00B0C'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S2 fuera de rango: 38 \u00B0C'),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Anomal\u00CDa 5',
              style: exptitleText,
            ),
            subtitle: const Text('10 de enero del 2024, 23:17 hrs'),
            textColor: Colors.purple.shade500,
            collapsedIconColor: Colors.black,
            iconColor: Colors.purple.shade500,
            backgroundColor: const Color.fromARGB(255, 250, 221, 255),
            children: const [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S1 fuera de rango: 35 \u00B0C'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S2 fuera de rango: 38 \u00B0C'),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Anomal\u00CDa 6',
              style: exptitleText,
            ),
            subtitle: const Text('13 de enero del 2024, 20:45 hrs'),
            textColor: Colors.purple.shade500,
            collapsedIconColor: Colors.black,
            iconColor: Colors.purple.shade500,
            backgroundColor: const Color.fromARGB(255, 250, 221, 255),
            children: const [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S1 fuera de rango: 35 \u00B0C'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S2 fuera de rango: 38 \u00B0C'),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Anomal\u00CDa 7',
              style: exptitleText,
            ),
            subtitle: const Text('15 de enero del 2023, 03:28 hrs'),
            textColor: Colors.purple.shade500,
            collapsedIconColor: Colors.black,
            iconColor: Colors.purple.shade500,
            backgroundColor: const Color.fromARGB(255, 250, 221, 255),
            children: const [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S1 fuera de rango: 35 \u00B0C'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S2 fuera de rango: 38 \u00B0C'),
                  )
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Anomal\u00CDa 8',
              style: exptitleText,
            ),
            subtitle: const Text('17 de enero del 2023, 13:07 hrs'),
            textColor: Colors.purple.shade500,
            collapsedIconColor: Colors.black,
            iconColor: Colors.purple.shade500,
            backgroundColor: const Color.fromARGB(255, 250, 221, 255),
            children: const [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S1 fuera de rango: 35 \u00B0C'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('S2 fuera de rango: 38 \u00B0C'),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}