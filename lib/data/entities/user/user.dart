import 'dart:convert';

import 'package:collection/collection.dart';

class User {
  int? id;
  int? score;
  String? pseudo;
  String? avatar;
  int? games;

  User({this.id, this.score, this.pseudo, this.avatar, this.games});

  @override
  String toString() {
    return 'User(id: $id, score: $score, pseudo: $pseudo, avatar: $avatar, games: $games)';
  }

  setPseudo(String pseudo) {
    this.pseudo = pseudo;
  }

  getPseudo() {
    return pseudo;
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        score: data['score'] as int?,
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
  /// Parses the string and returns the resulting Json object as [User].
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

  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    int? id,
    int? score,
    String? pseudo,
    String? avatar,
    int? games,
  }) {
    return User(
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
    if (other is! User) return false;
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
