import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trivial_pursuit_flutter/data/entities/question/question.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import '../../../data/repositeries/question_repository.dart';
import 'bloc/game_state.dart';
import 'bloc/game_cubit.dart';

class GamePage extends HookWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _score = useState(0);
    final _isclick = useState(false);
    final _disableButton = useState(false);
    final _difficulty = useState("easy");
    final _scoreIncremented = useState(false);
    final responses = useState([]);

    GameCubit? cubit;

    TextStyle styleLabel = const TextStyle(
        color: Color.fromRGBO(187, 203, 236, 1),
        fontSize: 16,
        fontWeight: FontWeight.bold);

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
                //userRepository: RepositoryProvider.of<UserRepository>(context),
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
                  List<FormQuestion> _questions = state.questions;

                  void _scoreIncrement(String difficulty) {
                    _scoreIncremented.value = true;
                    if (difficulty == 'easy') {
                      _score.value += 2;
                    } else if (difficulty == 'medium') {
                      _score.value += 5;
                    } else if (difficulty == 'hard') {
                      _score.value += 10;
                    }
                  }

                  void _AnswerHandler(bool isCorrect, String difficulty,
                      FormQuestion question) {
                    if (isCorrect) {
                      _isclick.value = true;
                      _difficulty.value = difficulty;
                    } else {
                      _disableButton.value = true;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context, question),
                      );
                    }
                  }

                  /*void saveScore(int score) {
                    cubit!.setScore(score);
                  }*/

                  SwipingCardDeck deck = SwipingCardDeck(
                    cardDeck: _questions.map((question) {
                      responses.value = [question.correctAnswer ?? ""];
                      responses.value
                          .addAll(question.incorrectAnswers!.toList());
                      return Card(
                          child: SizedBox(
                              height: 500,
                              width: 1000,
                              child: Column(children: [
                                Container(
                                    color: Colors.red,
                                    child: Column(children: [
                                      Text(
                                          question.question ?? "question empty",
                                          style: styleLabel),
                                      Text(
                                          question.difficulty ??
                                              "difficulty unknomwn",
                                          style: styleLabel),
                                    ])),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: responses.value
                                        .map(
                                          (response) => _disableButton.value
                                              ? Text(response)
                                              : TextButton(
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Color.fromRGBO(
                                                                    33,
                                                                    150,
                                                                    243,
                                                                    1)),
                                                  ),
                                                  onPressed: () => _AnswerHandler(
                                                      response ==
                                                              question
                                                                  .correctAnswer
                                                          ? true
                                                          : false,
                                                      question.difficulty!,
                                                      question),
                                                  child: Text(response)),
                                        )
                                        .toList())
                              ])));
                    }).toList(),
                    onDeckEmpty: () => {/*saveScore(score)*/},
                    onLeftSwipe: (Card card) {},
                    onRightSwipe: (Card card) {
                      print("swiped right");
                    },
                    //_scoreIncremented.value = false,
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
                      Text(
                        "Score: ${_score.value}",
                      ),
                      deck,
                      _isclick.value
                          ? TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(33, 150, 243, 1)),
                              ),
                              onPressed: () => {
                                    if (_isclick.value == true)
                                      {
                                        _scoreIncrement(_difficulty.value),
                                        deck.swipeRight(),
                                        _scoreIncremented.value = true,
                                      }
                                  },
                              child: Text("Question suivante"))
                          : Text("Veuillez repondre a la question"),
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

Widget _buildPopupDialog(BuildContext context, FormQuestion question) {
  return AlertDialog(
    title: const Text('Mauvaise réponse'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('La réponse à la question : "${question.question}"' +
            ' est :  "${question.correctAnswer}"'),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(Color.fromRGBO(33, 150, 243, 1)),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Fermer'),
      ),
    ],
  );
}
