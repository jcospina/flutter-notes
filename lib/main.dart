import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/screens/home.screen.dart';
import 'package:loading/loading.dart';

final Future<FirebaseApp> _initialization = Firebase.initializeApp();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FutureBuilder(
    future: _initialization,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return NotesApp();
      } else {
        return Loading();
      }
    },
  ));
}
