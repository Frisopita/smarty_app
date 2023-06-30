import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'perfil.dart';
import 'package:flutter/material.dart';
import 'perfil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<List<String?>> _texts;

  Future<void> _saveTexts() async {
    final SharedPreferences prefs = await _prefs;
    final String text1 = _textEditingController1.text;
    final String text2 = _textEditingController2.text;

    setState(() {
      _texts = prefs.setStringList('texts', [text1, text2]).then((bool success) {
        return [text1, text2];
      });
    });

    // Navegar a la nueva pantalla y pasar los textos como argumento
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(texts: [text1, text2]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _texts = _prefs.then((SharedPreferences prefs) {
      final List<String?> storedTexts = prefs.getStringList('texts') ?? ['', ''];
      return storedTexts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textEditingController1,
              decoration: const InputDecoration(labelText: 'Enter text 1'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _textEditingController2,
              decoration: const InputDecoration(labelText: 'Enter text 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTexts,
              child: const Text('Save Texts'),
            ),
            const SizedBox(height: 20),
            FutureBuilder<List<String?>>(
              future: _texts,
              builder: (BuildContext context, AsyncSnapshot<List<String?>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        'Saved Texts:\n\n'
                        'Text 1: ${snapshot.data?[0] ?? ''}\n'
                        'Text 2: ${snapshot.data?[1] ?? ''}\n\n'
                        'These should persist across restarts.',
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
