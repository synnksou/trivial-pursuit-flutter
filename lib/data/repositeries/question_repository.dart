import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivial_pursuit_flutter/data/api/question_firebase.dart';

import '../entities/question/question.dart';

class QuestionRepository {
  static QuestionRepository? _instance;
  static final QuestionsFirebase _userFirebase =
      QuestionsFirebase.getInstance();

  static getInstance() {
    _instance ??= QuestionRepository._();
    return _instance;
  }

  QuestionRepository._();

  Future<QuerySnapshot<FormQuestion>> getQuestions() async {
    Future<QuerySnapshot<FormQuestion>> questions =
        _userFirebase.getQuestions();
    return questions;
  }

  Future<QuerySnapshot<FormQuestion>> getByType(String type) async {
    Future<QuerySnapshot<FormQuestion>> questions =
        _userFirebase.getByType(type);
    return questions;
  }

  Future<DocumentReference<FormQuestion>> insertQuestion(
      FormQuestion question) async {
    return await _userFirebase.insertQuestion(question);
  }
}
