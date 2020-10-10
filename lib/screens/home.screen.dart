import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/screens/login.screen.dart';
import 'package:flutter_notes/theme/notes.theme.dart';
import 'package:loading/loading.dart';

class NotesApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Notes App',
            theme: buildNotesTheme(),
            home: LoginScreen(),
            routes: {
              LoginScreen.id: (context) => LoginScreen(),
            },
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
