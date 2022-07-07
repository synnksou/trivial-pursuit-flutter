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

  Future<QuerySnapshot<TriviaUser>> getUserById(String id) async {
    Future<QuerySnapshot<TriviaUser>> user = _userFirebase.getUserById(id);
    return user;
  }

  Future<QuerySnapshot<TriviaUser>> getUsers() async {
    QuerySnapshot<TriviaUser> users = await _userFirebase.getUsers();
    return users;
  }

  Future<DocumentReference<TriviaUser>> createUser(TriviaUser user) async {
    return await _userFirebase.insertUser(user);
  }
}
