import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Images/logopage.png',
            fit: BoxFit.cover,
            height: 100,
            width:
                130), //const Text('Kabsim App', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: PersonalInfo(),
      ),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child:  Text(
                  'Informaci\u00F3n del usuario',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text('Datos personales'),
          ),
          const Row(
            children: [
             Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.person,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre Completo',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.tag,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Edad',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.phone,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'N\u00F9mero de Tel\u00E9fono personal',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.alternate_email,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo electr\u00F3nico',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.home,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Direcci\u00F3n',

                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text('Contactos de Emergencia'),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.people,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de contacto de emergencia 1',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.phone,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'Celular de contacto de emergencia 1',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.people,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de contacto de emergencia 2',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.phone,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'Celular de contacto de emergencia 2',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text('Informaci¨®n M¨¦dica'),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.medical_information,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'Nombre de su M\u00E9dico',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.medical_information,
                  size: 30, // Tama?o del ¨ªcono
                  color: Colors.blueGrey, // Color del ¨ªcono
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'Tel\u00E9fono de su M\u00E9dico',
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(5),
            child: ElevatedButton(
                onPressed: () {
                  //Guardar datos
                },
                child: const Text('Guardar')),
          ),
        ],
      ),
    );
  }
}
