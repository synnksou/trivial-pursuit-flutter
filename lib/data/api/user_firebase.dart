import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/entities/user/user.dart';

class UserFirebase {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
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

  Future<QuerySnapshot<TriviaUser>> getUsers() async => await _userRef.get();

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
}
