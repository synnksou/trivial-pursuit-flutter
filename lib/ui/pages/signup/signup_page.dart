import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/entities/user/user.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/autb_repository.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/user_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/signup/bloc/signup_cubit.dart';
import 'package:uuid/uuid.dart';

import 'bloc/signup_state.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SignupCubit? cubit;

  TextStyle styleLabel = const TextStyle(
      color: Color.fromRGBO(187, 203, 236, 1),
      fontSize: 16,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Signup',
              style: TextStyle(
                  color: Color.fromRGBO(187, 203, 236, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
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
                  cubit = SignupCubit(
                    authRepository:
                        RepositoryProvider.of<AuthRepository>(context),
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                  return cubit!;
                },
                child: BlocConsumer<SignupCubit, SignupState>(
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
                    if (state is Saved) {
                      // Navigator.of(context).pop();
                      //chargement d'ecren de chargement
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: styleLabel,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              cursorColor: Colors.white),
                          TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: styleLabel,
                                fillColor: Colors.white,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              cursorColor: Colors.white),
                          ElevatedButton(
                            onPressed: () {
                              var email = _emailController.text;
                              var password = _passwordController.text;
                              var uuid = const Uuid();

                              var user = TriviaUser(
                                  id: uuid.v1(),
                                  score: 1,
                                  games: 1,
                                  pseudo: email,
                                  avatar: "");

                              cubit!.registerUser(email, password, user);
                            },
                            child: const Text('Senregistrer'),
                          ),
                        ],
                      ),
                    );
                  },
                ))));
  }
}
