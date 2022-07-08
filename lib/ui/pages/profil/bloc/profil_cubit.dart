import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/autb_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/profil/bloc/profil_state.dart';
import '../../../../data/entities/user/user.dart';
import '../../../../data/repositeries/user_repository.dart';

class ProfilCubit extends Cubit<ProfilState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  ProfilCubit({required this.authRepository, required this.userRepository})
      : super(const ProfilState.loading());

  Future<void> getAvatar(TriviaUser user) async {
    emit(const Loading());

    QuerySnapshot<TriviaUser> userAuth =
        await userRepository.getUserById(user.id!);

    if (userAuth != null) {
      emit(const Loading());
      QuerySnapshot<TriviaUser> image =
          await userRepository.getFileById(user.id!);
      if (image != null) {
        emit(Retrieved(image));
      }
    } else {
      emit(const Error('Error signing up'));
    }
  }
}
