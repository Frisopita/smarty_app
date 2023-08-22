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
            subtitle: const Text('1 de junio del 2023, 10:15 hrs'),
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
            subtitle: const Text('2 de junio del 2023, 13:07 hrs'),
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
            subtitle: const Text('5 de junio del 2023, 17:09 hrs'),
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
            subtitle: const Text('8 de junio del 2023, 18:15 hrs'),
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
            subtitle: const Text('10 de junio del 2023, 23:17 hrs'),
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
            subtitle: const Text('13 de junio del 2023, 20:45 hrs'),
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
            subtitle: const Text('15 de junio del 2023, 03:28 hrs'),
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
            subtitle: const Text('17 de junio del 2023, 13:07 hrs'),
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