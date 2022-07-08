import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivial_pursuit_flutter/data/entities/user/user.dart';

part 'profil_state.freezed.dart';

@freezed
class ProfilState with _$ProfilState {
  const factory ProfilState.initial() = Initial;
  const factory ProfilState.loading() = Loading;
  const factory ProfilState.retrieved(QuerySnapshot<TriviaUser> image) =
      Retrieved;
  const factory ProfilState.error(String error) = Error;
}
