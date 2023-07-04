import 'package:flutter/material.dart';
import 'settings.dart';

class Perfil extends StatefulWidget {
  final List<String?> texts;
  const Perfil({Key? key, required this.texts}) : super(key: key);

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
            width:130),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Datos personales',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Nombre del usuario 1: ${widget.texts[0] ?? ''}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text('Edad ${widget.texts[1] ?? ''} '),
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
            ],
          ),
        ),
      ),
    );
  }
}
