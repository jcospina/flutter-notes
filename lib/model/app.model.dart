import 'package:flutter/foundation.dart';

enum FormType { REGISTER, LOGIN }

class NoteAppState extends ChangeNotifier {
  bool loginIn = false;

  setLoginState(bool state) {
    loginIn = state;
    notifyListeners();
  }
}
