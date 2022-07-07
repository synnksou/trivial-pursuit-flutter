import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivial_pursuit_flutter/data/api/question_api.dart';
import 'package:trivial_pursuit_flutter/data/api/question_firebase.dart';
import 'package:trivial_pursuit_flutter/data/api/results_firebase.dart';
import 'package:trivial_pursuit_flutter/data/entities/result/result.dart';

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

  final QuestionApi _questionApi = QuestionApi.getInstance();
  final ResultsFirebase firestore = ResultsFirebase.getInstance();

  Future<List<FormQuestion>> getFiltredQuestions() async {
    List<FormQuestion> list = await _questionApi.getQuestionsOfTheDay();

    return list;
  }

  Future<List<FormQuestion>> getQuestionsOfTheDay() async {
    // final Results? list = await firestore.getResults();

    /*   final Results? list = await firestore.getResults();

    Results objectToReturn = Results(results: list?.results!, date: _getDate()); */
/* 
    if (objectToReturn.date == _getDate()) {
      return objectToReturn.results!;
    } else {
      List<FormQuestion> questions = await getFiltredQuestions();
      Results results = Results(results: questions, date: _getDate());
      firestore.deleteQuestion();
      firestore.insertQuestion(Results(results: questions, date: _getDate()));
      return results.results!;
    } */

    List<FormQuestion> questions = await getFiltredQuestions();
    Results results = Results(results: questions, date: _getDate());
    /* firestore.deleteQuestion(); */
    await firestore.insertQuestion(results);
    return results.results!;
  }

  Future<Future<FormQuestion?>> getQuestions() async {
    Future<FormQuestion?> questions = _userFirebase.getQuestions();
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

  String _getDate() {
    DateTime now = DateTime.now();
    return '${now.day}/${now.month}/${now.year}';
  }
}
