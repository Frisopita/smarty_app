import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarty_app/Pages/perfil.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}


class SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<List<String?>> texts;

  @override
  void initState() {
    super.initState();
    texts = _prefs.then((SharedPreferences prefs) {
      final List<String?> storedTexts = prefs.getStringList('texts') ?? ['', ''];
      return storedTexts;
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = [_textEditingController1.text, _textEditingController2.text];
    await prefs.setStringList('texts', dataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Image.asset(
          'Images/logopage.png',
          fit: BoxFit.cover,
          height: 100,
          width: 130,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Editar informaci¨®n del personal',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('Datos personales'),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _textEditingController1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese informaci¨®n';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nombre Completo',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.tag,
                        size: 30,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _textEditingController2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese informaci¨®n';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Edad',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _saveData();
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}