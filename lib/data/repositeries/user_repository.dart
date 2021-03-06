import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trivial_pursuit_flutter/data/api/auth_firebase.dart';
import 'package:trivial_pursuit_flutter/data/api/user_firebase.dart';
import '../entities/user/user.dart';

class UserRepository {
  static UserRepository? _instance;
  static final UserFirebase _userFirebase = UserFirebase.getInstance();
  static final AuthFirebase _authFirebase = AuthFirebase.getInstance();

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

  Future<void> uploadAvatar(XFile file, String userId) async {
    await _userFirebase.uploadFile(file, userId);
    return;
  }

  Future<QuerySnapshot<TriviaUser>> getFileById(String id) async {
    Future<QuerySnapshot<TriviaUser>> file = _userFirebase.getFileById(id);
    return file;
  }

  getUserUuid() {
    return _authFirebase.getUserUuid();
  }

  getConnectedUser() async {
    if (_authFirebase.isConnected()) {
      String uid = _authFirebase.getCurrentUser();
      return await _userFirebase.getUserById(uid);
    } else {
      return null;
    }
  }

  Future<void> setScore(TriviaUser user) async {
    await _userFirebase.updateUser(user);
  }
}
