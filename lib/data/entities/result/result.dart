import 'dart:convert';

import 'package:collection/collection.dart';

class Result {
  int? responseCode;
  List<Result>? results;

  Result({this.responseCode, this.results});

  @override
  String toString() {
    return 'Result(responseCode: $responseCode, results: $results)';
  }

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        responseCode: data['response_code'] as int?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'response_code': responseCode,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());

  Result copyWith({
    int? responseCode,
    List<Result>? results,
  }) {
    return Result(
      responseCode: responseCode ?? this.responseCode,
      results: results ?? this.results,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => responseCode.hashCode ^ results.hashCode;
}
