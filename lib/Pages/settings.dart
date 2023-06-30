import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
            fit: BoxFit.cover,
            height: 100,
            width:
                130), //const Text('Kabsim App', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: EditPersonalInfo(),
      ),
    );
  }
}

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({super.key});

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Editar informaci\u00F3n del personal',
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
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.tag,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.phone,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.alternate_email,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.home,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              child: Text('Contactos de Emergencia'),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.people,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.phone,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.people,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.phone,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              child: Text('Informaci\u00F3n M\u00E9dica'),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.medical_information,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
              children: [
               const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.medical_information,
                    size: 30, // Tama?o del ¨ªcono
                    color: Colors.blueGrey, // Color del ¨ªcono
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
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
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Enviando Informaci\u00F3n')),
                    );
                  } else {
                    // Formulario inv¨¢lido, mostrar mensajes de error y realizar acciones adicionales
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
