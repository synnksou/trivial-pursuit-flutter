import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/entities/user/user.dart';

part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState.loading() = Loading;
  const factory LeaderboardState.saved(List<TriviaUser> users) = Saved;
  const factory LeaderboardState.error(String error) = Error;
}
