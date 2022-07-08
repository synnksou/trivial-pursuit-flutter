import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/autb_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/signup/bloc/signup_state.dart';
import '../../../../data/entities/user/user.dart';
import '../../../../data/repositeries/user_repository.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignupCubit({required this.authRepository, required this.userRepository})
      : super(const SignupState.loading());

  void signup() {
    emit(const SignupState.saved());
  }

  String? getUserUid(){
   return userRepository.getUserUuid();
  }

  Future<void> registerUser(
      String email, String password, TriviaUser user, XFile file) async {
    emit(const Loading());
    User? userAuth = await authRepository.signUp(email, password);

    if (userAuth != null) {
      await userRepository.createUser(user);
      await userRepository.uploadAvatar(file, userAuth.uid);
      emit(const Saved());
    } else {
      emit(const Error('Error signing up'));
    }
  }
}
