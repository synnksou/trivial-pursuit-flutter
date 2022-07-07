import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/entities/question/question.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.initial() = Initial;
  const factory GameState.loading() = Loading;
  const factory GameState.setAnswerQuestionState(String answer) = SetAnswer;
  const factory GameState.next() = Next;
  const factory GameState.retrieved(List<FormQuestion> questions) = Retrieved;
  const factory GameState.error(String error) = Error;
}
