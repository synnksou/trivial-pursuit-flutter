import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivial_pursuit_flutter/data/entities/result/result.dart';

class ResultsFirebase {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static ResultsFirebase? _instance;

  static late final CollectionReference<Results> _resultsRef;

  ResultsFirebase._();

  static getInstance() {
    if (_instance == null) {
      _resultsRef = _firebaseFirestore
          .collection('questionsOfTheDay')
          .withConverter(
              fromFirestore: ((snapshot, _) =>
                  Results.fromJson(snapshot.data())),
              toFirestore: ((question, _) => question.toJson()));
    }

    _instance = ResultsFirebase._();
    return _instance;
  }

  Future<DocumentReference<Results>> insertQuestion(Results question) =>
      _resultsRef.add(question);

  Future<Results?> getResults() async {
    final list = await _resultsRef.get();
    final test = await _resultsRef.doc(list.docs.first.id).get();

    return test.data();
  }

  Future<void> deleteQuestion() async {
    QuerySnapshot<Results> element = await _resultsRef.get();
    _resultsRef.doc(element.docs.first.id).delete();
  }
}
