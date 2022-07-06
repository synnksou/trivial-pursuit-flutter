import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/autb_repository.dart';
import 'package:trivial_pursuit_flutter/data/repositeries/user_repository.dart';
import 'package:trivial_pursuit_flutter/ui/pages/login/bloc/login_cubit.dart';

import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginCubit? cubit;

  TextStyle styleLabel = const TextStyle(
      color: Color.fromRGBO(187, 203, 236, 1),
      fontSize: 16,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login',
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
                  cubit = LoginCubit(
                    authRepository:
                        RepositoryProvider.of<AuthRepository>(context),
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                  return cubit!;
                },
                child: BlocConsumer<LoginCubit, LoginState>(
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
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              cursorColor: Colors.white),
                          TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: styleLabel,
                                fillColor: Colors.black,
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              cursorColor: Colors.white),
                          ElevatedButton(
                            onPressed: () {
                              cubit!.connectUser(_emailController.text,
                                  _passwordController.text);
                            },
                            child: const Text('Se connecter'),
                          ),
                        ],
                      ),
                    );
                  },
                ))));
    /*  body:
         Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.black;
                }),
              ),
              child: const Text('Valider'),
            ),
          ],
        ),
      ), 
    )*/
  }
}
