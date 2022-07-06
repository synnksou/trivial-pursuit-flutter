import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/entities/user/user.dart';

class UserFirebase {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static UserFirebase? _instance;

  static late final CollectionReference<User> _userRef;

  UserFirebase._();

  static getInstance() {
    if (_instance == null) {
      _userRef = _firebaseFirestore.collection('users').withConverter(
          fromFirestore: ((snapshot, _) => User.fromJson(snapshot.data()!)),
          toFirestore: ((user, _) => user.toJson()));
    }
    _instance = UserFirebase._();
    return _instance;
  }

  Future<DocumentReference<User>> insertUser(User user) async =>
      _userRef.add(user);

  Future<QuerySnapshot<User>> getUsers() async => await _userRef.get();

  Future<QuerySnapshot<User>> searchUsers(String name) async {
    return await _userRef.where('name', isEqualTo: name).get();
  }

  Future<QuerySnapshot<User>> getUserById(String id) async {
    var document = await _userRef.where('id', isEqualTo: id).get();
    return document; // faut faire le data() pour avoir le document
  }

  Future<void> insertUserWithId(User user, String id) async =>
      _userRef.doc(id).set(user);

  Future<void> updateUser(User user) async =>
      _userRef.doc(user.id.toString()).update(user.toJson());

  Future<void> deleteUser(User user) async =>
      _userRef.doc(user.id.toString()).delete();
}
