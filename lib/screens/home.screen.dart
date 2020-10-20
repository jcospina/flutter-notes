import 'package:flutter/material.dart';
import 'package:flutter_notes/model/app.model.dart';
import 'package:flutter_notes/screens/login.screen.dart';
import 'package:flutter_notes/screens/note-list.screen.dart';
import 'package:flutter_notes/services/auth.service.dart';
import 'package:flutter_notes/theme/notes.theme.dart';
import 'package:provider/provider.dart';

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteAppState(),
      child: StreamBuilder<Object>(
        stream: AuthService().authStateChanges,
        builder: (context, snapshot) {
          Widget _initialRoute = snapshot.hasData ? NoteList() : LoginScreen();
          return MaterialApp(
            title: 'Notes App',
            theme: buildNotesTheme(),
            home: _initialRoute,
            routes: {
              LoginScreen.id: (context) => LoginScreen(),
              NoteList.id: (context) => NoteList()
            },
          );
        },
      ),
    );
  }
}
