import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/entities/question/question.dart';

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
                  for (var element in questions) {
                    print(element.question);
                  }

                  return ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          questions[index].question!,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          questions[index].difficulty!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },

              /*  ListView.builder(
                    itemCount: cubit.length,
                    itemBuilder: (context, index) => Card(
                      child: (context, index) => Card(
                        semanticContainer: true,
                        elevation: 6,
                        color: const Color.fromRGBO(14, 25, 43, 1),
                        margin: const EdgeInsets.all(10),
                        child: const [
                          ListTile(
                              title: Text(cubit![index]["question"]),
                              )
                        ],
                      ),
                    ); */
            ),
          ),
        ));
  }
}
