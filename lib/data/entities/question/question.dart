import 'dart:convert';

import 'package:collection/collection.dart';

class FormQuestion {
  String? category;
  String? type;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  FormQuestion({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  @override
  String toString() {
    return 'FormQuestion(category: $category, type: $type, difficulty: $difficulty, question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers)';
  }

  factory FormQuestion.fromMap(Map<String, dynamic> data) => FormQuestion(
        category: data['category'] as String?,
        type: data['type'] as String?,
        difficulty: data['difficulty'] as String?,
        question: data['question'] as String?,
        correctAnswer: data['correct_answer'] as String?,
        incorrectAnswers: data['incorrect_answers'] as List<String>?,
      );

  Map<String, dynamic> toMap() => {
        'category': category,
        'type': type,
        'difficulty': difficulty,
        'question': question,
        'correct_answer': correctAnswer,
        'incorrect_answers': incorrectAnswers,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FormQuestion].
  factory FormQuestion.fromJson(String data) {
    return FormQuestion.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FormQuestion] to a JSON string.
  String toJson() => json.encode(toMap());

  FormQuestion copyWith({
    String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
  }) {
    return FormQuestion(
      category: category ?? this.category,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FormQuestion) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      category.hashCode ^
      type.hashCode ^
      difficulty.hashCode ^
      question.hashCode ^
      correctAnswer.hashCode ^
      incorrectAnswers.hashCode;
}