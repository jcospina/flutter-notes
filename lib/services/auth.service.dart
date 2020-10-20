import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final AuthService _authService = AuthService._internalConstructor();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  factory AuthService() {
    return _authService;
  }

  AuthService._internalConstructor();

  Stream<User> get authStateChanges {
    return _firebaseAuth.authStateChanges();
  }

  User get currentUser {
    return _firebaseAuth.currentUser;
  }

  Future<User> registerUser(String name, String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _updateUsername(name, result.user);
    return currentUser;
  }

  Future<User> login(String email, String password) async {
    final credentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return currentUser;
  }

  Future logout() async {
    return _firebaseAuth.signOut();
  }

  Future _updateUsername(String name, User firebaseUser) async {
    await firebaseUser.updateProfile(displayName: name);
    await firebaseUser.reload();
  }
}
