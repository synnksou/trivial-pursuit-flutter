import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/api/user_firebase.dart';
import 'package:trivial_pursuit_flutter/data/entities/question/question.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/user_repository.dart';
import '../../../data/repositeries/question_repository.dart';
import 'bloc/game_state.dart';
import 'bloc/game_cubit.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  GameCubit? cubit;

  TextStyle styleLabel = const TextStyle(
      color: Color.fromRGBO(187, 203, 236, 1),
      fontSize: 16,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Game',
              style: TextStyle(
                  color: Color.fromRGBO(187, 203, 236, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<QuestionRepository>(
              create: (_) => QuestionRepository.getInstance(),
            ),
          ],
          child: BlocProvider(
            create: (context) {
              cubit = GameCubit(
                userRepository: RepositoryProvider.of<UserRepository>(context),
                questionRepository:
                    RepositoryProvider.of<QuestionRepository>(context),
              );
              return cubit!..getQuestions();
            },
            child: BlocConsumer<GameCubit, GameState>(
              listener: (context, state) {
                if (state is Error) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                        const SnackBar(
                          content: Text("error"),
                        ),
                      )
                      .closed
                      .then((value) => {});
                }

                //List<FormQuestion> listQuestion = state.data;
              },
              builder: (context, state) {
                if (state is Initial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is Retrieved) {
                  List<FormQuestion> questions = state.questions;
                  var indexQuestion;
                  List<String> responses = [];
                  int score = 0;

                  void scoreIncrement(String difficulty) {
                    if (difficulty == 'easy') {
                      score += 2;
                    } else if (difficulty == 'medium') {
                      score += 5;
                    } else if (difficulty == 'hard') {
                      score += 10;
                    }
                  }

                  void incrementScore(SwipingDeck<Card> deck, bool isCorrect,
                      String difficulty) {
                    if (isCorrect) {
                      scoreIncrement(difficulty);
                      deck.swipeRight();
                    } else {
                      deck.swipeRight();
                    }
                  }

                  void saveScore(int score) {
                    cubit!.setScore(score);
                  }

                  final SwipingCardDeck deck = SwipingCardDeck(
                    cardDeck: questions.map((element) {
                      indexQuestion = questions.indexOf(element);
                      responses = [
                        questions[indexQuestion].correctAnswer ?? "",
                      ];
                      responses
                          .addAll(questions[indexQuestion].incorrectAnswers!);
                      return Card(
                          color: Colors.red,
                          child: SizedBox(
                              height: 300,
                              width: 200,
                              child: Text(
                                  questions[indexQuestion].question ??
                                      "question empty",
                                  style: styleLabel)));
                    }).toList(),
                    onDeckEmpty: () => {saveScore(score)},
                    onLeftSwipe: (Card card) {},
                    onRightSwipe: (Card card) {},
                    cardWidth: 200,
                    swipeThreshold: MediaQuery.of(context).size.width / 3,
                    minimumVelocity: 1000,
                    rotationFactor: 0.8 / 3.14,
                    swipeAnimationDuration: const Duration(milliseconds: 500),
                  );
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      deck,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: responses
                              .map(
                                (element) => TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue),
                                    ),
                                    onPressed: element ==
                                            questions[indexQuestion]
                                                .correctAnswer
                                        ? () => incrementScore(
                                            deck,
                                            true,
                                            questions[indexQuestion]
                                                .difficulty!)
                                        : () => incrementScore(
                                            deck,
                                            false,
                                            questions[indexQuestion]
                                                .difficulty!),
                                    child: Text(element)),
                              )
                              .toList())
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }
}
