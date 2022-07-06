import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  static AuthFirebase? _instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static getInstance() {
    _instance ??= AuthFirebase._();
    return _instance;
  }

  AuthFirebase._();

  String? getUserUuid() {
    return _firebaseAuth.currentUser?.uid;
  }

  Future<UserCredential> signInWithCreditentials(
      {required String email, required String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  bool getCurrentUser() {
    return _firebaseAuth.currentUser != null;
  }
}
