import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loading() = Loading;
  const factory LoginState.saved() = Saved;
  const factory LoginState.error(String error) = Error;
}
