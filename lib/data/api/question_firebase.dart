import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/entities/question/question.dart';

class QuestionsFirebase {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static QuestionsFirebase? _instance;

  static late final CollectionReference<FormQuestion> _questionRef;

  QuestionsFirebase._();

  static getInstance() {
    if (_instance == null) {
      _questionRef = _firebaseFirestore.collection('questions').withConverter(
          fromFirestore: ((snapshot, _) =>
              FormQuestion.fromJson(snapshot.data()!)),
          toFirestore: ((question, _) => question.toJson()));
    }

    _instance = QuestionsFirebase._();
    return _instance;
  }

  Future<DocumentReference<FormQuestion>> insertQuestion(
          FormQuestion question) async =>
      _questionRef.add(question);

  Future<QuerySnapshot<FormQuestion>> getQuestions() async =>
      await _questionRef.get();

  Future<QuerySnapshot<FormQuestion>> getByType(String type) async =>
      await _questionRef.where('type', isEqualTo: type).get();
}
