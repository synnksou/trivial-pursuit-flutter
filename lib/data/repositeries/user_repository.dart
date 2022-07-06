import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivial_pursuit_flutter/data/api/user_firebase.dart';
import '../entities/user/user.dart';

class UserRepository {
  static UserRepository? _instance;
  static final UserFirebase _userFirebase = UserFirebase.getInstance();

  static getInstance() {
    _instance ??= UserRepository._();
    return _instance;
  }

  UserRepository._();

  Future<QuerySnapshot<User>> getUserById(String id) async {
    Future<QuerySnapshot<User>> user = _userFirebase.getUserById(id);
    return user;
  }

  Future<DocumentReference<User>> createUser(User user) async {
    return await _userFirebase.insertUser(user);
  }
}
