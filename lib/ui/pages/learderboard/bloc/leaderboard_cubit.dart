import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/entities/user/user.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/user_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/learderboard/bloc/leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  final UserRepository userRepository;

  LeaderboardCubit({required this.userRepository}) : super(const Loading());

  Future<void> getLeaderboard() async {
    emit(const Loading());
    QuerySnapshot<TriviaUser> users = await userRepository.getUsers();
    if (users != null) {
      emit(Saved(users.docs.map((doc) => doc.data()).toList()));
    } else {
      emit(const Error('Error retriving users'));
    }
  }

/*   setAnswer(String answer) {
    selectAnswer = answer;
    emit((setAnswerQuestionState(answer)));
  }
 */

}
