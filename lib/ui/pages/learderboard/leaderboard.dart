import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/user_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/learderboard/bloc/leaderboard_cubit.dart';

import 'bloc/leaderboard_state.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State {
  LeaderboardCubit? cubit;

  /*  final List list = List.generate(1000, (index) {
    return {
      "id": index + 1,
      "title": "This is the title $index",
      "subtitle": "This is the subtitle $index"
    };
  }); */

  handleColorCircle(position) {
    switch (position) {
      case 1:
        return const Color.fromRGBO(255, 207, 77, 1);
      case 2:
        return const Color.fromRGBO(170, 174, 170, 1);
      case 3:
        return const Color.fromRGBO(176, 145, 91, 1);
      default:
        return Colors.white;
    }
  }

  handleTextColor(position) {
    return position < 4
        ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        : const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classement',
            style: TextStyle(
                color: Color.fromRGBO(187, 203, 236, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
        body: MultiRepositoryProvider(
            providers: [
          RepositoryProvider<UserRepository>(
            create: (_) => UserRepository.getInstance(),
          )
        ],
            child: BlocProvider(
                create: (context) {
                  cubit = LeaderboardCubit(
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                  return cubit!..getLeaderboard();
                },
                child: BlocConsumer<LeaderboardCubit, LeaderboardState>(
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
                }, builder: (context, state) {
                  if (state is Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Saved) {
                    return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: handleColorCircle(index + 1),
                            child: Text(
                              (index + 1).toString(),
                              style: handleTextColor(index + 1),
                            ),
                          ),
                          title: Text(
                            user.pseudo!,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            ' Best Score: ${user.score!.toString()}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Scaffold();
                  }
                }))));
  }
}
