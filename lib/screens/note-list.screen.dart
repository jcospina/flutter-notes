import 'package:flutter/material.dart';
import 'package:flutter_notes/services/auth.service.dart';
import 'package:flutter_notes/widgets/rounded-button.widget.dart';

class NoteList extends StatelessWidget {
  static String id = '/noteList';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AuthService().currentUser.displayName),
            RoundedButton(
              label: 'Logout',
              onPressed: () async {
                await AuthService().logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
