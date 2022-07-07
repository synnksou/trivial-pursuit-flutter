import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/entities/question/question.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/question_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/games/bloc/game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuestionRepository questionRepository;
  late FormQuestion _lastQuestion;

  final int _score = 0;
  String selectAnswer = '';

  GameCubit({required this.questionRepository}) : super(const Initial());

/*   setAnswer(String answer) {
    selectAnswer = answer;
    emit((setAnswerQuestionState(answer)));
  }
 */

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
}
