import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'example.dart';
import 'settings.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
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
          actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const Settings(),
              ));
            },
          ),
        ],
        ),
        body: const Center(
          child: PersonalInfo(),
        ),
    );
  }
}

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child: Column(
        children: [
           Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Datos personales',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Nombre del usuario'),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Edad'),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('N\u00F9mero de Tel\u00E9fono'),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Correo electr\u00F3nico'),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Direcci\u00F3n'),
            ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Contactos de emergencia',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Contacto 1'),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Celular Contacto 1'),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Contacto 2'),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Celular Contacto 2'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Informaci\u00F3n M\u00E9dica',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          Padding(
              padding: EdgeInsets.all(5),
              child: Text('Nombre M\u00E9dico'),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text('Celular M\u00E9dico'),
            ),
            /*
          Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const SharedPreferencesDemo(),
              ));
            },
            child: const Text('Hola'),
          ),
            ),
           */ 
        ],
      ),
    );
  }
}