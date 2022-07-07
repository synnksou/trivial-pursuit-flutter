import 'package:trivial_pursuit_flutter/data/entities/question/question.dart';

class Results {
  int? responseCode;
  String? date;
  List<FormQuestion>? results;

  Results({this.responseCode, this.date, this.results});

  @override
  String toString() {
    return 'Results(responseCode: $responseCode, date: $date, results: $results)';
  }

  factory Results.fromMap(Map<String, dynamic> data) => Results(
        responseCode: data['response_code'] as int?,
        date: data['date'] as String?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => FormQuestion.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'response_code': responseCode,
        'date': date,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// dart:convert
  ///
  /// Parses the string and returns the resulting Json object as [Results].
  Results.fromJson(dynamic data) {
    responseCode = data['response_code'] as int?;
    date = data['date'] as String?;
    results = (data['results'] as List<dynamic>?)
        ?.map((e) => FormQuestion.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// dart:convert
  ///
  /// Converts [Results] to a JSON string.
  Map<String, dynamic> toJson() => {
        'response_code': responseCode,
        'date': date,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  Results copyWith({
    int? responseCode,
    List<FormQuestion>? results,
  }) {
    return Results(
      responseCode: responseCode ?? this.responseCode,
      date: date ?? date,
      results: results ?? this.results,
    );
  }
}
