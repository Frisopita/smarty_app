import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:provider/provider.dart';
import 'package:smarty_app/Providers/profile.dart';
import 'package:smarty_app/variables.dart';

class Perfil extends StatefulWidget {
  final List<String?> texts;
  const Perfil({Key? key, required this.texts}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileData>(
      builder: (context, profileData, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,//left
                  30,//top
                  0,//right
                  30//bottom
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Datos personales',
                        style: subtitleText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Nombre del usuario 1: ${profileData.texts[0] ?? ''}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text('Edad ${profileData.texts[1] ?? ''} '),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          'N\u00F9mero de Tel\u00E9fono: ${profileData.texts[2] ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          'Correo electr\u00F3nico: ${profileData.texts[3] ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child:
                          Text('Direcci\u00F3n: ${profileData.texts[4] ?? ''}'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Contactos de emergencia',
                        style: subtitleText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text('Contacto 1: ${profileData.texts[5] ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          'Celular Contacto 1: ${profileData.texts[6] ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text('Contacto 2: ${profileData.texts[7] ?? ''}'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                          'Celular Contacto 2: ${profileData.texts[8] ?? ''}'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Informaci\u00F3n M\u00E9dica',
                        style: subtitleText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          'Nombre M\u00E9dico: ${profileData.texts[9] ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                          'Celular M\u00E9dico: ${profileData.texts[10] ?? ''}'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final updatedData = await Navigator.push<List<String?>>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(),
                          ),
                        );
                        if (updatedData != null) {
                          final profileData =
                              Provider.of<ProfileData>(context, listen: false);
                          profileData.updateTexts(updatedData);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade200,
                        onPrimary: Colors.white,
                      ),
                      child: const Text('Editar mis datos personales'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
