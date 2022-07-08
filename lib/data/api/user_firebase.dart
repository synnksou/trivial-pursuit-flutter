import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/entities/user/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class UserFirebase {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static UserFirebase? _instance;

  static late final CollectionReference<TriviaUser> _userRef;

  UserFirebase._();

  static getInstance() {
    if (_instance == null) {
      _userRef = _firebaseFirestore.collection('users').withConverter(
          fromFirestore: ((snapshot, _) =>
              TriviaUser.fromJson(snapshot.data()!)),
          toFirestore: ((user, _) => user.toJson()));
    }
    _instance = UserFirebase._();
    return _instance;
  }

  Future<DocumentReference<TriviaUser>> insertUser(TriviaUser user) async =>
      _userRef.add(user);

  Future<QuerySnapshot<TriviaUser>> getUsers() {
    return _userRef.orderBy("score", descending: true).get();
  }

  Future<QuerySnapshot<TriviaUser>> searchUsers(String name) async {
    return await _userRef.where('name', isEqualTo: name).get();
  }

  Future<QuerySnapshot<TriviaUser>> getUserById(String id) async {
    var document = await _userRef.where('id', isEqualTo: id).get();
    return document; // faut faire le data() pour avoir le document
  }

  Future<void> insertUserWithId(TriviaUser user, String id) async =>
      _userRef.doc(id).set(user);

  Future<void> updateUser(TriviaUser user) async =>
      _userRef.doc(user.id.toString()).update(user.toJson());

  Future<void> deleteUser(TriviaUser user) async =>
      _userRef.doc(user.id.toString()).delete();

  Future<UploadTask?> uploadFile(XFile file, String userId) async {
    UploadTask uploadTask;

    Reference ref = _firebaseStorage.ref().child('$userId.jpg');

    final metadata = SettableMetadata(contentType: 'image/jpeg');

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }
  }

  Future<QuerySnapshot<TriviaUser>> getFileById(String id) async {
    var document = await _userRef.where('avatar', isEqualTo: '$id.jpeg').get();
    return document; // faut faire le data() pour avoir le document
  }
}
