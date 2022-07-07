import 'dart:convert';

import 'package:trivial_pursuit_flutter/data/entities/question/question.dart';
import 'package:trivial_pursuit_flutter/data/entities/result/result.dart';
import 'package:http/http.dart' as http;

class QuestionApi {
  final String _baseUrl = "opentdb.com";

  static QuestionApi? _instance;

  static getInstance() {
    _instance ??= QuestionApi._();
    return _instance;
  }

  QuestionApi._();

  Future<List<FormQuestion>> getQuestionsOfTheDay() async {
    final queryParamters = {'amount': "10"};

    final uri = Uri.https(_baseUrl, "/api.php", queryParamters);

    final reponse = await http.get(uri);

    if (reponse.statusCode == 200) {
      Results questionApi = Results.fromJson(jsonDecode(reponse.body));
      return questionApi.results!;
    } else {
      throw Exception("Failed to load questions");
    }
  }
}
