import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/autb_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/login/bloc/login_state.dart';
import '../../../../data/repositeries/user_repository.dart';
import 'package:flutter/foundation.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  LoginCubit({required this.authRepository, required this.userRepository})
      : super(const LoginState.loading());

  void signIn() {
    emit(const LoginState.saved());
  }

  Future<void> connectUser(String email, String password) async {
    emit(const Loading());
    User? userAuth = await authRepository.signIn(email, password);

    if (userAuth != null) {
      var user = await userRepository.getUserById(userAuth.uid);
      debugPrint('test $user ');
      emit(const Saved());
    } else {
      emit(const Error('Error signing in'));
    }
  }
}
