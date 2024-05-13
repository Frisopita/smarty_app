import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/variables.dart';
import 'package:smarty_app/Providers/profile.dart';

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
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Image.asset('Images/logopage.png',
            fit: BoxFit.cover, height: 100, width: 130),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: EditPersonalInfo(),
      ),
    );
  }
}

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({Key? key}) : super(key: key);

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();
  final TextEditingController _textEditingController5 = TextEditingController();
  final TextEditingController _textEditingController6 = TextEditingController();
  final TextEditingController _textEditingController7 = TextEditingController();
  final TextEditingController _textEditingController8 = TextEditingController();
  final TextEditingController _textEditingController9 = TextEditingController();
  final TextEditingController _textEditingController10 = TextEditingController();
  final TextEditingController _textEditingController11 = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<List<String?>> texts;

  @override
  void initState() {
    super.initState();
    texts = _prefs.then((SharedPreferences prefs) {
      final List<String?> storedTexts = prefs.getStringList('texts') ??
          [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
          ];
      return storedTexts;
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = [
      _textEditingController1.text,
      _textEditingController2.text,
      _textEditingController3.text,
      _textEditingController4.text,
      _textEditingController5.text,
      _textEditingController6.text,
      _textEditingController7.text,
      _textEditingController8.text,
      _textEditingController9.text,
      _textEditingController10.text,
      _textEditingController11.text,
    ];
    await prefs.setStringList('texts', dataList);
    Navigator.pop(context,
        dataList); // Envia los datos actualizados a la pantalla de perfil
    final profileData = Provider.of<ProfileData>(context, listen: false);
    profileData.updateTexts(dataList); // Actualiza los datos en el perfil
    //  Navigator.pop(context); // Cierra la pantalla de configuraci贸n
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Editar mi informaci\u00F3n personal',
                style: subtitleText,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Datos personales',
                style: subtitleText2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.person,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.tag,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.phone,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'N\u00F9mero de Tel\u00E9fono',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.alternate_email,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController4,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo electr\u00F3nico',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.home,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
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
              child: Text(
                'Contactos de Emergencia',
                style: subtitleText2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.people,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController6,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre de contacto de emergencia 1',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.phone,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController7,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Celular de contacto de emergencia 1',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.people,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController8,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre de contacto de emergencia 2',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.phone,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController9,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Celular de contacto de emergencia 2',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Informaci\u00F3n M\u00E9dica',
                style: subtitleText2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.medical_information,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre de su M\u00E9dico',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.medical_information,
                    size: 30, // Tama?o del 铆cono
                    color: Colors.blueGrey, // Color del 铆cono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      controller: _textEditingController11,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese informaci\u00F3n';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tel\u00E9fono de su M\u00E9dico',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    await _saveData();
                    // If the form is valid, display a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Enviando Informaci\u00F3n'),
                      ),
                    );
                  } else {
                    // Formulario inv谩lido, mostrar mensajes de error y realizar acciones adicionales
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Faltan campos por llenar')),
                    );
                  }
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
