import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trivial_pursuit_flutter/data/entities/user/user.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/autb_repository.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/user_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/profil/bloc/profil_cubit.dart';
import 'package:trivial_pursuit_flutter/ui/pages/profil/bloc/profil_state.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key, TriviaUser? user}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  TriviaUser user = TriviaUser(
    id: "test",
    score: 2,
    pseudo: "pseudo",
    avatar: "avatar",
    games: 3,
  );

  ProfilCubit? cubit;

  TextStyle styleLabel = const TextStyle(
      color: Color.fromRGBO(187, 203, 236, 1),
      fontSize: 16,
      fontWeight: FontWeight.bold);

/*   final ButtonStyle flatButtonStyle = TextButton(
    style: (
      primary: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      )),
  );
 */
  final TextEditingController _pseudoController = TextEditingController();

  void handleChangePseudo(pseudo) {
    setState(() {
      user.pseudo = pseudo;
    });

    user.setPseudo(pseudo);
  }

  // ignore: prefer_typing_uninitialized_variables
  var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil',
              style: TextStyle(
                  color: Color.fromRGBO(187, 203, 236, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Color.fromRGBO(187, 203, 236, 1),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        children: [
                          const Text(
                            'Modifier mon profil',
                            style: TextStyle(
                                color: Color.fromRGBO(187, 203, 236, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Pseudo',
                              ),
                              controller: _pseudoController),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              handleChangePseudo(_pseudoController.text);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                // If the button is pressed, return green, otherwise blue
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.green;
                                }
                                return Colors.black;
                              }),
                            ),
                            child: const Text('Valider'),
                          ),
                        ]
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: e,
                                ))
                            .toList(),
                      )),
                );
              },
            ),
          ],
        ),
        body: MultiRepositoryProvider(
            providers: [
              RepositoryProvider<UserRepository>(
                create: (_) => UserRepository.getInstance(),
              ),
              RepositoryProvider<AuthRepository>(
                create: (_) => AuthRepository.getInstance(),
              ),
            ],
            child: BlocProvider(
                create: (context) {
                  cubit = ProfilCubit(
                    authRepository:
                        RepositoryProvider.of<AuthRepository>(context),
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                  return cubit!;
                },
                child: BlocConsumer<ProfilCubit, ProfilState>(
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

                  if (state is Loading) {
                    //chargement d'ecren de chargement
                    /*     setState(() {
                        displayLoader = true
                      }); */
                  }
                  if (state is Retrieved) {
                    setState(() {
                      QuerySnapshot<TriviaUser> image = state.image;
                    });
                  }
                }, builder: (context, state) {
                  return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        CircleAvatar(
                          backgroundImage: image,
                          radius: 24,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text("Nom d'utilisateur : ${user.pseudo}",
                                style: styleLabel)),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text("Best Score : ${user.score}",
                                style: styleLabel)),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text("Nombre de parties : ${user.games}",
                              style: styleLabel),
                        )
                      ]));
                }))));
  }
}
