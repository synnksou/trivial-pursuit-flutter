import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.loading() = Loading;
  const factory SignupState.saved() = Saved;
  const factory SignupState.error(String error) = Error;
}
