import 'dart:convert';

import 'package:collection/collection.dart';

class TriviaUser {
  String? id;
  int score;
  String? pseudo;
  String? avatar;
  int? games;

  TriviaUser(
      {this.id, required this.score, this.pseudo, this.avatar, this.games});

  @override
  String toString() {
    return 'TriviaUser(id: $id, score: $score, pseudo: $pseudo, avatar: $avatar, games: $games)';
  }

  setPseudo(String pseudo) {
    this.pseudo = pseudo;
  }

  setScore(int score) {
    this.score += score;
  }

  getPseudo() {
    return pseudo;
  }

  factory TriviaUser.fromMap(Map<String, dynamic> data) => TriviaUser(
        id: data['id'] as String?,
        score: data['score'] as int,
        pseudo: data['pseudo'] as String?,
        avatar: data['avatar'] as String?,
        games: data['games'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'score': score,
        'pseudo': pseudo,
        'avatar': avatar,
        'games': games,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TriviaUser].
  /// If the parsing fails, this function throws a [FormatException].
  /// The optional [reviver] function can be used to transform the Json object
  /// before it is returned.
  /// The [reviver] function must return an object that can be serialized
  /// to JSON.
  /// If [reviver] is omitted, it defaults to calling [Json.encode] on the
  /// result of calling [toJson] on the object.
  /// The [toJson] function is called on the object before it is encoded.
  /// The [toJson] function should only be used to convert the object to a
  /// representation that is JSON encodable.

  TriviaUser.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    score = json["score"];
    pseudo = json["pseudo"];
    avatar = json["avatar"];
    games = json["games"];
  }

  /// `dart:convert`
  ///
  /// Converts [TriviaUser] to a JSON string.

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['score'] = score;
    map['pseudo'] = pseudo;
    map['avatar'] = avatar;
    map['games'] = games;

    return map;
  }

  TriviaUser copyWith({
    String? id,
    int? score,
    String? pseudo,
    String? avatar,
    int? games,
  }) {
    return TriviaUser(
      id: id ?? this.id,
      score: score ?? this.score,
      pseudo: pseudo ?? this.pseudo,
      avatar: avatar ?? this.avatar,
      games: games ?? this.games,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TriviaUser) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      score.hashCode ^
      pseudo.hashCode ^
      avatar.hashCode ^
      games.hashCode;
}
