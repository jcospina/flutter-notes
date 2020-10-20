import 'package:firebase_auth/firebase_auth.dart';

class ErrorHandler {
  static final ErrorHandler _errorHandlerService =
      ErrorHandler._internalConstructor();

  factory ErrorHandler() {
    return _errorHandlerService;
  }

  ErrorHandler._internalConstructor();

  String getAuthErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'The account already exists';
        break;
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-email':
        return 'Incorrect email or password';
      default:
        return 'Please check your connection';
    }
  }
}
