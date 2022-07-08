import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/entities/question/question.dart';
import 'package:trivial_pursuit_flutter/data/entities/user/user.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/question_repository.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/user_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/games/bloc/game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuestionRepository questionRepository;
  final UserRepository userRepository;

  String selectAnswer = '';

  GameCubit({required this.questionRepository, required this.userRepository})
      : super(const Initial());

  Future<void> getQuestions() async {
    emit(const Loading());
    List<FormQuestion>? questions =
        await questionRepository.getQuestionsOfTheDay();
    if (questions != null) {
      emit(Retrieved(questions));
    } else {
      emit(const Error('Error retriving questions'));
    }
  }

  Future<void> setScore(int score) async {
    TriviaUser user = userRepository.getUserById("1") as TriviaUser;
    user.setScore(score);
    await userRepository.setScore(user);
  }
}
 