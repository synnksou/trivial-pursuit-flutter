import 'package:firebase_auth/firebase_auth.dart';
import '../api/auth_firebase.dart';

class AuthRepository {
  static AuthRepository? _instance;
  final AuthFirebase _authFirebase = AuthFirebase.getInstance();

  static getInstance() {
    _instance ??= AuthRepository._();
    return _instance;
  }

/*   static String? getUserUuid() {
    return _authFirebase.getUserUuid().uid;
  }
 */
  AuthRepository._();

  Future<User?> signIn(String email, String password) async {
    UserCredential userCredential = await _authFirebase.signInWithCreditentials(
        email: email, password: password);
    return userCredential.user;
  }

  Future<User?> signUp(String email, String password) async {
    UserCredential userCredential =
        await _authFirebase.signUp(email: email, password: password);
    return userCredential.user;
  }

  Future<void> signOut() async {
    return await _authFirebase.signOut();
  }
}
